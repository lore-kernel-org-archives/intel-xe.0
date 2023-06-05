Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBFEC7EE2A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 06:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320B110E083;
	Mon,  5 Jun 2023 06:08:11 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4406110E083
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 06:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685945289; x=1717481289;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yQ+I+uVpoaGtSulxOu70YYlyu+q5YiZK6tv+ha6EjoI=;
 b=CJIwIzHYMoBr1WwaMRQ3DbQE2rgoFCHiIAd9bdRlMoWVf7XzJ/A+OjvR
 Ii7gAArbVg6r8qWOPYu8CHYBfvT9xTFRyghuvAIFxuTJo0FX3JF8UsIrt
 TzwhvEezYGyGxM2x/WqVIqfLmBUrz5ip3AAbwMQR8gF9ZdYPfEPffU6VI
 E/veJee4v7ohism0mTI7rgaD+D06jMcBZUmpHsSJW8DoPHLFXQMp0185y
 nIxuZt9cZCQaHQbXEqf70MTsRdCJPO0SUUQYcZuuyHWvyT2D/Iq8GOwqw
 6nKb9KLlbq4xnfWW7o0/FVJLp7eq8xzL6u2YRrh5Vt6QOXGL2RDVLGNU/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="355146041"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="355146041"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2023 23:08:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="741585746"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="741585746"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 04 Jun 2023 23:08:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 4 Jun 2023 23:08:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 4 Jun 2023 23:08:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 4 Jun 2023 23:08:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 4 Jun 2023 23:08:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kheK1SVx7Zut3B5FwE3NfCFFfRjH2OMFMYuTBxtESFtbnaA9VH2vlkBC9aE/Q13UyA/04kax7Dqhk3qsFoSaLWxcw4SZWx2rLUlmoJBHT+V9fbD0zEaQ29R1dPakadh1giMapPZkK7sWlpiNCZ2NrVMP+uQwzkpXqAlA+/1ywr69eLN6Tucg0CUx2FZDWneTo6Giu2LcQDutctEvUdO8ia0Al/JefqA3KRO98+UftZFXm6uMLhT/SXdFx2zViI82P3dgXvvrMbshLkhdJz0C3F1ntAHaFhELGjfqf+iuT2TsU3Tw8PMLNMZKIphBr3EKnNv8T/fU0+M458iU+OKlPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfW6pEXY2IDX1hO56cftpAE7jykNEQz05Z+eoMaQ6M0=;
 b=ABheBWcaYPYLIDRD6BN1c3d9KRcpnX4pZ147MKIIA3l+xmbY2KvqSzQiyOfAyrJQQSR6okc5kriUI/TBW6U1IKz68jplRgMV/rvcNT53GtYC1FJsF7Lt1PKdS+xxnYawNPaDkTLTdMxrkWIgLnzmaQTKKsooE9rL3DY34j7JJ6ZHfyJrTM/+kCrryAL6vJgePg4LN/EP0a/WAhOEeTamVHTzGM94Drq88hP9dnZEBg2ZRUUoIFPkTMREMkb9fscAv1uka/dhTeJ75No2g5jiokQ0bOHvUav+bptTNCbJhkpWPBL3Ct1U5UxLlwCCRFlpg1MwqDJmEA6e/qhZXyh0pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM6PR11MB4724.namprd11.prod.outlook.com (2603:10b6:5:2ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 06:08:04 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 06:08:04 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory size
Thread-Index: AQHZfnnAmtsopt9dbk62RKm6nfbCWq9xE4SAgAADPwCAAXKegIAEtk2wgACOJQCABByR8A==
Date: Mon, 5 Jun 2023 06:08:03 +0000
Message-ID: <SJ1PR11MB620464748F175B30568EA3F7814DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM6PR11MB4724:EE_
x-ms-office365-filtering-correlation-id: fbadfad2-b1d9-4a2a-4788-08db658b391e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2pulSTWZv0gy4W9Cdu+p02K5VOh37iCV/ltAwP+rn5t/ByqagXQsb9vefVk1Ldd5cfn8Z3q3RrzyObatbf4QKEEhd4LcuzDHH8Q3QBgtudpKSZ2LoWBD6CiYQ8FTNR0CiPPwp9EoNm3/orNNF2Staw7e33VXCnhnYmm0NvJlJB2lEPm/2vF1KhK/xTfqC84niciNLQhHproondob+8hsZ2dDqxzoTPsdfGXjSP8g6PoIbLK8FJW8GwKh32f3UpskIBp2tVQvAstoEkXBc905ysN5a7kF7kEofgDbujGXeOXIj8VqYxa1rBdccRNAZafCFcAuJFcT/UCmIijhOrecJt2OlKwGiV8Gl/0d63eruaSo02mPnQQq7jDntdwCywI1JPHuM7itREfUr2rCa1aJORh85Ns1xmgdsPu/3N6nYY4cBi1poDU/o8o29DNpznmiJU6C3GK39P/xZPlCfWOwWLhPrQFqIFVEFKCVVutDhX6YNiSMKWyJbF08vUOFVCDhknSh+z9g3aB86CfPUCUEwFnFmArc5rVtLIhnav4TJHDeD3F5MyOI7IJuSLX3n0hh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199021)(478600001)(71200400001)(122000001)(82960400001)(38100700002)(6636002)(4326008)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(55016003)(8936002)(8676002)(6862004)(38070700005)(33656002)(86362001)(5660300002)(52536014)(2906002)(41300700001)(316002)(83380400001)(966005)(6506007)(53546011)(9686003)(107886003)(186003)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kmpK9luVYu+I3vDGvKeFu5+4AGW6V7IOpKyE5Imtf+VpHPi889JUxa9ugxyW?=
 =?us-ascii?Q?+rWEpIP0xAkgpP/YstCCtvHy7rZ3hlyF6B6U8ayUtqFuYO2gu1Yce74BH4Sl?=
 =?us-ascii?Q?n0Kow/qYNkOM9QI0XZ1gjrmCMVQg50FVzgVbg2nbev4sPx8jugEfP2L1Gzfd?=
 =?us-ascii?Q?baUskGeXV/xJKwx+wBQGB2odYr8dUmLHiZcwUF23lBHns8V3m+oV32vR9GRb?=
 =?us-ascii?Q?QYwuwh7r4DE8PL0JKeJkQ0DKzGT0tenWaTg+tbnCeM/PRA6JAdKWwS+0coeG?=
 =?us-ascii?Q?/a5HE8FPqzfmF+qaoITTHEjQn/4nA/5ahmbOxkEgcMewTpNjAUu/c1WwbumM?=
 =?us-ascii?Q?p6oY7aiSd6GEU/MmHGF19pa2wg/MO0xe9u8OrvPe2kexHgfAjjvCw9YOVeZz?=
 =?us-ascii?Q?50IBzY/bXBM/EFdlR5AzVsOHo5LHvnD7K5P5BaWL4yib7cCgwb36J2YzNUwD?=
 =?us-ascii?Q?DZ5bheb9fTNUB+xL2GsbVehAODZQC+FvzFczK3gttB9JhghUID+lzRm3P18t?=
 =?us-ascii?Q?bM7bG52ksO5wpmvbcy5STwhxaMuY9cQ3X34E1B70Mjb7l4hOR7IJoEjrwIFx?=
 =?us-ascii?Q?AQJ1xqEochGBnsFeWR4NWbrF/IR+zDqciKh8o+XTx0Nupjf+/UcWuTPUNgNH?=
 =?us-ascii?Q?M2RdkSwyRHzrsf66+pAMrC4X+ksNy4vHjEJdHqDOHIW6IrBGAusRr76rGESY?=
 =?us-ascii?Q?dATHcy8rlJyYwE4o3ST6PKh7eeFthqi/TJrrHHEtdiBUGodW1ohEbNc/QlF3?=
 =?us-ascii?Q?nT2XmPa4WEB4emogRw+Bhs2NItsnNJKdi6Fh9h9jH6cBeUpDaJWWM8yIsa8x?=
 =?us-ascii?Q?1GZo5NNTKCmdWiSAmb3H/qQzIUl2UskO+QqYhfuKubLHW4+Lg2TgjudJExNp?=
 =?us-ascii?Q?C8fqQ7UGWwMkdKyxWvjYYesZDUB8sZJmvJn/Giopu7AjPJlKfFmi2vhXnsx0?=
 =?us-ascii?Q?d83o7bZEreYy4bYApdmOnekxwTO4LsQDcJkm62W/FWpDPhGY5X6s0WVQVKJ5?=
 =?us-ascii?Q?t4yGdvGt6tb58cZb0OkYd4588GF9nCRDPG8GmQMSYxNdW1uuBZC+SpMZ3RZg?=
 =?us-ascii?Q?WbkAvRWPdh79jj+9SOqKPSXauIPCaWpQuWvzWaHzi1c3swcyPsJ57a/rTpit?=
 =?us-ascii?Q?aVsT4bu+2QC3UwvDeKkauLoy1BEHOVj85CYnlUfKoLKTEMo1WhhrB7niXLNe?=
 =?us-ascii?Q?vD+EyF2ehP1flifXIQJOxVccr9+ObDd/9JbQxGoQkDXXn23yC86wNpnsGt0x?=
 =?us-ascii?Q?STcrXz+Ow7lFGeARUcjyxaTUOeL+chMou96hVoJIO1BfcHWEjZkCpygnb0WU?=
 =?us-ascii?Q?9usXCbEJxGxhEwjLhcGWrmeJR68ZRgHtgt+mwp9KmEpsMH4mCOJjnP7LDUNi?=
 =?us-ascii?Q?mnxmb3qFNHps2cUw3S9ComC94n7Awxza7/G6NbJLO7913kLr22+ZCq0RV/S9?=
 =?us-ascii?Q?SoiJbsNMfqGNnwR4BviB6PZxrIsPIKElBq2zN+3V9jiDHA28YglXJwqNLr4p?=
 =?us-ascii?Q?KAiZJCo4kwWJOJnyauwcra+N7FUCEyn9N83I1B0/Q/ixaYEdOwNWVxYJocoK?=
 =?us-ascii?Q?H0GxloqvAMUB0rF8IA48GMW0DdZ/TLYNlA2n0AYMpXqgkasKLVmiH8UgNJTj?=
 =?us-ascii?Q?VeHpF4OlQnwSJTQSURYclSSp58HXt+reiI3iCEVUiZVx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbadfad2-b1d9-4a2a-4788-08db658b391e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 06:08:03.5584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2sFTLGdGAS75i6+JNTrGxDanK6s9ENaOPrMfb6nVNTmgtPdRtwuelHrt3JRqfxnOV6ICVr3l8bff5DRSfrlpoDadSwa0djryQhc3ofQzV4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4724
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

Thanks Matt, I also agree to use /sys/class/drm/cardX/tileY/addr_range, whi=
ch should be independent of /device/gt0 and /device/gt1 we currently have c=
reated on xe.

Also current addr_range covers whole memory including stolen memory for tha=
t tile and is consumed by userspace that way only.

I will go ahead with this approach.

Thanks,
Tejas
>=20
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
