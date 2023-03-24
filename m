Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB80C6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 15:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEE710E539;
	Fri, 24 Mar 2023 15:57:51 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91F110E539
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679673469; x=1711209469;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qilMLEntLG9wLRit/xRr3ssh0CfGVowt+UL1FP3iwrE=;
 b=aHfDEI5UOv9mxMvaAyfvHlcXNHbIs/lWCARCh7dGZ2s1+RfwUHtUa4tV
 VAIb+8C6wXZ3zahvDEVgKmqzWrg+7KRqFNgEAFqIDe4WgGL6Y2bUk57yb
 XR0+IfgQE28yGnyxdVjxYJ9lq5NNNyDtFYXhH70IlfJQ4ELPWWJ+ZsRZj
 1DvVaGOVb1997VgCKQF4SVkhujK/tub4N3cS5Q2Ek0CNhgrBhh7r7KMq6
 6BdH7kUoS9N44PJOTdm1mK6Ho9sNzsyyZpjfThV4oGufOy5sKwvdvfF1+
 20gdQKtElVwQg7JujoSv69PnRldR12W5DsTlydosFb3+WzhrZrS2+nElm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="319460185"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="319460185"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 08:57:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="715288207"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="715288207"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 24 Mar 2023 08:57:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:57:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:57:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 08:57:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 08:57:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfzvabTuods5mk5/BMj+E+6JBSQNKNHtxsXeUE6ATSIHqfQ1YF5okUnYbQhXF/w7x52fMFxxeXdc+udVBdkF/dWjXwZiedSU8ImOSVeQcwj3DPA85cNzaVA6RTdDOXiqdlWbSOp78bS/LscNpt2x5QzMqyN0laaVYEWLvlkcdy8AIxcWf9F9Gygr50HfGm5Bvpt5d5NcPzDxM4aZyOCOyHz1oEKYzaKiOaBoIQMgKEWcLV7ZjO9dnxtn2OHjE6xVXiZ8DMhl3P6gOBVujLL8yRQkTiMBo8mboN0DdfDlUXO9gA9PWoybTuCbD67KgWoTr23QyqzcmSAPJdtE9oWfHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmJqmfxLWhBSyWiBdMYhZqt03d+k0IPwGvvTMJKpQhI=;
 b=eA4cJEqv/UFoz0okGM3P4LaDp/3AG3ngNjNtNcImwn+FQMLLEeHot/ve+0PgX5UOOSN/SBHC5DU08E9eROmm0MuRYYd7PwzTiKn4uVlA5+PRW17QufojEOlRjEXvM6I9cYoTLagOF8hM9gBQ0jDuuFxvnUmQndoprFWFlNqYI5ka5gq01aY+FV3bYCjWf5V5g6QKcEifz6/Ofl8vD07Xwy1c82ORjzd4tPBBqdOr9QaZ3g1KEm1IPQQYi0Y4QuvrSUc+6SOQ+hDqOPD/XkjiP4XJUGrNQQdQ1pD4fpXvWrza6SaC+rTAKXanrpPAYg1M61kvaTTBSa8wyox61MOy9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 by DM4PR11MB6216.namprd11.prod.outlook.com (2603:10b6:8:a8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.38; Fri, 24 Mar 2023 15:57:33 +0000
Received: from CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876]) by CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876%9]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 15:57:33 +0000
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist mode
 if guc failed to init
Thread-Index: AQHZXiBCTAsK2/AuE0m/FE6dTpuzua8KDpkA
Date: Fri, 24 Mar 2023 15:57:32 +0000
Message-ID: <CY8PR11MB69401805DBB626806F6D818BC3849@CY8PR11MB6940.namprd11.prod.outlook.com>
References: <20230323202313.3523-1-yu.bruce.chang@intel.com>
 <20230324071424.ctpkvjhsuxbp3ghx@ldmartin-desk2.lan>
In-Reply-To: <20230324071424.ctpkvjhsuxbp3ghx@ldmartin-desk2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6940:EE_|DM4PR11MB6216:EE_
x-ms-office365-filtering-correlation-id: 899d88ae-d641-454e-4208-08db2c807a87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YPx2yxrYvGpi1xB1vmaf6YI8PZ2ooSxG3tj30RmL/VxgT6Tqv/eEByXWJjZ8SHpQlACCT+lWZrQES8M8RRam3Y5Rf1XU9VI4EhVAsoUAwSlOwbig2unEUR+dqSqF8eOYxw3fGJxy3SO+pt2RIhun/UeeRLRv+NhH/FXBM/xvPvCgg9IQezL7k6+m6q9bkmgEIVerEk1P+8WieihTjJGXCv3jPPIyfwENSuq0/0llywCindvIvr7FtO8iv9e8lnaoWpT70vg85MITqbBq26PCW3Yv3eZwkM5Q/rR2/IcGqMruVDvmVv1ajGHLR9USo7sdyLsI4taBrh0K7NuDgBsoVd0x1jHFvZ2kUHccJWLAnGGNk/huPk+Y5R6HTnd0W9ppt2+WW8RJbw4sTKb6/AgpnuUQNtK+SHFYNt/8wxdReubzv0JKWibjcwkW8Xvyyodsf6iIFXOTAVlAen9nqe0lN/CKpmbKAyKX1ARpO6ZynQenjUZy7DRU4rftA3A50RVO7jZ66/985Psm2xLhKgiISl63WpHmOeYN18jU4T30e55VrdxAkD3QE/8L/dcIpzGqZcugqAt9lJuICz6An85cNELILhd40Aw4GdNioFl22AYKhTtRvMJlB3Ekcq5KD1P1hFxQhDipQL4ocoIeCE1zQ+W8I/Qov4/ir+TIaSxA0M0i6+qIWxUYlX6DRoOn2xn6riTQpeYNpvxmXdWsCq7zXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6940.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199018)(8936002)(76116006)(66446008)(52536014)(66946007)(66476007)(66556008)(64756008)(6862004)(41300700001)(4326008)(86362001)(8676002)(33656002)(38100700002)(38070700005)(53546011)(6506007)(9686003)(26005)(55016003)(122000001)(83380400001)(186003)(316002)(7696005)(71200400001)(6636002)(478600001)(5660300002)(82960400001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6y420WutN/4cUGd8a01Q8ZpzsXpicD+Mfa6VYFIuXszV65kCr6yeVHJSDXT6?=
 =?us-ascii?Q?uFxguvfzQGsYzLRNqU/y3uqR9kx6HB2LO5bmtCOsS4HibdoIrAh5uoSOFE4c?=
 =?us-ascii?Q?BlvpxSQSmgC0jyzljjDH2IEDYwVFRhQ7aGl0ha4iv69l8JdvufrMOhn+FIdP?=
 =?us-ascii?Q?U4oaT6XcvoKRWqKmTi8WgCDK4epMgDMmWCVbOQtSmGRv8qATaSXAXFh/jb+q?=
 =?us-ascii?Q?hhd4EFYY5zhhpDoQa6iwLJd0oVlX+Eb7gTbE+yT6opL3W0uVA15M67mWuLqm?=
 =?us-ascii?Q?2oczXizTh+dgQbimaybRg6zxx9eyOPpBISnEEPc+5xmPybJ8KsrKLlpfJuNU?=
 =?us-ascii?Q?7gu/suC5SEOy344xezisjnS6IhoMe+zz0jX99FuLFlTn11cY5DPhyYat2Ff+?=
 =?us-ascii?Q?J4Q/QgNrhK/ns8K/twybpfLMSN4w+9jGt9PaPwHXZqeUYNwXHv2LyuYoJzvQ?=
 =?us-ascii?Q?eERLvQ8E//Is7LQPdn7flGqzk6fV/wqzQYZFe7OvqGGrCDErHwRnXFFeCsIa?=
 =?us-ascii?Q?jFmkxDwtsxswxFqAFfezyw3opDYuMvqGo/lXuYdJEGzEmVzBapMFkiD0WGTs?=
 =?us-ascii?Q?NGvCFJpH8tQClIjWD0rd2/y/6yKu0MfQTRcWdONopOC58hBSjoCAmFYglCRa?=
 =?us-ascii?Q?0gvW6nsTc2600ynoY9CBynoZ8hV1V41TJvh9vSCmSB0r9c6dBDHt9PNFuG56?=
 =?us-ascii?Q?8C9LYiW/yzZIlkVTE+0pGCl2UW9CH6K1iiLB/covRY71ceBaC0hOzzEXWozH?=
 =?us-ascii?Q?g35gAOgO+A8Lrf8dAfCLU4PXV9bzyQUivSFko69z/wFmSM9+DfzhpXgaMAmP?=
 =?us-ascii?Q?MfbQpAh24m7FaHKrgKMEMxJl963VMrvrJKwBHoR4N/IqZctJHBF2IoArL2hf?=
 =?us-ascii?Q?VcQKFb/AsQqHYDV79avcAqi6b2GbkGtzQpzlC9FVDxsRkJObVw5yphr/wpvx?=
 =?us-ascii?Q?1qMa2mbXdLKb1IjNHxnpcUdkLiEi0W/rH/sIuwcuP2idKtmYQQ1U7oG/MVHT?=
 =?us-ascii?Q?1GfDe5Fqn77JOALQ47OyRDvieUoQyMRfh53d5xwVtN25bolMHZQLawLu++CF?=
 =?us-ascii?Q?8C/PKq8gVnwCFdLGg8x4gl/Har4DDwf7uRSZLEGwUwgMV9fKaRHiY8z99/y3?=
 =?us-ascii?Q?GCgy27JOYTNYGifEzNGttHZTOiZb/uRpV/E+K3eyUm2zugwdt9slTjGggLhp?=
 =?us-ascii?Q?dLLvFL2FsbCjcAte9zCiUY5luPrmPC2hqoN0qjf58r5tFCOu78EsIi3OGjGT?=
 =?us-ascii?Q?wMC+bR9lvpSeY05ZNhUtCuBbd3QkXXBilV6baOG84NpFjaVK/gV+iIDDtR0z?=
 =?us-ascii?Q?qv7gpXbDASUdBSFhyzqFI2FyrNGsUoTro/Gq+zlDIG5TMFrdR0Wf9VhTeh9D?=
 =?us-ascii?Q?9vHjQJ7f5EUcjI3jucdJYTiIAyX6kDBriEC0YO6Q4RLkVPG5Km1oc5EiFOMh?=
 =?us-ascii?Q?NAlkPnwozbzfTs5ip/o8SbE05mUNoZdN3m67vSkKoB1Vfp5Jv+tKMjnZDuU6?=
 =?us-ascii?Q?3s+mTZaXgE07o5StIJEzyax4kgjUKtRJLqhvgTxK5OBnMXPywoIQ9IqvMNji?=
 =?us-ascii?Q?0Jmx6mOecxsELMXA24jdxs6G7ajWVDAdwmU0I689?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6940.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 899d88ae-d641-454e-4208-08db2c807a87
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2023 15:57:32.5396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o3oQzHEgnvGLjI9/2ejgbl/Ik7e+YyGJj86q1ZKxqyIw7oxnCq6JOAk4zBN1nRdYemzs+TcMCi4sQ1BA0KqWMYoGKaYCDQTjKZPvLMP1yBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6216
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist
 mode if guc failed to init
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Friday, March 24, 2023 12:14 AM
> To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist =
mode
> if guc failed to init
>=20
> On Thu, Mar 23, 2023 at 08:23:13PM +0000, Chang, Bruce wrote:
> >In general, this is due to FW load failure, should just report error
> >and fail the probe so that user can easily retry again.
> >
> >Cc: Matt Roper <matthew.d.roper@intel.com>
> >Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_gt.c | 4 ++--
> > drivers/gpu/drm/xe/xe_uc.c | 3 ---
> > 2 files changed, 2 insertions(+), 5 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> >index daa433d0f2f5..8a436c95591e 100644
> >--- a/drivers/gpu/drm/xe/xe_gt.c
> >+++ b/drivers/gpu/drm/xe/xe_gt.c
> >@@ -455,9 +455,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> > 			goto err_force_wake;
> > 	}
> >
> >-	/* Allow driver to load if uC init fails (likely missing firmware) */
> > 	err =3D xe_uc_init(&gt->uc);
> >-	XE_WARN_ON(err);
> >+	if (err)
> >+		goto err_force_wake;
> >
> > 	err =3D xe_uc_init_hwconfig(&gt->uc);
> > 	if (err)
> >diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> >index 4ccf2b3435e1..70eabf567156 100644
> >--- a/drivers/gpu/drm/xe/xe_uc.c
> >+++ b/drivers/gpu/drm/xe/xe_uc.c
> >@@ -54,9 +54,6 @@ int xe_uc_init(struct xe_uc *uc)
> > 	return 0;
> >
> > err:
> >-	/* If any uC firmwares not found, fall back to execlists */
> >-	xe_device_guc_submission_disable(uc_to_xe(uc));
> >-
>=20
> now that we are not disabling submission, isn't there anything to undo fr=
om
> the steps above? if so, then the goto's can be simply removed?
>=20
The guc_init failure is not supposed to disable guc submission since it
is supposed to be only enabled later in xe_guc_submit_init.

The xe_device_guc_submission_disable is just to indicate not to continue en=
able
Guc submission if we want the driver to continue the init process. But sinc=
e this patch
will fail probe as a whole, so this flag is really no much usage.

> one thing that seems very wrong in the previous state of the code is disa=
bling
> guc submission if huc failed.
>=20
Right, actually this should have different steps to revert each previous in=
it step here.
But I think that is a more than this patch is intended to do.

-Bruce

>=20
> Lucas De Marchi
>=20
> > 	return ret;
> > }
> >
> >--
> >2.25.1
> >
