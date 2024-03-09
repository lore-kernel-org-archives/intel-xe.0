Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C70C54798
	for <intel-xe@archiver.kernel.org>; Sat,  9 Mar 2024 07:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226A610EF6B;
	Sat,  9 Mar 2024 07:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGpwudyY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B45610EF6B
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Mar 2024 07:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709967685; x=1741503685;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W4hlXqlK5WnMTsoeOqiUIkrlmShzuIK1y58jRzYXIDg=;
 b=JGpwudyYEInsYTf/cWfSWSm08m1HfQAlQ5I5fqiy5GFkC6Wbgk9enxY1
 lE7VxzDJfOuQwWmhsypswZaraq8VSEcyJxfo3kACxI3YNdSjPmOIuDv/W
 FWHEV2YABCVaX4ZH51GGoGTdIvpA9UmVUkdmkgcu3zooU36xw1oTWPzp/
 S7dPHx5Fsxz7ymaLjvKHuHX47HM2ColRyMms6Nv3rtkGfDpjMlHn+3sji
 MDaUFyeIRHgzAHJw3D5AXGHTjFZNB1Glu49BiDilp7+GlhFWamDdEv0W3
 Xa8wg/AO47+5Z40hr2S6wPtPexEM1qWbS0UCrkujN3/CeWm4FG6DfhhKE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4549030"
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="4549030"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 23:01:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; d="scan'208";a="10561754"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 23:01:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 23:01:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 23:01:21 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 23:01:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4iF4BDmZRnatMcg5UlkhszBH5VYQZIFfgoKNY9euVMOR30knZ+N9Ilg2pBuTyA7kqB5ho1JkR5lbLgxUrG5+2OV+b097bzzYbJAvtUfrcL7tkyspqBcRfx0DzzTy/AGXrpdKwEfZN0yy9OPj3T1R9lepl1QqujFGE3amLqoTentS7H9R6Fr/pRrAcKnDmubJf2wCDTxD5huRP3zySjNc/OEyEdcxhnkU3dV00DefHVNiJcHn4gyQJrFa2VI6wYNDrssK8xjJ9fYYZHZ/NUf82wIsJ+G23/1KxOfsdexzwPf3U2FeKhw+GXFfaK/qNmGvsW5JD0qw1ueOFOZM6KhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdAosX84Ugf6rvMcqIor+gY+zS8FiiqtNsRTdQeI4Cs=;
 b=SHDc62EU5eDcehdpJbqYjhDY5/FL9ohaYdTCEt4kYDQVt2FLSSYfkMHvRUv5JNNsT9IkxeGSB6Uc/NIjJnLXC1hZUtEe3iBUBCEzhezbcDFqZSrl4neU9vQxaKc/lVAgkkNIZs5QWJq1nuTQZsIE2F+Npit4iZOAACNE+hyV4AQiKa3L2s8gh9PEZ90N9HVKnGuCH8PWsxl9pUs10vlPupb/sN3q/AXs+QgkFxCsvlZW4bO8Ywp1Yxjrp7TElUChNx7od2AlLuqZoKiasbqeeIciQWAYu//XuKZGbkIpUlqytWeTSFQtdc1AS8Ce3bfzs6X0gvMrL4JDaX3vrYahSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by SA2PR11MB5115.namprd11.prod.outlook.com (2603:10b6:806:118::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.9; Sat, 9 Mar
 2024 07:01:19 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::2d59:ea91:ba77:8784]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::2d59:ea91:ba77:8784%5]) with mapi id 15.20.7362.019; Sat, 9 Mar 2024
 07:01:19 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v2] drm/xe: Invalidate userptr VMA on page pin fault
Thread-Topic: [PATCH v2] drm/xe: Invalidate userptr VMA on page pin fault
Thread-Index: AQHacaJvm/EvBp2EaEm6OQaisQnA9rEu+42Q
Date: Sat, 9 Mar 2024 07:01:19 +0000
Message-ID: <BL3PR11MB6362DC5DEB7A22950F7AC5289A262@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20240308214911.601044-1-matthew.brost@intel.com>
In-Reply-To: <20240308214911.601044-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|SA2PR11MB5115:EE_
x-ms-office365-filtering-correlation-id: 42152a79-3a2a-46cf-2441-08dc4006b8a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i2YELhB1bONQrVk7zp1yhGMG67K1zV/uhaJyb/MDJxtdI9hTDsS6USSihGfYCHR5s4/e/BL4tgfcvXTaUX5C8n6QbmZ3br0XiRHmkMHDG9N9MfAx5D6INwfkb6GruaTAFjd+7wV+jLyaZc7iWc+EqYiC84bOUxM1tznGVg3vyY2urdeql6nuIVhGoXQdHMmZn/xVFg4ltqVCig16GFahx2qaZ2Xm3YZ3cTew6azsxAXFHcAfHcRab8W5AQkXhxxbDMTO4ZMNKwUNk96ScHje/AC7U16ycKbhYXYPdkyTxHFM9il7GMFatCAu0ozX0sKB18Nq9JG5PS9XYXy3QAc1th7+jFMa9CaYC6LurSAd8x7eV2ZufcH49mo1PMfFAgKNLgz41WMdi2zEV8dVJ7u8NcXgFDrl+BqqwfPZBZtaIVBh73pKvK9ar1fYOZPoulFk0Z4yzc65srKMc/wdzJcaQNKS/gjKIv8xb0H+80W1MDiS+n8dnwKR0nMMSywwtlLSvxWUxF5H/n7c4TiC9RjdoFVb/SRm0ZDLcUNGH/wIsrO5eqws1kZ8llTNfEe+15Xvujz6B8V3ZzMv7z4lbqNJwDkQpJ6OKGseR+MOJDRWLagIIaNO9Mb8vF43qbAxV/JGBfEZIN1Yd2YqnvxSdyppETVa7TrpyKzL6B3lbWQJLSLfTfajWp2NhXNXR9Ve1QTXkaBGEYPoPvPTdtr1dAhn2ShbQSwzgxBXYa5oYPLxU/M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VvNU51hrrxZfjWkbcO9uPt/CO3feOr/TpTXeM2Ylo0517HWTUpzwkOQXMOSU?=
 =?us-ascii?Q?d2BLsxupvIvYuGIEz1GwvkEO2idcA/xmXXHjZtnq6n2dVU7qlM+ccaaODBta?=
 =?us-ascii?Q?Re9prt/oTQzeuCeH+TaEezZeyf5Fxzd3FPrBCWTzJl71bUmCtiCaCu8uW+xb?=
 =?us-ascii?Q?168RmALprX2KlXcgDafXiEpzVfWUBoQGY2V5UuUoaAUVElccRZXB97ut3kU9?=
 =?us-ascii?Q?QySLA93KgVu0EgnWa+iRshwLpFnHYAAiM/yFowj47t8ZTm8Gxyeo0BqzraIq?=
 =?us-ascii?Q?e+Kb2TziSKgkvEb+aI3piw6vUlRqYwlAKZuWtpru4k1bGmjl/AcHHVvodVzx?=
 =?us-ascii?Q?v4MXUyQ2tKyO1VA+AQAmacLLKRmdOKbVpyTMr1WuhpdZbgd/StmuNMnCTSP6?=
 =?us-ascii?Q?mzEsVSiXF1fVLXemxfBrXHhVjL5xHzrA8L0RDksYStC3jniIFZJLbKYPURIP?=
 =?us-ascii?Q?iG4aXfL3sFRa1a2I3RDyLi6RayHfHDMsJaezBYVep59s1M0gDjsMsUrmtUYR?=
 =?us-ascii?Q?i/UC81aXgJ7UmRCW4EvgvBR8L77/AhAN1oIka+dmhCiHyRKsybdKFVLy09Hk?=
 =?us-ascii?Q?GoHZRhB541O2sSHqfsB2qE22uWpGhP2qxO+5vjXsc6PtXYcFelBnhsnVwT36?=
 =?us-ascii?Q?IuKh5E4HMKda4Njf6oD/FRF5nPBGGdI82LRggHFww8ohXZ+EfMNxTqDeMNVW?=
 =?us-ascii?Q?29l+xfQg8mG1pWO+Hfyw6O1bY2qzM6mQgXGyQ3d/tDyzkb5JxhmVeuEo2+yc?=
 =?us-ascii?Q?mSJIg4CPq9YBiEP2jrmulbFCyTRYOw8StBFr8Q6jRlJeGpRQyL4DFSbiwlOr?=
 =?us-ascii?Q?+viq4pDnftswmnWiwzt/Y/hzuTl8/4e5MRHM/uT1TX/cECIrwA0MrZocS//i?=
 =?us-ascii?Q?HEVhD+doir/DVYe+dP1Jv0NvITyuv8AezYBHwmNrznNEgIxuxIy9aZJXOAyn?=
 =?us-ascii?Q?sVzHwHa5eEGUbbqavsgKlDWdvNbjkFPF3Qs7zRTcWMclwlJSFKvYWgG7BQES?=
 =?us-ascii?Q?C60LY/MkEyx2NV4/F+HnvKLSPXr0OI2FBNJbli4Vb7yhDKGZySabtY15cXIU?=
 =?us-ascii?Q?fieIh4wqMjBMuOeKqIWGuJ1l36pTNeZT9OG4pC6xf9KCnfktvPzmG2usHqeQ?=
 =?us-ascii?Q?guAmK0rcTfOe2cp8wk6qeMjh7YKhY1YGhgI3HI/rZ/6JUNW2TcF9TSp/VtCN?=
 =?us-ascii?Q?ANNpw91Nxr/w9Phl6YIKVlq028+lMjDw6drFd8ewav4KIZkxAM/LliVue1EY?=
 =?us-ascii?Q?abm05ao2If48BNJuU01w95crX+nSY+rY9tOrnk80I6c4mcoTvszISM5wJs0z?=
 =?us-ascii?Q?CpfQqEEeiXPXzZ1s94GEJjguIZSfWAb4b6Y/qvTiPmsLjp1vReHJBfiEDVmi?=
 =?us-ascii?Q?Q7MiulXNxcoWYq9tSzSjr7ArMbd3xNNYSmeiVBHQD9fL1VzsACZk+iVjabE4?=
 =?us-ascii?Q?D7ZA38N0GJPJRsFj/DCKW1J2bQQs7M/a5hj9ZSAuK+wJhrt2d8vIJbgY2RRd?=
 =?us-ascii?Q?14Yl1UFwTNSrTJ3KQSWZ37nlNEbxJJeHzHlg7OcyaG4ZWxaEgPwurR+kUHzs?=
 =?us-ascii?Q?XpagioaH78cNqmJ7/Go=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42152a79-3a2a-46cf-2441-08dc4006b8a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2024 07:01:19.0857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pt1OByZFbJ087C8AesXcK/p1GEd/9VDAGbJXnLzA+d64D6e6vbV/D0dEwe5ebk7uq1uXsunszovWRIVUe+PRLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5115
X-OriginatorOrg: intel.com
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

Snip

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x 643b3701a738..fff7be376bc4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -724,11 +724,18 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>       list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
>                                userptr.repin_link) {
>               err =3D xe_vma_userptr_pin_pages(uvma);
> -             if (err < 0)
> -                     return err;
> -
>               list_del_init(&uvma->userptr.repin_link);
> -             list_move_tail(&uvma->vma.combined_links.rebind, &vm->rebin=
d_list);
> +             if (err =3D=3D -EFAULT) {

why checking for EFAULT only?

> +                     err =3D xe_vm_invalidate_vma(&uvma->vma);
> +                     if (err)
> +                             return err;
> +             } else {
> +                     if (err < 0)
> +                             return err;

For errors other than EFAULT, we would return without invalidating the vma?

> +
> +                     list_move_tail(&uvma->vma.combined_links.rebind,
> +                                    &vm->rebind_list);
> +             }
>       }
>
>       return 0;

-Fei
