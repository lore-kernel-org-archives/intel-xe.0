Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF5F606A32A
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 23:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dZVyrvrg;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=cZs8TyBj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AF610E25C;
	Tue, 24 Nov 2026 23:30:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0993E10E25C
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 23:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795562999; x=1827098999;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=U7y9fKqL4mpZuIeI+kvEaKoktOOWM0JZ0UhX5Ko0B1E=;
 b=dZVyrvrgRVM/bA1qOxIq5lTOOyumnkuUARUpYPlGi3O2FwMwk6E5sKxH
 IdlE2YNajg9GI5F9JI5Wzo7V5Q0yTbTBXyiBWfpgJ+BoBuIPcmt+9Shz2
 10m3BqtnGEVFLEgRc4JChr/18WSI8d0WhpdhLvYXYoev9/NaIMLxQvd+7
 DGzSk7iGr3nZOXIcmiyzDAJw+2hjYNJzjE5U5E1bwgNVoqDLZ/nooAtZh
 qaB10J3jdhTp+p+Q5vRn8OTTC8NlPL7Wk7VhLNNQQBzEYD7RuMoVejo/n
 7Cy5ZeAOmDxjmDlfbWY8/MPksbzZA6VKnF+pe/7EDZCgmVBeE3e4E0mYe g==;
X-CSE-ConnectionGUID: 0ZmhvoDvQ5mp+7JglS94og==
X-CSE-MsgGUID: q2XrUE1gTaGPkhBTXdFFIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4399165"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4399165"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 15:29:58 -0800
X-CSE-ConnectionGUID: M5lIvGikSkCw+Uut09HhFQ==
X-CSE-MsgGUID: QVoRhlRfSw+rKPC5GOAWUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="13727241"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 15:29:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 15:29:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 15:29:58 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 15:29:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pbVB7Ir3GJWZOIubfvHtfpA0DKM1m+z2RVtYW+uZ9sH3HKZbUB36lJcKXj2QW1EdrHf6Z1/WQf53Xk17ocCqxk9zbWmBzN0rGAHx918fXxGmxs4NwQpkjKU+rSxDyynO4a1sbNtSy8julQZy2yRmOeXnRhRO0+h9V/ALxQSl0IVZJTi4wsCvK6Z9D0toVPFumkJjn0nE10la4BBQiTWehEO6d+trfMFkp7jb+gDolDQ64ligkF2L7hFhF8xwf3X5e+Mr0W7y2A5fpRCzVaEBBJqnWfB2miTdBLo9Z2vq3MPSUihb5eh7R1uwnnHdnqejufyHDEcaFdqLfR33r5eoaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NppJhqDqTuSUAM6OS/3JUyR02dEMebqYJY0Xr0T4nC8=;
 b=IYGoFnlmeUPfgToVUSuThHEXvCh416VY5H1TR7iAkgDQGv68SO8q5wxxDad7IdP5MAUSlsHbfObUh6QxT0vwqb6d3R752ogEylNjIcaKRV5QtcdgBBbGJl3ppPG9qK/QSA+wgY0SBolh1Ydo+uFMpfpwA/k59aat6xrb+AzWq8ILMr+8fqfm1ayfY5fqd0zSjVS2LfVLD21VowiLwVPoXuSW0/34dmtmpPbyS0e2INDsy8Zdknew3tDe0pZTcT75SsIBOfitxTMQYgBnebP5N44plZVJeZt0ZiVSGEum15bGyyHh4iE7a/fBMr1hSgWKHApni2NDG3wR/V5Qc/XpGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NppJhqDqTuSUAM6OS/3JUyR02dEMebqYJY0Xr0T4nC8=;
 b=cZs8TyBjAAxaBa2HHQl5iBIajKp/H4uN76qunuU3omaWjUa8HnRjd0/m1R4v9YZdaGVwMYkIlUI7yK9srD+CuFnkCeqUt/L6urzDiOXVyTRA+4CKJRF4q/rm8JrnWbTTE+bnY8uzonjfRdHWJcHDMF7+xdzUWSWYHwihRPgzmao=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by PH3PPFB9A266170.namprd11.prod.outlook.com (2603:10b6:518:1::d45)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Tue, 24 Nov
 2026 23:27:48 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 23:27:48 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Jesus Narvaez <jesus.narvaez@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Jesus Narvaez <jesus.narvaez@intel.com>
Subject: Re: [PATCH v5 0/2] drm/xe: Handle GuC semaphore instruction field
 check error
In-Reply-To: <20261120191111.4097737-4-jesus.narvaez@intel.com>
References: <20261120191111.4097737-4-jesus.narvaez@intel.com>
Date: Tue, 24 Nov 2026 20:27:43 -0300
Message-ID: <877bi195e8.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0213.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::8) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|PH3PPFB9A266170:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dab0be5-5016-4b9d-4cb9-08df4a828ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|261009221227099003|261009223027099003|18002099003|22082099003|3023799007|56012099006|11063799006|261102123227099003|261021123027099003|261021121427099003|261022075727099003|261022113327099003|10067099003;
X-Microsoft-Antispam-Message-Info: pg3Z5EIqjAbcxrViT/hppeFGTV/CCsT4gdAx5jPfTV6iXkcJoNQ+ixFPrQUOfb2ntAer/OStDxqxAgprUVAuWDT7B+U7i4pasy0l5rjSda3RAJNZCc7JN8Rr9Qmo5i/JN7wzdWXzfdMCJyAjkHdwF5TZKxwWZQzouHxui4Ah9NaObUd/7AmlU20sm0dXOB67RiR+LUPVv2Z9/I+wiJsKs9Dweqg+fGl2z42lSsKIIG79C9j5IL203qUWlJFvNmagrTdND6sBs2yVzgPXrq6mLMSvKITyZAS2XfIWwtSzWEbXEUYx4jcEHzDQ4p6X5KuQXrmsxWb1n9aKdkORWHQbykliYfgv9p2DyhHET2bJqNgT4iJ6kOq+Kf2J94BJZ7aZAQXd6Bq+Ogk/QDZd9Rn3kl3JjNQAVR3T7Ulmjr39SCzV5M+8OW/xVw5S9sT+aESbCR2YOjSD3EaRsLQCCXmVTlbMI6+IFzMNeJX+W7q+QnSdiPSFYzmSF8FY3rL6cZVl9Y909AGIDV+BCBONBVRTH14wAIZgXt6W/OZsQngvLffPWJFCp3a1xxjl9oKeFSkpJiL6f4an0K2tQCpuksjHAG/9ikYXwFdQFhnC6SFwnM97AKxJFhUp8blsTc879ZrS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(261009221227099003)(261009223027099003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(261102123227099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022113327099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nvn6GDOGrlZgSkK9vPc+R2T3BzznQfruJDJgrNYaxD8hH9tqga548DbRGWDx?=
 =?us-ascii?Q?+lSrdEkgV6z+y9CRaoqYdm+g8ywM7IDisu0AXwQaLvBv/60wwCm4nUesm7FH?=
 =?us-ascii?Q?l4cgq7RMEnkKV/eZAePEsUMlnK9D/kVHGR71xzGy7aQtn/sqAuNwjl9dHERD?=
 =?us-ascii?Q?bCHVsALTp4FanhmiRay7oJdF5VuwmRs3g1b1fxG3vod0KR/5Zz6H6s+t1SgA?=
 =?us-ascii?Q?Q0sUSKk4KELOr5IEt0yBdUM9TBEL3/3d8XMMhjjsnV4WukLMV4S2z+xquDHm?=
 =?us-ascii?Q?gNu7d42r6uHtLUyVjCVpP7FYlhKv86MK6iLL7hiD2drynk/3RxWwh8b7oCT7?=
 =?us-ascii?Q?3P5mFT2KzwBXKnMvCde7R43bni3d9Hhvx5boTVUZ2bzPYLXGUDRS8tdQREVV?=
 =?us-ascii?Q?h1rW3MJ2HSHjhUfjKliayRY/bNovzev6cRt7Q8eKfdV8bovn1IvAedJus+Gt?=
 =?us-ascii?Q?MWdcxAyO+rjp2EquwHZZzsmDcuQXqweKNfDwo9dlPAbDRjqFn6vy2u/cl1gx?=
 =?us-ascii?Q?Xg5XEPH+TtPoayYqh/JP+zVA8lAfEQbMWvISrkdR4TR1LlZE6+uUUIiVikbF?=
 =?us-ascii?Q?ePBAjmak2b3/INA6EG6ibFiFs7TbUWavt14GFQ52TN+mLwjiQ515e8Bk2dJK?=
 =?us-ascii?Q?tZ96RzWDW6RMbokj3qejtiZWvcsRmYcNmuaHp5QVJ4kiHzTMRRKZ+6mRvoej?=
 =?us-ascii?Q?NLTbPWobHUjp0GLm7SDvhqCcbIIp1zJghlBiSBkgFI30WzrD4VVhtp6ER1mZ?=
 =?us-ascii?Q?m8iJTxBtwutuUCMPnQp/xVfUoeC58xPfVFjtlASSJQiBEj+oZz197FD5Y1Wf?=
 =?us-ascii?Q?m4on1Tpbr7EgIDyLodlAQ5QynEyeEwN2kl+O35cUD2zJmrqUEpqCViutIjcH?=
 =?us-ascii?Q?2uZyG29Jhq/+u4RQ1eZavi42F0FXR3sY/Iphjt06by03BOnS3e/3nNXeKczF?=
 =?us-ascii?Q?gvmEIYpCPdA2bV/j7wBGdFP6bFefdtahrfrASGkiURZgDRX45WSeMgamWQZN?=
 =?us-ascii?Q?mWpo7qXPBAnJmHWeBgI9XS1/lfoudJNIP3/mI/y8c+QRdCt2M1WvQHa3Szy+?=
 =?us-ascii?Q?JeNnk8fBcGZFuIZctXjXbdxfc6BbBjASbEd0DviNE0zZfG+5hx7TEMiUDjHv?=
 =?us-ascii?Q?YMVazTFjkrWetHBIKc6TCdqN2wOlBDbevLybQFoW2fMhjKc23DhsNcrTuopy?=
 =?us-ascii?Q?ksG/QEJtEtfiXLL/HwDM0S9LOvmCX4z4z9o0F8EqBErBiXNawfxnwKjXC05B?=
 =?us-ascii?Q?48pO4N6FOA2jvIFNdKUMMUIviEVUxOwJSjfHpyMJcwR2ShG2awId5ORMqf08?=
 =?us-ascii?Q?597+JQOqRuEu6PzkB+N7xy5BoFx0ZrGqHRNWti6jWMux/Q5rFdNnP9KI4ZF9?=
 =?us-ascii?Q?klXEGnNaVmHm5H3csCcYPFqFsAf5yh55GZZY7x+uOK7Jtd/DkddI2drm/J+l?=
 =?us-ascii?Q?I3o+fD61g7IPj3hQcf6bkwxaIgfvpFEmzZI7P48IeZ3XH+8CO828PEFQqkZw?=
 =?us-ascii?Q?p6V1141FwBarPT6DpOGVc4UTqdEt13iqxhimorYevicrrZS6oK1kZArscDHE?=
 =?us-ascii?Q?OmKc3ru845nY6LxXFOkZZIKRBjamlE9n7/RBHlPtxfFK4LiVuw0WRSdm/vCh?=
 =?us-ascii?Q?f2HdX2+IAd7GS9pNq785n96/RhbnADvnR5BxpjuSWlO3D8vlRAoXLG4ZEDK2?=
 =?us-ascii?Q?QZN0u5KpyvDg0+Jsb2n1R0rPTGt4Ps1JgObmMnhVU1ciIo/tYOMihiGCtsPR?=
 =?us-ascii?Q?1eOfANqTIQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: JfCIE6ojZrYT+jlyaJOHdVvLsf5Ecq3FRvFDVwmXNvPmRzuyQU+krCZSKuknKI4aGKldPLuiu6L21SiSf+EgPgXJI+wc46qOJHu+NU9rICwX6nXJ6XEpaSE6jhN59ncdA+e9rpPcmlfzh3qnW0Za4QGTGwy6rkXdkRJxQZFe9K0suDpei7o8wDoJaeBjlHwNppRBNm10jpxU0VUdbmgCm59fKemMIdN84bTPhypaE/fBbvdYzF8jDxV7M7vyw3nxoWYuD9d5WYwPAb6ym1Cm5BuA5ArM6xbP6kX0XeQwElDUu9B3PaAOiZhnKDNTKqBx5Q9x7MITmvR8yoOmOmDSUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dab0be5-5016-4b9d-4cb9-08df4a828ce7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 23:27:48.2254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hYUn/orypxzGxq/L34H/WhOlRn9ImyZQRLVUAEPwdxwts5NA7PPEEd3T3CbOCem/YZr75iQfBMOo9lK1SyaAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFB9A266170
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Jesus Narvaez <jesus.narvaez@intel.com> writes:

> This series enables the driver to opt in to have the GuC check the SW Token Info
> field of 64 bit semaphore instructions and then handle the G2H received from the
> GuC when an unsupported value is detected.
>
> Originally, I only had the patch to opt in to the GuC feature, but after
> becoming aware of the series to add and use the has_sem64 flag, I added the
> has_sem64 flag definition to this series and updated the opt-in patch to use the
> new flag, with Tilak's permission.
>
> Patches:
>   1. drm/xe: Add has_sem64 bit to graphics/media IP descriptors
>      Tilak's patch, carried over to this series unmodified (his v2)
>   2. drm/xe/guc: Handle GuC semaphore instruction field check error
>      Opts in to the GuC check when has_sem64 is set, and handles the G2H
>
> Changes in v5:
> - Patch 1: Updated to Tilak's v2, which now only compares has_sem64 when both
>   GTs are present (Daniele). Added Daniele's Reviewed-by.
> - Patch 2: No changes from v4.
>
> Changes in v4:
> - Patch 1: Added Tilak's patch to series, carried over unmodified.
> - Patch 2: Updated to use the has_sem64 flag in the opt-in condition and updated
>   comments accordingly. Daniele's Reviewed-by for v3 is kept with his
>   permission.
>
> v3 of the GuC patch: https://lore.kernel.org/all/20261029202643.2233648-2-jesus.narvaez@intel.com/
> Tilak's patch: https://lore.kernel.org/all/20261120120231.748267-2-tilak.tirumalesh.tangudu@intel.com/
>
> Jesus Narvaez (1):
>   drm/xe/guc: Handle GuC semaphore instruction field check error
>
> Tangudu Tilak Tirumalesh (1):
>   drm/xe: Add has_sem64 bit to graphics/media IP descriptors

Pushed to drm-xe-next. Thank you all for the patches and reviews.

--
Gustavo Sousa

>
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 10 ++++++
>  drivers/gpu/drm/xe/xe_gt_types.h         |  2 ++
>  drivers/gpu/drm/xe/xe_guc.c              | 10 ++++++
>  drivers/gpu/drm/xe/xe_guc_ct.c           |  4 +++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 46 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h       |  2 ++
>  drivers/gpu/drm/xe/xe_pci.c              | 27 ++++++++++++--
>  drivers/gpu/drm/xe/xe_pci_types.h        |  2 ++
>  drivers/gpu/drm/xe/xe_trace.h            |  5 +++
>  10 files changed, 107 insertions(+), 2 deletions(-)
>
> -- 
> 2.43.0
