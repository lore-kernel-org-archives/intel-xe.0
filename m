Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D344C77B7A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 06:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0230D10E625;
	Fri,  2 Jun 2023 06:52:00 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6D110E625
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 06:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685688718; x=1717224718;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bc8xVuI9VHJLchDolm6nfFO5+w0ydLnRhQNFDOWjKMM=;
 b=HxBNF+jQdrbLFNjAkMGZ+KEehY9axdvlIChN31lY8o+8DktKWLTXVe9V
 mFkRTDGP7w22Y2+x1z7piIz1wVxi55yfHfU0M81dhpgtyfMlmCFKe40kK
 78t2WrawgZLae7CkeiV0ebPtyke7m6DEbka65JBo3kpVWP459mNbkQQFb
 8XvOTZQ00EhVBCe8tQbcEdnNSd9XyjQauZu+n1WdaDLOxFlCPvWQjjCBv
 PTPBpdm6dgnO6qszU/pt/yS6PgSIfm0W8cocH+1WmDRMx+QSS006ngogS
 0p9XjmwNvRJtb9U7XJiLtB5fkqF79EIAhPfPWTrpY5QTFmfsnnSJS5aO2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="340419878"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="340419878"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 23:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="658120392"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="658120392"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 01 Jun 2023 23:51:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 23:51:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 23:51:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 23:51:55 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 23:51:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ix6nlFxvnuWErW/K2lepB6BNgzUmcSFhZc5paRqPwllQ/t3YTYFI95dmdrOARWXEk9rGLlpQP/+z68FASwOEtjm+3RP2q1ejlovtaBW/j2EbhE1emvUwkgkuLHIs1kdT2ZMriBr4okObN2yT7P3TCZYgOCkcZI/tDl2GvixsiWw4khM/TQyJIyEb2AuD76dGPxrxmo9ZevKBvHh3LcTafkgk8BOfyOUYFl2TUU0yWttqYoDA/6fVY6XuiPg7/E4lBRfeIkcG6jzrymS6E2g2b/VGPCJVOaiazz6bYhkN/BbLFsrEat0+CJjbG6PkXvmydepLUpdAP8mlnUUw05uHNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPNBw9uk5UlaqtvrA0kCpj/Vl5YF3KEA3CzH14OMVm8=;
 b=BHBZHBOJPvsPWPscFhjhhK0MjI86Mw42P+sAZjQ3HSuwiAcX4fdKuLbPi7qWUqksN56F5TaUKQSZfGCTNNZ4SF5s9PU5TUKG3GKWoY/x0oObi8IIVHi1GSO3nTLjk7tbzkzg012J64kzCEOQbwOV3VnkBdru9Ob5JKo3ve5y2oVRSxB1a/K4Suyg5WEzZNa0NUg9H8+ir3IXJr28MeVNNOYulJEa6BNUqMSDtqgqhHHbEoU/9OHSz3Nrap8HP4YHGmgU8GEx7jfcD0T4x5UfKpDmBNgh+M/nKe41ZkkCn4pAP9KTvyFdVB93B1+7Cqsr5692BjL3C0LSMyrCPJiJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 06:51:52 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8%6]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 06:51:51 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Thread-Topic: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory size
Thread-Index: AQHZfnnAmtsopt9dbk62RKm6nfbCWq9xE4SAgAADPwCAAXKegIAEtk2w
Date: Fri, 2 Jun 2023 06:51:51 +0000
Message-ID: <SJ1PR11MB620439B1C575F0177E747142814EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
 <SJ1PR11MB6204AD929734B440C251F235814A9@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <CH0PR11MB54742C54B5F0E7872CE9DC718C4A9@CH0PR11MB5474.namprd11.prod.outlook.com>
 <BL1PR11MB5480D96FD947D16F4E140DA68C4B9@BL1PR11MB5480.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB5480D96FD947D16F4E140DA68C4B9@BL1PR11MB5480.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: matthew.d.roper@intel.com,rodrigo.vivi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|BL1PR11MB6026:EE_
x-ms-office365-filtering-correlation-id: 0771e612-a4b4-4cd2-139a-08db6335d81a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ibaPDnzauX/isbDyIMOER6uR3t9RRBLcHi47EYBlq8NI/Lj2dg0xvpC8Q3UtkKr/qUkCA08EsZbnvCJAZsp3R8Jo4uIr2wCgxNgsnHyEanGPqb/0EW0kMj7d/VrwlSvsafiWbQh/O2csYElnjNpFt5WR44QOiH+OAmvVzOu+spfomKcihuHiU24Mf05uHMqMQw+UDRdlseIY6PSQo8iapN1ZNc2D6cRAu7QMi8+NmKVUFJX/C5lRKKv5cNK/PiaIdeMdZoYsn1FHRGRHGJLDvfkTtp5Rkut53sdBuh0feRm2DCio/LD2rxRCBDIJ4so/RaG0ZmwelWDBcw+oV5aljXpVPwNCzodpRQ3CRbVTk4CjpCznaKQqziMv0a98eU9PIm1M491OarJHmNBYlgqNie2m0cUds4grOi5uX88D9zTEbylKZLGHz3MXAd08eaISGPLw5XJ0/wxZUs54S8Ug7yvHwN+dLjaMe3W0sJIIKGcTa3xb14R8t1RKYNb4x/GyD3qnrHKWZkoDwNfMBu44QQg6tiEiZuR6Jcl+DjgPfpwCagSCohnVt5rG/NH+ObHq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199021)(82960400001)(38100700002)(122000001)(86362001)(38070700005)(33656002)(66946007)(8936002)(41300700001)(966005)(107886003)(52536014)(5660300002)(6506007)(9686003)(53546011)(55016003)(186003)(83380400001)(66556008)(71200400001)(316002)(66476007)(66446008)(76116006)(478600001)(110136005)(2906002)(7696005)(8676002)(64756008)(4326008)(6636002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ceMAx6JZ/B3Yk9+pOU/kqza63O4HSTTuysAcm0APBC/pWYWAFMpxDN/C+ZiE?=
 =?us-ascii?Q?vDdGxxa2xguI86fdeSo+4XnNiOrDTU3g0kQwmKPWG5qhpj4yTPhGdsP/b2n3?=
 =?us-ascii?Q?kUZgy6kxqYeGcxZXeLYjvh7OM2nuro6G1Z/2H6iInT15o8OZ5N3VpaVZtljj?=
 =?us-ascii?Q?41s7rRDvefHQLhpDio8rA8zHBPsPKyMcJK9WSeuN6kDEwx4wslM2gglKQ3mn?=
 =?us-ascii?Q?2HPJVt2H1W1X00EyeDGjQi/yhgwwM5nI9H+HBNBsoysyMQ3TqZn280FYCokG?=
 =?us-ascii?Q?540aWogzXGcxyplSrLZK741Gjow5jHu8bRFSRfLdJiORwW+6OYCOJRTYQ2y8?=
 =?us-ascii?Q?ehsff+Fp2KJuQBOYXUPA+Zesb6Hf1tCVCFeLUztqLni7Vn0JJk/tBPErho1a?=
 =?us-ascii?Q?jKhAeLbqgyWpjUhuSeeophF4F8ouvj0Im2671hQpwqSHsJ+QYUDbtVObHfIA?=
 =?us-ascii?Q?i4U+ONkpC2EkwkdeuQINet14fyZFRnla2JDk93urbn6q9yK2/mHKjMNFMVGc?=
 =?us-ascii?Q?zEYYloJm3o2Hm2HosG49bQQZqvjBDxNFnubGN5X6nVya3RAgSCOsjB1kIHU+?=
 =?us-ascii?Q?w7gZKvV9Lw4a2ji/dY512ABz3xpwTzw8NVhKkqT9u8Pj5YycVOV4eAyl8eNH?=
 =?us-ascii?Q?i/XmJWDdMDYkJY2z2hXpjdfbBSAO1GyRiuxgKG3ncEELJy0/dxt9mX6mPFtc?=
 =?us-ascii?Q?CMLpABrHKKioRFOJeUuT8+SB33mHfM9nGTuKN4tvbiy1Ip6lekW87v2ZyOSq?=
 =?us-ascii?Q?MDe0LYLbar/rSzFkiBjzJ0m4K6f5k9emASfNN0Vz5Z/3/WTyERXzLNDBcCnm?=
 =?us-ascii?Q?NqLtCgdK1D0s6kvw6dO99iPt55epHSshp8QEZo2qjVMcXrvOOEq6Q23IsFBF?=
 =?us-ascii?Q?0ZH2IOEWp0mEeCsuqj3AOaMTpodIh53Tchq7jjIVaA6OVgmAUTCfcNVOKRYi?=
 =?us-ascii?Q?+JqhskCuCTYuI6RGbsKrTpgTlfiXGZ+eUcifDm+gp3oNWCj3iyKL/BCkerSJ?=
 =?us-ascii?Q?GZvr+gSIKV9E9+j/L0vGfXF12KWh2FLrNGOVJT5Ug7OUszHrZVRDI6riLtg9?=
 =?us-ascii?Q?1zzDULgjYrEdXA35IuIR75AZTOhlqKmGtENTdihdlt81eqAlADXBNUBduOe/?=
 =?us-ascii?Q?OFdaujo5JfiuM2Edz+MNsiQHj/oo84aTqmaBekmWue9VVHBnKbJ4Mv2KoO3j?=
 =?us-ascii?Q?y5QDaxg/83OcrBexBH6b5jjC3pWkK9Re4e3DIZ80jiZiVi2xH1+E413Ht926?=
 =?us-ascii?Q?t0PqjzXZOXiTPUeUA+ib43+YjXYsnPF7Cd0IKk3tcKAA/ugygc4a6ZjHFORl?=
 =?us-ascii?Q?ilMiTh2BY507tR7DipbmpfWt21r1zYK9o3YDkb+YP0Fun8gew+3iz3UaWEvD?=
 =?us-ascii?Q?RuHBRHSWU4lcU005XOSxuxH/l7t1j410xq59fLQndn5xvTzuc5MzhH3G0/Fe?=
 =?us-ascii?Q?ApwKvOralucXfbh+cS4pgbc4jv05GG9I4ctCJTUiMJUg2xIZp0KvDYUXQkGY?=
 =?us-ascii?Q?wHxcBUEmAk7JruxsS8d58RcIf0ok3Gjl9gbk7vf+sMPh0ZcAbWi9pjFc3JcU?=
 =?us-ascii?Q?cV5dRn4i1rBck4dwRI/hfzKV6ILiqED3I2DrMjoBgjFO2FiNcP5HLDwsosKG?=
 =?us-ascii?Q?42Ir1X2TgslcSxezkjEVIBEE+xl/RJdcHiTKq718Qlnd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0771e612-a4b4-4cd2-139a-08db6335d81a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2023 06:51:51.2486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RXG9Zi0dm4DqQ6/H8gI3DXR91IdQGHtOWSbcgDc4+d8LZUjIhQLD/OpBxstGBelHJ3vkqnLbTzOkNTIVqzNP2BbHj9meZ6b8GPW1UoPISIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>
> Sent: Tuesday, May 30, 2023 12:22 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org; Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>
> Subject: RE: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory
> size
>=20
>=20
>=20
> > -----Original Message-----
> > From: Iddamsetty, Aravind
> > Sent: Monday, May 29, 2023 2:15 PM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dixit, Ashutosh
> > <ashutosh.dixit@intel.com>; Roper, Matthew D
> > <matthew.d.roper@intel.com>
> > Subject: RE: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
> > memory size
> >
> >
> >
> > > -----Original Message-----
> > > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > Sent: Monday, May 29, 2023 2:10 PM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Vivi,
> > > Rodrigo <rodrigo.vivi@intel.com>; Dixit, Ashutosh
> > > <ashutosh.dixit@intel.com>; Roper, Matthew D
> > > <matthew.d.roper@intel.com>
> > > Subject: RE: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
> > > memory size
> > >
> > > Initiating discussion on sysfs path for this inline below :
> > >
> > > > -----Original Message-----
> > > > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > > Sent: Thursday, May 4, 2023 4:50 PM
> > > > To: intel-xe@lists.freedesktop.org
> > > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Iddamsetty,
> > > > Aravind <aravind.iddamsetty@intel.com>
> > > > Subject: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
> > > > memory size
> > > >
> > > > Add sysfs entry to read per gt physical memory in total including
> > > > stolen memory.
> > > >
> > > > The sysfs entry added can be read using:
> > > > cat /sys/class/drm/card1/gt/gt0/addr_range
> > > > cat /sys/class/drm/card1/gt/gt1/addr_range
> > >
> > > We already have gt#num directory created under device folder, should
> > > we create addr_range under that only. I think that would be straight
> > > forward to start with.  For example,
> > >
> > >
> /devices/pci0000:a7/0000:a7:01.0/0000:a8:00.0/0000:a9:01.0/0000:aa:00.
> > > 0/
> > > drm/card1/gt0/addr_range
> > >
> > > Initiating discussion there to conclude on path on this sysfs entry
> > > as well as scheduler interface entries as well as under "engine"
> > > folder under
> > card1.
>=20
> Also, now with Matt's " Separate GT and tile" series addr_range is associ=
ated
> to a tile rather than gt.  We might have to introduce "tile" in sysfs

Hi @Roper, Matthew D, @Vivi, Rodrigo,

Should we expose tile0/1->addr_range to user, with sysfs like device/tile0/=
gt0, device/tile1/gt1? Looking for inputs here to move forward with second =
version of this patch.

Thanks,
Tejas
>=20
> Thanks,
> Aravind.
>=20
> >
> > Scheduler/engine entries are not related to this feature let's discuss
> > them separately.
> >
> > Thanks,
> > Aravind.
> >
> > >
> > > Please provide your inputs.
> > >
> > > Thanks,
> > > Tejas
> > > >
> > > > As it involves drm_class, it required movement in xe_device init
> > > > flow, patch for same is part of this series.
> > > >
> > > > Actual physical memory per GT was dependent on infra patch from
> > > > Ruhl, Michael J, so I have added it as part of this series to pass
> > > > through pre-
> > > merge.
> > > > Patchwork: https://patchwork.freedesktop.org/series/117126/#rev3
> > > >
> > > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > >
> > > > Tejas Upadhyay (3):
> > > >   drm/xe: Rework multi tile device memory initialization
> > > >   drm/xe: Register drm device prior to gt init
> > > >   drm/xe: Add sysfs entry to report per gt memory size
> > > >
> > > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h   |   2 +-
> > > >  drivers/gpu/drm/xe/xe_bo.c             |   8 +-
> > > >  drivers/gpu/drm/xe/xe_bo.h             |   2 +-
> > > >  drivers/gpu/drm/xe/xe_device.c         |   8 +-
> > > >  drivers/gpu/drm/xe/xe_device_types.h   |  20 +-
> > > >  drivers/gpu/drm/xe/xe_gt_sysfs.c       |  74 ++++++-
> > > >  drivers/gpu/drm/xe/xe_gt_sysfs.h       |   1 -
> > > >  drivers/gpu/drm/xe/xe_gt_types.h       |  21 +-
> > > >  drivers/gpu/drm/xe/xe_migrate.c        |   6 +-
> > > >  drivers/gpu/drm/xe/xe_mmio.c           | 279 ++++++++++++++-------=
----
> > > >  drivers/gpu/drm/xe/xe_mmio.h           |   4 +-
> > > >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  30 +--
> > > >  12 files changed, 291 insertions(+), 164 deletions(-)
> > > >
> > > > --
> > > > 2.25.1

