Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EBEC001DE
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 13:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFDD10E160;
	Fri, 28 Jul 2023 13:22:13 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8736210E160
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 13:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690550531; x=1722086531;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PnMYdIChFuSf/4dv3zAqazMeEDMpUpDOThpwvEmbbko=;
 b=T6mig2eteS59GNbBXVg7WEzra2AiFm7w5+tiqnKmfITiGOHoBA9E7TEj
 B1/s2RDpua2P5onLcvvAst9ZK8R4uQ7a5KIRgeB5G655nXqd3hhGA4DGE
 n2niChB1nEF77XGUn+Yg2c+1mlp0H29ydmaZ0bhhOzqxhJpbNo9YJZml1
 5iRDDOgEPIN8Sj+KZb4GF1JmHw+zD3v8heJWUMbazGD5xtZPkzBpDbf3F
 1Ol1IHOkiJF/61s9xWfkZUbWRA2q8hpoYDyi8KHKSfbGRLFF+XK0KERkT
 TO9G74vzU957DqKV4B5PXEGhcbqCBIptWv4hYPqzktsppbaap08AhD2Va Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353498645"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="353498645"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 06:22:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="727482640"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="727482640"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 28 Jul 2023 06:22:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 06:22:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 06:22:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 06:22:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 06:22:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+rRrNxbFb7gO61/1mVIM2XfZVG55cblNsQq1E73cWsu2K+xuWCnRqftuLTfesE6s0z8LWaXGo5WDTsyzk9jreMhJc+toW5NzOdUma5xPReQ2BdesJDwQTwtAMBSb8Pk6sLHzlthtjqmJ928V+6t/Eav2BflXFAD8VGZSyZSTGEIstYLeYixCaiVjROTv8CyeHKLIgZdj4fRh9oMqOSbuWlZJ16s3iiPFbS81yaP9QwqzgegSWgkVOlSFNQXBE+sNA/I4cD+J8KZThX5Bn4iFsbcVjyyqwSZS/ImLOS8cwXh0sqcyxvgJ54U8rMBrX5vY2xind5x59kmDwELdPJpyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBnA2XKNC5y7rTKQl9Q6Ek8xMvF0xkTc2N/GpP9G68c=;
 b=Ow/5w6ixZ+JHcamsGL6meSCMBaQvnliB/Bv+uqqPhTjA4EG2ogt3Wl3mSAtutq/xXUDRkj0blyhjelCPmQFAbHbAlqxeA+AzoTKpcNYmy+NmMujVGgK7Ut+zq8sIjl9XtTZLXTz2pxPfJ/wwQt4Nf1UondjpKTJkfAbBjt0IB3MF5ZwWAQe5eleLDJGTCG+ieF3QDOY8vPOOUlerbmmKJf9mQvg8tdenGNAd50u8sM5WDwvxDhA6PMwpSLE7ZDkQYiXLHeOIv6H08KwmBxDNX5BPH8wBqYN7eE8M0DHbCx1ByWseZ5hvKl1761X3D5cMVbjPKh4vktaFDjBFlP7uAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CY8PR11MB7316.namprd11.prod.outlook.com (2603:10b6:930:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 13:22:08 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1a96:db0e:58b5:123c]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1a96:db0e:58b5:123c%4]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 13:22:07 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Thread-Topic: [PATCH V9 1/6] drm/xe: Add sysfs entries for engines under its GT
Thread-Index: AQHZwGKYaOlhrxNWVUyrM2QtASaaya/NsDSAgAF7z2A=
Date: Fri, 28 Jul 2023 13:22:07 +0000
Message-ID: <SJ1PR11MB62049D4D96BCFFCEB65C70568106A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
 <20230727082235.905240-2-tejas.upadhyay@intel.com>
 <ZMKCM9cxTq6ww/1c@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZMKCM9cxTq6ww/1c@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CY8PR11MB7316:EE_
x-ms-office365-filtering-correlation-id: 17b7a993-3f74-4adb-27ba-08db8f6da4a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wwXdrg9DKePpExMxLvnN4r1ZdLSGwtkoBXayZb8M5a3E8yvphzp3elAA68d5EUq4TXmzJDmvAEdzplei8Q3OJou+Q/BsZWOkQ17UXs2WXJ1AVVPeCWTJ1Byhdqflkk0IjK/CEq/E32BZCqlKYVQcGHTCVU0+684y+vCYZrw/L2PgmTJUgLmjCcv/+7wFz35aWNHeu+aMFIjdhu4A70lpq/UskSHHsdqFErvuw/NHBxzC1JS3GSdWgoK+TdzTYWB2uJQdX8UUttRwwczeZ5gF7ulndF5jfS3GRtu+J9c/YBh/hXFRNsO2/3zAQrjHmXtAS33FB7myQ+rNDg8xzgwmXi76CqKYITpoffa6ylH5dfeQF5TWuthUezA0Gn4NFJme9q+iIYRYosRXP9FpCopDu6gWbZ1AGmeQGY+TGkw1rGs4UvQy2DiXnNA+YOUY55+3KOIfBBLS3rqcjEY/5oxP375nGgoyW1zO13WxVoCB5EbymPUwSCbOsN6rGG149kQH4Ne9ZvSWGRZjxmlgAlV3yOZJtA19+fhQF0HxGuXPYRsFgddr1Kn50J3QWqWnTTR3zS0ikpOjhqOAFm2WGkCNYU9AcbsO54lHSpFbRDMkRGQIHUo6/aNDi+X9DRSFd04x
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199021)(41300700001)(8936002)(76116006)(66946007)(8676002)(54906003)(64756008)(6636002)(66556008)(4326008)(66446008)(66476007)(316002)(6862004)(52536014)(5660300002)(38070700005)(2906002)(478600001)(7696005)(9686003)(33656002)(55016003)(122000001)(53546011)(6506007)(107886003)(83380400001)(26005)(86362001)(186003)(71200400001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ALvgjY0plX+lRkgywc08sNHClVvrd2Sd1cI+QqWnBeR2lPrkWveHLxNc6WV+?=
 =?us-ascii?Q?K6ubZwdoSgy5r/XvxvRI2cKOc1u7w+u5RW9QNWq+zBghbJZbvK7pnh1s/P6F?=
 =?us-ascii?Q?y95Og1LisL6MjI3urXFSG+XNnYf40PJbPKIuA0YQnlUK8PIX8/NeBd1abQjn?=
 =?us-ascii?Q?BOKdw03LZyGs+AVa/IQfaco5WKjyZKwtYljx88QQZRi+7TP4mxkbRctMSGSJ?=
 =?us-ascii?Q?vaFOlspg7X4rDEciySSZDhBomkzu28MPLRK83RIHUvdP3J4UaB4WPaDrtN/z?=
 =?us-ascii?Q?+fYxE7DC4eZo+ocILnY791C+D2vSGBZw/4kdu/PwE8Z9kF1PFCAxwyyoA4cn?=
 =?us-ascii?Q?SB1w3NAcZKwD8K80HjhPH1GPrRKHOTMeojlcTsrOJ1NWzmIo+eKeLxbAzDMp?=
 =?us-ascii?Q?7y4koWzN8F0UfZhKOh/h51Cthd2kn3EtlgaiUI0AcM/0IDu/NLza746WUf0n?=
 =?us-ascii?Q?zpEP0gccUraXcsQchNbFFHbiyEjMxFmT+Sqen2j/VVbrxUBxczi1pzbdbv/c?=
 =?us-ascii?Q?YnLM2grKLi8EIPS0JYTHRxESVFUv10mW6oac8RnBTW6VRZaeyEd5XeGq5gEn?=
 =?us-ascii?Q?7+duqp7uQpvRY2lD9ZE2OXlP/mHyuOZGXMOaGEhUwmyLlWIXfu86BGIgQu+j?=
 =?us-ascii?Q?1qMtrfTMXdAf1Vme0i+czD80KWFNgDFPDxTEoAiqhedIb94xdtPWnS+tssbC?=
 =?us-ascii?Q?41sDvIhLEU3NNrIc3P7Q9qg1pnBa3e9mziINu9UhmDX14YqJwitNA+aAUQ2R?=
 =?us-ascii?Q?yzmzBoz8et1fKpIMMncV+20IrpeLSL2ZA8PRB3dBTPatiNpip7RTGb/ipUrw?=
 =?us-ascii?Q?NsRp3W4ImvOVcyy5bEAWw5pAQOWAGgFEwSb1Zl5rfmy3UuMMt8WG6CUDu56d?=
 =?us-ascii?Q?Cjtr8fz/BRreYbsxJE83wcGr2lInWehrZXmDa+SfQKwytycz7xU8yTO/AGHd?=
 =?us-ascii?Q?di5XtT8ywg6PoizRt+wwry9DvE9uj9wpiWgwn/ei0IkrZqpfWafX1/iCWlfx?=
 =?us-ascii?Q?ozRYn47YllwEbU4XiVoVWb21BHxxvyZr72onO6+11c6HNOCMffYIqmOUwS0i?=
 =?us-ascii?Q?d8Do6HTvwm6ysrp7acFRUhq/kYnHQpz0SIGSfNJEmmaqikpV6I6XWN+FEp0q?=
 =?us-ascii?Q?Ojf9z0vt4pTeHrdLuiM7SU2X3UghMyRntwnweaFbZlmlNHVPGPfJor/Fz9VB?=
 =?us-ascii?Q?YXcWKsD9maW6QUilpnK4dBtMxY+r3dUtvvMR/Z4Kzi69wyIWBdllY8bjMx9H?=
 =?us-ascii?Q?8vV8A6wh6Gn5PoIgYtQ0cLlivGI2cN2NL9ANNjtuEbzuVvyHe2P9s2Ah4YiY?=
 =?us-ascii?Q?Qov3SL0WJdDgRBx3vhUgRuCGRehIZblD8LgmILt+4x2MCbmlfvfIEEDY/8d5?=
 =?us-ascii?Q?BoJKnZvvpB9meyvD8bTSn5kRgGv8hnzITTFWFbi78tWJWo5CfcPgRJpYdVtq?=
 =?us-ascii?Q?dryCcXWayhRZkqPj47p1N4LXywUJLh187QjKA6JT3Bb08BBMPTz0fV0fHz9T?=
 =?us-ascii?Q?vUz0tV6BbFNBCLN1zHU5pE+E8ZdFba5amGVFB7uGRqeJPmyBha0+UxThlCnW?=
 =?us-ascii?Q?6zZmkPXZSHZP6jZbAAHjhvC7uoHpYgZTiRTB3x/4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b7a993-3f74-4adb-27ba-08db8f6da4a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 13:22:07.8979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uye4j8TNm3XyS+t0ECnaZC/j8POcTRvaw0bHH7m2KG3kax2iZkgVTCMaA5UouDPr5HnpO/3qRudC1D7juVp1xZ5eLCO+ZxgTfKkfvOmzToA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7316
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V9 1/6] drm/xe: Add sysfs entries for engines
 under its GT
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



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Thursday, July 27, 2023 8:12 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>
> Subject: Re: [PATCH V9 1/6] drm/xe: Add sysfs entries for engines under i=
ts
> GT
>=20
> On Thu, Jul 27, 2023 at 01:52:30PM +0530, Tejas Upadhyay wrote:
> > Add engines sysfs directory under its GT and create sub directory for
> > all engine class (note its not per instance) present on GT.
> >
> > For example,
> > DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/
> > bcs/ ccs/
> >
> > V5 :
> >    - replace xe_engine with xe_hw_engine - Matt
> > V4 :
> >    - Rebase to resolve conflicts - CI
> > V3 :
> >    - Move code in its own file
> >    - Rename API name
> > V2 :
> >    - Correct class mask logic - Himal
> >    - Remove extra parenthesis
> >
>=20
> A couple nits, otherwise LGTM.
>=20
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile                   |   1 +
> >  drivers/gpu/drm/xe/xe_gt.c                    |   7 ++
> >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 111
> > ++++++++++++++++++  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |
> > 13 ++
> >  4 files changed, 132 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> >
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 4ea9e3150c20..a3099a4fd56b 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -52,6 +52,7 @@ xe-y +=3D xe_bb.o \
> >  	xe_device_sysfs.o \
> >  	xe_dma_buf.o \
> >  	xe_engine.o \
> > +	xe_hw_engine_class_sysfs.o \
>=20
> This is out of place alphabetically.
>=20
> >  	xe_exec.o \
> >  	xe_execlist.o \
> >  	xe_force_wake.o \
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 3e32d38aeeea..d52eb45896a7 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -27,6 +27,7 @@
> >  #include "xe_gt_topology.h"
> >  #include "xe_guc_engine_types.h"
> >  #include "xe_hw_fence.h"
> > +#include "xe_hw_engine_class_sysfs.h"
> >  #include "xe_irq.h"
> >  #include "xe_lrc.h"
> >  #include "xe_map.h"
> > @@ -322,6 +323,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> >  	if (err)
> >  		goto err_force_wake;
> >
> > +	err =3D xe_hw_engine_class_sysfs_init(gt);
> > +	if (err)
> > +		drm_warn(&gt_to_xe(gt)->drm,
> > +			 "failed to register engines sysfs directory, err: %d\n",
> > +			 err);
> > +
> >  	err =3D xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> >  	XE_WARN_ON(err);
> >  	xe_device_mem_access_put(gt_to_xe(gt));
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > new file mode 100644
> > index 000000000000..c2f092b54af1
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > @@ -0,0 +1,111 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright (c) 2023 Intel Corporation  */
> > +
> > +#include <drm/drm_managed.h>
> > +#include <linux/kobject.h>
> > +#include <linux/sysfs.h>
> > +
> > +#include "xe_hw_engine_class_sysfs.h"
> > +
> > +static void kobj_xe_hw_engine_release(struct kobject *kobj) {
> > +	kfree(kobj);
> > +}
> > +
> > +static const struct kobj_type kobj_xe_hw_engine_type =3D {
> > +	.release =3D kobj_xe_hw_engine_release,
> > +	.sysfs_ops =3D &kobj_sysfs_ops
> > +};
> > +
> > +static struct kobject *
> > +kobj_xe_hw_engine(struct kobject *parent, char *name) {
> > +	struct kobject *kobj;
> > +
> > +	kobj =3D kzalloc(sizeof(*kobj), GFP_KERNEL);
> > +	if (!kobj)
> > +		return NULL;
> > +
> > +	kobject_init(kobj, &kobj_xe_hw_engine_type);
> > +	if (kobject_add(kobj, parent, "%s", name)) {
> > +		kobject_put(kobj);
> > +		return NULL;
> > +	}
> > +
> > +	return kobj;
> > +}
> > +
> > +static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj) {
> > +	kfree(kobj);
> > +}
> > +
> > +static const struct kobj_type xe_hw_engine_sysfs_kobj_type =3D {
> > +	.release =3D xe_hw_engine_sysfs_kobj_release,
> > +	.sysfs_ops =3D &kobj_sysfs_ops,
> > +};
> > +
>=20
> We should have kernel doc for all non-static functions, this a WIP across=
 the
> driver but since this is new code I think we should include kernel doc fo=
r this
> function.
>=20
> > +int xe_hw_engine_class_sysfs_init(struct xe_gt *gt) {
> > +	struct xe_hw_engine *hwe;
> > +	enum xe_hw_engine_id id;
> > +	struct kobject *kobj;
> > +	u16 class_mask =3D 0;
> > +	int err =3D 0;
> > +
> > +	kobj =3D kzalloc(sizeof(*kobj), GFP_KERNEL);
> > +	if (!kobj)
> > +		return -ENOMEM;
> > +
> > +	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
> > +
> > +	err =3D kobject_add(kobj, gt->sysfs, "engines");
> > +	if (err) {
> > +		kobject_put(kobj);
> > +		return err;
> > +	}
> > +
> > +	for_each_hw_engine(hwe, gt, id) {
> > +		char name[MAX_ENGINE_CLASS_NAME_LEN];
> > +		struct kobject *khwe;
> > +
> > +		if (hwe->class =3D=3D XE_ENGINE_CLASS_OTHER ||
> > +		    hwe->class =3D=3D XE_ENGINE_CLASS_MAX)
> > +			continue;
> > +
> > +		if ((class_mask >> hwe->class) & 1)
> > +			continue;
> > +
> > +		class_mask |=3D 1 << hwe->class;
> > +
> > +		switch (hwe->class) {
> > +		case XE_ENGINE_CLASS_RENDER:
> > +			strcpy(name, "rcs");
> > +			break;
> > +		case XE_ENGINE_CLASS_VIDEO_DECODE:
> > +			strcpy(name, "vcs");
> > +			break;
> > +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> > +			strcpy(name, "vecs");
> > +			break;
> > +		case XE_ENGINE_CLASS_COPY:
> > +			strcpy(name, "bcs");
> > +			break;
> > +		case XE_ENGINE_CLASS_COMPUTE:
> > +			strcpy(name, "ccs");
> > +			break;
> > +		default:
> > +			kobject_put(kobj);
> > +			return -EINVAL;
> > +		}
> > +
> > +		khwe =3D kobj_xe_hw_engine(kobj, name);
> > +		if (!khwe) {
> > +			kobject_put(kobj);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +	return err;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > new file mode 100644
> > index 000000000000..c461fac717c2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright (c) 2023 Intel Corporation  */
> > +
> > +#ifndef _XE_ENGINE_CLASS_SYSFS_H_
> > +#define _XE_ENGINE_CLASS_SYSFS_H__
> > +
> > +#include "xe_gt.h"
>=20
> No need to include this, just forward declare struct xe_gt.

Not only xe_gt, for_each_hw_engine and few others are also coming from same=
 header.

Thanks,
Tejas
>=20
> > +
> > +#define MAX_ENGINE_CLASS_NAME_LEN    16
>=20
> This doesn't need to be in the header, just define in the .c file.
>=20
> > +int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
>=20
> Add a newline here.
>=20
> Matt
>=20
> > +#endif
> > --
> > 2.25.1
> >
