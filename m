Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0EC606A327
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y8kwYbnJ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=cT1PVxyv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A0A10E25B;
	Wed, 25 Nov 2026 19:46:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD85B10E25B
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 19:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795636003; x=1827172003;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/6BMADZPgaVvI4ASX5hgtCr9DDK63Qhiapug0DIIw08=;
 b=Y8kwYbnJao053ygBPyfcfa4ViJ6hU37fCC0uAdo3haixfJkGwRmCH6hE
 fGVu876MOYvJk9e4fSl+71zvAJh4XELfj+84gkKwYdMUjve3UNvPdn91L
 VguF0oT3BIFz9sJ1KAxulAiVRbTFkTymbt3cedF9w65mXLHLFgxVmQIpA
 1BuKPIWK08rElZbORnZHp6pP9iKcZqArbdcuS0/n7CgsNKW9T9TqL8442
 V32I9abu3Cx1VVaDUHjzEARC1UuMZDGZIiLm2L59cyGpJ3roEsfXBPujl
 rWNxsUIQ4sqQ47i8EWbwlhZotXhiRrlY3Fxiu9qteGQb3lW4Xoak6uur8 A==;
X-CSE-ConnectionGUID: HtQ7y+ZFQ4WHo5XAv+WmUg==
X-CSE-MsgGUID: 2PK3ZHLgT46sWrIR3/FKJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4586834"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4586834"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 10:26:13 -0800
X-CSE-ConnectionGUID: 0WVB0DzDRlWN3SB9dntWog==
X-CSE-MsgGUID: tiS6EgwKTdSIcc0lDPpmoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="12053470"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 10:26:13 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 10:26:12 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 10:26:12 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 10:26:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnvQdPV7CV3n+1FYrdQo+3/6cUEmTxeYrwMNwMwRnetqZEtZzLVoYtHfzHNhocWi3aR1eZaLFusBCSd9giZRhxUnEMfpE6i0cbfVGcJXSBK6TU+hPlBBa6vdfgvGeR8Q93l+0zIX6z1NAUYLMlrBrj4ZcxTjQq5SxuooyVxtP5nFCH2y6NBqJxPPp+X4eJmBx0RP6VklkEXuUBMUEVu42mpHFUlrdGbTD6rOMzZ9cTksLXPJOv3A4j65UcTKRF6T0rq1fYZNdagxDAApIHpQ3wTRFh7wNQfFMCO4jP84+lAqDIhFrNbDqGfKimKQ09G1o3VW+lvgsLVqF9089yYJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcpnmGAmvoNe8nz/kS833P2leYjrLAOkPmjsTEZIZYk=;
 b=MGlpoq4KIpWuPD4pVletsgspGNty5OxR2OjwVfs0kryDCQqAat982ZaZyzTOQzeCqsY5p9wi03hz9/ShDuF3c2NIW0P/mlYNNnYC3XKG0CRxsSSU/32Zl+SPbZKPyAOY+3LfoUbXlkVVNvIs7QDHOjGI0EDutLPacNDmW61O80Em1C3eYQL918RaNboO76b1By5tU2YHVa5QmzZZR2nZldLMapZrdPFFf9026kj5509RWowFZxDiqgNIoHQm6SMbzXxYMgWF5PiQiiyAIX0x2Ebqfn/ukHU1Wzu7AeJRudKjRNjTQlCdMca9f/Q7CtFqEW/zqbGmYDvC0iTFvqyLqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcpnmGAmvoNe8nz/kS833P2leYjrLAOkPmjsTEZIZYk=;
 b=cT1PVxyvsG1yPCRMc183LFsOwF1bzUAC2nb0kivpEkixP60OHO6xGBpHKjp2fbd/YMIW71pim1AzD7BM7lNHoAZCHuTr695CaTd0arPMJqNKa1zBYIdODUZHaUTk6lnsnOfVv+JyNvu/Kx9Fqt37Tc3v7QLMDbC3RkfGAnrIZ90=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 SA3PR11MB7656.namprd11.prod.outlook.com (2603:10b6:806:320::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.6; Wed, 25 Nov 2026 18:26:05 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Wed, 25 Nov 2026
 18:26:04 +0000
Date: Wed, 25 Nov 2026 13:26:01 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <ravi.kishore.koppuravuri@intel.com>
Subject: Re: [PATCH v4 02/10] drm/xe/hwmon: Expose fanN_max
Message-ID: <awcoObOEU30OsURt@intel.com>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
 <20261124054811.798763-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124054811.798763-3-karthik.poosa@intel.com>
X-ClientProxiedBy: BY5PR20CA0024.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::29) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|SA3PR11MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: adc00d16-bea0-48c3-8cb7-08df4b2190b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|10067099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003|261102123227099003|261009223027099003|22082099003|18002099003|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: Xk/FbPS2G/fpzleArZECRkNU2TMcedqBwz4vE14oY7usuywdl7Tv/0839uvEq6ucDKl7mMhnYj52QsneIdCjtUeEHNJhHRSWxWtCZIPnqpYjHe75Sn0cziVC+dKWvVIXBTlWi2mWVpmaeiGNlhL1e5CDwimKZoBbNDL8WS+XVKQQ8zWx0PaDHhzCUioSpslT8iIaGVaWhtsqxNnyLgrxQfc8O+C9FUkahSLJ74CiOa4sA9EuOXFqjbNL1jLu7z8pdYK6YoMh0TPCnCZUMRditb2hVws1+17uV7FfjDAkxRYcb3EsG9z1AFtej8RmO8fwvM3eKVXRRA1IE2QKSblMgukPer6eG5sFU635zdLFscP71FzfTE9vUmypR2mp3ZgMtF6hLc0j7YtFQHIoVG2WV8tSZVtwT1Z+IUjVx3DyskaeFBDpTowhwtNjxiIu+NdbKa2RhkYLRiUHx9XBGuUaM78r/4ra1koWy5NLH96KkZyfLgkOjUsLp4W0rUiAkYgyTK+kzR+aawVGhVlo5zvFzGxWhC9X+IyeNgT2C/3qeh+kgIJ3G+vmrifkbl6GPirmX9Wf6/xiHaa32kzqDPt/l02VQV3kJu2UhS+mlNs/bj5muM/LNOMMFXZMBFb7kBn/ptpPJMu1bW9/Yw0eJwYiEUwZ/aMHtog9VF6PF5KtUdo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YXIsCZlVEpp4UwFJgpfA3Jo1UWPRjQ86nQM4lWvvGxHqGvm+K+l5KTVvrdgU?=
 =?us-ascii?Q?dkDFzwdhMfoJRVFvLUYGFD0GKJA50K9vczPQZ1rVES3WoIPU/YGwAlWxQLco?=
 =?us-ascii?Q?6AeX98pAaFTggtpssHFXwAJg8mmsJA0bsANZa0tvAd253eLrb54sclEtEg4e?=
 =?us-ascii?Q?sqHpJES1Hq4E021lDjexzIjywbR5cP3ftzozHYsnAJuPDuIFV2lwMNHB1/nr?=
 =?us-ascii?Q?TAsymkXfNHOjvQvbxE4Lw4ZEcVEPveUHO1RkU+ec9RlvyjKPiJs4bBH4wf7a?=
 =?us-ascii?Q?8JtJQrHsvbNb6/U+5vHsnV6AydDv0lQmf2/F3JUo3Ye1bJfFMwd+fCXRGg3+?=
 =?us-ascii?Q?byAk4k3c7VsV9T2da60TzarXMa7QY/nufFdFPTfufgjtPdvuU2iLv7A41jTZ?=
 =?us-ascii?Q?2FPXho5KI8g2HUUK+sO0ltjeja83Ic7nGhwp/QP1vI9/gscQZwfv72Ozv2g4?=
 =?us-ascii?Q?3xCp5ecIPQlQ9NI0nqM+U8RhNNgR3ccKZCTZaIWrMEXV4bAMsqChunrhhoC4?=
 =?us-ascii?Q?uLmVjKbZGYjQuKkHsSdAsQF+TtaiB6yqdpPOIebv9a2mMKwK5bpeZr+U+5yl?=
 =?us-ascii?Q?sQgSGOW85gby8IH/u6vfNiHPy1xqGUfrr9Y4J+ZUt9YW6EKdgvG1Y6umx8Oo?=
 =?us-ascii?Q?EkfC+/twSRkmDB55xBZ0jDqQpKFfQimp544Tqiv0paRjCFFogQ1VuL9PzkYQ?=
 =?us-ascii?Q?mBjPtgIR1kcp4ZlR1Bwbduv8bIRLJP5SWEmNTwKh2kshQvgBdTIAf0Qu7PUP?=
 =?us-ascii?Q?O5jdZDcw1Bmv8uZXhErwt1tsq1q7tCz4YrgJiUdihgkyCqEc9nKgORPnDj9Z?=
 =?us-ascii?Q?oPu3qth98SLfslVvFVBBsUM4P5T6gCmc9e4MFcJoVhA6Md6mGKYfEoOFEAWu?=
 =?us-ascii?Q?dXFuGNVP8s6b1DZur47cxR/zZWWnMAl+F/nI+oHY9bMRNLm6mdSUtlZ1eqdC?=
 =?us-ascii?Q?uz1rPwPvwBrz1fopej3l3H+kA5+bx915J2JAVLUuLsS1eXxm0c911DRJA3TA?=
 =?us-ascii?Q?3jAatSF9sAC0J9z/aj2zqRAXHOLCeB+zob1WX8x8zmYSQZT3pHz/rU26WlGn?=
 =?us-ascii?Q?ZnXq9ZAbm5IuxwZkBTa/puMQmJh6YCIPYm/BPfxi34CD5PTvLiyXQ/A9M/TY?=
 =?us-ascii?Q?bwrjA21aDwT+AB3mzxeV0tSd7lTLx8I+0KQjT2mVc7lVFLgCVKgaspBxO2xO?=
 =?us-ascii?Q?27C6yfisqIYq56G4FTdr/x1YzO05DU9gHfNDWalU8II/0IDBhb6M8mHsi4dN?=
 =?us-ascii?Q?/D1ov7MO1yu4YiAsXBp5CCcoqn3zBFY96e4qKuzilXI2V5JkkOZxPxtfBUjk?=
 =?us-ascii?Q?u28ATmNkorHlPQAna7gytR4AfesbiXqhIh5OptxKT52tv+iy2SDia4VGywIx?=
 =?us-ascii?Q?quX74qR0gfqn7rE0HmO01kU1ThYUYQ0xyqNahqf9QwdGNBhod9h0bKF5USct?=
 =?us-ascii?Q?x1zyDsGiJlr4VvCCq0OYU7ZoNJLpNyOePVVIdy+ZGhimCOTOIJIjUYuDomYV?=
 =?us-ascii?Q?z2EJq+joi68f8kBdgmBQ+vKbjTz7xd4SsD3ca6fvApHdWJUiPZiSv48G2OBI?=
 =?us-ascii?Q?90rw6BpH4ZEDkXi2H3rmqpnKftefmzDUDYAtxXZRDYQ0BM4n2Z67JpHCItGw?=
 =?us-ascii?Q?HYHgUdkwewoVS8BBX8ZOoRoauPM8KGRu4d22QTWGWixOxTsnSrFAAmpFuw2Y?=
 =?us-ascii?Q?yZCItMbyIzzXRcR7N66zaZ4qbiji39kXWbUg2ddp/XYldT0B3gXEMJzuRZbU?=
 =?us-ascii?Q?iyu8AWO4gg=3D=3D?=
X-Exchange-RoutingPolicyChecked: jVuAu56Cc42+/hrz0pfdlfHqYy6OOPZaOxQm2QGnOfA5kAXWjdmYWiALXVs9z4wsIQzs96vwEsGGb4Pn0//HrMX5aohvV7FRXD+CyDN3iWWPqsBBrcwW40s+QvvkqpovA0SvGsl5bREuevEjHUVYxU4Af1AtswXDCTbEc4PkpsgXMv72KzfH2PUyFPDFFsqaUnblHv60/Rb08G/fbjIe0982ZrqTcl9TBlYL4T8RjUJ1yh/OdfhlVr+nOQG+wk4Z91zDhwCjezIu+vI8BVenBjRHVC5zL1QHSFVthe1tw1K3NYkTyVLSEODXv2segQezVlMsSZjDnqfGbAW0CXN3XQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: adc00d16-bea0-48c3-8cb7-08df4b2190b7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:26:04.6020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8sUyzL0erSBk/p9xOrhNuStfzGQe9DqcP3hPV/eXVM7CjQuE+6AsWbuSkO0/IbnGOImXveuWBxqAByy1ELMLGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7656
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 11:18:03AM +0530, Karthik Poosa wrote:
> Expose fan maximum RPM via fanN_max.
> 
> The value is derived from the firmware-reported maximum fan RPS and
> converted to RPM in the fan hwmon read path.
> 
> Update Xe hwmon ABI documentation for fanN_max.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> v2: Use xe helper for dmesg logs.
> 
> v3:
>  - Fix indentation of the max_rps struct member. (Soham)
>  - Enable fanN_max only when fanN is supported.
> 
> v4:
>  - Read max RPS independent of stock table availability.
>  - Clear max RPS on pcode read failure.
> 
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  8 +++++++
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 21 +++++++++++++++++--
>  drivers/gpu/drm/xe/xe_pcode_api.h             |  1 +
>  3 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 0da739d9a816..1d42ea0639f7 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -266,6 +266,14 @@ Description:	RO. Fan 3 speed in RPM.
>  
>  		Only supported for particular Intel Xe graphics platforms.
>  
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan[1-3]_max
> +Date:		November 2026
> +KernelVersion:	7.5
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Maximum fan speed in RPM for each fan channel.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
>  What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap
>  Date:		May 2025
>  KernelVersion:	6.15
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 2ee4f89e7bf7..d06f9dc8a463 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -185,6 +185,8 @@ struct xe_hwmon_fan_info {
>  			u8 speed;
>  		} fcp[MAX_FAN_CONTROL_POINTS];
>  	} fan_table[FAN_TABLE_MAX];
> +	/** @max_rps: maximum fan RPS */
> +	u32 max_rps;
>  	/** @min_pwm: minimum fan PWM */
>  	u32 min_pwm;
>  };
> @@ -913,7 +915,8 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>  	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
>  	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
>  	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> -	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
> +			   HWMON_F_INPUT | HWMON_F_MAX),
>  	NULL
>  };
>  
> @@ -1163,7 +1166,7 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>  	int ret;
>  	int err = 0;
>  
> -	/* Stock table failures leave fan_input visible; tach readout doesn't need it. */
> +	/* Stock table failures leave fan_input and fan_max visible; they don't need it. */
>  	for (fan = 0; fan < FAN_MAX; fan++) {
>  		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>  		u32 stock_fcp_count = 0;
> @@ -1171,6 +1174,15 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>  		if (!IS_FAN_ENABLED(hwmon, fan))
>  			continue;
>  
> +		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_MAX_FAN_RPS, fan,
> +						      &fi->max_rps);
> +		if (ret) {
> +			fi->max_rps = 0;
> +			xe_warn(hwmon->xe, "failed to read fan %d max RPS, ret=%d\n", fan, ret);
> +		} else {
> +			xe_dbg(hwmon->xe, "fan %d max RPS %u\n", fan, fi->max_rps);
> +		}
> +
>  		ret = xe_hwmon_pcode_read_fan_control(hwmon,
>  						      FSC_READ_STOCK_FAN_CONTROL_POINTS,
>  						      fan, &stock_fcp_count);
> @@ -1765,6 +1777,8 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  	switch (attr) {
>  	case hwmon_fan_input:
>  		return IS_FAN_ENABLED(hwmon, channel) ? 0444 : 0;
> +	case hwmon_fan_max:
> +		return IS_FAN_ENABLED(hwmon, channel) && hwmon->fi[channel].max_rps ? 0444 : 0;
>  	default:
>  		return 0;
>  	}
> @@ -1815,6 +1829,9 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  	switch (attr) {
>  	case hwmon_fan_input:
>  		return xe_hwmon_fan_input_read(hwmon, channel, val);
> +	case hwmon_fan_max:
> +		*val = mul_u32_u32(hwmon->fi[channel].max_rps, 60);
> +		return 0;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 0349b24a8259..b8132db0e399 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -82,6 +82,7 @@
>  #define     PCODE_MBOX_DOMAIN_HBM		0x2
>  
>  #define   FAN_SPEED_CONTROL			0x7D
> +#define     FSC_READ_MAX_FAN_RPS		0x3
>  #define     FSC_READ_NUM_FANS			0x4
>  #define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
>  #define     FSC_READ_FAN_TABLE			0x7
> -- 
> 2.34.1
> 
