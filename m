Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E46C7EE2D
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 13:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD53A10E29E;
	Mon,  5 Jun 2023 13:44:23 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBD710E29E
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 13:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685972662; x=1717508662;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tXAaRjAqqSh6H4cFqmwlOx27ENfDVXxslJu8gMexnaU=;
 b=cqkcqOAXkFY+vLq5dF2Tegdp9Z+kbHC1G08ZW9G0pkYLBIOLK3bR4sll
 FX4Xm/aDEbowZLlRCUKOydLi1weFWGuMQZtth8c+5+QZQvY4+aJXW58W6
 n5900i1HzzpcGzxI1ejVpLiD6goMjWxBI5NPXOkqzv4PaOBozFuWG4D+b
 qkPgLGehEkRttqmMKsj8f4BRijAJFUlWX6egHbYZbB/EIhuM896iewNQC
 pysblpa/Gq/XizjL/ajl6j2u44ulvAvsNnIJUlpgwPBZ1RACihNEWxpCf
 DvMwLqCpOZl8GhaqBOPZ75ByOTc7Q1Dh5vZSaPloNR77YLKyv3n4YU58C Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="353860306"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="353860306"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 06:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="778559114"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="778559114"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 05 Jun 2023 06:38:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 06:38:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 06:38:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 06:38:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 06:38:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bT7Ege+MxU8VfY/14Vsibj93ooL8A4dUqw4X8e4OARIx8DbSdTn1TL7YL21ZdtdvkHbJAb5cLNgmJQ/EPdKZ6EBgbOca/BCvuY1C2L4Olagpzn3+treyfcbokdZR9zuBA8stf2aGUMfxCbW43OE+DPWAhNDhOCR/UWDWft5/5rrXGDWD6H5BO90jsXrhMrSP0vgUmBN72L3UtgnbsrCyuVbDRuv0GIrVtyDA9iLbMW7Ok9I9mK1M4uvY9BqQ4U6diytbqytyl9rk8Fb/a3NIdRLYJPppnv+eG9OlE4QEMzGNEMox5nlm1cwFqUSKQdXMaX7jkbL7h5FmnfzRSHr/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZNapVC/5SeKOkyskKuArY0H86ti3eLoh5HtSl3UtTU=;
 b=EQnDUmDSkxlQ9GWVQlPbo4bmNSeF19GYgcOvEccXO/gAUaJYAj/j/2hWQpVGZwl5FNDbbr/W2PYM2UsGLB9CQvWpa95rto4z+jiOMdWJS0XMVpUI3y2LEfCmu7Y1P22RjvTT3F1zU3srrjiZuskcVU6vggae3stx5JRG2wH/CtTzDctLnl+bOoirAvuVoarAat5wvT5UKlMf10fW+JJMeDJ2FttuoJ+8446FSjq3j3uqBFCKKNN3VlNYGoSvrpT+2Y5piq81H4m6Xb60tMjffUKhDVEefZo+vGsy+YjAnMab0Zgwd5gPhbTYLBBLqCL0SOf79868g3uZbdQx2XCATg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS7PR11MB6037.namprd11.prod.outlook.com (2603:10b6:8:74::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.32; Mon, 5 Jun 2023 13:38:22 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 13:38:22 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory size
Thread-Index: AQHZfnnAmtsopt9dbk62RKm6nfbCWq9xE4SAgAADPwCAAXKegIAEtk2wgACOJQCABJqtUA==
Date: Mon, 5 Jun 2023 13:38:22 +0000
Message-ID: <SJ1PR11MB620415A7B4F4FD2CFA9BC742814DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
 <SJ1PR11MB6204AD929734B440C251F235814A9@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <CH0PR11MB54742C54B5F0E7872CE9DC718C4A9@CH0PR11MB5474.namprd11.prod.outlook.com>
 <BL1PR11MB5480D96FD947D16F4E140DA68C4B9@BL1PR11MB5480.namprd11.prod.outlook.com>
 <SJ1PR11MB620439B1C575F0177E747142814EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <20230602151748.GD5433@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230602151748.GD5433@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS7PR11MB6037:EE_
x-ms-office365-filtering-correlation-id: b228451c-f082-4371-568b-08db65ca218e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pvCaX8hbIu17dEUPbJBCkVwtJOrfVKfQdDsZxpvPr/K7UkaH0IVS7+T3+LoH8mOG/J47vFvlx3r2xDSbn59OKtduSn+68NhMCEfuGOvfGZxe+0a+r3lDuvUFuHqNLTZfJHXLYim4DxZTQWWGFVmbj6UD/6H9K418JKntBVymd4X/MG2VeH4TW0CrYyfYhU7dBaS7eBwstKNXxFyDhoghKLcAxKKRZMawuXXbEC92AXLa/i+MVJlnZdWrkhVE3S7MqwrPpzOIMOMtNVD+hKZoHxUq0NFHBtq0N14SleKQinEsOzWSoA8eM21ePKGZ3348J+dgokj7Y2wsoZPP2kLsqJ4kgsPoUKmeC02H/dIY/EdqTaVjVYQQyE6kC9LjufNWFzfuX2iaB5jLYFTX6atkHfrsjPOgq2j6KoX/Mf+qnc5OoMx8wrSYLUexmQoZ6IOhiMCscQriPHR/un8SQxKYvRVsvz/9ufpw7EQufZlIa9GlUsCK5XmuKpaW8Z/s69Tb+4RY8gDQH9gfXMelEpGk4fGeUIqmbI6DqtHacDYOOYwoli4pj0octMakl9nfHm7C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199021)(55016003)(54906003)(478600001)(82960400001)(8936002)(6862004)(8676002)(66446008)(6636002)(4326008)(76116006)(66556008)(316002)(38100700002)(66476007)(64756008)(66946007)(122000001)(41300700001)(186003)(83380400001)(966005)(7696005)(71200400001)(107886003)(53546011)(9686003)(6506007)(26005)(33656002)(86362001)(5660300002)(52536014)(2906002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FQ7fmvCO5MR6e3/543Nw+UpqDiOq2Uh1k+R38y2r/xbntvYNzM1yq+VdC/p1?=
 =?us-ascii?Q?CHog0a1vUKr4iHdy4+HRTL8oCotSdMLNVaHgh7YB/ulouoXO8LbcX58fp5qa?=
 =?us-ascii?Q?8Iin4pNpKJ8JrdAaWVwdpnDDSt/j9r94SlPQ0rTzGVTzsOCiM2L2YFycZuMw?=
 =?us-ascii?Q?etQEWyz/DFp2z/LQDtZMeEbYEWttjK+PVF3GMZe3jri9/uFV9M7kIFn3l1gI?=
 =?us-ascii?Q?0JFchcoWzjgfteZnYSuv5+Flo8X4EBGAH0v00wz29uznrDA0B4I7xFHdtveM?=
 =?us-ascii?Q?jAVevcDfCzZUeuTXRMUCHEe+aXKTKLqOkWDHDNUQ/d2r0qW8vWSsxUfyDpq0?=
 =?us-ascii?Q?ISLUGvcBmm5IfzXiaIIzazkddtgfBlBSExbI2s9bqxdI+braiJWL/v3I61wI?=
 =?us-ascii?Q?8NclasECOwncqrVp647/RpVVjvKyH+xMQYSvKQ/XY4x5m68v3JH39KCFMcDz?=
 =?us-ascii?Q?tlppNayYGRDaGDolXbpMx6QkGkPEoAj58qHrDt2THyFQPaPFk8ooiQJzFO+r?=
 =?us-ascii?Q?PtwdBLOb4cSkEQbSXVwflg08LpkVxoMJMAt+M/pURlZr3m5afApN3l2XF+Yj?=
 =?us-ascii?Q?A9TPU1yo30L0yzd0CF/Bs5jfQDRiiI6gP9pu5wyxuBApfdnKDTrqgcCGKTKS?=
 =?us-ascii?Q?F7Jk1U9z9sUpnycTOD77M7T9XYEfzDHPiMc9e8HNr2R9j0RowdV1MNff3C/H?=
 =?us-ascii?Q?+DP4Ljv+4B0G7N8RzZjT9Hdfzbi9DQpAW9SJX/OMuYDxfH2aN128yODzsV7a?=
 =?us-ascii?Q?WyvpuC0Epe6eyoFeAHm3/+0g/Q70FsQNYE3vIhqsxJ03ASBJ8Lo1go0XcGH5?=
 =?us-ascii?Q?4R24N+wS7KGxLmFTz7WRwvKMmFV8jLgCzbLtcAnryRUFxmCOflnfh1vF0FMh?=
 =?us-ascii?Q?OF1QNVij2wfMXmKujZWCQF32ZQD2aA7Yp1ZEYRiTMT4mdkOtvZuXToKXW3DJ?=
 =?us-ascii?Q?hfJXkRGBTpSrBF9sMhrwDZ24dkpfGzplyadyP9NbpfpkTT8IG/BY7110AM/c?=
 =?us-ascii?Q?4JHHhMH6lni5ddgdqe8tgY4LwKK7YSvjKzcmlW9w+wVPMRGvqB1S6rF+3Uuo?=
 =?us-ascii?Q?RACQceVn4Z1eqELkpt59FSqzUkFreMeAseL3QYyi4z+PwZFVzkJGLAYMlc2M?=
 =?us-ascii?Q?cyM+pC8ocfOzVht55cDBnopy0jFPQcGl6rE1TaApmiKnjWIXiG6TN5EZTJUr?=
 =?us-ascii?Q?puVV8y5hnUHMDPcRCoSrplg6pMByqq5k3CuRunUH7R+m6MKWdu5EcwG3YZHV?=
 =?us-ascii?Q?zjp4KVOrtMU+K9Drd/btuFqtf8lHn4224McxVSVQBDk5C3AnlKweIbae76vm?=
 =?us-ascii?Q?ZJqRH9t56J9f5vwaW8/Mz1MKXxj02OYLXz3Tfc7b5qLf0MZO4wiXDol4ta3H?=
 =?us-ascii?Q?LAby3sn82vRslk6RYVP72OjHZHPfSZd/rc4QycjR5dnwuXuUKk6CwVq2TY4d?=
 =?us-ascii?Q?v4uDM/EQ1cnEX5llQ6HVkMTlrIf27sX02lGo7sRgnKZiYjyVOP10nIrhYqD0?=
 =?us-ascii?Q?WtZkAzHCIJC3hR0wEpKuV0bffIJiD3OMCyk6xvns7sEJa63g5f1jpdTg3OhV?=
 =?us-ascii?Q?8onO7aLVmCex5exYII/ifX4akw5ALErX2Y2OCgVH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b228451c-f082-4371-568b-08db65ca218e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 13:38:22.3221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: itOcBAbPRRkn4il2f5inLCortMIj3scGopbMlRzwxYaIRltnthjLGdyl2sqzKFV8DjX7eFKHU/VbFykFOn4WnAIHbhO55TQ3POdbF/s5C/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6037
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
 memory size
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Friday, June 2, 2023 8:48 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; intel-
> xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dixit,
> Ashutosh <ashutosh.dixit@intel.com>
> Subject: Re: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory
> size
>=20
> On Thu, Jun 01, 2023 at 11:51:51PM -0700, Upadhyay, Tejas wrote:
> >
> >
> > > -----Original Message-----
> > > From: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>
> > > Sent: Tuesday, May 30, 2023 12:22 PM
> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > xe@lists.freedesktop.org; Roper, Matthew D
> > > <matthew.d.roper@intel.com>
> > > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dixit, Ashutosh
> > > <ashutosh.dixit@intel.com>
> > > Subject: RE: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
> > > memory size
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Iddamsetty, Aravind
> > > > Sent: Monday, May 29, 2023 2:15 PM
> > > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > > xe@lists.freedesktop.org
> > > > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dixit, Ashutosh
> > > > <ashutosh.dixit@intel.com>; Roper, Matthew D
> > > > <matthew.d.roper@intel.com>
> > > > Subject: RE: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
> > > > memory size
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > > > Sent: Monday, May 29, 2023 2:10 PM
> > > > > To: intel-xe@lists.freedesktop.org
> > > > > Cc: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Vivi,
> > > > > Rodrigo <rodrigo.vivi@intel.com>; Dixit, Ashutosh
> > > > > <ashutosh.dixit@intel.com>; Roper, Matthew D
> > > > > <matthew.d.roper@intel.com>
> > > > > Subject: RE: [PATCH 0/3] drm/xe: Add sysfs entry to report per
> > > > > gt memory size
> > > > >
> > > > > Initiating discussion on sysfs path for this inline below :
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > > > > Sent: Thursday, May 4, 2023 4:50 PM
> > > > > > To: intel-xe@lists.freedesktop.org
> > > > > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Iddamsetty,
> > > > > > Aravind <aravind.iddamsetty@intel.com>
> > > > > > Subject: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
> > > > > > memory size
> > > > > >
> > > > > > Add sysfs entry to read per gt physical memory in total
> > > > > > including stolen memory.
> > > > > >
> > > > > > The sysfs entry added can be read using:
> > > > > > cat /sys/class/drm/card1/gt/gt0/addr_range
> > > > > > cat /sys/class/drm/card1/gt/gt1/addr_range
> > > > >
> > > > > We already have gt#num directory created under device folder,
> > > > > should we create addr_range under that only. I think that would
> > > > > be straight forward to start with.  For example,
> > > > >
> > > > >
> > >
> /devices/pci0000:a7/0000:a7:01.0/0000:a8:00.0/0000:a9:01.0/0000:aa:00.
> > > > > 0/
> > > > > drm/card1/gt0/addr_range
> > > > >
> > > > > Initiating discussion there to conclude on path on this sysfs
> > > > > entry as well as scheduler interface entries as well as under "en=
gine"
> > > > > folder under
> > > > card1.
> > >
> > > Also, now with Matt's " Separate GT and tile" series addr_range is
> > > associated to a tile rather than gt.  We might have to introduce
> > > "tile" in sysfs
> >
> > Hi @Roper, Matthew D, @Vivi, Rodrigo,
> >
> > Should we expose tile0/1->addr_range to user, with sysfs like
> device/tile0/gt0, device/tile1/gt1? Looking for inputs here to move forwa=
rd
> with second version of this patch.
>=20
> Since memory is a tile-specific concept and isn't related to GTs, I'd ima=
gine
> you probably want something like
>=20
>         /sys/class/drm/cardX/tileY/addr_range
>=20
> Since this is sysfs rather than debugfs, that means we have to follow all=
 the
> strict uapi requirements, including having an opensource userspace
> consumer and preserving backward compatibility forever.  Which userspace
> component plans to use this?  It's unclear to me how this is going to get=
 used,
> but you should make sure a single general addr_range is actually what the=
y
> want, rather than a more general interface that can report details about
> multiple ranges of memory per tile (e.g., stolen memory, generally availa=
ble
> vram, etc.).
>=20

Also, we have gt0 and gt1 sysfs dirs created under device folder as device/=
gt0 and device/gt1 right, do we need to establish relation between new tile=
 dir (/sys/class/drm/cardX/tileY/addr_range)  and gt0/gt1 dir which we alre=
ady have in xe? Or we should keep them independent!

Thanks,
Tejas
>=20
> Matt
>=20
> >
> > Thanks,
> > Tejas
> > >
> > > Thanks,
> > > Aravind.
> > >
> > > >
> > > > Scheduler/engine entries are not related to this feature let's
> > > > discuss them separately.
> > > >
> > > > Thanks,
> > > > Aravind.
> > > >
> > > > >
> > > > > Please provide your inputs.
> > > > >
> > > > > Thanks,
> > > > > Tejas
> > > > > >
> > > > > > As it involves drm_class, it required movement in xe_device
> > > > > > init flow, patch for same is part of this series.
> > > > > >
> > > > > > Actual physical memory per GT was dependent on infra patch
> > > > > > from Ruhl, Michael J, so I have added it as part of this
> > > > > > series to pass through pre-
> > > > > merge.
> > > > > > Patchwork:
> > > > > > https://patchwork.freedesktop.org/series/117126/#rev3
> > > > > >
> > > > > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > >
> > > > > > Tejas Upadhyay (3):
> > > > > >   drm/xe: Rework multi tile device memory initialization
> > > > > >   drm/xe: Register drm device prior to gt init
> > > > > >   drm/xe: Add sysfs entry to report per gt memory size
> > > > > >
> > > > > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h   |   2 +-
> > > > > >  drivers/gpu/drm/xe/xe_bo.c             |   8 +-
> > > > > >  drivers/gpu/drm/xe/xe_bo.h             |   2 +-
> > > > > >  drivers/gpu/drm/xe/xe_device.c         |   8 +-
> > > > > >  drivers/gpu/drm/xe/xe_device_types.h   |  20 +-
> > > > > >  drivers/gpu/drm/xe/xe_gt_sysfs.c       |  74 ++++++-
> > > > > >  drivers/gpu/drm/xe/xe_gt_sysfs.h       |   1 -
> > > > > >  drivers/gpu/drm/xe/xe_gt_types.h       |  21 +-
> > > > > >  drivers/gpu/drm/xe/xe_migrate.c        |   6 +-
> > > > > >  drivers/gpu/drm/xe/xe_mmio.c           | 279 ++++++++++++++---=
------
> --
> > > > > >  drivers/gpu/drm/xe/xe_mmio.h           |   4 +-
> > > > > >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  30 +--
> > > > > >  12 files changed, 291 insertions(+), 164 deletions(-)
> > > > > >
> > > > > > --
> > > > > > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
