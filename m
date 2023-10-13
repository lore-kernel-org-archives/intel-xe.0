Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF22CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 07:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEBC10E5BD;
	Fri, 13 Oct 2023 07:00:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359A710E5BD
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 07:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697180455; x=1728716455;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ugcBA+TorRk8En00XwL6ME6thtVo8Zmqc9f/J7dq8Bs=;
 b=KP/W+NSvxgP8NfUAVoGOL4JMOIFPtMtBn5ZDtSoe/C4LjARj5LlP4Gk1
 BTH8ouUJzxdQncv0QxdCFMOqOP/12CeCCY5DXtx438Wv03vuCd8g895Dn
 CGpbkgAgZomMdz+SKVRWVuv6akSw2P3ST9reAERV+qoTQTn/Lj1HHeW01
 A0FZZ4s+jrhhXly0UZewBSLUytvaKpltMQRMVg95lcvvkFmeTxPkAFepl
 JChR+ARV5RHWpvS+lOpVU0Cndg9hxNOV4QzjiDaBey66L3iWl8B323CP2
 KCapWZ8G3gDPTXfxPOIHmESq7wrYYJhRiylCYiw05gQr6Rjs3cWMgjNVg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="451596832"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="451596832"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 00:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="789749538"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="789749538"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 00:00:33 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 00:00:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 00:00:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 00:00:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 00:00:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fujL6slplU6rUxoEkLNVlM4wgf5qmMTNM0uk+JBgDWVskxRiJQCsQIFBd+CkYPrYIO/BpR0T81ccxeLRfzA2zwQXKOlRjaJrd0VSPoeSD/qt49FR1bQG7Hrqo966lzFkhZh5e+qKEbfSLR7umDHmIJh0W0J+q77y5YHV9/55FtdlMsJhWjkftgE+aCuLa3suQ37Zz6D7CaJ+zZvRi67PASwFt9rg92dti+TdAiNxGq+O2/TkSueQ265v7W3afZDcFP4lx9hIrrTvhpmJ+1AJ6brw1AMymU533Z4ayZVtnZ0WNZCWPlG4N03sqQ6yYOwQviMJzzJB3vt1r1tUfy1Ggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+wCfzn4NmsQAhSOlxCMdN/Y6Xf7YMndtfBYrWj+ypA=;
 b=fCHhaD124Lm1uoLgrbTke6uRM59b5zsxIJRC+oi+yboD+9VEmHTAoe5jg00zgSo+xNrr4fsKm1+GXkmcGusffFi2WxG6UDrZfpVorLoG2lV0cvW7m/4811RL3C4HBNpYnsYnLxVLp6s53XTqkPVEA0vn3Nzg2zsYJv1SOTujiXbhwjXGRRqplZtcHgfipTcKDxWAWZV9PHeeGr81vFVm+3SNQ+f/djZ9k9GGEJEitYTR1TX/daokOFZEoaRjXLjXl/cWyjnIUx/6VAPD7Vm6KDrc7RtbHW/J71DH5pf0ilfVIhBnHcvzpNB3pcdjHEJtImfv9I2V+jCqOuCO3dqf2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM4PR11MB6431.namprd11.prod.outlook.com (2603:10b6:8:b8::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Fri, 13 Oct 2023 07:00:30 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 07:00:30 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v3 0/6] Fix compatibility issue for intel_dmc
Thread-Index: AQHZ/QvhIgzZ0VcaJUm9F1tXRYW4U7BGYRqAgADqb9A=
Date: Fri, 13 Oct 2023 07:00:30 +0000
Message-ID: <SJ1PR11MB6129C7C03FE9166772F5056EB9D2A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
 <5gdgcz7dq5bkdswph6bn7vcvdzeltdbay2lnvwkfq3nngq2tox@kzzfemaguhbp>
In-Reply-To: <5gdgcz7dq5bkdswph6bn7vcvdzeltdbay2lnvwkfq3nngq2tox@kzzfemaguhbp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DM4PR11MB6431:EE_
x-ms-office365-filtering-correlation-id: 94430a28-457c-4622-c5a8-08dbcbba169f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DbJWpj3nINgCYSOZr5DniBbV0Qsp0v1HFzqJ/c/VuGBiUx4mxMyoLl1vIiHCLmoCuNepP+2re2uVurW5gAIV+VuFfEzdU55mGtlq4C8WihvsnAYpa5sJww6tkmqt7tc6diyOPdN+28ygQ//Z2rOJ+cXyfr2y6NXqluuFnWO8FTk6qtroJkosPrNU3FYNwnjB6hNbjCo5vrFkaymRDucgUhH6peWWRggEK3HevcBa4n+Nm+F+PtcPOqd0pII51Mud6ns2uLmvlCxXStBno/JU8UlvKSkLW2cv6I4za5LKX+ZZ6s36V8FlMeqRunXnJxOqrAuG9EK0aExf4c4hHKQbIldpGyLfN+8cdrzcr7vs6Gow5cORe8WO9wp93346A99BEt+A7xg2PSE4fYIwH9N9OjIG2295mTDiftt05zBDMcj6ko7Zj23rfqkCFCrgk3qhLrb7/dksgXroyrBGItRjYYav0GDVyOFWL4U6mu5IfcY2zp3BlL9nMr2JopSTvNBVTwz6NY9/8rvEccVCmjEs0p38HmIAvqgRPiy9yPNANJCqlQyOmrIQUug3/qIfYmNrKO31NB86V/S1Dm6WHaNyL1czVz/sVxL+AZz2HzMehsUOZAr7URFP/3o359gi/Mq4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6862004)(4326008)(8936002)(8676002)(52536014)(53546011)(64756008)(66556008)(66946007)(66476007)(66446008)(76116006)(7696005)(6636002)(316002)(6506007)(9686003)(38100700002)(5660300002)(71200400001)(478600001)(26005)(41300700001)(55016003)(83380400001)(82960400001)(38070700005)(122000001)(2906002)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SOVoNGDkL/HHL6flUCGqK6hGg/mKH42aUoPhfqUySxn7LC3YNYBv1GMIhkOb?=
 =?us-ascii?Q?/qlR5gUjmthH+FJJPHLRws68uE3r3w9RmwZDPVae8XUy095yOFCjG0/cvJl9?=
 =?us-ascii?Q?+mSuxMpf5XwTjFWBoWbHamDl5tVb7xcThcyQpuLz4Rdg9E+R7nonrJGMefym?=
 =?us-ascii?Q?BEgOG5zcwxcJJhqRsZx85TLtQRZ3PI/6oqhvOH6Kaus6udqS3ZAv4wrxcWAn?=
 =?us-ascii?Q?LL4WdXXheuddyxPlBDNdZd5wkkWMrBllZB4I4JbOupLrIMTWyOOLShdOv3u5?=
 =?us-ascii?Q?7RfVB8qxS7L6scaVFqshMyq/Z0JVDe/as3hU9eNEsW896oC1niqAAAW79JVu?=
 =?us-ascii?Q?8cPzveBQe2I9jCHqEA+9z9F/uigKwL/8yT/xqUvs71XgeE5siBb6z9Bdqx4Z?=
 =?us-ascii?Q?WJu23J26YUmM97qUOIbsiSvDNSptTrCnEFN1MmHftqG4qw8bDj8YYIufugw4?=
 =?us-ascii?Q?8FIFxVG1njxZni/BU9IZCl/I96JHRbAPAKzWXiuTt88tLwXy8+q1SuE6jAtY?=
 =?us-ascii?Q?hShQD4VpfY27c9wGcbKyE2xrHJNEwLvdc8+SeXFvICTZZwmof7I7ZwNujvhn?=
 =?us-ascii?Q?ephMJnc6rgfaHq9w+BGj0Nezeetsr34rLf6goAIg5TkJH1bWOeldcQ/t1bvv?=
 =?us-ascii?Q?0JY7WHs8F2uvzdcpgwMlGLSmZHnlNOsAc3ntWv+OM86Di1y4vd7JhcBytLyq?=
 =?us-ascii?Q?c4Wx3rM4qXSEqI/tnAROOTTV0o/eWFrQLuu5t1T6/7YERIvpWNhPyZM4x4RP?=
 =?us-ascii?Q?1XBl0ZblZW3fwuf0/dTzfotCv0zHgtGdek8WjY+GQ42so9peoYkQEvpuoqy/?=
 =?us-ascii?Q?mIo4eP5pkfXcpQKOI+OInvddxJZxh9Orp2uZl1cdoQkFSIrDT3T9I+AUf2Oc?=
 =?us-ascii?Q?BIOgvV10RbL8KHag1sZosx/9YqcxvTDlf3zozLO0KgxuU73JbZJcGdCH5LCq?=
 =?us-ascii?Q?n/GshbT0imiGj7kSn4NkeTdylrkGbayaNjuu3N9Qw7lrJFUFLh1tAN0X9IEj?=
 =?us-ascii?Q?q/sbzHjMEQeSJQyVpmELCZjIv77g5HGdhiOav7Dmr22GP7FxXzdIEpvIu7Yt?=
 =?us-ascii?Q?7NnOMGj0qXpYxlvnnlzIOoHCoXEq/e/FwsZOC/GLPrwxJkE2/YjahowZnxAF?=
 =?us-ascii?Q?+tKCa5E6ISbdyofGqS0uICGDNZMe1W/cqgN6lzVN+WK776qawbavRk6e/YVq?=
 =?us-ascii?Q?2kkbUk5TY2CnpBLOZSosHl7XGkSk+9jEq/BoO2SNXe4ldLR+hp0qiVEM0nqJ?=
 =?us-ascii?Q?Pidias8hhTA+21jI7LQl5aGpC2MVWZ72UIFUR5yX+WCAZJmKauX9bq9DuIc4?=
 =?us-ascii?Q?+inaqt0+HUh7IZgJ9M3/LEiGMTRaH8DbslzslsbsCFHdAdfRBcoWRYh8FpmW?=
 =?us-ascii?Q?k9dA441kNFCKKkG/G6Zvt9xRJUH5OoqjaTnpNOfIcKrOmoKmSm7h1rNuKfEo?=
 =?us-ascii?Q?+OB5bz0TT86bNIsHwApOVCboK92T1Cv49iADiRjSc9Ja43Ldc+fkCKNLjnLX?=
 =?us-ascii?Q?FjAmlYOgCK1LZmWoiJp9WPTZczDgmJDOxZOfK3mfjbJZEJSbBVTcZ9CzEf3t?=
 =?us-ascii?Q?7kV9PUKgn3F5hhDbCtW5RhDcmiO+8bsIjWotPUn5s2JPUTGwGDeCh7Io9nyx?=
 =?us-ascii?Q?oQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94430a28-457c-4622-c5a8-08dbcbba169f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 07:00:30.6884 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zuL5rAHo3kvlBGbH0/L85FJXrGZYirTiUlXiitlFcECsct4hfYmtCOVIZ9D2pgwrZRHQpEPUl0WwqKxwoK2CX5lTK6QRynoB2eK8y55Bbp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6431
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 0/6] Fix compatibility issue for intel_dmc
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

Hello Lucas,

> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Thursday, October 12, 2023 10:30 PM
> To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH v3 0/6] Fix compatibility issue for intel_=
dmc
>=20
> Patches 1-5:
>=20
> 	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>=20
> For patch 6 we need to change the define removing the directory like we
> currently do in xe. With that you can add my r-b in that one too.
>=20

Thanks a lot for the reviews. I have corrected patch 6 and refloated.

Regards

Chaitanya

> thanks
> Lucas De Marchi
>=20
> On Thu, Oct 12, 2023 at 06:24:04PM +0530, Chaitanya Kumar Borah wrote:
> >This series reverts hacky #ifdefs from intel_dmc
> >
> >v2: Rebase
> >v3: Add compat headers as fixup patches to
> >    "drm/xe/display: Implement display support"
> >
> >Chaitanya Kumar Borah (6):
> >  Revert "FIXME: drm/i915/dmc: xe way of getting at stepping"
> >  drm/i915: Add wrapper for getting display step
> >  fixup! drm/xe/display: Implement display support
> >  fixup! drm/xe/display: Implement display support
> >  fixup! drm/xe/display: Implement display support
> >  fixup! drm/xe/display: Implement display support
> >
> > drivers/gpu/drm/i915/display/intel_dmc.c      | 19 ++----------------
> > drivers/gpu/drm/i915/intel_step.c             |  5 +++++
> > drivers/gpu/drm/i915/intel_step.h             |  1 +
> > .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  4 +++-
> > .../xe/compat-i915-headers/i915_gpu_error.h   | 17 ++++++++++++++++
> > .../drm/xe/compat-i915-headers/intel_step.h   | 20 +++++++++++++++++++
> > .../drm/xe/compat-i915-headers/intel_uc_fw.h  | 11 ++++++++++
> > 7 files changed, 59 insertions(+), 18 deletions(-) create mode 100644
> > drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
> > create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
> > create mode 100644
> > drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
> >
> >--
> >2.25.1
> >
