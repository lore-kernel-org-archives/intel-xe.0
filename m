Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8899CA0FE2
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 03:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BE410E1B4;
	Fri,  1 Sep 2023 03:04:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EAC10E121
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 03:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693537467; x=1725073467;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N9KYWwFDlbOoy1CuCCjYkKBFacu71rgMqhqW6sEC7ZU=;
 b=OVwG4UsSMgWY6IoDXglF1uV6JVZaxr4ieUzIKml/w4LEWRaajDg7gjn4
 N8DzNQrafoB0tJHvEDMl+8Mm9aG2eWaNla5f1P1SybdEkLyV5s/nG8XkN
 kWeRVUeMJIHIwsjqB8PaXvEW65fvusIuO1dIorg3OIRpt87v//+UY6Z8L
 IHVgDRLBQYfb24NFEvF8N7WZDF3aWJIuoVI8dIEchJYuqMunvVi4zcL4N
 HugodqYNyZgZN8FIqYYgokjdXpKYHWPbFgMrOqdrDqetXNp0oeF+cvZBm
 RZ8fE+CoOB0Tq2Yke0uU0juc3eQpS13OTaxMRNNVCzuFspQPuGDiDKoB2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="376057093"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="376057093"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 20:04:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="742956900"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="742956900"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 20:04:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 20:04:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 20:04:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 20:04:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+Ihh55FEWqbLqI4ULiDBAM2YHb+QFv8DudgGqNqCbW4hbf1O/sdPTLactrRAKIp+aHvS/MIMs2ovw7h13iw2B3FEWY6+Xw/mwX8UwHXuiX6Agm58+2d8kJrnNpA33Edhpvyftf+8KLOvZAAW0vjEVvtm7P1CbgCWujxmT9WuyfPJSwctFGI16OJmpCW9ap1+LvBTGf4+KlPNaQr1WUDUoXtTjGxYXpOYEjLZgQ/beOviJYHyziPV6CRXG5N9v29NK7KIq1ORdvWZA3U2goSX7sOzDWpv+y4QhCJBCkKPVnm+tmrzvbb61qE8DRRmI4Ip18j3CSLyOsR6/bfEDY2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2sth/fXSOuL8EesSHXUWA9boLT6yeiQfgeZ/lnN8sQ=;
 b=KzE4U3v8X8SY2FXi/VCiC4odabZv4MWqxNV5Cncqpzm/uQOIJnhdb/OshNjypBF6qcMAOeBjoW8t5R2ajYug37/1zBm0LWW/29dqzf/6LWUdGol0U1G+6gyMIcwjN3UZ96KOD5kDz1CHoHdBQcIrUSZ1RIYFotgSwCyUbriVPSp/m1iInwP4cL5hQKOIByQ3J5V7KBD6X1m/ZRtkL31OQq7l0hm44TifuGjM8os+wv8diu0Y1e+MtHSrN/cjNjnQspFES7aH8tws21HcfrLY/MAzFKn5zZeSGRjMANVLINOCYxHJXbAV5rRHRsZPDXJELmjKK98LGD2dLFgbDSavOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM4PR11MB7398.namprd11.prod.outlook.com (2603:10b6:8:102::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Fri, 1 Sep
 2023 03:04:23 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241%7]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 03:04:22 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap mappings on rpm
 suspend
Thread-Index: AQHZ1rH8xVpew1Twn0aVdibZK9Z5xa//U/xAgACYjICAA3FDgIAAhgKAgAEQS4CAAFsagA==
Date: Fri, 1 Sep 2023 03:04:22 +0000
Message-ID: <CY5PR11MB621128EC912B3A35AFCFBD6D95E4A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230824174618.1560317-1-badal.nilawar@intel.com>
 <CY5PR11MB621124B2BA3F61F7DF797A0C95E0A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <f7e1d567-a7ce-fe10-87d9-3b5c3b104bf6@intel.com> <ZO+u6e06mWzZqX2d@intel.com>
 <CY5PR11MB6211EA7222270115D2E3DCFF95E5A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <ZPEDvQ3jSK6tqHMC@intel.com>
In-Reply-To: <ZPEDvQ3jSK6tqHMC@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM4PR11MB7398:EE_
x-ms-office365-filtering-correlation-id: 0bbbeb99-c7e4-4348-a3fa-08dbaa98245f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e5j3uRL131FsBQeMIXQ4lCeaJ1HaL/cR1mFFugB5B4xmGPxdVMPSttzIQmpOvK6zSEAP3smcEXSKod2larYkjeE6yowGRLUy374ZUnasnAUAxpTnLphA/2WGgq2ouyqe/Rk5HPyXH58nz+EnCy68VJiPE6polBiw6IVOgYJY9ZRUyCOsPAKaCgTk1t15kSNcL4r/OJsBsXHygDNX29cwc28VqAXH5lJHNIyQPGuCQVzJnoXSRaO4x6VArKn38ArSOcH0KI/k6vWtNT1VTs2DVUgFlbCaCWWfdvwdrLz4W1FnuuQMF18NVWon5y4UMkcv0JFTy9Yz3qjlIrEae0kIL7hO5hUbB1BdHnRX2RewND1ZjZ4TDABhfK9NC8qsY0lpSxSV77qbH6YklXVj1xnC95ZQI4f7vz64a0giTgd7t0rBtlWjcUpyAl0kEdCVwo4BO9tPswWhVccVaHgG99HT4+HbUKg4MrsITpxEqbkpWoLK8GXdTEOjROECmmMQm/nKD3fjFcpqf9ZmVk/UOAow9R4n+xOtLJw8iKOdF4HtTCTZF0EudQXvMOB+9dVNj5We/fIJwhZy3+CWP/VEkJI0+EIJInWfyrkAq5yGJPoQ7pJ4NjlW9kpAMBkmhaD/PoFy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(8936002)(76116006)(478600001)(53546011)(122000001)(66946007)(7696005)(66556008)(6506007)(64756008)(71200400001)(66476007)(66446008)(54906003)(38070700005)(6636002)(316002)(38100700002)(41300700001)(82960400001)(9686003)(26005)(83380400001)(5660300002)(107886003)(55016003)(2906002)(15650500001)(86362001)(30864003)(52536014)(8676002)(33656002)(4326008)(6862004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3P2W4naXrYpOM1JJWEuAqEEn0mSkl+mwV4Zyv2DYlIxMaxuFrXF5d9vIv5LZ?=
 =?us-ascii?Q?xmjCbt3uCmpUvz2DnLdLWUXFJrRWDqIqgeIAFTv+fHIzPrfk4fnoHcNgZ6K9?=
 =?us-ascii?Q?xqKcdw8wemrHjtRbL7zimcJteVRbn1ZmsEte4ALk6joRVam56LM7P5t9Sh7h?=
 =?us-ascii?Q?Fm0Z8toSvRr5W2/ry1599uiEGFnj3GoFbttR+1fwvtBIHPkMsR/RaoubJn/w?=
 =?us-ascii?Q?PpqrqNACSrjFBGDyMIYH43puiA7MJ7arRQeo+3laFVMg+AhnBeEH/eN/Ed2q?=
 =?us-ascii?Q?6/3cV7iBToJNs4r1YcqtsYnXb/c3vpek6F5667DkyjwpQzBjthBDJhZSS87L?=
 =?us-ascii?Q?m3L0zdaj/ZIrptypW7bmCI8ud9eJ55W0S585wVX/9RwMBC6W1XI4TuVlEnsP?=
 =?us-ascii?Q?YEY7p5sx5Xei0m1uIkyoZt8i95dA8yg25SekFaFpnP4JiG6eqy1b1GUB3EAL?=
 =?us-ascii?Q?r2ZxBvjVXfKNWglrKcDnpBizt4BsDBeJv5f/TlRPReuQAToNHDLF1Mh4JRr3?=
 =?us-ascii?Q?GwGksp3RijVrLnlqfHFOo6fA4+/AZ5CGdPbSdaY+tGELczfELG/vgkqjZ8vl?=
 =?us-ascii?Q?gH0JwKo641UlRF8pFZJXk7GOTmCX7Le4jpH70phNBAfvqdYQ9RgLiTGQKbo9?=
 =?us-ascii?Q?AXhtbzymn0ReYYbge6pCw2usDt8hj0qBJnvGDH25HnqpLOECM28/UUAT59mg?=
 =?us-ascii?Q?4XG8Xf+sqOQwTFLO4+tVrxZ8rLPdYjfLvOPQUYxbXE6lbT6N68BZx+6AdmpA?=
 =?us-ascii?Q?gidqtLUmmrFLgLVBt/ls6IJjZz0OrDILyrYuSAbkzEiPRZt2dDi2cRoyY3Z9?=
 =?us-ascii?Q?Q/9E/6ZBJec6l4CNQMrRq71Xsz6oUCey7uaoIh/U5VvQjEDIs7mEutt94W+Q?=
 =?us-ascii?Q?eHnYAANnpKbtekfbGPkCOiUfWcyjwTPSD1M5ji/+miNgqdp4zPXGI5nYrfh+?=
 =?us-ascii?Q?W1AZY86sZT7AXsG6qYhXGNzbITe/aIN2a0PW8jlP5guhK9DfHdN0y6p4kJ63?=
 =?us-ascii?Q?BTmKT3V5Tp5mQG8KaUQxxX45eKVYziKpVQ/s1WbvFvYD2qqZN1Y1L+5ywQ7v?=
 =?us-ascii?Q?lirpNHU2nhNRdxy9uSQF0aGymIa+jRipRNfRKQyhheJJz7nNmWMbhk8lWQWY?=
 =?us-ascii?Q?z8N2Bf5l5HkAFQPr6Xgf56/3jYVn2JlnuUKEm7TeXhKRTqHAdYASsY94CCLd?=
 =?us-ascii?Q?iCutBgxE9HmksnwSHnlvCpRe4daTTPxKUu+UkSZ+3veozZw7RPFp7AjlM6Za?=
 =?us-ascii?Q?qcHjrTFn20asP2M+HTDyk4oxXWhrCw3kso2QrR8fSaD18chahyKm/Cd7rp5w?=
 =?us-ascii?Q?fu1tm+haopnEuf9CSaYacr9O7HRSdda2oBWgTXaaxukjFt5TUDBkEoTxl6CY?=
 =?us-ascii?Q?wHi5Yoz4lLHpeeX5QdjZ6RuQ4ueyT90QVe8yIEROBYL7LC8ovCUij4W3t0+g?=
 =?us-ascii?Q?IBRI5XZ1KeSVMeHtkprjlS7dLxhBgOfS1Q3loq8MCiZ1PIfY7yIq51VkNef1?=
 =?us-ascii?Q?l/65uwmzvF/fL13bIkSFM3crme9FH74YHW1ZZadE53qSGnCZazXDjrz6Ns8L?=
 =?us-ascii?Q?dFIYoPfS+6BRttqggZOdpxavXwBaqEbf/PYScrO3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbbeb99-c7e4-4348-a3fa-08dbaa98245f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 03:04:22.4588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CKBwjQkJOdeCZzicHIvoiRMNHBipKCbETO1TmRADQIm75YhAz5aGRCEXDhVyaLz2XjBRb3yr+1vTDsyEf4EncC6MV0Y+w/p8+iv4Rc6eO58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7398
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap mappings on
 rpm suspend
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Friday, September 1, 2023 2:49 AM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: Nilawar, Badal <badal.nilawar@intel.com>; intel-
> xe@lists.freedesktop.org; Auld, Matthew <matthew.auld@intel.com>
> Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap mappings
> on rpm suspend
>=20
> On Thu, Aug 31, 2023 at 01:23:40AM -0400, Gupta, Anshuman wrote:
> >
> >
> > > -----Original Message-----
> > > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > Sent: Thursday, August 31, 2023 2:35 AM
> > > To: Nilawar, Badal <badal.nilawar@intel.com>
> > > Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
> > > xe@lists.freedesktop.org; Auld, Matthew <matthew.auld@intel.com>
> > > Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap
> > > mappings on rpm suspend
> > >
> > > On Mon, Aug 28, 2023 at 10:00:31PM +0530, Nilawar, Badal wrote:
> > > >
> > > >
> > > > On 28-08-2023 17:46, Gupta, Anshuman wrote:
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Nilawar, Badal <badal.nilawar@intel.com>
> > > > > > Sent: Thursday, August 24, 2023 11:16 PM
> > > > > > To: intel-xe@lists.freedesktop.org
> > > > > > Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Auld,
> Matthew
> > > > > > <matthew.auld@intel.com>; Vivi, Rodrigo
> > > > > > <rodrigo.vivi@intel.com>
> > > > > > Subject: [RFC PATCH] drm/xe/dgfx: Release mmap mappings on
> rpm
> > > > > > suspend
> > > > > >
> > > > > > Release all mmap mappings for all vram objects which are
> > > > > > associated with userfault such that, while pcie function in
> > > > > > D3hot, any access to memory mappings will raise a userfault.
> > > > > >
> > > > > > Upon userfault, in order to access memory mappings, if
> > > > > > graphics function is in
> > > > > > D3 then runtime resume of dgpu will be triggered to transition =
to
> D0.
> > > > > IMO we need a configurable threshold to control the behavior of
> > > > > mmap mappings Invalidation, if vram usages is crosses to certain
> > > > > threshold, disable the runtime PM for entire life time of mapping=
.
> > > > Agreed. Other option could be disable rpm on server descrete
> > > > graphics for entire life time of mapping. But mainitaning
> > > > threshold is more promising and gives control to user.
> > >
> > > what use cases we have here for this?
> > > I believe that for discrete we could entirely block rpm if we have
> > > display or if we have shared dma_buf. any other case we should handle=
?
> > If Discrete is used for display then anyhow display is going to block r=
untime
> PM completely(be it PSR or Non-PSR).
> > The use case is with display turned off or with hybrid gpu use case.
> > Currently on Xe we are missing to have mem access ref count on mmap
> mapping and therefore mmap for vram bo is broken.
> > dma-buf will be also the use case in hybrid gpu use case.
>=20
> right. unfortunately we don't have the unmap callback.
> We could maybe get the reference on a new xe_gem_object_mmap and
> just release at xe_ttm_bo_destroy or maybe at
> xe_ttm_bo_delete_mem_notify?
>=20
> for the dma_buf we could probably hook the get/put to the attach/detach?
Hi Rodrigo,
attach/detach is already protected by mem access get/put but in my opinion =
 that will going to burn more power on dgpu in hybrid case as explained bel=
ow,
idle display on (display pipeline from igpu and framebuffer is imported  fr=
om dgpu) is going to burn more power for dgpu when it is completely idle (e=
ven igpu is idle, if it uses psr panel to refresh then platform can go to s=
0ix).
Is above behavior expected ?  if not then we will need this patch.
Thanks,
Anshuman Gupta.
>=20
> >
> > Thanks,
> > Anshuman Gupta.
> > >
> > > >
> > > > Regards,
> > > > Badal
> > > > > Thanks,
> > > > > Anshuman Gupta
> > > > > >
> > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > > > > ---
> > > > > >   drivers/gpu/drm/xe/xe_bo.c           | 53
> > > ++++++++++++++++++++++++++--
> > > > > >   drivers/gpu/drm/xe/xe_bo.h           |  2 ++
> > > > > >   drivers/gpu/drm/xe/xe_bo_types.h     |  6 ++++
> > > > > >   drivers/gpu/drm/xe/xe_device_types.h | 20 +++++++++++
> > > > > >   drivers/gpu/drm/xe/xe_pm.c           |  7 ++++
> > > > > >   5 files changed, 85 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > b/drivers/gpu/drm/xe/xe_bo.c index 1ab682d61e3c..4192bfcd8013
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > @@ -776,6 +776,18 @@ static int xe_bo_move(struct
> > > > > > ttm_buffer_object *ttm_bo, bool evict,
> > > > > >   		dma_fence_put(fence);
> > > > > >   	}
> > > > > >
> > > > > > +	/*
> > > > > > +	* TTM has already nuked the mmap for us (see
> > > > > > ttm_bo_unmap_virtual),
> > > > > > +	* so if we moved from VRAM make sure to unlink this from
> the
> > > > > > userfault
> > > > > > +	* tracking.
> > > > > > +	*/
> > > > > > +	if (mem_type_is_vram(old_mem_type)) {
> > > > > > +		spin_lock(&xe->mem_access.vram_userfault_lock);
> > > > > > +		if (!list_empty(&bo->vram_userfault_link))
> > > > > > +			list_del_init(&bo->vram_userfault_link);
> > > > > > +		spin_unlock(&xe-
> >mem_access.vram_userfault_lock);
> > > > > > +	}
> > > > > > +
> > > > > >   	xe_device_mem_access_put(xe);
> > > > > >   	trace_printk("new_mem->mem_type=3D%d\n", new_mem-
> > > > > > > mem_type);
> > > > > >
> > > > > > @@ -1100,6 +1112,8 @@ static vm_fault_t xe_gem_fault(struct
> > > > > > vm_fault
> > > > > > *vmf)  {
> > > > > >   	struct ttm_buffer_object *tbo =3D vmf->vma-
> >vm_private_data;
> > > > > >   	struct drm_device *ddev =3D tbo->base.dev;
> > > > > > +	struct xe_bo *bo =3D ttm_to_xe_bo(tbo);
> > > > > > +	struct xe_device *xe =3D to_xe_device(ddev);
> > > > > >   	vm_fault_t ret;
> > > > > >   	int idx, r =3D 0;
> > > > > >
> > > > > > @@ -1107,9 +1121,10 @@ static vm_fault_t xe_gem_fault(struct
> > > > > > vm_fault
> > > > > > *vmf)
> > > > > >   	if (ret)
> > > > > >   		return ret;
> > > > > >
> > > > > > -	if (drm_dev_enter(ddev, &idx)) {
> > > > > > -		struct xe_bo *bo =3D ttm_to_xe_bo(tbo);
> > > > > > +	if (tbo->resource->bus.is_iomem)
> > > > > > +		xe_device_mem_access_get(xe);
> > > > > >
> > > > > > +	if (drm_dev_enter(ddev, &idx)) {
> > > > > >   		trace_xe_bo_cpu_fault(bo);
> > > > > >
> > > > > >   		if (should_migrate_to_system(bo)) { @@ -1127,10
> +1142,25
> > > @@
> > > > > > static vm_fault_t xe_gem_fault(struct vm_fault
> > > > > > *vmf)
> > > > > >   	} else {
> > > > > >   		ret =3D ttm_bo_vm_dummy_page(vmf, vmf->vma-
> > > > > > > vm_page_prot);
> > > > > >   	}
> > > > > > +
> > > > > >   	if (ret =3D=3D VM_FAULT_RETRY && !(vmf->flags &
> > > > > > FAULT_FLAG_RETRY_NOWAIT))
> > > > > > -		return ret;
> > > > > > +		goto out_rpm;
> > > > > > +	/*
> > > > > > +	 * ttm_bo_vm_reserve() already has dma_resv_lock.
> > > > > > +	 * vram_userfault_count is protected by dma_resv lock and
> > > > > > +rpm
> > > > > > wakeref.
> > > > > > +	 */
> > > > > > +	if (ret =3D=3D VM_FAULT_NOPAGE &&
> > > > > > xe_device_mem_access_ongoing(xe) && !bo-
> >vram_userfault_count)
> > > {
> > > > > > +		bo->vram_userfault_count =3D 1;
> > > > > > +		spin_lock(&xe->mem_access.vram_userfault_lock);
> > > > > > +		list_add(&bo->vram_userfault_link, &xe-
> > > > > > > mem_access.vram_userfault_list);
> > > > > > +		spin_unlock(&xe-
> >mem_access.vram_userfault_lock);
> > > > > >
> > > > > > +		XE_WARN_ON(!tbo->resource->bus.is_iomem);
> > > > > > +	}
> > > > > >   	dma_resv_unlock(tbo->base.resv);
> > > > > > +out_rpm:
> > > > > > +	if(tbo->resource->bus.is_iomem &&
> > > > > > xe_device_mem_access_ongoing(xe))
> > > > > > +		xe_device_mem_access_put(xe);
> > > > > >   	return ret;
> > > > > >   }
> > > > > >
> > > > > > @@ -2108,6 +2138,23 @@ int xe_bo_dumb_create(struct drm_file
> > > > > > *file_priv,
> > > > > >   	return err;
> > > > > >   }
> > > > > >
> > > > > > +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo
> *bo) {
> > > > > > +	struct ttm_buffer_object *tbo =3D &bo->ttm;
> > > > > > +	struct ttm_device *bdev =3D tbo->bdev;
> > > > > > +
> > > > > > +	drm_vma_node_unmap(&tbo->base.vma_node, bdev-
> > > > > > > dev_mapping);
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * We have exclusive access here via runtime suspend. All
> > > > > > +other
> > > > > > callers
> > > > > > +	 * must first grab the rpm wakeref.
> > > > > > +	 */
> > > > > > +	XE_WARN_ON(!bo->vram_userfault_count);
> > > > > > +	list_del(&bo->vram_userfault_link);
> > > > > > +	bo->vram_userfault_count =3D 0; }
> > > > > > +
> > > > > > +
> > > > > >   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> > > > > >   #include "tests/xe_bo.c"
> > > > > >   #endif
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.h
> > > > > > b/drivers/gpu/drm/xe/xe_bo.h index 0823dda0f31b..6b86f326c700
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > > > > @@ -247,6 +247,8 @@ int xe_gem_create_ioctl(struct drm_device
> > > > > > *dev, void *data,
> > > > > >   			struct drm_file *file);
> > > > > >   int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void
> *data,
> > > > > >   			     struct drm_file *file);
> > > > > > +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo
> *bo);
> > > > > > +
> > > > > >   int xe_bo_dumb_create(struct drm_file *file_priv,
> > > > > >   		      struct drm_device *dev,
> > > > > >   		      struct drm_mode_create_dumb *args); diff --git
> > > > > > a/drivers/gpu/drm/xe/xe_bo_types.h
> > > > > > b/drivers/gpu/drm/xe/xe_bo_types.h
> > > > > > index f6ee920303af..cdca91a378c4 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > > > > > @@ -68,6 +68,12 @@ struct xe_bo {
> > > > > >   	struct llist_node freed;
> > > > > >   	/** @created: Whether the bo has passed initial creation */
> > > > > >   	bool created;
> > > > > > +	/**
> > > > > > +	 * Whether the object is currently in fake offset mmap
> > > > > > +backed by
> > > > > > vram.
> > > > > > +	 */
> > > > > > +	unsigned int vram_userfault_count;
> > > > > > +	struct list_head vram_userfault_link;
> > > > > > +
> > > > > >   };
> > > > > >
> > > > > >   #endif
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > index 750e1f0d3339..c345fb483af1 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > @@ -328,6 +328,26 @@ struct xe_device {
> > > > > >   	struct {
> > > > > >   		/** @ref: ref count of memory accesses */
> > > > > >   		atomic_t ref;
> > > > > > +		/*
> > > > > > +		 *  Protects access to vram usefault list.
> > > > > > +		 *  It is required, if we are outside of the runtime
> > > > > > +suspend
> > > > > > path,
> > > > > > +		 *  access to @vram_userfault_list requires always
> first
> > > > > > grabbing the
> > > > > > +		 *  runtime pm, to ensure we can't race against
> runtime
> > > > > > suspend.
> > > > > > +		 *  Once we have that we also need to grab
> > > > > > @vram_userfault_lock,
> > > > > > +		 *  at which point we have exclusive access.
> > > > > > +		 *  The runtime suspend path is special since it
> doesn't
> > > > > > +really
> > > > > > hold any locks,
> > > > > > +		 *  but instead has exclusive access by virtue of all
> other
> > > > > > accesses requiring
> > > > > > +		 *  holding the runtime pm wakeref.
> > > > > > +		 */
> > > > > > +		spinlock_t vram_userfault_lock;
> > > > > > +
> > > > > > +		/*
> > > > > > +		 *  Keep list of userfaulted gem obj, which require to
> > > > > > +release
> > > > > > their
> > > > > > +		 *  mmap mappings at runtime suspend path.
> > > > > > +		 */
> > > > > > +		struct list_head vram_userfault_list;
> > > > > > +
> > > > > > +		bool vram_userfault_ongoing;
> > > > > >   	} mem_access;
> > > > > >
> > > > > >   	/** @d3cold: Encapsulate d3cold related stuff */ diff --git
> > > > > > a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > > > index 0f06d8304e17..51cde1db930e 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > > > @@ -172,6 +172,8 @@ void xe_pm_init(struct xe_device *xe)
> > > > > >   	}
> > > > > >
> > > > > >   	xe_pm_runtime_init(xe);
> > > > > > +	INIT_LIST_HEAD(&xe->mem_access.vram_userfault_list);
> > > > > > +	spin_lock_init(&xe->mem_access.vram_userfault_lock);
> > > > > >   }
> > > > > >
> > > > > >   void xe_pm_runtime_fini(struct xe_device *xe) @@ -205,6
> > > > > > +207,7 @@ struct task_struct *xe_pm_read_callback_task(struct
> > > > > > xe_device
> > > > > > *xe)
> > > > > >
> > > > > >   int xe_pm_runtime_suspend(struct xe_device *xe)  {
> > > > > > +	struct xe_bo *bo, *on;
> > > > > >   	struct xe_gt *gt;
> > > > > >   	u8 id;
> > > > > >   	int err =3D 0;
> > > > > > @@ -238,6 +241,10 @@ int xe_pm_runtime_suspend(struct
> > > > > > xe_device
> > > *xe)
> > > > > >   	 */
> > > > > >
> 	lock_map_acquire(&xe_device_mem_access_lockdep_map);
> > > > > >
> > > > > > +	list_for_each_entry_safe(bo, on,
> > > > > > +				 &xe-
> >mem_access.vram_userfault_list,
> > > > > > vram_userfault_link)
> > > > > > +		xe_bo_runtime_pm_release_mmap_offset(bo);
> > > > > > +
> > > > > >   	if (xe->d3cold.allowed) {
> > > > > >   		err =3D xe_bo_evict_all(xe);
> > > > > >   		if (err)
> > > > > > --
> > > > > > 2.25.1
> > > > >
