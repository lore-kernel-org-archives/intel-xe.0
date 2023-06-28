Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56009EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 05:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F345810E351;
	Wed, 28 Jun 2023 05:06:09 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A28910E34F
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 05:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687928768; x=1719464768;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JzY63WIU/GIG1VdXVKQ+rPgW9zOCQFax60DAEa0RuCk=;
 b=MkPutWIAUxzH67UTZaoHOpA89mnLzRHxRGzx5GIVIMQw6jGINCpZD9zE
 Nh7pwGVbCroFxdzIpJCkhKmupYCv4TU+1SOM9+LKS606Mdmlrhc4TAtqN
 gbzbMr6bZ7cDmugNyPcVB+U4yf6MU5Q6OS3IDXi9RDt7jHgYDgKdSoibi
 4JHRZDVID76YU/k6ox6evnXhXshGMUMTIEvG/v8zXcYVV/c3PLM8m1NOh
 VrDn0mfDnT/s4K89Z9EP3OU5gI8ZQF4sAWS+M3kuALjI+eUMY9u4U45jv
 OG5cI/GEfctxJCgbpwNtlNYjbpP5l1uqeYcTF31AH85O0rL5fFHvR2Z9N w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="427758507"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="427758507"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 22:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="806747030"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="806747030"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Jun 2023 22:04:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 22:04:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 22:04:49 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 27 Jun 2023 22:04:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJ30CNB4bzvrk24ZDliFNV75S8imKjvuf19Vr2aEKeoWa27bqBepF54WzyiUIhmU39lWSr1gwCsVK8XHl+yrVaG6F9oSpDXWO7OPx23wIYwRfjpmuyGpWqSygA8LFHxnUX7VblCsMaHnY5PORb1L5xlMM4UKdA0sxxn+8gwTHrYfTwdkrExY8hBc53v35wzzEhI4l8NarA5rigojUlgsccHPFgT/x7aTIObO8zO58ssVh4Xs60Ad5PpdZrXwA9/cbUrGoQ5zCVULvf6gKHb5Pk91g3BydkPjTv5vz3djRICx757B2VUi2KHP/pZpoegKcMFmU123uglPow633sddOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIOYXr25KHnnGV5jOdmJBhFUogr9jau27m8yHO2aPgY=;
 b=bUJwUlpM0F4s2eGXcbkmS7k/NLEiitRH/BtM5wCst19LQcKvCUNJqu0fmKlCHq9NfthsH/ZkhFSSken6eNxMP7ylBvZrQ2vzFetsrmBlkc6RrMO78lKhAoYrecCq7QjpNF0e95bycaaQbvMEwT4QS6ZDV+EFV1904/oIzetmQvsA9mj7NDHtTyJAI394b/ayZju3v/nN99SPVXymsRKiPZX8U6EQImFO7DP+9Bl1j7sveHY/0worTBGCoUR48JJz45WV9LBFqL+Kc24HiRJpGtFyJspmhMebtnCVlOtlViAnoUukHHkroyEFvCdQzf2Kj9xrwPWX6B6BmZ57J7ay1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by LV8PR11MB8606.namprd11.prod.outlook.com (2603:10b6:408:1f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 28 Jun
 2023 05:04:46 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 05:04:46 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH V4 2/3] drm/xe: Add GTs under respective tile
 sysfs
Thread-Index: AQHZpNpMRYXAIRGQVUCvRE7ch0BJWq+e8nCAgAC+kFA=
Date: Wed, 28 Jun 2023 05:04:46 +0000
Message-ID: <SJ1PR11MB6204E302D81B6E1367ADAE0A8124A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230622072818.3182423-1-tejas.upadhyay@intel.com>
 <20230622072818.3182423-3-tejas.upadhyay@intel.com>
 <pmzxaxpm3ycndjmtlnxwx5dwewgyeprmfxjzkgcnuvxyfiaww7@lwqjio7wvneo>
In-Reply-To: <pmzxaxpm3ycndjmtlnxwx5dwewgyeprmfxjzkgcnuvxyfiaww7@lwqjio7wvneo>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|LV8PR11MB8606:EE_
x-ms-office365-filtering-correlation-id: 9ef28575-7bb7-455a-7715-08db77953119
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OxEYNh2gSRb8hx8opSRw76nQ2+0sJsMm8x10WXfNdUkLBMJfAf7LOiGrQ+jm3LXwrhh6BAy/jm9sE1ZbHm9Q8tGQypZCmM6kCfq/LyKgwkC0KvvLpUZnj8LjdJNYvPLT7LlnSUHXLyqvxKKx5BCiqFicr1VjrFdXtda0yZM+N4LfdshZVmBgKa9lA/vTn9xUAx5u12au3p28s5/hsJqaC16W53WkWxUtDNeF8vj7Nc/Ck6ocXsftmcMONKPHzA22VpO4N2EkH9mTgRy1WkGcP572uPVArPOr91XZ/Czj+I73x63wu2eRM46UIZJ1z/ZeRNQ//sfDxaU9H0iraun5fzUb+nWhdyB87WTmHkPlEhgs+u/AlHYXTzrs6TUL0tu/lRWNF32TtzAV56BiYgpnnViaghgj2q066MIkmvfGgd79Q6iCsnPMmsIJK3cM6YnELB/u/k+yFNNVaYYbHGUPuPCIUB9O8AnlxX2t3KGj2XqpTbW/ahX0+KisWlKuoANDaoSqQ8qEbV7ZzIlY1luQj2XOTJaMbMSsanHdIASVWWmp3Jon64HCoCrGNSCwOTjS22VR0o2axrij1b800nUL1996FKpgY2gPnuRHu25JZtQIrRv7RbVlSqSG8reZC0dxzVh5HlU3PZ1dWH0GAVR3pA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(366004)(396003)(136003)(346002)(451199021)(122000001)(82960400001)(38100700002)(38070700005)(83380400001)(33656002)(86362001)(478600001)(9686003)(966005)(71200400001)(7696005)(6636002)(8936002)(316002)(76116006)(8676002)(66946007)(55016003)(66476007)(66556008)(4326008)(41300700001)(66446008)(64756008)(6506007)(26005)(53546011)(186003)(6862004)(52536014)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IFJcpGbngFN7M1lDag6Kbbde2QFxDRpxMXd2qMIAGPBFqWnvdsx2g1zCpJ+7?=
 =?us-ascii?Q?LlnfpZpjlIhOH20w9I/agqBdrXgT+BzURUb9UmdOYRecLkiFnHxQcwu4MT9N?=
 =?us-ascii?Q?7qlZCGrLl+THcaUB8l3H0KYllpB6W4QX17sqHZYQq4W7Z8wKjsC8iVfPL503?=
 =?us-ascii?Q?2+Vja14d31HtCFzrFEQ+DyIV1ZjwxIe7bWbxsb8WqQ7RzIgsnaWr6xV3MvwL?=
 =?us-ascii?Q?AQD8FGHpRok/He4oI3cDwZXcxr2lKccYAtNUWuYO0QWUzouKGuP+eJyyCBca?=
 =?us-ascii?Q?Qakn9ILuklvqswC8qhjUADTcgLribjZNYZLfDVnMUEB0dLwUBafzltYt81ZZ?=
 =?us-ascii?Q?kKK0mcDo/JI+FHyOBI6Ba/wIoJsWNorOOgIFS3fRWnm2yXN5iZfSV+vQzEP6?=
 =?us-ascii?Q?sCWIxgsqpiNapYWtE2H9s60ca0yt8FDK9dSoOtk1CytgKHU0olAlX4Rmw6Nr?=
 =?us-ascii?Q?YEMNLESu8Fd1y8hAB7fq6N2cpGWHcCOXksJA+nB4iE/oJHEKl5s3N1ZGH/LT?=
 =?us-ascii?Q?w07fQ96QhrrV3TdzT5WEoBpkg4ybXPXifB3srQO0o87KDmT912DE3UuMfAL6?=
 =?us-ascii?Q?zk22mjbWxyV98X/447glQK4/tVWlrZGb3+2GI+gRkpKEOxW3g8xV8+klMD+A?=
 =?us-ascii?Q?wmLQ1xeC9pTpcguaKD2YqPkPOCxDjXiji2i9ZM9sdCfIw80Kra5r2XbDSbUO?=
 =?us-ascii?Q?+h9RaOue48jwXuFDGbXDWXd9ToxgZuiR3ga3cIl7jzMWy34yZ0iOtaYwdFdy?=
 =?us-ascii?Q?8zCqj78vBzM40077P0SQTuHj8JT23CAvNdDgbaQbvES5lufP6HhyzKROnaGR?=
 =?us-ascii?Q?eFNx0ZeTLXM2QQQs+d1j/EVOgMHn3bjTAs8AAAV5LvWJ/A8pz4/RbGjGfsXu?=
 =?us-ascii?Q?spwvi+0BE4Y+qDDPLYvuGFEPas3i7E5SeHyVmHsP36yIhtdFCEGVFEsegjLb?=
 =?us-ascii?Q?G9WxkdpVNXXdVQeBaPJXjqA0UCC98KE5tI1rhh7BTWtoW5lr0drhlWG4IG29?=
 =?us-ascii?Q?HW31Mcl87mP4C8nzG2ZTqBpUCn5MZRKXI9GoHDlQCJ9hFe+psf32habXr7L3?=
 =?us-ascii?Q?VE5SwuK5IRe4ih+3DGmvtXpxrBss69rnmTohpf+Z3g7R1jYVD//GMYcfPZ9f?=
 =?us-ascii?Q?3+hUuJM3eI8fDzTBvFYimryc0dlaJq/fS63rDYCwxphwa2IZfdRc3ycmJM24?=
 =?us-ascii?Q?rAzY+C7FAbkZN8BhME8F8RUOdOov4K2TNkZcscXbf1KN1tvrnrRqlwERbevt?=
 =?us-ascii?Q?vMLaR+VYyns0V0cfQt2EwgVc4sfGmaJXgBtZV+Y8dFeuPEannt5xNITI8Xpq?=
 =?us-ascii?Q?snFON3EDaBXFUG4+veGAF1/Tr5U/NBvG9iJd5JvzqhRmvTVkl85NcQgjz0Rc?=
 =?us-ascii?Q?1y67cdpXVWbQoGrtdBUjBtILtcolCbQKfuiSP0Hy0iwX1rFlw7jDp0s8v6+u?=
 =?us-ascii?Q?k8tA8gFYpffH/0Ytv3tlRaRjmvW1wr5uS2Aoqcz7+zj2I5uM19yr0euBybOB?=
 =?us-ascii?Q?QZJ8sGj6GVWUHOS9M82gy64fVf7vJ2YxEqiGxtLovbDB5jNZzGOCVO0tI+Bk?=
 =?us-ascii?Q?/7VtSluyGDEersjGx55AAO0tAhzz5yhy/j7XIo6g?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef28575-7bb7-455a-7715-08db77953119
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 05:04:46.0569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jCuhC65LQjHDBClKnhXY4oK6Q+fbi6qAHvYAXUlEk+ULgDOYoIwS4EVorY+Zs0gtoHsDTABF3y91NvXZN3/BwuJ/KtowWecffV570B9ehBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8606
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V4 2/3] drm/xe: Add GTs under respective tile
 sysfs
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
> Sent: Tuesday, June 27, 2023 11:08 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH V4 2/3] drm/xe: Add GTs under respective t=
ile
> sysfs
>=20
> On Thu, Jun 22, 2023 at 12:58:17PM +0530, Tejas Upadhyay wrote:
> >With the separation of xe_tile and xe_gt, We now consider a PCI device
> >(xe_device) to contain one or more tiles (struct xe_tile).
> >Each tile will contain one or more GTs (struct xe_gt).
> >So lets align sysfs paths accordingly.
> >
> >TODO: Currently we have gt0 under tile0 and gt1 under tile1 on
> >multi-tile. This GT indexing still under discussion, when it is
> >concluded we need to revisit this change.
>=20
> do we want to merge this commit with this TODO? Once we export things to
> userspace it's always harder to change it. When you say multi-tile, are y=
ou
> referring to devices like PVC (real multi-tile) or like MTL (multi-gt)?

Current xe driver with https://patchwork.freedesktop.org/series/117614/ ser=
ies already running with these questions intact. Multi-tile by I mean real =
multi-tile (PVC). So whenever indexing fixes everywhere if applicable chang=
es will come. So for now I think it should be ok to merge. We already have =
IGT implemented and reviewed https://patchwork.freedesktop.org/series/11980=
1/#rev3, waiting for merge for respective change.

Thanks,
Tejas
>=20
> Also we had a discussion in the past, but I don't see any current discuss=
ion
> about it being taking care of. Where is the discussion you're talking abo=
ut?
>=20
> Lucas De Marchi
>=20
> >
> >Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_gt_sysfs.c | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >index c01cc689058c..13570987a756 100644
> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >@@ -31,7 +31,7 @@ static void gt_sysfs_fini(struct drm_device *drm,
> >void *arg)
> >
> > int xe_gt_sysfs_init(struct xe_gt *gt)  {
> >-	struct device *dev =3D gt_to_xe(gt)->drm.dev;
> >+	struct xe_tile *tile =3D gt_to_tile(gt);
> > 	struct kobj_gt *kg;
> > 	int err;
> >
> >@@ -42,7 +42,7 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
> > 	kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
> > 	kg->gt =3D gt;
> >
> >-	err =3D kobject_add(&kg->base, &dev->kobj, "gt%d", gt->info.id);
> >+	err =3D kobject_add(&kg->base, tile->sysfs, "gt%d", gt->info.id);
> > 	if (err) {
> > 		kobject_put(&kg->base);
> > 		return err;
> >--
> >2.25.1
> >
