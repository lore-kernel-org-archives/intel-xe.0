Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAD9C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 09:31:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94AD110E379;
	Tue, 30 May 2023 09:31:56 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F299710E384
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 09:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685439115; x=1716975115;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3ZhSjwqLaG3lBpR9KtmFKyUcnx7Rlffg7M/OVuMwB4s=;
 b=FViWGQj4lrcJuddClqHImPoz/4L/6W1C7bJqRsdoTvxuej1u31pPIYMQ
 rdwKKz7CVKrhtb997LAJfgKxheXUec7Pa0Xgm0VdoeBuV2e5CIZ9+/fmP
 ogXb/AOrzSggccEFlit5iqYHg7kk+5fp2Fl+zsxrtJ4OXptfwQUYWqRod
 PgUVZTC+WXleZapmwTIQVBxwTV/kt42Yzy3zAj/KmqQtqeC/RHJ6D/7SR
 0SOsoN1yFzqIRKgE1zneY0U1igW7OmLKImuFb1HC9FGgSfn+EKaB8KH0p
 0X2Gwg6NJ/Vti6+SmxXNw1DyQ6s7GIRB1FzDoclBe5wVYszapTudkdamV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="344366079"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="344366079"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 02:31:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="818721347"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="818721347"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 30 May 2023 02:31:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 02:31:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 02:31:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 02:31:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 02:31:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McTkm9DMgpVuwt+9KVH6YJdilBU+PmOLqk1u9CyOUMH2EgJgLylUVpR1cJ5Sn4WFFNKrDT4jrQUthocp2VXYTaspyoeQ+257ZjN+/ZFmz4PFIA3xfqKr9tzdtmPPOK763gL34YqU/zyF411MkaRMx8QbCboSMt2+/vYdOQtZVtbVoZG1LxrIF6HyRpp/yH1IeukO8AkVL1CXEhijB1vJsLGab9J83PNRAFGM+EFzm0xnBPTSVCrS6iTQb8wxFwCJUIvAW6+vjRl3HMsJG3TORrL67lO8EWfPiNrlhfBtVdr5eeMdLm+vMsS4iN93x57hBaE3gMnotVGh2MrWsSCfng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xbi+aId6DHMexQgDeTGIyrTkkb3FY+SSBVgr/7SrHTM=;
 b=iYUVwCGXtYcCwEUnMUw6zhLFl9n/bsjMMByNjjZrw3OFKn/GMPPjDGu4fPTTw2jJZwHHrJws3+g7oMNLvbegp9ceQV6bLlDzAw4l33q1iEURhFeoLTeNw9xDLVfcqf2+ADj9FhhyQO4nxUXP8KTe85tfm6dKYNwpFoE16A87wI6g+B8GXsRK1YymEnGBFXPIuIoO6VnE7qtsGNVo7ySeoi+P6gkovSaeB2r2nW+UaiK5N7ck0fg3NNwFgCw35wndffecZOuhdnwbZ9o/3sBe4IDhfBmJMEV+z1GAtaTyrcwyiHqz95G7XsRT3xgtGo9HYuFp5aydiUzdz/fzj9NmYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 09:31:51 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::f6ff:ca66:f20b:bd43]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::f6ff:ca66:f20b:bd43%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 09:31:50 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory size
Thread-Index: AQHZfnnAmtsopt9dbk62RKm6nfbCWq9xE4SAgAADPwCAAXKegIAALE0g
Date: Tue, 30 May 2023 09:31:50 +0000
Message-ID: <SJ1PR11MB6204C25C37FA992CEAA4C708814B9@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
 <SJ1PR11MB6204AD929734B440C251F235814A9@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <CH0PR11MB54742C54B5F0E7872CE9DC718C4A9@CH0PR11MB5474.namprd11.prod.outlook.com>
 <BL1PR11MB5480D96FD947D16F4E140DA68C4B9@BL1PR11MB5480.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB5480D96FD947D16F4E140DA68C4B9@BL1PR11MB5480.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ1PR11MB6129:EE_
x-ms-office365-filtering-correlation-id: f65634dd-1c56-4210-0f7d-08db60f0b24d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yz97w0qDr9/394WnV12yT15caia5mdG7pGTPY551EWVknRnpegoz8xHxuBIcPMfjUp5I8szMdv/hQbBhg3ZSJM9IX7JHi2Q6iWT6O2bY/89nEiyKo8Gkq5Tv/K9v6fkzLF6tuktPlb8I0tH8wvyJz5Cy0DOgfVt0uJ/aqREtK1Oj5bwS44hCdg9/G6DvJjyUNQ5NZa3soPGkMjYqxsknCq5sh94ToQq0fU/mDQn1ouHVanVzA8uHypvi0LyHMFmimHjSJfPGFG2usYXvUZe2fY3HTgGX4ht8AiUNOJaT+//gVwf0jlJ44PUEr2X83e4Ffu45Q6KK7g8C7gFGOOR4JB+6NBozzrd+JLs61Qr5UzEFUg616/1dL8fMv96g6tTbyy8b+3tJRHsTLOsgmbmugrvI8tCE/GQkDdn5Ms7fBTXC1wbQ7tYqAkiDjdPiSAuI95AEu+6+EKqRMf8QrgpnYzqXbbity5Hb5ovZ8YZiCPiU6u0kbM/0S5/SbRQl8dj/QBSIqhjDNLcRyOq6r/5SN+Ycq1rqHaT27T+rKQyWDjrHbhdFOvYGjfLMrrbsu5tD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(6506007)(9686003)(186003)(53546011)(2906002)(54906003)(110136005)(478600001)(83380400001)(7696005)(8676002)(82960400001)(38100700002)(41300700001)(122000001)(8936002)(966005)(55016003)(66446008)(66946007)(5660300002)(66476007)(66556008)(76116006)(64756008)(316002)(86362001)(33656002)(71200400001)(38070700005)(107886003)(52536014)(6636002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/Hdba5nK5H3hv0V0KrQrRG+rjNIQUHb47YkEo3Pjc7OjzB0bJXr9YL6x0eD1?=
 =?us-ascii?Q?esJjMAJ22McEmroQiemSQHfZ0Ns3nFcBg5yb7nmJDa51/ANTyYunedjfmN8b?=
 =?us-ascii?Q?0HhwNLDkQUHUnaeMLGDwcCwX4UGjyhFKkdkau+tzULz9Xd7UEUMdFzaWRDIS?=
 =?us-ascii?Q?vl8OFTYaRwAdVCUyyN5Dk7S6jzGpLyzHhO7Xu8FsVYtvgaM6KROqzCwfgz1O?=
 =?us-ascii?Q?fufOxbyqb0Cl9DltJE1vxhNgLTQthZ2yY6/RA3DuQoMqP7Pl8+v/IpdssUEf?=
 =?us-ascii?Q?MEYXJKzQOFZw+HdxYQT5Zd8ys9WIoKoKCCNgpDqK85LS+PXRzsTaW5fdYahP?=
 =?us-ascii?Q?UtUI4ZJMZv8Z19vT8+m/6Lc7/NF0ALNfh/unhp3fiZztppVq8mUaNkdvHA+p?=
 =?us-ascii?Q?t5PELG30Xc3UfSm0alqHpuHaB8EuUN9Z3IWDjjYanXK4ieMwoU4fOkpK1w6f?=
 =?us-ascii?Q?a5YDjuhPAq3VpaKzKN3z2/+/2jMgTQA8BaR3q/JQB1Qhs02qv1QNA5mrui4T?=
 =?us-ascii?Q?eQpRoiyIeoILR1REHrjRPLlAl4c49Cgzx85aeV3ppo4BhE+PogQhZsk7r6Gu?=
 =?us-ascii?Q?cBh/C748xYZ23NPkDQmo1Z2jNuzT1G7wVlXRteRWXhlYdMsD9VToMNNCZ8pd?=
 =?us-ascii?Q?HxK6/qIfRCsf56zNiiDVxahbZi+vRcSE72CBJbj9iUr09Xb8+Dhh3G4fuxZB?=
 =?us-ascii?Q?jEucEm9/5QulnDbMm5RAdaxXOr2zrzy3EieUpSmVvIuR3dB1bEc26nvb5DS4?=
 =?us-ascii?Q?A8ZxS/LVZYc2IaCMNdDaoScg1T6D8BtPSRHpSGuotbJJ4zOWB+3/VGOKw/O+?=
 =?us-ascii?Q?24XmbL12ISYXACypivt4eWfz4GpgLKdBZUr3DyQg/dSfH+esG2DZLASeeOTD?=
 =?us-ascii?Q?QJ7qB3aNY+2gL3u3VJT/iOwdNKU1ZV1nrkrxa5x+/8KMRkqhclHby13XgNgG?=
 =?us-ascii?Q?Mra7i7aES1f0MdP64Flu0Lw+M6GUPUmdvMPRZtDyj6fndchcwW9FAb4VdG1C?=
 =?us-ascii?Q?KAV9MSwh10FxG3fkZkIvgzBP5OX30Um3D7Gc71KIi+2bdtP3tGr0471NWxXj?=
 =?us-ascii?Q?GBYhTRU0pX7Pys34FXCRDah6RsXgHLjimEPAn+ac/qGfHXwHEZkQQpy9O3JP?=
 =?us-ascii?Q?rP/uZEpddpyksvX2RlHNQWrYe8SjbSc7F6JCGp3a7loR623gHw04yCbYdRqs?=
 =?us-ascii?Q?eFr4XmzM3GZtF8mQEc6iCuufK8PD9lgRTCbkXxy6fEs2MxkOP6wWCA9aJgQn?=
 =?us-ascii?Q?o9Qt1Oml/DBLNkUxpxpvolgEAQ5eeoRsRL8TyrNZpsl4Q95JEhxBw4CqJIKB?=
 =?us-ascii?Q?/ztk3JfwmT53FjZkvgYqNCzTh077gjw6eQxUFTAZlV8dSGxF1oVERKGcHHZy?=
 =?us-ascii?Q?Sf8prsbqpHCKaMUTsiIYCmNkzAhl2ncJux6YrBFUq0uZSyOKKAjfU9xUDv+F?=
 =?us-ascii?Q?fa+y9th0A0q+GJCLtHAt14XmcaOS6LeN0f/o6ZVVzsU+UwvZ0UsJfTIgvSHk?=
 =?us-ascii?Q?uuB2CCBxZz5AEP3mGPJxE7nNoYwOwHB9oLXSrOcBiXd+b1t58I4x8akDmwo/?=
 =?us-ascii?Q?Tfca4TmJXeRS5DHEk+qWD/HW2GI0kTgUJKIbIkdYfzp5hnisIG83f/gzXNE7?=
 =?us-ascii?Q?KrHCY7FG1cYITA10T6OH3fu9hYveOnb07oqvrKoLsRFj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f65634dd-1c56-4210-0f7d-08db60f0b24d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 09:31:50.2254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dUFjobbNXHfiffjjaxc38vSgNlHzrWDmzFH53ca/laeTBJCH6C0eBNUXxRRznJN5ihX5rcsOSDftuQwKCTsZ4ZphXFasx4R8K38p4fSgrmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6129
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
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

Thanks Aravind, Yes now PCI device --> Tile --> GTs is tree now with Matt's=
 change to show real hardware behaviour. I will change accordingly as our m=
ain interest is Tile.

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

