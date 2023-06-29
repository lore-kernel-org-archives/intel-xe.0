Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21E4EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 06:14:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C9110E002;
	Thu, 29 Jun 2023 06:14:06 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50E910E002
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 06:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688019244; x=1719555244;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pN2IhsUWbjDYBS9qDAvoH6wWIX+8hRSDikqXy6PTP98=;
 b=jaN+LHLbwRk7SeZJJ+XwDhlei2r52auOL08YwWyYCMT2HwJ/1QH1/9UM
 5qjzu4kfrFxtIOPF+FMPJjpt6bbqTja0k7qXYMvy2/c8qh3CV0VGqsk4i
 ENKRCePSHGJ+tzM6uYNOzYODMLzveDDx0Kz3g0cP++LeYXmE+1gbwCLfd
 cmkRifyNeNNblQzxXLgmMCeoaTwLYMgUlTQPfRsSjRakWL8+vDu94z+Mi
 Um8FQgwPXu9KB2TuM18jxtpQifrDj6Ot9gFYJXKAspwIuKVQog5kscwKh
 igbKfs6n+yUcmRncvddVjAfMM/PI9npiRJhQXCfHLPU4kHofNpcj8KWgR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="364580495"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="364580495"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 23:14:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="694514736"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="694514736"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 28 Jun 2023 23:14:03 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 23:14:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 23:14:02 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 23:14:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVF8rNug8P9/Xk728yiTp9dZf5oAL6eO+xRz87zGoycxkwADUHBBSw8LVZ6POs0tfUcwTP1oFur+n+uueNtJELTY95gV8iY9dtpzAIDapc5JUmSMpXA3wfn12P4ng8oxYJmV/uAJZsTp7090OiM5+aa6agO7zLq+rh2dyq22N8uSulK4xFcJxifCISr/IMKt0DKE410VIpuqNtN0t7EtZx/JZof2adM10oy+zh6GTp5e2rARYBf5Dh4ABRwLaff64Oz02h6ojMn92cSw4AcGkUmLPHuLtRoUvtAr0bY8YzA7Uq4my4IHJ4hW45aAx6azzMN2MXmtCw5lQt0OaF2IfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pT7LHRzV+XSj7XP1DyfmMaSKeODNKzDUZ+SHdx+OR8E=;
 b=ar0KJdL1HNFN57cv+O7CVt3sSARPSwsD50YHTrp30KIKrqY2mPNcFdKUb/zm8bM07Uv/XKYwVEmplUPOdy3jJEQe2jHzEmkc5Z1oFmj+bw0vQle/6uYyWBh0VqgMW5ekH1u5pj70Rl3PVoKIHfsYCkgJXiz5sTIzH7ZJftr6d1+10NtmQrw1tz9cZsifhoum8NR8lsD+B9jgQxTbZGUsrN7M4BQ1+yeWyFSimdE51aseHmsJB0UyWlYSl8a9JYqf9a4HtAXbC38Ja73WjKNakP527A6IUCtviENt9WAzRs6SyYmx63KudRmctJ8UjAfcC/FHHl7EinYB1T6PpG5gSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4492.namprd11.prod.outlook.com (2603:10b6:5:201::31)
 by SA1PR11MB8278.namprd11.prod.outlook.com (2603:10b6:806:25b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 06:14:00 +0000
Received: from DM6PR11MB4492.namprd11.prod.outlook.com
 ([fe80::70fd:799c:5217:9470]) by DM6PR11MB4492.namprd11.prod.outlook.com
 ([fe80::70fd:799c:5217:9470%4]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 06:13:59 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH V3 0/6] drm/xe: Add engine scheduler control interface
Thread-Index: AQHZqbV/JQWfp1Ckn0qJDx6IP7PMlK+gF9NAgAE2KMA=
Date: Thu, 29 Jun 2023 06:13:59 +0000
Message-ID: <DM6PR11MB44925BF7EDDFE989BE25C0A78D25A@DM6PR11MB4492.namprd11.prod.outlook.com>
References: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
 <SJ1PR11MB6204958BA5BF21A8805CD90D8124A@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6204958BA5BF21A8805CD90D8124A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4492:EE_|SA1PR11MB8278:EE_
x-ms-office365-filtering-correlation-id: 0913558d-cbb9-4b78-318a-08db7868075b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ldkX39eKabeiaNcdSTcrUQiFEjS57GbADVatBoFN4aW43mq4gRoZYbQFR8yn9iB3Mec/6kLfs0NO1AuBm7/nPujzK/Lc9isvN1D9uafJQK3bDV/205iSd5SYe92OpFCQ6lzp/Aa7hmmXCw7NyevB2BsoQYqMk92vz8HSfPxDtpsM9pHbajL3WcuVbeucCBYnay1oY6VYVwow9jFdIuW5Q0GgPosFwqj9VlS2i0+9QMuXjqrSreYH6zdndh7xVXvhSOd5iVZ6bhLBCOh892tpXYQOELuWKMRdQ9pQmRj9nrvf0sYvsrXFWhW14UG1OfO4A1MTSfzMcBedr0gQ/ZtOg5QuwGE4ODuz1tqwsrJM7+UT8oSF4MkBCxgnoBHe9mOBftvoXyjyOVuI1gM5vGgbgZQo0vLsYMb0w9BKgxXUtnPdVtngp62eQ2Mc9CVvafI19wSIo/xFxU3RPoakeluVmZxvPOcmUeykqcqEiqvmDfarh9lwEcyrnaEh5o2BIoDwjjPssn/+A+/6Qlb5u96pLZhBSuniJ5Yw0x3iBxixbXnyLGqKl5uWeLVwbn8T0Q1TbpdMhKcsJhJoRAtY0ITj/F+bRf24+oO0po8c/B6saw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4492.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199021)(66446008)(38070700005)(9686003)(66556008)(66476007)(33656002)(66946007)(122000001)(86362001)(8936002)(41300700001)(316002)(8676002)(55016003)(82960400001)(5660300002)(52536014)(64756008)(38100700002)(76116006)(110136005)(966005)(6506007)(53546011)(186003)(2906002)(83380400001)(71200400001)(7696005)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hr6xtVTajnZdoPj5VyPLgPmbA6SOMc6+OmGie9ikujUKMhv4fZkC+p3AOK41?=
 =?us-ascii?Q?q4e5a+UILGEjASKNweMAHeHEQ7phQInP/qcBkWSnYSHw3C5Dk6/XqcH0rjCL?=
 =?us-ascii?Q?//+S95zijvtpaeKy9HrHjCTwUfG/rIUoN+0Kgq9ishOxiMJYT8ifdda/m3gw?=
 =?us-ascii?Q?3Z+tiH/GnRsSifMzHeDVSjYDJaSEapqmp518W8/CcUiXEskPuXHKxOMssBXn?=
 =?us-ascii?Q?wDmfQuZVlPFxzAblfR1iAsez0ZQgTFZkc5Jka/ieaXTv2EhDTxJgBagAWydf?=
 =?us-ascii?Q?Wu1vB8uzcFl5H9np8aSCIFaOBoTSElpq6DLkOJZqvkRNwIdR09uS96Xq4473?=
 =?us-ascii?Q?ciwyy3jC+uh2oR0EzxcimM60G+pKC8xJERDN0XMjjvgUcPtkyumkFReDlXcI?=
 =?us-ascii?Q?BIj1tkV0l+g2ljmaqZHY1AmKxUwj78af8tp4xOjW+0N/7ZvR/6A3yp2zdUMa?=
 =?us-ascii?Q?Ep+NJM27+0UkGx27x2BVaUOvvTwpVK5vo8kPR0Ulw3zm23quN31WAaa/XElk?=
 =?us-ascii?Q?fQj4nyTYfQNs60QUdyUdTTq4TNDmeDD5v0KdUXlx5Inr/LStikMXXnI6OriT?=
 =?us-ascii?Q?PprMwNjmhO1ZhLFJ3kvh6zvsnAA+wE7xLpH6fYtOerCWjUt1ey6AP3h8F/PM?=
 =?us-ascii?Q?3n45CqrkHsd0wBwCOBZ8pG8dC127oOh2iqwz2omY1COpUnJ3g8Y4O3HJolcJ?=
 =?us-ascii?Q?aXGDx9ZEQK93TwIHEwwOob1thlLetvv82fwPSY2g7ciM1eMOB/xINYIK8Xt5?=
 =?us-ascii?Q?uTIoqQKktj1gU7PybtP/FyY2vJql0BEmrm73HUB6dRTBsUUdgpU3xROCHTD2?=
 =?us-ascii?Q?GMD8g0H3sryRolxYm1oM0yzMLc3MIAPrizuNPtI92LIqIY3JsFV9PcFS+qRz?=
 =?us-ascii?Q?1gtLe+m6qrjapdgndpsG/ueGYNQQL/TZIbSSy1GZ7sAcNXywm5xOV1EtSTWx?=
 =?us-ascii?Q?+nqh3OxwFH5cns1/t5xK5iCWzm3ZyVe1et31iEJhaTCRTnC8hyVvEi9WdYDk?=
 =?us-ascii?Q?I3JS4l/OvV6XQ5iPAWtQACb8cpr1DD4vkMpEz2QUYjWrjv9BVVjhVABlnf46?=
 =?us-ascii?Q?HUu9mxtJ7pndBgZkWou4zVJwG5+FBgTZsEVAf/TrNPJ7JajCzFCqu5/PcbtE?=
 =?us-ascii?Q?C8wysZ0syYWdpAslBgCqucZWs8MHlStbm4vPRtQ0/K9F60sU12mVqBhQDE4t?=
 =?us-ascii?Q?KMj04sIXi2GUJRFJdlpeO11zNUz56iweukFozg2ybju7iiSWohu75So905sz?=
 =?us-ascii?Q?bnrr967j1UCM1Fp99njHtp8ttXlops5a60N5hezbQpN+ZyrOOVNvkg2shLYI?=
 =?us-ascii?Q?dD0tMun1vRW6AJsR680SuJJ+s6xqkb3wwGLAWPOLDRY+9mwJpROS352bNHwm?=
 =?us-ascii?Q?oqZHONY+hr54OwAT2MezheO5zHGNg0plgscDFeFUz+mwN7nw3FGJGz5KgQQw?=
 =?us-ascii?Q?ngPysno+UzajtT7O2oGJvMWjL16H8ORinvW9bHOPk9d0t7OU+37Kwnx4bRSn?=
 =?us-ascii?Q?6uDcgod+urlPswTOcXyLuUf940/kryN2CTw8RRIUp/Tx8U1gz5N1K3fewAte?=
 =?us-ascii?Q?0CBgdY6M2yq+sKWoNQDSyYQBeMTf4HN9CzmJGQ8JEJuVxQdFQ07sNe00J7iz?=
 =?us-ascii?Q?H54N81ICDlGT3daBTyEbEqWVQM4yMoRLnfMkyk3tyoV7u/afGt8snnHfKcXh?=
 =?us-ascii?Q?w7sv6g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4492.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0913558d-cbb9-4b78-318a-08db7868075b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 06:13:59.8033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PqQqSEYXf/p97dllxZ8JwL30Aeug2R+j0swvoJ0tmDWyeAw+G4FRdhBq/UQy2Brlw4nc0baXFS7pWvT3OK/U5lH+TcXOSXgH4CbF0s2qQXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8278
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 0/6] drm/xe: Add engine scheduler control
 interface
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
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: 28 June 2023 05:13 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Subject: RE: [PATCH V3 0/6] drm/xe: Add engine scheduler control interfac=
e
>=20
>=20
>=20
> > -----Original Message-----
> > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Sent: Wednesday, June 28, 2023 5:17 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Subject: [PATCH V3 0/6] drm/xe: Add engine scheduler control interface
> >
> > Patch series introduces this in several patches, 1. Add basic
> > directory structure under its GT, as below
> >    DUT# cat /sys/class/drm/cardX/device/gtN/engines/
> >    ccs/ bcs/
> > 2. Add default entries with its value for user to go back
> >    to default
> > 3,4,5 : Add individual engine properties sysfs entry
> > 6: Introduce min/max to control in what range these properties
> >    can be set for elevated and non-elevated users.
> >
> > VLK-46764, VLK-46767
> >
> > V3 :
> >     - Improve class_mask logic
> > V2 :
> >     - Rebase to solve conflicts
> >     - Use sysfs_create_files in this patch - Niranjana
> >     - Handle prototype error for xe_add_engine_defaults - CI hooks
> >     - Remove unused member sysfs_hwe - Niranjana
> >     - Restric min/max setting to #define default min/max for
> >          elevated user - Himal
> >     - Remove some unrelated changes from patch - Niranjana
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >
> > Tejas Upadhyay (6):
> >   drm/xe: Add sysfs entries for engines under its GT
> >   drm/xe: Add sysfs for default engine scheduler properties
> >   drm/xe: Add job timeout engine property to sysfs
> >   drm/xe: Add timeslice duration engine property to sysfs
> >   drm/xe: Add sysfs for preempt reset timeout
> >   drm/xe: Add min/max cap for engine scheduler properties
> >
> >  drivers/gpu/drm/xe/Kconfig              |   7 +
> >  drivers/gpu/drm/xe/Kconfig.profile      |  38 ++
> >  drivers/gpu/drm/xe/xe_engine.c          |  62 ++-
> >  drivers/gpu/drm/xe/xe_gt.c              |   6 +
> >  drivers/gpu/drm/xe/xe_gt_sysfs.c        | 671 ++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sysfs.h        |   9 +
> >  drivers/gpu/drm/xe/xe_gt_sysfs_types.h  |  13 +
> >  drivers/gpu/drm/xe/xe_guc_submit.c      |   5 +-
> >  drivers/gpu/drm/xe/xe_hw_engine.c       |  11 +
> >  drivers/gpu/drm/xe/xe_hw_engine.h       |  31 ++
> >  drivers/gpu/drm/xe/xe_hw_engine_types.h |  23 +
> >  11 files changed, 870 insertions(+), 6 deletions(-)  create mode
> > 100644 drivers/gpu/drm/xe/Kconfig.profile
> >
> > --
> > 2.25.1
Tested-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Testcase: https://patchwork.freedesktop.org/series/119835/

