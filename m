Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A57C74A5B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 17:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8295F10E219;
	Tue, 21 Mar 2023 17:58:14 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2E710E219
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679421492; x=1710957492;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QOf6mYvzNNgxG0K0ZWnKWCAolqV65IlOK3ZV6OeV/mg=;
 b=Mws7Ka+AO5U6Upb0t4t01HU9amx775cdRCjPvfSf+M1lcpVmiVd40/e9
 sfAUHzjxthWfdtQwBzPMYoEhsnZOpIek2bFueu+RV7Z/UOgZ6AxkfzF1n
 9aNDKN8FYF9V2yLh8HkHsvUmJc52KEmf5qA2N8BSFT9XqJW+nrcD4Nmc2
 ntIurBhsrOEJ/FdqPiYuZICocy6v9soa6BWpkzbuI+uzdsAErWSbj/5Xe
 IOlDvakTIP22YUXLHXYk4H02WNagPhzBpa149WzakgHnj6Ix35iCcHRmL
 2I4CeZk06PW2IwI3dRkS5oxQLGnUGj7CYI0x39Z8BZPZQ2E986quNMoUi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="340557736"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="340557736"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 10:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="674944284"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="674944284"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 21 Mar 2023 10:57:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 10:57:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 10:57:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 10:57:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 10:57:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PV0cZxU58ymMMMVpEWeHYg1IsD9A2sTuULiLJTaoiwPYX7ZDDZqVltJBk4kvLbKsmTQ10H0l5kiP7j6vwO43d4eqgAwPW0oQBfXZJfRbwGjW/fM6KwD/pCt/hnPp/SrTqKKVUy0F7scUDHK1DTuD4DxG0BRIODipPQzvFefAqc8E5LUG9AbdYV+SN9mNJpL6xicGPeOp8ZJPNKE2DU7nn5KitgcHv4EB4noSzS/+trPFwmH1lTpo+fjXFzDG8TiAwz/Rb1ii3vezcPUSEZOAIjgrC1xgEZl9iQPUN1q8mk999pymBfn3orrGicUq4cl3teKjuq8uKgeuQxGJz+KhZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+iiAAnSHEjnVrwE0aifHkMbVBn9droa68yUaIsu65s=;
 b=MH4bNk43CwlMYj+/1k6EjsIRNQEAO4k/i4W9tSedZcU0rtXGON5WCPw5tkj6krfojWChzsVCsdQpsVBQzZt6ZSXb4oaYvmHT9SlJske4B/7ev7KtNt6LSjyGR8PcH5s+7R2NORx6pddAE8ywAb9ZwmzwNADwfybjjcgMLt8xfElIqxeNoIiyYB7jaMMzFy87SXjPNgyY9p6FvGYFg6RDatbrgeTiMlDEVdjvgj4kdtGjb39oprO62l0Vgvcnqk4vSThpXfuLoBSSBvdID1P0XIHdDa9tYHJ5cl9sOkgUllhVBF+8m5VpUdD8yid5oGJxv3TI7muKze88cNP+ag4I8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 by DS0PR11MB7214.namprd11.prod.outlook.com (2603:10b6:8:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 17:57:55 +0000
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::4b35:822b:2c31:1137]) by SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::4b35:822b:2c31:1137%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 17:57:54 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe/huc: Macro support for loading
 unversiond HuC
Thread-Index: AQHZW4aoDO34alaK20mRCTI4tiDu968FYs+AgAAjLbA=
Date: Tue, 21 Mar 2023 17:57:54 +0000
Message-ID: <SJ2PR11MB77154F21AC79622FFAC4B518F8819@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230320235254.3288679-1-anusha.srivatsa@intel.com>
 <20230320235254.3288679-2-anusha.srivatsa@intel.com>
 <20230321155059.GK4085390@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230321155059.GK4085390@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7715:EE_|DS0PR11MB7214:EE_
x-ms-office365-filtering-correlation-id: e0475489-03f2-458b-0a7a-08db2a35cbcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8QCskPw4IO1asikxjGJRcIGS0Ky637SBjI/fg6iU7LPG/GX9bvNsTyZxS5M2VQ6eAjG65qOiApdH0ooAJkWR95eVZcLslOEFYCBydDpn066HtjUWYKu0MqNZrQFHLVxi1wQcYGzVx22+0pcy3NZ8pKWs0HHrDvrs2m+5zt2drn4EPYDgTfTXqE9SsD0RhDjeFskrRhKG+iUVIM88QUWD4pX0lN44wsAhIGVhliKqHrjF39eUqwacAKLPsgd6veMH8qlUY6md0/T55uWPcH3Pzd4f/cEs5UeG6XquJdZgdrlHyWiV3bitOr6bcvfyas8f/JYrKAzMwlI+X6EQ0QGfTI3LJbbHR75wBew0+rZBdjCYMHDN4rNgz6FW/wx8koNrpb93lTV2lQYYijObAIXFacGYY4KJPabjGcnCBh3wmglVQ0yp/iyvCHgJLfUgtewKxO4EE0aO4wxPdbmo+oGVUNNVLCyD1pvk1jcHzESx7H6Rl9JtM3BRC0KuDWv2ZSxwP/S9F1X2DJWwvM1adAEZyHS0MlxklleJ2tWdayFL9pmQYo2n5nenWgh0rg6zA75rVH0heHsJxV6SQK4utVeySHeDbny4uxLx8w1Piq8caAeMtTG6kUJQRQJGvYiXL/3DwaTykgqFk0wIK5k23fHFjlPyBvVyg5X+GN8JZsf9k4W2lri7B4OmCNn0XQf15rHKp4iqgbKLtf9XCyImy+AL6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7715.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199018)(122000001)(82960400001)(2906002)(83380400001)(86362001)(186003)(107886003)(52536014)(38100700002)(55016003)(6862004)(8936002)(5660300002)(33656002)(41300700001)(26005)(6506007)(7696005)(53546011)(9686003)(54906003)(6636002)(478600001)(316002)(71200400001)(38070700005)(8676002)(4326008)(76116006)(64756008)(66446008)(66556008)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U1CxgmrgUdc7nnMaTNwo9dmdRSEXZ6papPCrcgx4VjS0CaHWSzaPBxsqyQDl?=
 =?us-ascii?Q?kD3CnsBZ/WE0LvRNaYwIT8EYqOK2j5l5mCX2SnZ8moV136FSboEZAGgofceY?=
 =?us-ascii?Q?PzY3G6sAWFlhOQqLRWHBEHiZJy3K3cMf+Ukn38Iw6QnNMKSlFBTAbcyLbqGF?=
 =?us-ascii?Q?xe+Bhx0tA4lhrNDsmKbrOv5HuVzFrzPD+U7bAyIRNyl3igOtwVQvAZ21DElc?=
 =?us-ascii?Q?BiANMrChDPuXknbnZ99hzymlZ3kMMKJNxQKa7WvNzYRDfjtgQuwMnoqYY/5y?=
 =?us-ascii?Q?KGe4ua6XM2Se6MdGY39nw7Z3pp64PWciCoZjOiNAEGs8jeNoH3Em+DQ1z0E1?=
 =?us-ascii?Q?YHc2F8d3nX4CH7yJJH1ObtG1+HgmC7MN58j6dRK/9cfhtTt29UB6HmWBQLoj?=
 =?us-ascii?Q?C6l0qPcZSNIdvAVGGu4sdrXai4NirDmEJwZc4rcjPN76Jl7ZUOncFX/rAiNf?=
 =?us-ascii?Q?z6rgvqnhnMhbyK5u0ic0mqm5euH5MJguDp4RkZUE9OmmLL8r4nwFQSc/6Grd?=
 =?us-ascii?Q?X1gbDBZgQO5RzQKVa8EhAKPGvvKIaY9OwYRObwf7VnzibWWNFVzqUDQwTUMS?=
 =?us-ascii?Q?TVrQAldMdJrjZ1vSc4sFS/4znn6gPYmjcb+FTuLNfXYrABX9iBzyuG2vFG7/?=
 =?us-ascii?Q?8sMd2kMZnDS2VyhNmT6h28BmesJ7jIG9g4ub5Dipmnw+dhOQ9cj1L+If8/AE?=
 =?us-ascii?Q?ay7EDaL1EV5h8lyRs/Xe3UloS38O/3RXLGU9WunX/XCpyRIr62DkG7WTL9dJ?=
 =?us-ascii?Q?U6CdNPRsSDVxOr0zybGRxjIALHd0PDUp11BBr2tgip6aG5XS8CKjps0vG26+?=
 =?us-ascii?Q?gKpPbV1ly5ueG0KbEybTWwXu9DDUggJb63VTnxFkCJ8B9LUtU0Ax1gSbu2DH?=
 =?us-ascii?Q?DJ1MuF3KuD1v7BJJyu2gnLAJ5AR4a4maenawwSuKqra0Cik4dqIvzXbDDPAE?=
 =?us-ascii?Q?vkGTVjlel6vcfqXV5dTKO5p6aIzMCgD4/pzpNpl7ta6526GmNTwqgzeK0IDp?=
 =?us-ascii?Q?DIerfk/5W8zKfhHHl4OZKMGADd7o6lucEf0QpX38UIjT6Ha30z4WQUWGpJpL?=
 =?us-ascii?Q?8BsH5v2Uf1ofTbt6+dgwiI9hOR2ejtqBjQgwfwAOnUNhOb4HUtf9z0qrGoFh?=
 =?us-ascii?Q?B9p+LmB46OONCw9MBAVxIu5DcIA+OH9zlAzk8cYeTdv7Q4Qo64otwg44GH+C?=
 =?us-ascii?Q?mPY9R6wMhiIAuWCCtzXFnUeoXyyOsjCrZnaXMOx3iZCjsAIbkfuagQjhpc5f?=
 =?us-ascii?Q?WHGwoj5BYjY7KzUYHUhVzCtp52pqXzykg20m5NdfseDBRwKrDrZnKTGX/daN?=
 =?us-ascii?Q?9DONwwbcKZIBUXbKipcvqXwZhlkPCcI2G4iGVxBKg1BV15DTRIgOOhhOh/2r?=
 =?us-ascii?Q?L2s4bYckFz63c2hPrh5mkhV50bF/FMp2FnRoXLdpB7j0ZlN5Qd/jtA6KpcsV?=
 =?us-ascii?Q?6VNmLzUIkCIx3DM8D21bawDUNHpbYmJTuxh+iHspoGoFFvzG5229D00eIIpD?=
 =?us-ascii?Q?uIXJ+cPFpfxGz695HfQa350lXjdRd7ZW5uHnoPWCFt7+jTmw6hVsjofUDAUQ?=
 =?us-ascii?Q?Yaa4UKWnbsT1T//rVzwAm/UIzwMVrr36YdvZI7UL/Z/164zTXGBLATmqwZQD?=
 =?us-ascii?Q?Uw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7715.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0475489-03f2-458b-0a7a-08db2a35cbcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2023 17:57:54.3722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xWiVGufi/5f0bhptrUpqEdStWcOGl0iHBi8blip2DHWgiix9ROUWoCsWqKimXJUD+R/vz5hVZD3kG8lZqdJFC3+NrAsvr/Es2GyseUg6y0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7214
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/huc: Macro support for loading
 unversiond HuC
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Tuesday, March 21, 2023 8:51 AM
> To: Srivatsa, Anusha <anusha.srivatsa@intel.com>
> Cc: intel-xe@lists.freedesktop.org; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/huc: Macro support for loading
> unversiond HuC
>=20
> On Mon, Mar 20, 2023 at 04:52:54PM -0700, Anusha Srivatsa wrote:
> > Follow the new direction of firmware and add macro support for loading
> > unversioned HuC.
> >
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_uc_fw.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c
> > b/drivers/gpu/drm/xe/xe_uc_fw.c index e2e5f7fbe9db..3c522d970228
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > @@ -50,7 +50,7 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw
> *uc_fw)
> >  	fw_def(DG1,          0, guc_def(dg1,  70, 5, 2)) \
> >  	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 5, 2))
> >
> > -#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
> > +#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_def) \
>=20
> Why do we still need the old versioned filename?  Can't we get rid of it
> completely?  There's no backwards compatibility necessary on Xe yet so th=
is is
> our chance to eliminate the version numbers on HuC completely.
> It's not clear to me why we're still using huc_def instead of huc_raw bel=
ow
> either.

Yes makes sense. Will remove the versioned support.

> >  	fw_def(DG1,          0, huc_def(dg1,  7, 9, 3)) \
> >  	fw_def(TIGERLAKE,    0, huc_def(tgl,  7, 9, 3))
> >
> > @@ -59,6 +59,10 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw
> *uc_fw)
> >  	__stringify(prefix_) "_" name_ "_" \
> >  	__stringify(major_) ".bin"
> >
> > +#define __MAKE_UC_FW_BLANK_PATH(prefix_, name_) \
>=20
> Nit:  "UNVERSIONED" may be better than "BLANK."

Hmmm, if that is going to the norm anyway then  just MAKE_UC_FW_PATH should=
 suffice?

Anusha=20
>=20
> Matt
>=20
> > +        "i915/" \
> > +        __stringify(prefix_) "_" name_ ".bin"
> > +
> >  #define __MAKE_UC_FW_PATH(prefix_, name_, major_, minor_, patch_) \
> >          "i915/" \
> >         __stringify(prefix_) name_ \
> > @@ -72,12 +76,15 @@ static struct xe_device *uc_fw_to_xe(struct
> > xe_uc_fw *uc_fw)  #define MAKE_HUC_FW_PATH(prefix_, major_, minor_,
> bld_num_) \
> >  	__MAKE_UC_FW_PATH(prefix_, "_huc_", major_, minor_, bld_num_)
> >
> > +#define MAKE_HUC_FW_BLANK_PATH(prefix_) \
> > +	__MAKE_UC_FW_BLANK_PATH(prefix_, "huc")
> > +
> >  /* All blobs need to be declared via MODULE_FIRMWARE() */  #define
> > XE_UC_MODULE_FW(platform_, revid_, uc_) \
> >  	MODULE_FIRMWARE(uc_);
> >
> >  XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_GUC_FW_PATH)
> > -XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_HUC_FW_PATH)
> > +XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FW,
> MAKE_HUC_FW_BLANK_PATH,
> > +MAKE_HUC_FW_PATH)
> >
> >  /* The below structs and macros are used to iterate across the list
> > of blobs */  struct __packed uc_fw_blob { @@ -93,6 +100,9 @@ struct
> > __packed uc_fw_blob {
> >  	UC_FW_BLOB(major_, minor_, \
> >  		   MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_))
> >
> > +#define HUC_FW_BLOB_BLANK(prefix_) \
> > +	UC_FW_BLOB(0, 0, MAKE_HUC_FW_BLANK_PATH(prefix_))
> > +
> >  #define HUC_FW_BLOB(prefix_, major_, minor_, bld_num_) \
> >  	UC_FW_BLOB(major_, minor_, \
> >  		   MAKE_HUC_FW_PATH(prefix_, major_, minor_, bld_num_))
> @@ -122,7
> > +132,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_f=
w)
> >  		XE_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB)
> >  	};
> >  	static const struct uc_fw_platform_requirement blobs_huc[] =3D {
> > -		XE_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB)
> > +		XE_HUC_FIRMWARE_DEFS(MAKE_FW_LIST,
> HUC_FW_BLOB_BLANK, HUC_FW_BLOB)
> >  	};
> >  	static const struct fw_blobs_by_type
> blobs_all[XE_UC_FW_NUM_TYPES] =3D {
> >  		[XE_UC_FW_TYPE_GUC] =3D { blobs_guc, ARRAY_SIZE(blobs_guc)
> },
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
