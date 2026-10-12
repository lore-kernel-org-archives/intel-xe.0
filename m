Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1034CCA9ED2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 20:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D0A10E6B3;
	Mon, 12 Oct 2026 20:46:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6273710E6B3
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 20:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791837988; x=1823373988;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BgfOviXlO/rk2BIKIHzv7LOz3uDIx41FOZUc8IkW//M=;
 b=jZtiUpclYTiyOHi1C0u5nyBModKpZefyVK5SXSwyi7njJGvQeLCzhbiD
 stsNv5uWVGWvX/rYDCn+/fYDTBBVQwu2wY37ZxRNVm5evKWzgODR4TL90
 MIdnuP9g1Y3s9fP19vgFaEla7yuxn4PLyZxibMqihvxLp8mplPA5UI5Ci
 yr1QOGz5+lWoysSz3o7jXjc2wFyu34OGfuvkTb9iT2JlkZixn2eBusrV7
 XXBOWza2VArMS9YYjiByD+BVFUIJ+OGO9UcExaBWeLdgenbGX06luNf/O
 o8/MCLoecvTfmPVagYQAyos8ly4dNAHm4DnUBIFR4pefymxcOSPdaM0dc g==;
X-CSE-ConnectionGUID: wDleVE00Qq6X+nwc3VvymQ==
X-CSE-MsgGUID: KXpOvKNxQOm8g/AU5Tm2Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="432008"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="432008"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 13:46:23 -0700
X-CSE-ConnectionGUID: bl6IdnH9RhC6VFJuyazV6A==
X-CSE-MsgGUID: ZTn7/XErQ5+8x+yrtATMFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1178553"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 13:46:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 13:46:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 13:46:22 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.34)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 13:46:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnDP0dGhHRZ0XVPlMlXqJz7Amfy/ChCU5hrd7ixnYSTNarvAEyUY0GiwaFGzrXlOYHelcSweCWU3QfH4Ik67CLAg1RC+DkDZaIu8JLvseXxYOwc+LJimhiBPH8VwtDJIIINau9ixwS0SmRJgwLTsdGLqfVPhnwFNwo/UGIqd8epzxhuDiMJ8QGKugNJMTCav+0QlOuEtCk6LzaxZFlmsxHDmPPTn46ox+AFP55eNSz8rgSOXrJs0YwUOanHi7Bt6CfmtgfqFFfwTtqPWykKB+H+O6pUdUkenDHjakmgAzO2YTn5Zi+1oBD5sSoYOey6AkfzAkC9k9b+d2QrQYBfkmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byFwI7E+9mTauhlKH2442JU/i9yMfYgwRia4i4UERUE=;
 b=trNwH916YEvNJjgy7G6qKCYoIRKrpe9hYa0AxA9CX12NW8Pcl9fM5kv0ird3t5uNzCbSExmET/Yfk+1olbhlbPiZk5tjbmYgwurqL7ee4Mi5zNMytNtF8hxpdYW3O/6PO7JfjhMK3hSRSIQ4j5qirBLo5GuHmsztS40bNl/ughOJtsdHwZIiECt4pJUscL4ktgV2YeWLnPW5GkjpEeFKE1Ntv/Qr+sFzHqsXlNSwqkholSoYqqyU8/6qfzOaOkGYUqhnArrpLWJGlPxGUXYijouRpHWzvQil5Ga7z6B470Vw0N+oFkgjzY3zRsEEnKebrj+1s1wxXzbFfdmCeT1DVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11)
 by SA1PR11MB8476.namprd11.prod.outlook.com (2603:10b6:806:3af::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 20:46:10 +0000
Received: from PH0PR11MB4792.namprd11.prod.outlook.com
 ([fe80::fec9:8db4:c768:8289]) by PH0PR11MB4792.namprd11.prod.outlook.com
 ([fe80::fec9:8db4:c768:8289%6]) with mapi id 15.21.0472.016; Mon, 12 Oct 2026
 20:46:10 +0000
Date: Mon, 12 Oct 2026 13:46:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <mallesh.koujalagi@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 4/5] drm/xe: Introduce xe_wedge
Message-ID: <as1HD8wmt7o+FivQ@gsse-cloud1.jf.intel.com>
References: <20261010090718.68308-1-raag.jadav@intel.com>
 <20261010090718.68308-5-raag.jadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261010090718.68308-5-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::12) To PH0PR11MB4792.namprd11.prod.outlook.com
 (2603:10b6:510:32::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4792:EE_|SA1PR11MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: 016d8673-b34b-4bfd-761d-08df28a1d89d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|260925022911599003|260925021911599003|260925021311599003|10067099003|13003099007|3023799007|261009220027099003|261009223327099003|261009223027099003|261009221727099003|261009221227099003|4143699003|11063799006|6133799003|18092099006|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: TMCozZmblpB8fHIrpKu8RpMjmsDRWkc+fz1OsgmgrDmQvQn2bwmrbWZdS+YNHOTCHf5rlrpljn5E4ATslYpudwQClK7y4IdgA8eQ2E4SpF1UNTOaC+Ydrd98tZCyw/gYru4KHahUxGUhs/36zF8DBBGtrocvr0a7A1nB327EM/SJf0+EZ5e0aQu7gdKd98EXEfE1QJOJ7hDfO7WjkTFDFEgchrPNhTmEh29xodk2VnVl6QVF8iFajCvkhCYYkt6uGUQ4A+TdfTgZFqOCFJjc+EG/4GkqtmaULGNoC2VcQgppBMonxWMH8PW7OwlTHDAkv4Zep5QubgbJ5OrC3oNTbcK+dLVZGJ4VPHAkn0w1gLbeoVnsXQ8F3LTZEnQa7hkc/i2qjf7FEm0kqnTBgTaVFQi0CBmuHP6fp147AFBeQ2/5zDWA9FjQI1/vJ7O52b02DsxcMktlQeYz5VNMpEpXfBRBhrluir6K3T9R2bHjj0w5c0PbMnlwpi1NYnY0VRvPEHM/PNywt0tXUekQpghAVtPvqGPwJTIwmlMzbJko+vbX2CpJc5vyCp6m0GTQn+8kiYOk2Z4QjVSwfB3/SKidA+O5xncsr+MrkoIK5ZcWnRurspzyQiE/kBF14iESsZGK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(13003099007)(3023799007)(261009220027099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003)(4143699003)(11063799006)(6133799003)(18092099006)(18002099003)(56012099006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ELB2eC6qAvzWWS5swjlNcyF+AOmw9Tcq0tbfkE+ntEA4LkjpENQ+hnHDkd?=
 =?iso-8859-1?Q?tsVdUM4DpRplpPR/VeuFW0pp6oQdp/Pr8eoVGut3NFR+wmv40dys8+yO9Z?=
 =?iso-8859-1?Q?HQCl6lObK5wPyLeKHoRFYyIkJWkxyD1LmF78cWGNTYLWMzZEl2PqzkFjTN?=
 =?iso-8859-1?Q?C5hM5XQJ+0C0AK3AHstfDUaVeenfH/NJrJBw2VbLSFkTiwc9xTRsd6iW6i?=
 =?iso-8859-1?Q?9ynhWHiECV79AEMVALnLJ1G8EfMAzTmc6007Yup12azJOT6o//ds7Wa14U?=
 =?iso-8859-1?Q?OOdo3mEhT3Wz8591se5gtyzk5Xco9/VYg2uXIAhKIBC7kS2r3hsXx4fMM3?=
 =?iso-8859-1?Q?tiPshHEPt/y0Nf9yb+lDMlPKwhloIsIeGZeXNp2IDmhxiTzigrc4BS1pMg?=
 =?iso-8859-1?Q?piVADm3qwBJVwJMeHkBavHxlaDE8w0CQUl4GAkjSKemTCME3e0Z+QBEYQL?=
 =?iso-8859-1?Q?Xw5+PjV1zx4I9o6T41HBPtyIgWrqZTrY5j/oFqaarpDSq4RnUWgLKpXpmC?=
 =?iso-8859-1?Q?t8leNIivAICRURUyP+BnBKn58iogP7VNgZcYAmwgNrYJuZnKGrPDVe8XT1?=
 =?iso-8859-1?Q?N3hRGyaTWYgBjQ5sNEHfqlMt9Batorb+rOeIZNeCVjILkNqkERQStNqmhv?=
 =?iso-8859-1?Q?QKLToBdaYq/IUqMtVl1X235DTfDOp7ucgtcVSxzj0O2FaYFYinn22TAQxb?=
 =?iso-8859-1?Q?RXs3wgMMJtrtUz5KilPLZomcRE6zrJLEtNDyoVcYdoiBcxNQ99Ieo0FMTc?=
 =?iso-8859-1?Q?/e4XqnYZaiuD3sKbFyej6/b+D2MBiy/NGMA3qTcansNicZ2OQvTdbW4n9l?=
 =?iso-8859-1?Q?1ejX1bWIDlRh/sPQ2IbI2zlFNMS0RPbhdkNtjYsXBa/Hu+PCorpAlCDhi0?=
 =?iso-8859-1?Q?mzsoUxaD95D57o2kITvHBr/tf0Y5FLsP3REg2RYHHAMEKnQn8r6Kgl+Wlc?=
 =?iso-8859-1?Q?kC9gBXyKP/pOuHYrUucjcm38S3AX5lIavz76Iv0hmQN9C/HYiP3s62Odeb?=
 =?iso-8859-1?Q?PaKBBYQ12VpHEEEXVMDHLebOGs4PpJkj6E95EeuocyrjY1EEgAlhm5nGAw?=
 =?iso-8859-1?Q?+X+O3IxWdy1vAD1xd86XNTRhxhvaQ6MAuY1rQdGv/nW/OtpFwhsEwLRPW0?=
 =?iso-8859-1?Q?JTtDlqkZKEQirUd/0EEPfXH9K+ksIalHIz530SmTD4rdv96IFbe5fUkBcQ?=
 =?iso-8859-1?Q?T9pg5hohHD2RFSKc6IYydEyYuBjmHFTeqJzqrpzYjmgUHs3I9LUV8W4v1I?=
 =?iso-8859-1?Q?dXKH3ew6Nn0xggfEDZGZk0jYeOs0obrBXWGgSvUv3/Xyct9n0SXhxliAtQ?=
 =?iso-8859-1?Q?zus+OKFx6vpbmw/vKj98aqDXmHvQC4B4AxQR6yXNknkd3hPDCBA3BDlTl5?=
 =?iso-8859-1?Q?iEOZ/o5ikQHL3U1EivF2GHTJ9qsbc/NaiXMtU7Am8lue+IZbDPlSVucA73?=
 =?iso-8859-1?Q?h0ndbfnWMZoIE6DjzvcEbsn4cI8spiU1MfrklzwCpomw40X8EiJNGmZF59?=
 =?iso-8859-1?Q?Q2WGATdj58rXvqh9JJyk3bUyWyQJU8negMa4jVB5beFfNkcqaLHm9Omg4R?=
 =?iso-8859-1?Q?TgJN2Gzr6IUxM2lbTdmqONDLAQqXHQWoT1XXGyTlc+5j1irk2TNCvOVSNK?=
 =?iso-8859-1?Q?RBF/5dIKO8dFWkZ7ZvFEKv2mRLf/MlroVFggMi84yFJUOT+InhUyYTHlQO?=
 =?iso-8859-1?Q?HiAEeEqmFx3yUASOGcwU9Z02PRmsLIWkFmZyaaM0AfgmWarX6D3452L53A?=
 =?iso-8859-1?Q?yDR5Q4OrzDhN7t+1JD7mwLrEgo4dIVYVdA5+PCLqBTNq5z3rVz42xOasHb?=
 =?iso-8859-1?Q?dxwPZtjXqQSgLkhMgHH0mGVAjkWPVBg=3D?=
X-Exchange-RoutingPolicyChecked: VS9CBIII+hdnI5N3/4LxHw9cCyVBm2DIZvh6oJzkOz+4VuTO3yqANlwJLV5AuUeehutySRVpb0HfRxg9L5daI+uiyBnANKOArYxL+lht7VMyj+xtM9vWN9jDvRUrhZus99QVYvnsmUeD38NIwZKGSKKWPnq1HItrN7J+Xt8zSjxnK3/kAwcAjZ8u7aU3mD7+AL9BP/o6RKgRIij2sxpmGp5PBhJ+8i1MBMtAB+alfesdKqOAOItg3zGopuWVaq04rGQeamrUBjq/HdBXxZsB1fwLQnLPEsf/eohVs9GruKhWj2ZZAu3GSKHhhmUZiWYCzsoc8v4IjuVayg/39ytvWg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 016d8673-b34b-4bfd-761d-08df28a1d89d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 20:46:10.0422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMRa3vz2Mm3sX7vrtdOy/mjbSkE1vDfYDb3kpRT9Q1OVfJgkl15UjgPl6VsU6JXBKmlCWNiGms1hRy8B+ctvRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8476
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

On Sat, Oct 10, 2026 at 02:36:21PM +0530, Raag Jadav wrote:
> Consolidate wedging implementation into a dedicated xe_wedge component
> for better maintainability. While at it, rename all wedge helpers
> to match with component name.
> 
> No functional impact.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Acked-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v2: Also move struct xe_wedge and wedged_mode debt to xe_wedge (Lukasz, Michal)
>     Naming and aesthetic adjustments (Lukasz, Michal)
> v3: Respect the component namespace (Rodrigo)
>     Avoid chaining header includes (Rodrigo)
>     Squash debugfs changes with xe_wedge patch (Lukasz)
> v4: Include xe_sriov.h (Rodrigo)
> ---
>  Documentation/gpu/xe/xe_device.rst          |   2 +-
>  drivers/gpu/drm/xe/Makefile                 |   1 +
>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.c |   3 +-
>  drivers/gpu/drm/xe/xe_amc.c                 |   3 +-
>  drivers/gpu/drm/xe/xe_bo.c                  |   3 +-
>  drivers/gpu/drm/xe/xe_debugfs.c             |  66 +----
>  drivers/gpu/drm/xe/xe_device.c              | 194 +------------
>  drivers/gpu/drm/xe/xe_device.h              |  10 -
>  drivers/gpu/drm/xe/xe_device_types.h        |  30 +-
>  drivers/gpu/drm/xe/xe_gsc.c                 |   3 +-
>  drivers/gpu/drm/xe/xe_gt.c                  |  11 +-
>  drivers/gpu/drm/xe/xe_gt.h                  |   2 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |   3 +-
>  drivers/gpu/drm/xe/xe_guc.c                 |   4 +-
>  drivers/gpu/drm/xe/xe_guc.h                 |   2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c              |   7 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c              |  11 +-
>  drivers/gpu/drm/xe/xe_guc_rc.c              |   5 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c          |  13 +-
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c       |   3 +-
>  drivers/gpu/drm/xe/xe_mert.c                |   5 +-
>  drivers/gpu/drm/xe/xe_pci_error.c           |   9 +-
>  drivers/gpu/drm/xe/xe_ras.c                 |   5 +-
>  drivers/gpu/drm/xe/xe_sriov_pf.c            |   3 +-
>  drivers/gpu/drm/xe/xe_survivability_mode.c  |   5 +-
>  drivers/gpu/drm/xe/xe_uc.c                  |   6 +-
>  drivers/gpu/drm/xe/xe_uc.h                  |   2 +-
>  drivers/gpu/drm/xe/xe_wedge.c               | 287 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wedge.h               |  20 ++
>  drivers/gpu/drm/xe/xe_wedge_types.h         |  45 +++
>  30 files changed, 426 insertions(+), 337 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_wedge.c
>  create mode 100644 drivers/gpu/drm/xe/xe_wedge.h
>  create mode 100644 drivers/gpu/drm/xe/xe_wedge_types.h
> 
> diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
> index d3a022362ade..8baed81580c9 100644
> --- a/Documentation/gpu/xe/xe_device.rst
> +++ b/Documentation/gpu/xe/xe_device.rst
> @@ -6,7 +6,7 @@
>  Xe Device Wedging
>  ==================
>  
> -.. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_wedge.c
>     :doc: Xe Device Wedging
>  
>  ====================
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 011f7ef54086..bc203940f114 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -154,6 +154,7 @@ xe-y += xe_bb.o \
>  	xe_vsec.o \
>  	xe_wa.o \
>  	xe_wait_user_fence.o \
> +	xe_wedge.o \
>  	xe_wopcm.o
>  
>  xe-$(CONFIG_I2C)	+= xe_i2c.o \
> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> index 27740b40c8ae..57ea88cce92d 100644
> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> @@ -15,6 +15,7 @@
>  #include "xe_device.h"
>  #include "xe_device_types.h"
>  #include "xe_pm.h"
> +#include "xe_wedge.h"
>  
>  /**
>   * xe_kunit_helper_alloc_xe_device - Allocate a &xe_device for a KUnit test.
> @@ -123,7 +124,7 @@ int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
>  	kunit_info(test, "running on %s device\n", xe->info.platform_name);
>  
> -	KUNIT_ASSERT_FALSE(test, xe_device_wedged(xe));
> +	KUNIT_ASSERT_FALSE(test, xe_wedged(xe));
>  	xe_pm_runtime_get(xe);
>  	KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test, put_xe_pm_runtime, xe));
>  
> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
> index 8ecadee6eea3..ca8013d7f569 100644
> --- a/drivers/gpu/drm/xe/xe_amc.c
> +++ b/drivers/gpu/drm/xe/xe_amc.c
> @@ -18,6 +18,7 @@
>  #include "xe_device.h"
>  #include "xe_i2c.h"
>  #include "xe_mmio.h"
> +#include "xe_wedge.h"
>  
>  /**
>   * DOC: Add-In Management Controller (AMC)
> @@ -160,7 +161,7 @@ static void xe_amc_work(struct work_struct *work)
>  	case AMC_ALERT_OOB_RESET:
>  	case AMC_ALERT_CATERR:
>  		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]);
> -		xe_device_declare_wedged(i2c_client_to_xe_device(client));
> +		xe_wedge_declare(i2c_client_to_xe_device(client));
>  		break;
>  	default:
>  		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index cc78283b702c..4749ea57527c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -41,6 +41,7 @@
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_vm.h"
>  #include "xe_vram_types.h"
> +#include "xe_wedge.h"
>  
>  const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
>  	[XE_PL_SYSTEM] = "system",
> @@ -2197,7 +2198,7 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
>  	int err = 0;
>  	int idx;
>  
> -	if (xe_device_wedged(xe) || !drm_dev_enter(&xe->drm, &idx))
> +	if (xe_wedged(xe) || !drm_dev_enter(&xe->drm, &idx))
>  		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>  
>  	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 926020c7526e..e59d4964d811 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -18,13 +18,12 @@
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_gt_debugfs.h"
> -#include "xe_gt_printk.h"
> -#include "xe_guc_ads.h"
>  #include "xe_hw_engine.h"
>  #include "xe_mmio.h"
>  #include "xe_pagefault.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
> +#include "xe_printk.h"
>  #include "xe_psmi.h"
>  #include "xe_pxp_debugfs.h"
>  #include "xe_sriov.h"
> @@ -36,6 +35,7 @@
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vsec.h"
>  #include "xe_wa.h"
> +#include "xe_wedge.h"
>  
>  #ifdef CONFIG_DRM_XE_DEBUG
>  #include "xe_bo_evict.h"
> @@ -424,58 +424,6 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
>  	return simple_read_from_buffer(ubuf, size, pos, buf, len);
>  }
>  
> -static int __wedged_mode_set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
> -{
> -	bool enable_engine_reset;
> -	int ret;
> -
> -	enable_engine_reset = (mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET);
> -	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
> -						       enable_engine_reset);
> -	if (ret)
> -		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
> -
> -	return ret;
> -}
> -
> -static int wedged_mode_set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
> -{
> -	struct xe_gt *gt;
> -	int ret;
> -	u8 id;
> -
> -	guard(xe_pm_runtime)(xe);
> -	for_each_gt(gt, xe, id) {
> -		ret = __wedged_mode_set_reset_policy(gt, mode);
> -		if (ret) {
> -			if (id > 0) {
> -				xe->wedged.inconsistent_reset = true;
> -				drm_err(&xe->drm, "Inconsistent reset policy state between GTs\n");
> -			}
> -			return ret;
> -		}
> -	}
> -
> -	xe->wedged.inconsistent_reset = false;
> -
> -	return 0;
> -}
> -
> -static bool wedged_mode_needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
> -{
> -	if (xe->wedged.inconsistent_reset)
> -		return true;
> -
> -	if (xe->wedged.mode == mode)
> -		return false;
> -
> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
> -	    mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> -		return true;
> -
> -	return false;
> -}
> -
>  static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  			       size_t size, loff_t *pos)
>  {
> @@ -487,18 +435,10 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_device_validate_wedged_mode(xe, wedged_mode);
> +	ret = xe_wedge_set_mode(xe, wedged_mode);
>  	if (ret)
>  		return ret;
>  
> -	if (wedged_mode_needs_policy_update(xe, wedged_mode)) {
> -		ret = wedged_mode_set_reset_policy(xe, wedged_mode);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	xe->wedged.mode = wedged_mode;
> -
>  	return size;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 2a7794aa71f9..e0466390219c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -81,6 +81,7 @@
>  #include "xe_vsec.h"
>  #include "xe_wait_user_fence.h"
>  #include "xe_wa.h"
> +#include "xe_wedge.h"
>  
>  #include <generated/xe_device_wa_oob.h>
>  #include <generated/xe_wa_oob.h>
> @@ -238,7 +239,7 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
>  	long ret;
>  
> -	if (xe_device_wedged(xe))
> +	if (xe_wedged(xe))
>  		return -ECANCELED;
>  
>  	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
> @@ -256,7 +257,7 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
>  	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
>  	long ret;
>  
> -	if (xe_device_wedged(xe))
> +	if (xe_wedged(xe))
>  		return -ECANCELED;
>  
>  	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
> @@ -697,16 +698,6 @@ static int xe_device_vram_alloc(struct xe_device *xe)
>  	return 0;
>  }
>  
> -static void wedged_work(struct work_struct *work);
> -static void xe_device_wedged_fini(struct drm_device *drm, void *arg);
> -
> -static int xe_device_wedged_init(struct xe_device *xe)
> -{
> -	INIT_WORK(&xe->wedged.work, wedged_work);
> -
> -	return drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> -}
> -
>  /**
>   * xe_device_probe_early: Device early probe
>   * @xe: xe device instance
> @@ -766,16 +757,11 @@ int xe_device_probe_early(struct xe_device *xe)
>  	 */
>  	assert_lmem_ready(xe);
>  
> -	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> -			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
> -	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
> -		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
> -
>  	err = xe_device_vram_alloc(xe);
>  	if (err)
>  		return err;
>  
> -	err = xe_device_wedged_init(xe);
> +	err = xe_wedge_init(xe);
>  	if (err)
>  		return err;
>  
> @@ -865,14 +851,6 @@ static void detect_preproduction_hw(struct xe_device *xe)
>  	}
>  }
>  
> -static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> -{
> -	struct xe_device *xe = arg;
> -
> -	if (atomic_read(&xe->wedged.flag))
> -		xe_pm_runtime_put(xe);
> -}
> -
>  #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>  static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
>  {
> @@ -1112,7 +1090,7 @@ int xe_device_probe(struct xe_device *xe)
>  	/*
>  	 * Process and log any errors detected by hardware. Possible results can
>  	 * include declaring the device as wedged, which must be done only after
> -	 * xe_device_wedged_fini() is registered.
> +	 * xe_wedge_fini() is registered.
>  	 */
>  	xe_ras_process_errors(xe);
>  
> @@ -1351,168 +1329,6 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>  	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
>  }
>  
> -/**
> - * DOC: Xe Device Wedging
> - *
> - * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> - * When device is in wedged state, every IOCTL will be blocked and GT cannot
> - * be used. The conditions under which the driver declares the device wedged
> - * depend on the wedged mode configuration (see &enum xe_wedged_mode). The
> - * default recovery method for a wedged state is rebind/bus-reset.
> - *
> - * Another recovery method is vendor-specific. Below are the cases that send
> - * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
> - *
> - * Case: Firmware Flash
> - * --------------------
> - *
> - * Identification Hint
> - * +++++++++++++++++++
> - *
> - * ``WEDGED=vendor-specific`` drm device wedged uevent with
> - * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
> - * admin/userspace consumer about the need for a firmware flash.
> - *
> - * Recovery Procedure
> - * ++++++++++++++++++
> - *
> - * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
> - * the below steps
> - *
> - * - Check Runtime Survivability mode sysfs.
> - *   If enabled, firmware flash is required to recover the device.
> - *
> - *   /sys/bus/pci/devices/<device>/survivability_mode
> - *
> - * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
> - *   firmware and restore device to normal operation.
> - */
> -
> -/**
> - * xe_device_set_wedged_method - Set wedged recovery method
> - * @xe: xe device instance
> - * @method: recovery method to set
> - *
> - * Set wedged recovery method to be sent in drm wedged uevent.
> - */
> -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
> -{
> -	xe->wedged.method = method;
> -}
> -
> -static void wedged_work(struct work_struct *work)
> -{
> -	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
> -
> -	/*
> -	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> -	 * hangs, so wedge the device with 'none' recovery method and have
> -	 * it available to the user for debugging.
> -	 */
> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> -		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> -	/* If no wedge recovery method is set, use default */
> -	else if (!xe->wedged.method)
> -		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> -					    DRM_WEDGE_RECOVERY_BUS_RESET);
> -
> -	/* Notify userspace of wedged device */
> -	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> -}
> -
> -#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
> -#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
> -
> -/**
> - * xe_device_declare_wedged - Declare device wedged
> - * @xe: xe device instance
> - *
> - * This is a final state that can only be cleared with the recovery method
> - * specified in the drm wedged uevent. The method can be set using
> - * xe_device_set_wedged_method before declaring the device as wedged. If no method
> - * is set, reprobe (unbind/re-bind) will be sent by default.
> - *
> - * In this state every IOCTL will be blocked so the GT cannot be used.
> - * In general it will be called upon any critical error such as gt reset
> - * failure or guc loading failure. Userspace will be notified of this state
> - * through device wedged uevent.
> - * If xe.wedged module parameter is set to 2, this function will be called
> - * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> - * snapshot capture. In this mode, GT reset won't be attempted so the state of
> - * the issue is preserved for further debugging.
> - */
> -void xe_device_declare_wedged(struct xe_device *xe)
> -{
> -	struct xe_gt *gt;
> -	u8 id;
> -
> -	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
> -		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
> -		return;
> -	}
> -
> -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> -		xe->needs_flr_on_fini = true;
> -		xe_pm_runtime_get_noresume(xe);
> -
> -		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> -		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> -			    "For recovery procedure, refer to %s\n"
> -			    "Please file a _new_ bug report at %s\n",
> -			    WEDGED_URL, XE_BUG_URL);
> -
> -		for_each_initialized_gt(gt, xe, id)
> -			xe_gt_declare_wedged(gt);
> -
> -		schedule_work(&xe->wedged.work);
> -	}
> -}
> -
> -/**
> - * xe_device_validate_wedged_mode - Check if given mode is supported
> - * @xe: the &xe_device
> - * @mode: requested mode to validate
> - *
> - * Check whether the provided wedged mode is supported.
> - *
> - * Return: 0 if mode is supported, error code otherwise.
> - */
> -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> -{
> -	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> -		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
> -		return -EINVAL;
> -	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
> -		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
> -		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
> -			mode, xe_wedged_mode_to_string(mode),
> -			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> -		return -EPERM;
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * xe_wedged_mode_to_string - Convert enum value to string.
> - * @mode: the &xe_wedged_mode to convert
> - *
> - * Returns: wedged mode as a user friendly string.
> - */
> -const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
> -{
> -	switch (mode) {
> -	case XE_WEDGED_MODE_NEVER:
> -		return "never";
> -	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
> -		return "upon-critical-error";
> -	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
> -		return "upon-any-hang-no-reset";
> -	default:
> -		return "<invalid>";
> -	}
> -}
> -
>  /**
>   * xe_device_asid_to_vm() - Find VM from ASID
>   * @xe: the &xe_device
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 9b09e627af8c..93caa5b3de86 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -211,11 +211,6 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
>  void xe_device_td_flush(struct xe_device *xe);
>  void xe_device_l2_flush(struct xe_device *xe, bool force);
>  
> -static inline bool xe_device_wedged(struct xe_device *xe)
> -{
> -	return atomic_read(&xe->wedged.flag);
> -}
> -
>  #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>  static inline bool xe_debug_page_size_supported(struct xe_device *xe)
>  {
> @@ -264,11 +259,6 @@ static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
>  }
>  #endif
>  
> -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> -void xe_device_declare_wedged(struct xe_device *xe);
> -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> -const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
> -
>  struct xe_file *xe_file_get(struct xe_file *xef);
>  void xe_file_put(struct xe_file *xef);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index ec5c1f0b8f00..25b38258b629 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -30,6 +30,7 @@
>  #include "xe_sysctrl_types.h"
>  #include "xe_tile_types.h"
>  #include "xe_validation.h"
> +#include "xe_wedge_types.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  #define TEST_VM_OPS_ERROR
> @@ -47,22 +48,6 @@ struct xe_pxp;
>  struct xe_ttm_stolen_mgr;
>  struct xe_vram_region;
>  
> -/**
> - * enum xe_wedged_mode - possible wedged modes
> - * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> - * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
> - *	when critical error occurs like GT reset failure or firmware failure.
> - *	This is the default mode.
> - * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
> - *	any hang. In this mode, engine resets are disabled to avoid automatic
> - *	recovery attempts. This mode is primarily intended for debugging hangs.
> - */
> -enum xe_wedged_mode {
> -	XE_WEDGED_MODE_NEVER = 0,
> -	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> -	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
> -};
> -
>  #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>  /**
>   * enum xe_page_size_alloc_ctrl_mode - User BO page-size allocation control modes
> @@ -538,18 +523,7 @@ struct xe_device {
>  	atomic_t in_reset;
>  
>  	/** @wedged: Struct to control Wedged States and mode */
> -	struct {
> -		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> -		atomic_t flag;
> -		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
> -		enum xe_wedged_mode mode;
> -		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
> -		unsigned long method;
> -		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
> -		bool inconsistent_reset;
> -		/** @wedged.work: Worker for wedge handling */
> -		struct work_struct work;
> -	} wedged;
> +	struct xe_wedge wedged;
>  
>  	/** @devres_group: devres group */
>  	void *devres_group;
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 524ac56bdcc7..cd333f2a6632 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -31,6 +31,7 @@
>  #include "xe_sched_job.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wa.h"
> +#include "xe_wedge.h"
>  #include "instructions/xe_gsc_commands.h"
>  #include "regs/xe_gsc_regs.h"
>  #include "regs/xe_gt_regs.h"
> @@ -340,7 +341,7 @@ static int gsc_er_complete(struct xe_gt *gt)
>  		 * declare the device as wedged.
>  		 */
>  		xe_gt_err(gt, "GSC ER timed out!\n");
> -		xe_device_declare_wedged(gt_to_xe(gt));
> +		xe_wedge_declare(gt_to_xe(gt));
>  		return -EIO;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d762158c0777..a5aa947ea295 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -68,6 +68,7 @@
>  #include "xe_uc_fw.h"
>  #include "xe_vm.h"
>  #include "xe_wa.h"
> +#include "xe_wedge.h"
>  #include "xe_wopcm.h"
>  
>  #define GRDOM_RESET_TIMEOUT_MS	5
> @@ -933,7 +934,7 @@ static void gt_reset_worker(struct work_struct *w)
>  	unsigned int fw_ref;
>  	int err;
>  
> -	if (xe_device_wedged(gt_to_xe(gt)))
> +	if (xe_wedged(gt_to_xe(gt)))
>  		goto err_pm_put;
>  
>  	if (xe_device_is_in_reset(gt_to_xe(gt)))
> @@ -992,7 +993,7 @@ static void gt_reset_worker(struct work_struct *w)
>  
>  err_fail:
>  	xe_log_err_fatal(gt, GT, err, "reset failed\n");
> -	xe_device_declare_wedged(gt_to_xe(gt));
> +	xe_wedge_declare(gt_to_xe(gt));
>  err_pm_put:
>  	xe_pm_runtime_put(gt_to_xe(gt));
>  }
> @@ -1020,7 +1021,7 @@ static void gt_wedge_worker(struct work_struct *w)
>  {
>  	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);
>  
> -	xe_uc_declare_wedged(&gt->uc);
> +	xe_uc_wedge_declare(&gt->uc);
>  	xe_tlb_inval_reset(&gt->tlb_inval);
>  }
>  
> @@ -1204,13 +1205,13 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
>  }
>  
>  /**
> - * xe_gt_declare_wedged() - Declare GT wedged
> + * xe_gt_wedge_declare() - Declare GT wedged
>   * @gt: the GT object
>   *
>   * Wedge the GT which stops all submission, saves desired debug state, and
>   * cleans up anything which could timeout.
>   */
> -void xe_gt_declare_wedged(struct xe_gt *gt)
> +void xe_gt_wedge_declare(struct xe_gt *gt)
>  {
>  	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 92d934d50244..7b6952fe804c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -40,7 +40,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>  int xe_gt_init_early(struct xe_gt *gt);
>  int xe_gt_init(struct xe_gt *gt);
>  void xe_gt_mmio_init(struct xe_gt *gt);
> -void xe_gt_declare_wedged(struct xe_gt *gt);
> +void xe_gt_wedge_declare(struct xe_gt *gt);
>  int xe_gt_record_default_lrcs(struct xe_gt *gt);
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 37899fcf5b22..0007fb21908f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -37,6 +37,7 @@
>  #include "xe_tile_sriov_vf.h"
>  #include "xe_tlb_inval.h"
>  #include "xe_uc_fw.h"
> +#include "xe_wedge.h"
>  #include "xe_wopcm.h"
>  
>  #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
> @@ -1462,7 +1463,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  fail:
>  	vf_post_migration_abort(gt);
>  	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
> -	xe_device_declare_wedged(xe);
> +	xe_wedge_declare(xe);
>  	return;
>  
>  queue:
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 3ab4cb9e4964..7d239a0829fb 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1829,13 +1829,13 @@ int xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  }
>  
>  /**
> - * xe_guc_declare_wedged() - Declare GuC wedged
> + * xe_guc_wedge_declare() - Declare GuC wedged
>   * @guc: the GuC object
>   *
>   * Wedge the GuC which stops all submission, saves desired debug state, and
>   * cleans up anything which could timeout.
>   */
> -void xe_guc_declare_wedged(struct xe_guc *guc)
> +void xe_guc_wedge_declare(struct xe_guc *guc)
>  {
>  	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index c4eca40d69cf..75c4b9acb065 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -62,7 +62,7 @@ void xe_guc_reset_wait(struct xe_guc *guc);
>  void xe_guc_stop_prepare(struct xe_guc *guc);
>  void xe_guc_stop(struct xe_guc *guc);
>  int xe_guc_start(struct xe_guc *guc);
> -void xe_guc_declare_wedged(struct xe_guc *guc);
> +void xe_guc_wedge_declare(struct xe_guc *guc);
>  bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
>  bool xe_guc_has_paging_engine(struct xe_guc *guc);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index da5ce97484b8..7ab51c97f42a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -36,6 +36,7 @@
>  #include "xe_sleep.h"
>  #include "xe_sriov_vf.h"
>  #include "xe_trace_guc.h"
> +#include "xe_wedge.h"
>  
>  static void receive_g2h(struct xe_guc_ct *ct);
>  static void g2h_worker_func(struct work_struct *w);
> @@ -1064,7 +1065,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  	xe_gt_assert(gt, g2h_len || !num_g2h);
>  	lockdep_assert_held(&ct->lock);
>  
> -	if (xe_device_wedged(ct_to_xe(ct))) {
> +	if (xe_wedged(ct_to_xe(ct))) {
>  		ret = -ENOTRECOVERABLE;
>  		goto out;
>  	}
> @@ -1489,7 +1490,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	if (g2h_fence.fail) {
>  		if (g2h_fence.cancel) {
>  			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
> -			ret = xe_device_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
> +			ret = xe_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
>  			goto unlock;
>  		}
>  		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
> @@ -1828,7 +1829,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>  	lockdep_assert_held(&ct->fast_lock);
>  
> -	if (xe_device_wedged(xe))
> +	if (xe_wedged(xe))
>  		return -ENOTRECOVERABLE;
>  
>  	if (ct->state == XE_GUC_CT_STATE_DISABLED)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e0105222a2c7..9558d7196a51 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -36,6 +36,7 @@
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_wa.h"
> +#include "xe_wedge.h"
>  
>  #define MCHBAR_MIRROR_BASE_SNB	0x140000
>  
> @@ -188,7 +189,7 @@ static int pc_action_reset(struct xe_guc_pc *pc)
>  	int ret;
>  
>  	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> -	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
> +	if (ret && !(xe_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
>  		xe_gt_err(pc_to_gt(pc), "GuC PC reset failed: %pe\n",
>  			  ERR_PTR(ret));
>  
> @@ -212,7 +213,7 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
>  
>  	/* Blocking here to ensure the results are ready before reading them */
>  	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
> -	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
> +	if (ret && !(xe_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
>  		xe_gt_err(pc_to_gt(pc), "GuC PC query task state failed: %pe\n",
>  			  ERR_PTR(ret));
>  
> @@ -235,7 +236,7 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>  		return -EAGAIN;
>  
>  	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> -	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
> +	if (ret && !(xe_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
>  		xe_gt_err(pc_to_gt(pc), "GuC PC set param[%u]=%u failed: %pe\n",
>  			  id, value, ERR_PTR(ret));
>  
> @@ -257,7 +258,7 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>  		return -EAGAIN;
>  
>  	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> -	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
> +	if (ret && !(xe_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
>  		xe_gt_err(pc_to_gt(pc), "GuC PC unset param failed: %pe",
>  			  ERR_PTR(ret));
>  
> @@ -1357,7 +1358,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>  	struct xe_guc_pc *pc = arg;
>  	struct xe_device *xe = pc_to_xe(pc);
>  
> -	if (xe_device_wedged(xe))
> +	if (xe_wedged(xe))
>  		return;
>  
>  	xe_guc_pc_stop(pc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
> index 99fa127b261f..fa3062ab134a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_rc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
> @@ -16,6 +16,7 @@
>  #include "xe_guc_pc.h"
>  #include "xe_guc_rc.h"
>  #include "xe_pm.h"
> +#include "xe_wedge.h"
>  
>  /**
>   * DOC: GuC RC (Render C-states)
> @@ -40,7 +41,7 @@ static int guc_action_setup_gucrc(struct xe_guc *guc, u32 control)
>  	int ret;
>  
>  	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> -	if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
> +	if (ret && !(xe_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
>  		xe_gt_err(guc_to_gt(guc),
>  			  "GuC RC setup %s(%u) failed (%pe)\n",
>  			   control == GUCRC_HOST_CONTROL ? "HOST_CONTROL" :
> @@ -73,7 +74,7 @@ static void xe_guc_rc_fini_hw(void *arg)
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_gt *gt = guc_to_gt(guc);
>  
> -	if (xe_device_wedged(xe))
> +	if (xe_wedged(xe))
>  		return;
>  
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 7ce73489c35f..290740f1d654 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -50,6 +50,7 @@
>  #include "xe_trace.h"
>  #include "xe_uc_fw.h"
>  #include "xe_vm.h"
> +#include "xe_wedge.h"
>  
>  #define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN		6
>  
> @@ -1450,10 +1451,10 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
>  	if (xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
>  		return false;
>  
> -	if (xe_device_wedged(xe))
> +	if (xe_wedged(xe))
>  		return true;
>  
> -	xe_device_declare_wedged(xe);
> +	xe_wedge_declare(xe);
>  
>  	return true;
>  }
> @@ -1660,7 +1661,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	if (!exec_queue_killed(q))
>  		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>  	else
> -		wedged = xe_device_wedged(xe);
> +		wedged = xe_wedged(xe);
>  
>  	/*
>  	 * Only tag as GPU hang if this is the original timeout, not a
> @@ -1780,7 +1781,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	}
>  
>  	if (wedge_device)
> -		xe_device_declare_wedged(gt_to_xe(q->gt));
> +		xe_wedge_declare(gt_to_xe(q->gt));
>  
>  	/*
>  	 * We want the job added back to the pending list so it gets freed; this
> @@ -2543,7 +2544,7 @@ static int guc_exec_queue_wait_suspend_done(struct xe_exec_queue *q, bool blocki
>  						       WAIT_COND, HZ * 5);
>  	}
>  
> -	if (!blocking && vf_recovery(guc) && !xe_device_wedged(xe))
> +	if (!blocking && vf_recovery(guc) && !xe_wedged(xe))
>  		return -EAGAIN;
>  
>  	if (!ret)
> @@ -2803,7 +2804,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>  
>  void xe_guc_submit_reset_wait(struct xe_guc *guc)
>  {
> -	wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||
> +	wait_event(guc->ct.wq, xe_wedged(guc_to_xe(guc)) ||
>  		   !xe_guc_read_stopped(guc));
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index 111fef781b2a..dd38d95c6014 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -19,6 +19,7 @@
>  #include "xe_sa.h"
>  #include "xe_tlb_inval.h"
>  #include "xe_vm.h"
> +#include "xe_wedge.h"
>  
>  #include "regs/xe_guc_regs.h"
>  
> @@ -77,7 +78,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
>  		};
>  
>  		return send_tlb_inval(guc, action, ARRAY_SIZE(action));
> -	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
> +	} else if (xe_device_uc_enabled(xe) && !xe_wedged(xe)) {
>  		struct xe_mmio *mmio = &gt->mmio;
>  
>  		if (IS_SRIOV_VF(xe))
> diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
> index 32700c19a1df..b9948153ca0b 100644
> --- a/drivers/gpu/drm/xe/xe_mert.c
> +++ b/drivers/gpu/drm/xe/xe_mert.c
> @@ -11,6 +11,7 @@
>  #include "xe_mmio.h"
>  #include "xe_sriov_printk.h"
>  #include "xe_tile.h"
> +#include "xe_wedge.h"
>  
>  /**
>   * xe_mert_init_early() - Initialize MERT data
> @@ -74,7 +75,7 @@ static void mert_handle_cat_error(struct xe_device *xe)
>  		break;
>  	case CATERR_UNMAPPED_GGTT:
>  		xe_sriov_err(xe, "MERT: CAT_ERR: Access to an unmapped GGTT!\n");
> -		xe_device_declare_wedged(xe);
> +		xe_wedge_declare(xe);
>  		break;
>  	case CATERR_LMTT_FAULT:
>  		xe_sriov_dbg_ratelimited(xe, "MERT: CAT_ERR: VF%u LMTT fault!\n", vfid);
> @@ -82,7 +83,7 @@ static void mert_handle_cat_error(struct xe_device *xe)
>  		break;
>  	default:
>  		xe_sriov_err(xe, "MERT: Unexpected CAT_ERR code=%#x!\n", code);
> -		xe_device_declare_wedged(xe);
> +		xe_wedge_declare(xe);
>  		break;
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index 79ce0c671549..418b07dc983a 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -13,6 +13,7 @@
>  #include "xe_printk.h"
>  #include "xe_ras.h"
>  #include "xe_survivability_mode.h"
> +#include "xe_wedge.h"
>  
>  static void prepare_device_for_reset(struct pci_dev *pdev)
>  {
> @@ -22,7 +23,7 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
>  
>  	/*
>  	 * Wedge the device to prevent userspace access but do not send the uevent.
> -	 * xe_device_wedged_fini() releases runtime pm if wedged flag is set, so acquire a runtime
> +	 * xe_wedge_fini() releases runtime pm if wedged flag is set, so acquire a runtime
>  	 * pm reference to avoid underflow.
>  	 */
>  	if (!atomic_xchg(&xe->wedged.flag, 1))
> @@ -31,7 +32,7 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
>  	xe_device_set_in_reset(xe);
>  
>  	for_each_gt(gt, xe, id)
> -		xe_gt_declare_wedged(gt);
> +		xe_gt_wedge_declare(gt);
>  
>  	pci_disable_device(pdev);
>  }
> @@ -61,7 +62,7 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>  		return PCI_ERS_RESULT_DISCONNECT;
>  
>  	/* If the device is already wedged or in survivability mode, do not attempt recovery */
> -	if (xe_survivability_mode_is_boot_enabled(xe) || xe_device_wedged(xe))
> +	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
>  		return PCI_ERS_RESULT_DISCONNECT;
>  
>  	switch (state) {
> @@ -86,7 +87,7 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>  
>  	/* User wants to debug the error, prevent reset */
>  	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> -		xe_device_declare_wedged(xe);
> +		xe_wedge_declare(xe);
>  		return PCI_ERS_RESULT_DISCONNECT;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 7a85735c57d5..2e8eb8856f97 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -16,6 +16,7 @@
>  #include "xe_sysctrl_event_types.h"
>  #include "xe_sysctrl_mailbox.h"
>  #include "xe_sysctrl_mailbox_types.h"
> +#include "xe_wedge.h"
>  
>  #define CORE_COMPUTE_UNCORR_TYPE	GENMASK(26, 25)
>  /*
> @@ -321,8 +322,8 @@ static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
>  
>  static void punit_error_handler(struct xe_device *xe)
>  {
> -	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_COLD_RESET);
> -	xe_device_declare_wedged(xe);
> +	xe_wedge_set_method(xe, DRM_WEDGE_RECOVERY_COLD_RESET);
> +	xe_wedge_declare(xe);
>  }
>  
>  static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index 33bd754d138f..ce0db26203ec 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -19,6 +19,7 @@
>  #include "xe_sriov_pf_service.h"
>  #include "xe_sriov_pf_sysfs.h"
>  #include "xe_sriov_printk.h"
> +#include "xe_wedge.h"
>  
>  static unsigned int wanted_max_vfs(struct xe_device *xe)
>  {
> @@ -157,7 +158,7 @@ int xe_sriov_pf_wait_ready(struct xe_device *xe)
>  	unsigned int id;
>  	int err;
>  
> -	if (xe_device_wedged(xe))
> +	if (xe_wedged(xe))
>  		return -ECANCELED;
>  
>  	for_each_gt(gt, xe, id) {
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 45d44ebe288b..dacb6303b8da 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -20,6 +20,7 @@
>  #include "xe_pcode_api.h"
>  #include "xe_printk.h"
>  #include "xe_vsec.h"
> +#include "xe_wedge.h"
>  
>  /**
>   * DOC: Survivability Mode
> @@ -446,8 +447,8 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>  	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>  	xe_log_err(xe, SURVIVABILITY, 0, "Runtime Mode enabled!\n");
>  
> -	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
> -	xe_device_declare_wedged(xe);
> +	xe_wedge_set_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
> +	xe_wedge_declare(xe);
>  
>  	xe_log_err(xe, SURVIVABILITY, 0, "Firmware flash required!\n");
>  	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 65f59f06177f..686c28856014 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -326,15 +326,15 @@ void xe_uc_runtime_resume(struct xe_uc *uc)
>  }
>  
>  /**
> - * xe_uc_declare_wedged() - Declare UC wedged
> + * xe_uc_wedge_declare() - Declare UC wedged
>   * @uc: the UC object
>   *
>   * Wedge the UC which stops all submission, saves desired debug state, and
>   * cleans up anything which could timeout.
>   */
> -void xe_uc_declare_wedged(struct xe_uc *uc)
> +void xe_uc_wedge_declare(struct xe_uc *uc)
>  {
>  	xe_gt_assert(uc_to_gt(uc), uc_to_xe(uc)->wedged.mode);
>  
> -	xe_guc_declare_wedged(&uc->guc);
> +	xe_guc_wedge_declare(&uc->guc);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 255a54a8f876..23bc0ce1c42f 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -21,6 +21,6 @@ int xe_uc_start(struct xe_uc *uc);
>  void xe_uc_suspend_prepare(struct xe_uc *uc);
>  int xe_uc_suspend(struct xe_uc *uc);
>  int xe_uc_sanitize_reset(struct xe_uc *uc);
> -void xe_uc_declare_wedged(struct xe_uc *uc);
> +void xe_uc_wedge_declare(struct xe_uc *uc);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> new file mode 100644
> index 000000000000..bee51a87d043
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge.c
> @@ -0,0 +1,287 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +
> +#include "xe_defaults.h"
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc_ads.h"
> +#include "xe_log.h"
> +#include "xe_module.h"
> +#include "xe_pm.h"
> +#include "xe_printk.h"
> +#include "xe_sriov.h"
> +#include "xe_wedge.h"
> +
> +/**
> + * DOC: Xe Device Wedging
> + *
> + * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> + * When device is in wedged state, every IOCTL will be blocked and GT cannot
> + * be used. The conditions under which the driver declares the device wedged
> + * depend on the wedge mode configuration (see &enum xe_wedged_mode). The
> + * default recovery method for a wedged state is rebind/bus-reset.
> + *
> + * Another recovery method is vendor-specific. Below are the cases that send
> + * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
> + *
> + * Case: Firmware Flash
> + * --------------------
> + *
> + * Identification Hint
> + * +++++++++++++++++++
> + *
> + * ``WEDGED=vendor-specific`` drm device wedged uevent with
> + * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
> + * admin/userspace consumer about the need for a firmware flash.
> + *
> + * Recovery Procedure
> + * ++++++++++++++++++
> + *
> + * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
> + * the below steps
> + *
> + * - Check Runtime Survivability mode sysfs.
> + *   If enabled, firmware flash is required to recover the device.
> + *
> + *   /sys/bus/pci/devices/<device>/survivability_mode
> + *
> + * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
> + *   firmware and restore device to normal operation.
> + */
> +
> +/**
> + * xe_wedge_set_method() - Set wedge recovery method
> + * @xe: xe device instance
> + * @method: recovery method to set
> + *
> + * Set wedge recovery method to be sent in drm wedged uevent.
> + */
> +void xe_wedge_set_method(struct xe_device *xe, unsigned long method)
> +{
> +	xe->wedged.method = method;
> +}
> +
> +/**
> + * xe_wedged() - Check for wedged device
> + * @xe: xe device instance
> + *
> + * Returns: %true if device is wedged, %false otherwise.
> + */
> +bool xe_wedged(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->wedged.flag);
> +}
> +
> +static void wedge_work(struct work_struct *work)
> +{
> +	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
> +
> +	/*
> +	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> +	 * hangs, so wedge the device with 'none' recovery method and have
> +	 * it available to the user for debugging.
> +	 */
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +		xe_wedge_set_method(xe, DRM_WEDGE_RECOVERY_NONE);
> +	/* If no wedge recovery method is set, use default */
> +	else if (!xe->wedged.method)
> +		xe_wedge_set_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> +					DRM_WEDGE_RECOVERY_BUS_RESET);
> +
> +	/* Notify userspace of wedged device */
> +	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> +}
> +
> +#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
> +#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
> +
> +/**
> + * xe_wedge_declare() - Declare device wedged
> + * @xe: xe device instance
> + *
> + * This is a final state that can only be cleared with the recovery method
> + * specified in the drm wedged uevent. The method can be set using
> + * xe_wedge_set_method() before declaring the device as wedged.
> + * If no method is set, rebind/bus-reset will be sent by default.
> + *
> + * In this state every IOCTL will be blocked so the GT cannot be used.
> + * In general it will be called upon any critical error such as gt reset
> + * failure or guc loading failure. Userspace will be notified of this state
> + * through device wedged uevent.
> + * If xe.wedged module parameter is set to 2, this function will be called
> + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> + * snapshot capture. In this mode, GT reset won't be attempted so the state of
> + * the issue is preserved for further debugging.
> + *
> + * Since the wedge handling is done as part of worker thread, this is safe for
> + * atomic callers.
> + */
> +void xe_wedge_declare(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
> +		xe_dbg(xe, "Wedged mode is forcibly disabled\n");
> +		return;
> +	}
> +
> +	if (atomic_xchg(&xe->wedged.flag, 1))
> +		return;
> +
> +	xe->needs_flr_on_fini = true;
> +	xe_pm_runtime_get_noresume(xe);
> +
> +	xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> +	xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> +			"For recovery procedure, refer to %s\n"
> +			"Please file a _new_ bug report at %s\n",
> +			WEDGED_URL, XE_BUG_URL);
> +
> +	for_each_initialized_gt(gt, xe, id)
> +		xe_gt_wedge_declare(gt);
> +
> +	schedule_work(&xe->wedged.work);
> +}
> +
> +static const char *wedge_mode_to_string(enum xe_wedged_mode mode)
> +{
> +	switch (mode) {
> +	case XE_WEDGED_MODE_NEVER:
> +		return "never";
> +	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
> +		return "upon-critical-error";
> +	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
> +		return "upon-any-hang-no-reset";
> +	default:
> +		return "<invalid>";
> +	}
> +}
> +
> +static int wedge_validate_mode(struct xe_device *xe, unsigned int mode)
> +{
> +	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +		xe_dbg(xe, "wedged_mode: invalid value (%u)\n", mode);
> +		return -EINVAL;
> +	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
> +		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
> +		xe_dbg(xe, "wedged_mode: (%u) %s mode is not supported for %s\n",
> +		       mode, wedge_mode_to_string(mode),
> +		       xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> +		return -EPERM;
> +	}
> +
> +	return 0;
> +}
> +
> +static bool wedge_mode_needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
> +{
> +	if (xe->wedged.inconsistent_reset)
> +		return true;
> +
> +	if (xe->wedged.mode == mode)
> +		return false;
> +
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
> +	    mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +		return true;
> +
> +	return false;
> +}
> +
> +static int __wedge_mode_set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
> +{
> +	bool enable_engine_reset;
> +	int ret;
> +
> +	enable_engine_reset = (mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET);
> +	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
> +						       enable_engine_reset);
> +	if (ret)
> +		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
> +
> +	return ret;
> +}
> +
> +static int wedge_mode_set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
> +{
> +	struct xe_gt *gt;
> +	int ret;
> +	u8 id;
> +
> +	guard(xe_pm_runtime)(xe);
> +	for_each_gt(gt, xe, id) {
> +		ret = __wedge_mode_set_reset_policy(gt, mode);
> +		if (ret) {
> +			if (id > 0) {
> +				xe->wedged.inconsistent_reset = true;
> +				xe_err(xe, "Inconsistent reset policy state between GTs\n");
> +			}
> +			return ret;
> +		}
> +	}
> +
> +	xe->wedged.inconsistent_reset = false;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_wedge_set_mode() - Set wedge mode
> + * @xe: xe device instance
> + * @mode: wedge mode to be set
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode)
> +{
> +	int ret;
> +
> +	ret = wedge_validate_mode(xe, mode);
> +	if (ret)
> +		return ret;
> +
> +	if (wedge_mode_needs_policy_update(xe, mode)) {
> +		ret = wedge_mode_set_reset_policy(xe, mode);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	xe->wedged.mode = mode;
> +
> +	return ret;
> +}
> +
> +static void xe_wedge_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	disable_work_sync(&xe->wedged.work);
> +
> +	if (atomic_read(&xe->wedged.flag))
> +		xe_pm_runtime_put(xe);
> +}
> +
> +/**
> + * xe_wedge_init() - Initialize wedge
> + * @xe: xe device instance
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_wedge_init(struct xe_device *xe)
> +{
> +	INIT_WORK(&xe->wedged.work, wedge_work);
> +
> +	xe->wedged.mode = wedge_validate_mode(xe, xe_modparam.wedged_mode) ?
> +			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
> +	xe_dbg(xe, "wedged_mode: setting mode (%u) %s\n",
> +	       xe->wedged.mode, wedge_mode_to_string(xe->wedged.mode));
> +
> +	return drmm_add_action_or_reset(&xe->drm, xe_wedge_fini, xe);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
> new file mode 100644
> index 000000000000..e564a3b9d7d8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_WEDGE_H_
> +#define _XE_WEDGE_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +enum xe_wedged_mode;
> +
> +bool xe_wedged(struct xe_device *xe);
> +void xe_wedge_declare(struct xe_device *xe);
> +int xe_wedge_init(struct xe_device *xe);
> +void xe_wedge_set_method(struct xe_device *xe, unsigned long method);
> +int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_wedge_types.h b/drivers/gpu/drm/xe/xe_wedge_types.h
> new file mode 100644
> index 000000000000..e6084f151c62
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge_types.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_WEDGE_TYPES_H_
> +#define _XE_WEDGE_TYPES_H_
> +
> +#include <linux/atomic.h>
> +#include <linux/types.h>
> +#include <linux/workqueue_types.h>
> +
> +/**
> + * enum xe_wedged_mode - Possible wedge modes
> + * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> + * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
> + *	when critical error occurs like GT reset failure or firmware failure.
> + *	This is the default mode.
> + * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
> + *	any hang. In this mode, engine resets are disabled to avoid automatic
> + *	recovery attempts. This mode is primarily intended for debugging hangs.
> + */
> +enum xe_wedged_mode {
> +	XE_WEDGED_MODE_NEVER = 0,
> +	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> +	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
> +};
> +
> +/**
> + * struct xe_wedge - Struct to control Wedged States and mode
> + */
> +struct xe_wedge {
> +	/** @flag: Xe device faced a critical error and is now blocked. */
> +	atomic_t flag;
> +	/** @mode: Mode controlled by kernel parameter and debugfs */
> +	enum xe_wedged_mode mode;
> +	/** @method: Recovery method to be sent in the drm device wedged uevent */
> +	unsigned long method;
> +	/** @inconsistent_reset: Inconsistent reset policy state between GTs */
> +	bool inconsistent_reset;
> +	/** @work: Worker for wedge handling */
> +	struct work_struct work;
> +};
> +
> +#endif
> -- 
> 2.43.0
> 
