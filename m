Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F8FEB64DC
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 01:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9F410E3F0;
	Wed, 19 Jul 2023 01:51:48 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCC010E3F0
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 01:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689731506; x=1721267506;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x7cB3qOKFcCMNvJLjgeqxzxtdgiCWbOfcpGiJQdNZ2A=;
 b=V7VHPau9stkn5UX4JDfWiQifTxz7nSXzNSxnSvPJQwMfFCtwowOcK5i6
 3RAJPJ+4cZVJqus87eemv49go25d4voTQyq31rkGRYCfMxNvpCiTe6JKj
 tXy6rWFt2NgcOflnDCVFJQfL+nknq1e6iUEoJktBsWE59zhMpmwGSyS8T
 PCXoK7IYdK2rud4jh8zvcrSF5sLOYlI+Xhqe8BIWgnF7Uvo4CiHwkRI1F
 7nNvitoMRPSMVc2z0Ybq5eZZhlIBrQ1oTqmt2SmRByUzkcHDSKYX6xFrm
 kriF3t67q1Wwi/bkiCumWCgT1cVkoUdNTXSF3EPp7Cp0V4NRxpc86bgYa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="351222574"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; d="scan'208";a="351222574"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 18:51:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="813964853"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; d="scan'208";a="813964853"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Jul 2023 18:51:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 18:51:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 18:51:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 18:51:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsIN25H7Z9yx70ov7BTBtOaEf5yaiTp4MayC80E/NZw7jODjN4/16+vw6xAIUSQbcKulx7bo+ksj2OZgGvn+Gs69W8OHuxtjIiICkCeKvKW7Xwa2s0NeF1t9ohEErObKI//pZDDuuIriD+LCPtn7W+M28d7qBoVTHHl5mMk2HgKphuvwcdRvoDuwMoH/ZCRJHLhWyfIB6jGUHVtIMVxK0GlhpElw25lwyLZxwhZAwz9UU/AiwkQ9dn+hxeHbSb18U6c3YUXhivgq9Xz2VlR5nbiMidLRAgSQyl8W5sfruCJknAPN+KtikyDSX8jX9LvXNhTKoRWq+3BItNwgbthorw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxWdBUcjsb8nUVZncQBK/jfe1huGMq7QABGExhaxqDg=;
 b=M62h5Hx6Sc11wBJTf1VqemyzXPZeHRh/Ch3pMsqTi6VMXSaRzZELUd3GBOiZQSdscMcuXuTqKEIuQla3QTeMugLbtfMEaC/J/hrXdtgMxgdVkJveyAF7dRfDnotqy2ijd2dLCT10OloOh7r//1EHUIscseIo6tsWM1Sa27iQ7zmuJmIxWCX03On4i0lfECc241JLbjt8u9a+BaL4HWZPYzvwuB9MuwrCmt9AfSKZGZUiCwwvxac/KlQD9XJqjlQJ7PJMmK23EQkIfY+rV3Zd7+CcVRmc0P2oodUCUjGSciaSRkfEtrYHlugkL5eGJSPyytRHbvCCG+jLo9IzM5CDHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7346.namprd11.prod.outlook.com (2603:10b6:610:152::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 01:51:37 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::e273:56c0:2fca:f739]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::e273:56c0:2fca:f739%7]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 01:51:37 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [Intel-xe] [PATCH v5 1/2] drm/xe: Notify Userspace when gt reset
 fails
Thread-Index: AQHZuXucPRVq6L6MtEOjArEWQCTWnK/AMveAgAAa/NA=
Date: Wed, 19 Jul 2023 01:51:37 +0000
Message-ID: <MW4PR11MB7056C4F7A20F8995CC5D3207B339A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230718133216.3079521-1-himal.prasad.ghimiray@intel.com>
 <20230718133216.3079521-2-himal.prasad.ghimiray@intel.com>
 <20230718235250.GL138014@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230718235250.GL138014@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|CH3PR11MB7346:EE_
x-ms-office365-filtering-correlation-id: 15f8de68-ea6a-4c02-75a6-08db87fab033
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MYVagSthdXB7OlcqxztwJADi4iluT9MWtLruC4D98Re65XVBFS0slZgXf0wlkWe3cuEElvl5sblIi156h3mFoeEAv+OOVpObvy3PwNRKRm1lsiVXqkqAV/d2qK02JrWTGWI+Evs4Awik5mj3v+NBeLDhSt8SSLj8FYqXBvoc1woFqlRyy+yuQ83ROICCTmAFiFQm8RUNPHtkEar82FxW3K41ClYb/qMcmz6u/rcotNN07UmuY+F3wJhMlnhGlGfUF2wJ/zOtAba6dUNDpB9zUIUliLODjqtdJaheMKtkho8dP5EFokWpnYrxp1Nco+8QnMJADOFC4HHYlxr8+OOsl3QOk9DUPEkj4jqt0YCPxybGGPiR9JuBuEPW7/9PSGfZaZxe6Qlzs1F+S/VuT0ygzDhdTEC+uckBJSEVkMZXXJH6S/n0wmEsMq/0Wwz/9HTZ40IPng0yzN9hdE+lUBdkM+6M6h8zK6rrbjUmsoXu2kPax65FSNRd+Yxh5n8YvQtz2Ch/On0j5tbllCHG6ECeTLCIqdhfcgnFNO9WxH3WrbQ+oDboTv/kkLzggYxmEVxwHtU3RJJqFThuvcWVNj840uUNrzmGi/hHAdnkgKkBbyc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(366004)(346002)(396003)(451199021)(71200400001)(478600001)(7696005)(54906003)(83380400001)(86362001)(38070700005)(33656002)(55016003)(76116006)(2906002)(82960400001)(6506007)(186003)(53546011)(26005)(107886003)(9686003)(38100700002)(6636002)(316002)(64756008)(66556008)(4326008)(966005)(122000001)(66446008)(66946007)(66476007)(41300700001)(5660300002)(52536014)(6862004)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Mx2T+8E46HZP3sE8XZ9DRpugz2fLH9xyxk7kiuFgjOfoXIBNZO7iT146ysd5?=
 =?us-ascii?Q?kjr5W4bAIds3tEu7qMFc8AUWY4BbbiwFVHqSuBj/q6tgDcsZuhuljGKqGrQb?=
 =?us-ascii?Q?lrEPNooq1T4OkPL72xQjS/XYoB0sf/fh3FAFVgWel5u+dB98/GjcdYQCfN1J?=
 =?us-ascii?Q?wJNeeEOhMf9ZYQ0iHwlOggsqWWqYZDnG4CJJmiUiWEfdau6yUGd8g3QN3lKn?=
 =?us-ascii?Q?+Axp77BVlXwQuyx7CNrZxEbyeiMseLdFe8447LDa0ODrv6KlRe0Jocu8z/8M?=
 =?us-ascii?Q?tCwuAvkH1xBOTwtbI+S69wJbiKQTRrV0201jsD6ybheCMIknFyU5UnW6U3Ng?=
 =?us-ascii?Q?dpUJO2C009MxBMnkNJbtcf9kVjWlzR/gc4o2BAI6BCo1SKzZ/mHLPJujzw9d?=
 =?us-ascii?Q?p9/U6B6rK2MH07kzpQC4YSgeCBvQsxGEFmnQ5r9JeSdjpdufwYmbGYRUFA14?=
 =?us-ascii?Q?p30XHz30d+zdyOxuatxe7U7pIWUr/7NqUV+R9u4aea1zIJYaqiqCKENKFORh?=
 =?us-ascii?Q?2vxpktIZBmyjvSHx+EPxG5SVY+5VBzEHsx1EjKwRA2y5043xa2hKfECdaLyT?=
 =?us-ascii?Q?RYTlDzrCFFNAnbwAQLUwcMW6u7h4xbIAkeFsZmq0MJhn+hAy4hjrElW7pts7?=
 =?us-ascii?Q?p8uBWc6PsJ0yL1er7CPOk+EGPxL+tZf5WyNiEIR6tYVZ5sRqvuaulkOK3B6X?=
 =?us-ascii?Q?T4NeGWu1m8+FTDP/7qMXp2EmHpCXvLNKGqKifetOh9UpqxTnr26K/iEa42RU?=
 =?us-ascii?Q?05ewlyMs/h3dV8e9DZTV5/ZZfEH5eCBtFP6mEjysthBFlJeU6X5LaWQK4zbz?=
 =?us-ascii?Q?4+7lNc/dSNrx5gcQa2UBlLhDl5uECU2K3pkf7DqDwLn08ajYzkghRSIhtYDs?=
 =?us-ascii?Q?uuT0d7nq/JVm6OsQhzafR+B5YOCHgpOswDrcpn3FiDPoDcS6/uZQbdkyJHbn?=
 =?us-ascii?Q?jX2uhVdWjFd4enPTqFwaiO3bcE8NWoD+sB/0WDAnfZbPjDnSY8cCK8KrMiP/?=
 =?us-ascii?Q?ddyStMbc2I1j2g8XIzORhWKS7/OCk5M/JIfMgBE3Z4PDaju2eJITilYniWhl?=
 =?us-ascii?Q?FQ61qO6OCx8r1Rr7ipY0csle8uhhp42EwUg8bdwqzIWJdO6yTJzxseA24Zi8?=
 =?us-ascii?Q?ENz4ievSNN7STnGKQOou2HTsmQzoYBpu/wAlyLgWp0IH4cWL4epT4jLoSmpD?=
 =?us-ascii?Q?NsxFWi060Y4OBNZLTZhQ/nrLDwYL50KPcyMAm+X96TXDyANVt+SjH+ngz/A9?=
 =?us-ascii?Q?R2a9RI86VKNdwWmXpWKjlb8Wi9ipnR/A+X1wJAG6V6lGgeVvAYk3ctD27rAW?=
 =?us-ascii?Q?bYBB7yGg6bZxzofpg5sc/kC6XPCjMD+iwgjOamvSEqVNAfoHQvhPKE9MQER2?=
 =?us-ascii?Q?IQsUMsuCpL32JKBit9axg8RESMnxgrC5OlVsBJic19kAojwXihoEkHsJVQ1A?=
 =?us-ascii?Q?xBOc8Nzn/w3Nn5VLr0Tu4FGap3RY8fWZEqIi6H8Vy8VO1CgiRjfu0vTOrUu6?=
 =?us-ascii?Q?JLH5Y0oGsJscRZB6GUewVCAZo/w04tF60Gj1CNEc/mhxerNNJI+jinNVKDSH?=
 =?us-ascii?Q?Zo53BtWb4lJlczFptqx8u1bqPn2aPsRv/tHTwXXSKUP8cLi2gYNryAYnbvd8?=
 =?us-ascii?Q?Lw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f8de68-ea6a-4c02-75a6-08db87fab033
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 01:51:37.0451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nuDF+GmWxXNaN+nAexgly3+oxBUxZnRg8YbilDQEsciWgL3yDJKQFp5oQLLJQmQmA6oxSeX//AnYBmLBM5v4FnCv/wLiW7+Az/6EVuvvJ/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7346
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 1/2] drm/xe: Notify Userspace when gt
 reset fails
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

Hi Matt,

> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: 19 July 2023 05:23
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com=
>
> Subject: Re: [Intel-xe] [PATCH v5 1/2] drm/xe: Notify Userspace when gt r=
eset
> fails
>=20
> On Tue, Jul 18, 2023 at 07:02:15PM +0530, Himal Prasad Ghimiray wrote:
> > Send uevent in case of gt reset failure. This intimation can be used
> > by userspace monitoring tool to do the device level reset/reboot when
> > GT reset fails. udevadm can be used to monitor the uevents.
>=20
> This seems a bit questionable.  In theory a GT reset shouldn't fail; if i=
t does it
> either means we've either got a major software bug or a really catastroph=
ic
> hardware failure.  Letting the kernel driver just blindly move forward af=
ter
> reporting a uevent doesn't seem like a proper response to a huge problem
> like that.  Relying on userspace to pick up the pieces seems insufficient=
.
>=20
> Right now the return code from gt_reset() is just ignored and no meaningf=
ul
> action is taken within the driver.  It seems like we should at least be p=
utting
> the device into some kind of 'unusable' state (similar to i915's 'wedged'=
) so
> that other parts of the driver know that everything is completely broken =
and
> that they should stop trying to use the device (or some subset of the dev=
ice).
> We could also potentially attempt recovery ourselves by escalating to a
> DriverFLR.

Agreed. These feature needs to be there in the driver.

>=20
> I'm not sure why any userspace would ever care about the specific conditi=
on
> of "gt reset failed" --- it seems like it would pretty much only care abo=
ut the
> device being in one of three states and wouldn't care about the driver-
> internal details about how/why it's in one of
> those:
>=20
>  * Everything is good; can use device as normal
>  * Device partially broken; it's no longer possible to use these
>    specific GTs, engines, etc., but other units should still function as
>    expected.
>  * Absolutely everything is broken and nothing works.  You _might_ be
>    able to unload the driver, issue a PCI FLR, and reload the driver,
>    but otherwise all hope is lost and the device cannot be used anymore.
>=20
> Even if we decide that some uevent is appropriate here, this is new uapi =
and
> will need a real userspace consumer too.  The fact that we can watch any
> uevents raised by the device with udevadm doesn't seem like it would be
> sufficient for that purpose; that doesn't feel much different than claimi=
ng
> 'cat' as the userspace consumer of a sysfs node or something.
> What we really need for new uapi is a meaningful top-to-bottom solution
> that gives us confidence that we have an appropriate and maintainable
> interface defined.

https://spec.oneapi.io/level-zero/latest/sysman/api.html#_CPPv441ZES_EVENT_=
TYPE_FLAG_DEVICE_RESET_REQUIRED is the consumer for this uapi.
The application can register for events ZES_EVENT_TYPE_FLAG_DEVICE_RESET_RE=
QUIRED with Sysman and start listening to this event.
Then Sysman would send ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIRED event to a=
pplication, incase sysman recieves uevent "RESET_FAILED=3D1" or "RESET_REQU=
IRED=3D1" or if Sysman detects a repair have occurred.

Then after getting ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIRED event applicat=
ion could query zesDeviceGetState  to get the reason of RESET. And Sysman w=
ould tell the reason of reset as :
ZES_RESET_REASON_FLAG_WEDGED: Sysman would try to create a context and if c=
ontext creation fails due to EIO error, then device is determined to be wed=
ged and reset reason is declared as WEDGED

And sysman triggers a SBR to reset the device.

BR
Himal
>=20
>=20
> Matt
>=20
> >
> > v2:
> > -Add NULL check for xe_gt_hw_engine return(Aravind) -Arrange variables
> > in Christmas tree order(Tejas) -Check GUC_GSC_OTHER_CLASS(Tejas)
> >
> > v3:
> > - Rebase
> > - Remove notification for engine reset failure (Rodrigo)
> >
> > v4
> > - Rectify the comments in header file.
> >
> > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c | 18 ++++++++++++++++++
> > include/uapi/drm/xe_drm.h  |  8 ++++++++
> >  2 files changed, 26 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index a21d44bfe9e8..1db4d610f2fd 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/minmax.h>
> >
> >  #include <drm/drm_managed.h>
> > +#include <drm/xe_drm.h>
> >
> >  #include "regs/xe_gt_regs.h"
> >  #include "xe_bb.h"
> > @@ -500,6 +501,20 @@ static int do_gt_restart(struct xe_gt *gt)
> >  	return 0;
> >  }
> >
> > +static void xe_uevent_gt_reset_failure(struct xe_device *xe, u8 id) {
> > +	char *reset_event[5];
> > +
> > +	reset_event[0] =3D XE_RESET_FAILED_UEVENT "=3D1";
> > +	reset_event[1] =3D "RESET_ENABLED=3D1";
> > +	reset_event[2] =3D "RESET_UNIT=3Dgt";
> > +	reset_event[3] =3D kasprintf(GFP_KERNEL, "RESET_ID=3D%d", id);
> > +	reset_event[4] =3D NULL;
> > +	kobject_uevent_env(&xe->drm.primary->kdev->kobj, KOBJ_CHANGE,
> > +reset_event);
> > +
> > +	kfree(reset_event[3]);
> > +}
> > +
> >  static int gt_reset(struct xe_gt *gt)  {
> >  	int err;
> > @@ -549,6 +564,9 @@ static int gt_reset(struct xe_gt *gt)
> >  	xe_device_mem_access_put(gt_to_xe(gt));
> >  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> >
> > +	/* Notify userspace about gt reset failure */
> > +	xe_uevent_gt_reset_failure(gt_to_xe(gt), gt->info.id);
> > +
> >  	return err;
> >  }
> >
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 347351a8f618..c28bb54812e5 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -16,6 +16,14 @@ extern "C" {
> >   * subject to backwards-compatibility constraints.
> >   */
> >
> > +/*
> > + * Uevents generated by xe on it's device node.
> > + *
> > + * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset
> > + * gt fails. The value supplied with the event is always 1.
> > + */
> > +#define XE_RESET_FAILED_UEVENT "RESET_FAILED"
> > +
> >  /**
> >   * struct xe_user_extension - Base class for defining a chain of exten=
sions
> >   *
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
