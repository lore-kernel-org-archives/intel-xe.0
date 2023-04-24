Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A89AC77B61
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 13:50:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB76410E14A;
	Mon, 24 Apr 2023 13:50:07 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FEC10E14A
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 13:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682344206; x=1713880206;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rJUQJNAhot+QEFTkOJp/Hgk4u0mzBDJGn953ycQJ1Qc=;
 b=hzn2Op9aYI/HFHkNx1PWEtuoC0MwpR/jlSlEgaTISapZqYJtzzlcAFO/
 5/hBXWUahHublx1dICI7qwuRnBhqlxvUzeACpXB6EvWDhBRJMtKQKsIXO
 LtAkuLKpbJnT4hn1wZ445MjBi1cdJWMfd+f1Eo+4VaFjrgkxNRG1HvJOj
 zHCuk6/WvW6w3UZHQuv34rmq0ahDyExWk9wIWQ1HJajp7I8XPmguCgbyo
 Omw9JpBzZAK2laFITXzaVop2izkDKQa1VLhVVN2nzR0mpHn1XDqkQEaUD
 2rSEvDcwrnN2BhOLMrB+jWPpx4Zk+xNCJH5icGIBIWQKZY7MuXHrCsZga g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="348364253"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="348364253"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 06:50:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="695778001"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="695778001"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 24 Apr 2023 06:50:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 06:50:04 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 06:50:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 06:50:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 06:50:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dzw8CirJXowfDwppKL21C5jbOYrNtVV9IMloQqDHjy4039lebSASn2J4CGponmkwkyxqpnlfRY1QhKXQX3/8BmhIKEgXrVFNyjysIj9A7QQ3PqiDvGU2dKY5gBYA/M0QPWtRXh24qee6AFNJtcrrixJAVHViahuy8LbRiz5W6OmQ2fTNbEy0WrfagrF0VlpI273IxFX+knBcJYu2lFhJJM2jco7U7sQ4FNI+OI1WGTAgeyak5yarYo5rfASTF1SCO5x8PnkQI/4CpR33oCehTm5MpynrdMaW3WBy4jEQg7TNTjYeGEYoiS0foACP6JzzSalQGcbAtEXzjThXz+ICMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmPBjg7+TiGwnJj2kBRrdrujquPRsBniS7wPSqmHibY=;
 b=O4s4vbu+W+9lAv/1m6ganXmlhVGuTsRbDw1OvMXZlMizMp/ZnwGYjYEBUCI8+PcYhWSEjFkGTBfXGEyZqqBJ1oQVhmhGbHM96AfCwaV6SHAjL1eyZ7BDK7xQYmbpIWBRWCjq0+VOjOveoAWcauRTCiCSbxAPJnS5bgFq6dwTMmXynOMPo15t3wSWJh0rJfajKU+YD3D3Ki+ipHhXEQeD6S+/zn+XuC6tE5h0fgUGmEJwfMsaYz66PNzAxlCoW+2UOvc6bgl2Td6XUeXxPs+K7AjKGsL37Cdhy1RCy+qCgoXeBkVzSNY9iddqVotfSitKKxWLc21qOnLS5Y+oc/nqdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH7PR11MB7986.namprd11.prod.outlook.com (2603:10b6:510:241::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 13:50:01 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 13:50:01 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Thread-Topic: [Intel-xe] [PATCH i-g-t] test/xe_pm: Assert on unbounded VSP
Thread-Index: AQHZdDpBONjp46Lv7ECYUujFPu4QSK81yWcAgAAHUrCABJVwAIAAEfKg
Date: Mon, 24 Apr 2023 13:50:00 +0000
Message-ID: <CY5PR11MB621135801959F3DD42F3330395679@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230421101511.3532534-1-anshuman.gupta@intel.com>
 <ZEKVvAvVm8Z7uIBK@rdvivi-mobl4>
 <CY5PR11MB6211AB6A30A90B44C8F71AF595609@CY5PR11MB6211.namprd11.prod.outlook.com>
 <ZEZ0ThMp9vwXmwg0@rdvivi-mobl4>
In-Reply-To: <ZEZ0ThMp9vwXmwg0@rdvivi-mobl4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH7PR11MB7986:EE_
x-ms-office365-filtering-correlation-id: a4ce72fc-c2c8-484b-7682-08db44cacca0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RFV+2M6brtpAcvPtd+WH90+qjEBH2vDA/QKeHlUvwKXH+qndo1C+ORHZYn17gyZ/rvcgYR3EbWss8P/k3Dlif9j1Q0ZME+J9u8EgkZfxieRFhyRWD+JR6e7Y7MHMgm5oZIyr+2CaETcIOhavpjW9bhag4I9nh2MroEhMN4hjwPKeG6dMeTj5FLIEuOinZrZGVm3hy7FjSjp4kKBJX6GsJrWyncU1NV1PLksV3uncIEb/yX+ez1udPphCy462c9Q6sOkpTRPbqJU0P6jaHMizJKVv3dfUpPK9EG+foRCHGG68INAy+QKv4H2forYCSOORiw90T21F7rjnajL17pBf5O7Rduge1J8hLwWN1lwrl8iQ+l1yMXbls3nyT2yBTdmHpQe4cDmO8cCQ1m6SuP22Pp8+h2p76yRfc8mNd0YAgxfmxcewf72Jurrc+7FHmg/YZK3z/Ct5MBRwSnEbwKzRplyCaJ160yRCVcLFq5sLCYvmX4T/M6tgcfVgYO0BblywbSe0N5/MVoMSFNWwXdMU5Y3Z4S8/KPX3pB8GnvEJCRAlb9nvuS0e0N63nwg8dhTi6oavFV5i1GmWOeqHhOTe2XthVXmd7Obuu7Ts7Z9FtUk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199021)(8676002)(8936002)(38070700005)(54906003)(478600001)(66446008)(66476007)(66556008)(55016003)(64756008)(4326008)(6916009)(66946007)(76116006)(122000001)(316002)(41300700001)(82960400001)(2906002)(38100700002)(52536014)(5660300002)(86362001)(186003)(966005)(26005)(6506007)(9686003)(33656002)(53546011)(107886003)(7696005)(71200400001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tc6LOhLkx+56WPD2puM1dN4Vb8QtDgtUd3f9hCczAYpqIq8URP8+LE5UQm5L?=
 =?us-ascii?Q?h8G9xO7pk/bjRcf7++WVXgJLd6B//sxS0CtsRGWGTZEk5w2Rhc9m3ZFF9ttp?=
 =?us-ascii?Q?Pt+43XfZaVG/n/SJrQ6iC8I2hkH5f91ht0ZU2fvI6mO+XyUg9C0mTXa7XoR6?=
 =?us-ascii?Q?rQCLlvHzj94d+KKLp/S+Jp1UlIa+fOqIa4HACgm9+4SGnvnMwsMQwiXl7y5f?=
 =?us-ascii?Q?wXuCqoIezFUBM2QvxmvCpMfbKfRAsgOZ0d3+B73SCNrOIfOG4Mw2cQ2TFADT?=
 =?us-ascii?Q?8QEdAVUripd9ujgMP82EMvSLxXElGnhiZCU3kkfFx0zcvQyXzf8n6Lky8nFj?=
 =?us-ascii?Q?VdOXor+YTyYLuDn3zOA2AaSHT98r6IuA47LSqDJwgdoVULSUAJjCmzyUtgWH?=
 =?us-ascii?Q?5+a2XooUSdAJBZOOPtDtTIQSufrK9QD8+QNWaPXDih5OipyfFo49ZPJMNDHv?=
 =?us-ascii?Q?cLa3a5ONUm/5ZbWNCP0jSxoxNMi7OKkSSbAH50tHeS3oSuVIyGgqGwtxEWOH?=
 =?us-ascii?Q?m+L3Q/PAy4AFB0evf1TTfIr+Vac60jPSeOxUFSdBF9zvC5Ud9cuo+VE0+5ra?=
 =?us-ascii?Q?p4M32CaCS0sQ6dSDn3TSfGvFKJ/VoJmZBDccpt/ef4afBI7mJHojOPAJdkTe?=
 =?us-ascii?Q?vB7uoK3rR405YNHwus9jMimcgeixjmafjwo4Thf3dqLx7wui8A9W/jzon7Rc?=
 =?us-ascii?Q?jhyyErA2ATrQs9eVDas0fXBctZMmIKI2LGOgB67Emn9OPw42GmWL1F2o2Ohr?=
 =?us-ascii?Q?MnwmqA1vv1xGSCnxazhu3DKG8SBRsDMHM17FIp9bUp7eWvhD5vrh5Wl4Oa49?=
 =?us-ascii?Q?9dJ1G2cqt9NsVzwN/s9tR7bObcRddwT1ttKTCoXTIdlUitjTVcZ36FBbYbx4?=
 =?us-ascii?Q?uyHzGDhI9rgMvaSFSor0dfvchfp05e+p+4X8P63YjDcODSVV7LUFTa6ozPum?=
 =?us-ascii?Q?uK+YIXREP0ypbnl4JFUg1HoJ4W07aP4IbW8tP5nPZcsUrKHAiCCs1Pu6xHiF?=
 =?us-ascii?Q?AGMP2BWgXek8qxe9THWYyU2UchT5eisl+90AAWJyFPOPT6fjgofOBTP/jFyN?=
 =?us-ascii?Q?UqYa8GJSe3QUPVCdMB8brlUgtDaRULuIKpcYBpUd1GslNNkDqYtz5hPc0daf?=
 =?us-ascii?Q?l2rlFt2NjXZb9ZoSlpVlk+7ePSAK1IJ7Vna8WWQrjM9az6Rx4rd/owyupxjT?=
 =?us-ascii?Q?QB70sRbdUoImNT1y7N+LI2cjnrM4mY9QXWdR+2QHdGOWY+LfwhjQ4oyFcamJ?=
 =?us-ascii?Q?SKotFdp/YU/wVH2FNuSh+Vgu5MHTlSd8XF9/I5+PhaFvcW1gVT9OUQgIXO4p?=
 =?us-ascii?Q?Vs4fSUZ7cbpUyzEr2dbXbXQM8bjLYmZmUvg0yc2o5MMIrOcIZnUieonUuUXP?=
 =?us-ascii?Q?VTlsznvPs1Zb80YSGjB5pnvKF8bORf0+H/0+tfW0AZcxDXkMPZjVc7gG+S1F?=
 =?us-ascii?Q?6bQMBilGZV7wplp4qo9W6WKKWMghTlp+wu5ibUTzTfjFnD8OGPv6LC1hHSW0?=
 =?us-ascii?Q?HbsUEZY2bcPjHdcGB9uDcZBK6kxB08qbPmiHF6zxFVikADSCE99k6SWjL3Oe?=
 =?us-ascii?Q?/mV6Q6FRmYtxfiqxnMYykzZ8oVgiTaCNj+fMDeAF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ce72fc-c2c8-484b-7682-08db44cacca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 13:50:00.9928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s+o/wX7A33CrGxBtkc1oJnpd7FYJjfGrtpvaoKuzl0rt6aOQO3MMHRrN5qDCxR8fNv9qoKeAi6nHWrvw1o9ZIWltfNhfKG40W5U0DUjtzTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7986
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t] test/xe_pm: Assert on unbounded VSP
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
Cc: "Chehab, Mauro" <mauro.chehab@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> Sent: Monday, April 24, 2023 5:52 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: Chehab, Mauro <mauro.chehab@intel.com>; intel-
> xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [Intel-xe] [PATCH i-g-t] test/xe_pm: Assert on unbounded VSP
>=20
> On Fri, Apr 21, 2023 at 02:30:42PM +0000, Gupta, Anshuman wrote:
> >
> >
> > > -----Original Message-----
> > > From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> > > Sent: Friday, April 21, 2023 7:25 PM
> > > To: Gupta, Anshuman <anshuman.gupta@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Chehab, Mauro
> > > <mauro.chehab@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > Subject: Re: [Intel-xe] [PATCH i-g-t] test/xe_pm: Assert on
> > > unbounded VSP
> > >
> > > On Fri, Apr 21, 2023 at 03:45:11PM +0530, Anshuman Gupta wrote:
> > > > Discrete GFX cards gfx may have multiple PCIe endpoints, they
> > > > connects to root port via pcie upstream switch port(USP) and
> > > > virtual pcie switch port(VSP), sometimes VSP pcie devices doesn't
> > > > bind to pcieport driver. Without pcieport driver pcie PM comes
> > > > without any warranty and with unbounded VSP runtime pm and system
> > > > wide suspend/resume IGT
> > > test
> > > > cases may get pass as false positive.
> > >
> > > I'm not sure if I'm following here... you mean that in cases like
> > > this we cannot suspend/resume at all? What are the false positive?
> > > I'm not following the whole scenario here...
> > Recently Linux core kernel revert the L1 substate save/restore feature
> from Linux.
> > That eventually requires L1 substate to be  disable from BIOS,
> > otherwise s2idle fails on a HOST with DG2 card as DG2 was not able to e=
xit
> form L1 substate. But due to the unbounded VSP our CI missed to report
> such issue.
> > As VSP were unbounded and DG2 Link was not transitioning to low power
> > Link State and our tests were passing instead of failing.
>=20
> But then on this case we are just avoiding the test now?
> Why don't we cherry-pick the linux core kernel fix as a temporary topic/c=
ore-
> for-CI instead of blocking the test?
We don't have any fix yet, Atm Linux core Kernel does not support L1 substa=
te during Suspend/Resume.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/pci/pcie/aspm.c?id=3Da7152be79b627428c628da2a887ca4b2512a78fd
>=20
> Or why are we not handling this case in kernel side then?
> Why block even s3 tests if this is only about the s2idle?
This is about D0/D3 and Link state for our discrete graphics card not direc=
tly related to s2idle/S3.
Due to unbounded VSP, PM core will always keep the bridge devices in D0, L0=
 state,
There is no point to test D3 and Suspend/Resume with unbounded VSP.
Unbounded VSP was the one of reason on i915 that we missed runtime pm waker=
ef before accessing lmem.=20

Br,
Anshuman Gupta.

>=20
> >
> > Br,
> > Anshuman Gupta.
> > >
> > > >
> > > > Therefore assert the xe_pm igt tests on unbounded VSP.
> > > >
> > > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > ---
> > > >  tests/xe/xe_pm.c | 11 ++++++++++-
> > > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c index
> > > > 23b8246ed..78d9374cf 100644
> > > > --- a/tests/xe/xe_pm.c
> > > > +++ b/tests/xe/xe_pm.c
> > > > @@ -33,6 +33,7 @@
> > > >  typedef struct {
> > > >  	int fd_xe;
> > > >  	struct pci_device *pci_xe;
> > > > +	struct pci_device *pci_parent;
> > > >  	struct pci_device *pci_root;
> > > >  } device_t;
> > > >
> > > > @@ -344,6 +345,7 @@ NULL));
> > > >  igt_main
> > > >  {
> > > >  	struct drm_xe_engine_class_instance *hwe;
> > > > +	struct drm_xe_query_config *config;
> > > >  	device_t device;
> > > >  	char d3cold_allowed[2];
> > > >  	const struct s_state {
> > > > @@ -369,8 +371,15 @@ igt_main
> > > >  		device.fd_xe =3D drm_open_driver(DRIVER_XE);
> > > >  		device.pci_xe =3D igt_device_get_pci_device(device.fd_xe);
> > > >  		device.pci_root =3D
> > > igt_device_get_pci_root_port(device.fd_xe);
> > > > +		device.pci_parent =3D
> > > pci_device_get_parent_bridge(device.pci_xe);
> > > >
> > > > -		xe_device_get(device.fd_xe);
> > > > +		config =3D xe_device_get(device.fd_xe)->config;
> > > > +
> > > > +		if (config->info[XE_QUERY_CONFIG_FLAGS] &
> > > XE_QUERY_CONFIG_FLAGS_HAS_VRAM) {
> > > > +			igt_assert(device.pci_parent);
> > > > +
> > > 	igt_assert_f(!pci_device_has_kernel_driver(device.pci_parent),
> > > > +				     "pci bridge device does not bind with
> > > pcieport driver\n");
> > > > +		}
> > > >
> > > >  		/* Always perform initial once-basic exec checking for health
> > > */
> > > >  		xe_for_each_hw_engine(device.fd_xe, hwe)
> > > > --
> > > > 2.25.1
> > > >
