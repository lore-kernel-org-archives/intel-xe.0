Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549D6EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 14:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA3110E627;
	Fri, 16 Jun 2023 14:01:33 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F8510E627
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 14:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686924090; x=1718460090;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pQsPslOMgMdJTZVF6UU9sP+r9so5MnQCSMzvtJlsQTM=;
 b=SD4DvDPGXwIaOpDKIa7/1N3Exk0IVDWJ8CUljLVmiRYA+YHxCIifJv31
 ZSfp0c7d5EkfaLWjUAt5z2n8UbPUH2dgFbpVuEjZly1ND2eR7T/vR9+xX
 k34Cutxeb3vTSO4gbHOwqTkKalnqpxrq7fndxAdiDWNoiLYG2VabRAGbO
 degHQyOAk4dkalH77PwkV4jV8qCUQzRqDCgSGIpbRyjzOOVuotpIkA/A0
 EP3FsU8NXfu2+akL1TW0fTMLEuNRhgroj3Qt47aPlWGZSYnk+DjtXjCoj
 ZLlo/drikbWGihseXWpgcowpVThA55IvxWK61FlLmX2X9dZe63JW5RUiB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="361750012"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="361750012"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 07:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="887119690"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="887119690"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 16 Jun 2023 07:01:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 07:01:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 07:01:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 07:01:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 07:01:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdvZhDbzCuku2441KkxykK6votus5nKGsPPWb927qoBnt0NwEVhLhMfKexkAPPBQhbKhjFeHqFHY7kNuyCa8C98xMVmnXeEeRtUHeA1fQuWQO5nfjdtSJEYmgG208QZXqgWsiSKOBbktnOoB7C0DY+wMZii5QMCxToaOmoCyxR+781OzPDfctQfIWUopI55OLdvbxhB3I2HyDlpOgTFGSwmsF87W38gBNuh81nDe2O15dagPnDxg+fJOy17LWINg0Ri2O1SqZI4UM3O6qcpFXzHWtYKC6GKFwh7PsOPKeeRQIFVjUA0lAYs5VV1pncDQbgdZ72BhFaVRW76pU4WN3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23DGqYMVhLa7Oz0/eO9RZCFOoSdSEBVt35Tu+8j+EYI=;
 b=F9cqmt65SMnRNkxvEZ17JwDB15kC2oYHucspOOtS6AFCOaGwt07Bz54qQhcLDSdzt7lNuHnodB6oSK2dBXXnurzZaOZl3S7pgepe06IM5kaeo4ufDI7noR3UjzuNLh0OkPlcHVyXc1ob3Wj3g4kg9GaMxPEuYVOjvJH2E2wsrzmuMP0YJnjrYgtiN0uiv9ja1rZALlAveJdbk1eG4CGvQ97pLIVD0kfwyxuvWnEsWsdUnaVETcdk2+m08/Pt9tS775BUWVs0Chy3axF3BKlliPx3wnolZxznRHPgrJpXhaPAomk5sA5RuSLKsvunthkKYKlCM/9blOn3BYEGqafGXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CY5PR11MB6511.namprd11.prod.outlook.com (2603:10b6:930:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 14:01:23 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 14:01:23 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH V3 0/3] drm/xe: Add sysfs entry for tile and relate it to
 GTs
Thread-Index: AQHZmdx4qEKtMLuV9k6Dq7tFd4fPoq+NgirQ
Date: Fri, 16 Jun 2023 14:01:23 +0000
Message-ID: <SJ1PR11MB620455C3E93FC19529EE2DC08158A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230608074544.2186318-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230608074544.2186318-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CY5PR11MB6511:EE_
x-ms-office365-filtering-correlation-id: c06a03c7-0583-4266-8ac6-08db6e722b69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FYH37rh7S8NI79AhQe+HR5w8t2+i5yivU9IAwCq+6T2CorhG6OlVpVFJTniKqWb+pxPSXpKXMrYoR68S+6zmWLChRaXtUPn5L6+BQIq2iLXEyWnkS5aQcTYIsj5UfxeI72kqZ0eybnwpsmntVVJWOKIYDWtuQxnCUTyDqSAZcxvvYkfrTxrPUwxRNsX1NNX2CaF1bMeQ9PDG3sMqcye4knwnkXjpDHMj5K17zZYfCyojoynrlSnmaM+NcehdomN0oivpj5+C1vXNGaLeKYZR2YMRmFJ9WbFvPmh+AtljkP2tlXmNWRJiC50w3cC1ZxCyk0VJ1+FpFPru+BdFCHXuOtppQb0eJ93aWfUALAyDOSVgEr/o8PN4KNM/s3SdiysdoQ0gUnKEcltcGwJFwOsE7VjK+z6Zh2LdBNKGPZxv7n1z3mrC9KaCZTNmyxX9+y8kJvaf0DmuF8OptldnF0E1PIqBPSo2FWi8N/gxUP7rvlNtMVyljT7V4EKJp7l+3shHJ88nPdHdVRLw4SfZdlsq0+704TAWntrUF6F+aozJCRzT3QfxqeOdr/gOVQTkp3i9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(136003)(346002)(39860400002)(451199021)(107886003)(186003)(71200400001)(6506007)(55016003)(478600001)(53546011)(9686003)(38070700005)(86362001)(7696005)(966005)(6916009)(4326008)(66556008)(122000001)(66476007)(66446008)(76116006)(66946007)(33656002)(64756008)(316002)(52536014)(2906002)(8676002)(8936002)(5660300002)(82960400001)(38100700002)(41300700001)(54906003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xO6cXmhRQLG/0G5Uq8kuqG3E4UQRs7A7NnphvDPY8No7OVnYCTDIPdKGhiD7?=
 =?us-ascii?Q?u4eNdDghY7AM+SYryGaEDIBikSfgE6ZgHgPI4jCdX3qj1euGUZmhz8xka8Yz?=
 =?us-ascii?Q?/Hf1mHglAICMHpKjXYtA5p3nBHvfWfmNF8jrppr5ce1DpIvWCw+kbV99xXvD?=
 =?us-ascii?Q?1bcvMtxafohMNy9dFXEucy8h27YqlSfsrpQDNPLcQjpyIZcgUL/KuBRj52nf?=
 =?us-ascii?Q?SPFJln7B4ZFpDM0lVt8A2Zi3qEvDkZlDAtSILkNVE89saHaxHjpTvgMFRoWg?=
 =?us-ascii?Q?tia8faDKDHRvd4T/Mvsi/zx9UDyNu5baiqhf9i1ouBcT8vUI6QludxXD4mGc?=
 =?us-ascii?Q?ASMQFAufZ03+GjpM75/BYEj3hTo4VDrFFRrcRbJzP7YHtedue6FQVNXWDosQ?=
 =?us-ascii?Q?ivnHoIQ88RcryVKs/1vi40SpzT2aeScP04XC6vbnxfDeBT0j2gyueL0GgJvv?=
 =?us-ascii?Q?G75GyL9EZAIIqpgpvqzHnKzMPvldpkTbu+KADe/RE7+c7ngmjtogXGGFwYr7?=
 =?us-ascii?Q?iHAYX07azRtd25cLnc4CnIUKtMPhMgidyOdRZT6FwW6/SX5TlSrK2X3EiN/z?=
 =?us-ascii?Q?oDyM+QPXNDaXrNffOH3bSl5Qjc/5ffv5av7wQAhH3RKopawiVYRctDDvrfe8?=
 =?us-ascii?Q?IsbxNN23g0vToIAMdJr8maz3EDq1wUA6UeyZXEHAWTppBFDJ2+9uPDamD9r2?=
 =?us-ascii?Q?cfQ3cmPRMdlfv/oVGUvjekphahYax4Y8Oak/8D+VLjwpviwA68EaxhItA2uX?=
 =?us-ascii?Q?ormVy4ueWZVwyjewjphmz0K8Bkkslsvgy+YmrbUiF1x4RstwRGG1WLRaloaR?=
 =?us-ascii?Q?JD3JhPCXAXi0Q1JErAaFb4NkN6BGu+HJ2pVYAg2ZrVL+AArsD6nlmfs6+pcL?=
 =?us-ascii?Q?RfhGQVUEKEMDxJtIjTn43AXltVhJMZGXQ8H9pRTtzOPJAV3sOKKG06ScPujW?=
 =?us-ascii?Q?bV4Dn/XE/lVB+iIRbMUSRM08C5E+c3DsAAcMciG9v0CeAiX6uYjdk3D9akUM?=
 =?us-ascii?Q?Ta7YqUXBghZjwyXAn+QNTuiXGOogwQzrTpyPxPXmTgdbvlajnWquw4aPnJ60?=
 =?us-ascii?Q?kkybB8dqf7eBE5cNrdO8S9cQz9fzrLVyXM1vxdxN2OYLewoOYVSK3Zqpr4XS?=
 =?us-ascii?Q?clMG6wg9rtaPnzXRflA/LYVHWJ6rBBwSISrgvObAz367YJrjn+RFwxdTHCGz?=
 =?us-ascii?Q?D5wzg9T2Zv2mms0pxotoG6cfxKuLebSXB1VG5UH8rT4BVRZ78UNoeTKpQGsM?=
 =?us-ascii?Q?0Lf+UDJZ0bHkEvbtd6zE34T2c1nMqahClukeQlz4vq6RyWMN0qVrdV0vKcdi?=
 =?us-ascii?Q?Xy6VmjkkCB0NFulqAKGS8iU7RIi0EVp7EcwCggOLehNhbekNWY+AYrXU9wkI?=
 =?us-ascii?Q?BG7Bm2T8gC3KK7l+5aOYKrFl0ijLHTwnt4dSDQECRK9zEiQYp8myMY288Zj2?=
 =?us-ascii?Q?7WdNtpzQtjmfNDIRZ8YjqVfYUJaCQ5SF349Ck7DKEZLneiL3ZitUt3pFlwKb?=
 =?us-ascii?Q?imfOZ5mAJjpd3gjpGqks0WN2ktjp4GUwLN+KbIREuORZaSxI6Cxiat/dw59H?=
 =?us-ascii?Q?MVoKBSUqGbjKZXj2ei0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c06a03c7-0583-4266-8ac6-08db6e722b69
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 14:01:23.6705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lgLMPp7DAlQ8OlJGax5dt43cg4nW5M8hT497SILYQXwZRKac4t/Uuk9bj41ZH3eOCSVKHGZvCKjrLBiKT6fxCf4nkejgHcBFZhku0BEGbIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6511
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 0/3] drm/xe: Add sysfs entry for tile and
 relate it to GTs
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

IGT testcase for this series is at https://patchwork.freedesktop.org/series=
/119278/ .

Thanks,
Tejas

> -----Original Message-----
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Thursday, June 8, 2023 1:16 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Ghimiray; Ghimiray, Himal
> Prasad <himal.prasad.ghimiray@intel.com>; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>
> Subject: [PATCH V3 0/3] drm/xe: Add sysfs entry for tile and relate it to=
 GTs
>=20
> With the separation of xe_tile and xe_gt, We now consider a PCI device
> (xe_device) to contain one or more tiles (struct xe_tile).
> Each tile will contain one or two GTs (struct xe_gt).
>=20
> Sysfs entries also needs to be aligned as follows:
>=20
> drm/xe: Add sysfs entry per tile - Adds tile sysfs infrastructure
> drm/xe: Add GTs under respective tile sysfs - Relates GTs to each tile sy=
sfs
> drm/xe: Add sysfs entry to report per tile memory size - Reports actual
> physical memory per respective tile
>=20
> Sysfs entries will be as follows:
> cat /sys/class/drm/card1/device/tileN/addr_range
>=20
> V3 :
>    - Make tile_sysfs_init return void and warn for errors
>    - Exclude DG1 as it does not have TILE_ADDR_RANGE reg
>    - Use sysfs_create_files -> sysfs_create_file
> V2 :
>    - Address review comments
>=20
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>=20
> Tejas Upadhyay (3):
>   drm/xe: Add sysfs entry for tile
>   drm/xe: Add GTs under respective tile sysfs
>   drm/xe: Add sysfs entry to report per tile memory size
>=20
>  drivers/gpu/drm/xe/Makefile              |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h     |  9 +++
>  drivers/gpu/drm/xe/xe_gt_sysfs.c         |  4 +-
>  drivers/gpu/drm/xe/xe_mmio.c             |  1 +
>  drivers/gpu/drm/xe/xe_tile.c             |  3 +
>  drivers/gpu/drm/xe/xe_tile.h             |  2 +
>  drivers/gpu/drm/xe/xe_tile_sysfs.c       | 78 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile_sysfs.h       | 19 ++++++
>  drivers/gpu/drm/xe/xe_tile_sysfs_types.h | 27 ++++++++
>  9 files changed, 142 insertions(+), 2 deletions(-)  create mode 100644
> drivers/gpu/drm/xe/xe_tile_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs_types.h
>=20
> --
> 2.25.1

