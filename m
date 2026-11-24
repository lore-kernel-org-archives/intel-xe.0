Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AB3606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 22:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ArBZllYJ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=BNaET/Hi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6765410ECF9;
	Tue, 24 Nov 2026 22:02:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2932610ECF9
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 22:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795557745; x=1827093745;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ciYVDEFh2Jqmx+x46luV3Mc/+nfR36OrCYval5YD0Nc=;
 b=ArBZllYJXXd0dB5wKPCpg3TEDPZe9pJGHCbb2w1PMNIyjhsRH6MHoyI3
 WarZqysZORUAy0pz3hRMXbIkuPtZR77hIvb12Ij8aWYk6wGR67E3xBlu6
 poE+1MnmdRNp7vTqwzab3kTOOCd7vKL3g6AStlLDfv2Y4L7VRC0o0On+C
 R76FeFxCEdb+cV+KTAyPdQ79eSjoJGSB4/kt5jKg1PYzaiEdZc1X08vca
 5Ub0I/4HDclUXMJnkZw+Jf4ZcjOWcQMSjcyFuv8h4fDXzEC8ImOqtI7px
 iyj60wxx68hWKtg/D7Ud9LIwkVCB52SCf7hiMnTj3ecN4jXadpqPL9YLe Q==;
X-CSE-ConnectionGUID: AC6YZZlvQPaFnJVYuH/RRw==
X-CSE-MsgGUID: 1X3Ur4zSRm2FHf4k1XM4XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4418201"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4418201"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:56:15 -0800
X-CSE-ConnectionGUID: KwgW9rI/SQ2aWvuV3hl6SQ==
X-CSE-MsgGUID: 5wSTw8KWQdm+LOnh4S3srw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11881494"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:56:15 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:56:14 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 13:56:14 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:56:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVHq8JelNagJCpsjeaJBxQ7McTLP3lsFWZzJYnGGdqKI6Tth/PmfLy3HMhqL3hkXHjpjKvYVcPpWU8d//tV00IVi0L/ypTq/YBEa1DlQUHi4Ma9O3O/ei5B2qVmZ/hbonD+4R6mw34yTDTA0etri24XPyrAgRzBiazYybGgPZ1q1PqxKrfZwYo1DitRXUb7rwwHGkkURmuIgyUhig/jV0zkMm+r3GqUlKZvnxNPs2azGeql6S/Sh2GUq1lWUv0TjKgrcvzAS57pfTerMVylI/8bKxV/EQWto3y8ssq8Oee8COL7Nl8yUlmSMl73R4Qg2wys0iTU1Blvp7D73LiqNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2457nZjKYI+teCBo6OMU5B2uP3X5AR6FY290i5g5Jc=;
 b=knG06mbui/BK5n2FRFO++Jl8Q8B5chCLeo4Zhy6vguM4V8o0ZewQAlkRuNTwyKLtwI9BUDDIbutyv04ziOthCLNUX4zVevVd0A1CMR64CPG3SHjwBH0F5Cc5/KxPpQejg3XxRtwjgf53li8sA/qtQv/3jxWycJB5XuEYqNpCHgKzyJAT2Rx9h382/6cz8k306g2F/UnwIirEEza5Vhp3p/LyfgOaozPMHqA/Xxl3tRxmIGIiuEw3eI3/oBpac1qVAv7/+vuTEVuCnviDzWX21Dv4OQ+F7AMv4yjnHlPPSkl13WVJZVuKDgRmDmzyyz0LE3L400w5+JQqrYQLnOoxOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2457nZjKYI+teCBo6OMU5B2uP3X5AR6FY290i5g5Jc=;
 b=BNaET/HixxU0Jtbohtj4d9yg6Js8j3pnpYFOqpa+6qqdWaf1k+njG6SNY1RKAZJqKyamRxfsjpDywr35lte65nv/phZfZoh11jcjUlXpS8Zp8Vil7BtYKVaTNBnhDL5oQE6ckj05HydGDl4DiRyBtamx7fPOY8zb4Obb0/GAhro=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 21:56:08 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 21:56:08 +0000
Date: Tue, 24 Nov 2026 13:56:05 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Centralize migration fence updates
Message-ID: <awYH9SbYvaT45pm+@gsse-cloud1.jf.intel.com>
References: <20261120070822.3834209-1-krishnaiah.bommu@intel.com>
 <20261120070822.3834209-3-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120070822.3834209-3-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: SJ0PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:a03:333::18) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: d7ce44ec-83c6-46c8-0912-08df4a75beaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|11063799006|56012099006|4143699003|261022075727099003|261028144727099003|261026121527099003|261102123227099003|261021121427099003|261009223027099003|261009221227099003|261026140227099003|261022105027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: JvtYwZnMEJz83eSb0M4S4M6y700ACF57NPz/m9i4ucvDcyWLKCfy8WmqlEbQh9d1KyHCKB10b7CkqVTQp9VFMIQtc9+lieuG4YM5F92jMPVwN00Yvlny5cLvcU00ROjJCYaUS8qCfdeQgqIbik0zq/448FabBVk5siLc9ZhoIKfWzL4Oit+ONvUsy+ZoPPwjfcOPpvTVi5qLiQZfdaL3iyysTdSj4gMR45RBKj7bDkBR7HIhjj1iVfsD01ngB3a3pIcuCpD3LkPk7zgqU75a35BjqMKNHai1JxijzdTcKGSVdV6/GPogCjv6YgYocQ9+fIXE0qaTl4T47SLyS87obFZD9IgRKglyMHuoWafhPCp5paH65yr1ALIshYr/3zlbZgmYTEeWl/I5LuS64QxQeaIK4BDF1jZQhQbzcR+uBuAJbwE74OizLM+qLrrTLT75zZa0BPjEBKBed9UrPnHv2ndQKG/3D0RhtVEGKEJhixTBcY7/v6w7qpmESx0j1M2kDUepY7nMGSQAeF4JDNg1EjHpL4+/PVuQJN2z4IBEWx8cXAKJI/haDcdXLIGLdMqsNo0xJpx33cA91VwqzfbuHNMdt+xcbvkuKn2EScPbzeWMWqp5vkw7nVywNWdqjFQf2VthtMKBJaNNmJZF1Yy6zyLEGHN5CQ6Up0Qgyw55ROI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(261022075727099003)(261028144727099003)(261026121527099003)(261102123227099003)(261021121427099003)(261009223027099003)(261009221227099003)(261026140227099003)(261022105027099003)(261021123027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?inhqCck2dqAaPQFEWzou0ZycelTFMRs7TcoqYxToy4SAfnZoW5AfBzxeVI5X?=
 =?us-ascii?Q?VGS1Ct4WDfPDo5TTbi0OffJgv8+j6KqRtwQUjINHflPM1Obp44hAl6kh5GYv?=
 =?us-ascii?Q?Jp84t1B28rU2VcPxwNSx9PzZ5uYjBtoiWTLUX7HTnOV4+Hp0qexQY78FMzFK?=
 =?us-ascii?Q?MsMoT3nieluKy6j7uwhPOJGT5oYdl7Jdmvrne4K8E86XbpHug1SK8N8Hb7qF?=
 =?us-ascii?Q?TYxYfMpAXtKI2248ldkQ0OCP2/gpCrH8tIGeSc3MYZ7uOAGej12wNjPcEvds?=
 =?us-ascii?Q?AXJOlxYkyYJg6hc/Ox8yIOWTkrSjXkCM0r1SnIAGokapP95PtjEX+ju7zGit?=
 =?us-ascii?Q?y1x+YvLDiYU0Q/93WRkGryh/VloatUpLghzluvdHNZ1obCI/tg4pSSKQwxh/?=
 =?us-ascii?Q?vqHptN7q/XSEUeiQXQOdeGNkmiitOVDL2m7wnqgG0mKYP9t24/aHxwwhdm4w?=
 =?us-ascii?Q?RKo604V3m7d024Y3RfsjLcFFTgNCe+QBKsg7kxbFHrLiGUM24nlCIQpeMhnZ?=
 =?us-ascii?Q?GDtziz3H4tnU3TpLLUrnsJS0p4vMc1ofL6KG7vR0bff/43E5lRREhgl6J095?=
 =?us-ascii?Q?eqQLvN+t38A+ObQedNNIuEEEot+EbG7Yn5ck5D57MUpf89P/jUR+SLvmgbK7?=
 =?us-ascii?Q?tM2rhBP6Hx/7w9RkXf6cuwkixwYhfJUWnRQJOXTGSO/+9v14WgAkiSRw4sqH?=
 =?us-ascii?Q?F3qqzxOPH+8pS87C4VTe5XizbELktD/oK6sVQZQIwvvW6/0nUYhdYje+EIsq?=
 =?us-ascii?Q?WJaanN8vYV6eSc+/n1MryNgC8DSz/Uhfm4WQmy04cV150I2UD1Rzxi3KNusz?=
 =?us-ascii?Q?6w57ZF/PYh33KuxRrY1LuY3glJ6pRQDenacf4v63S09qolLJQ5zCgjCNJ+J9?=
 =?us-ascii?Q?3lrp1ms/v3/+6eVKzPHyIil1RQ2VEud9LQVkCjkMAs/UJZ/UEKeOQ+EEaVJT?=
 =?us-ascii?Q?wmzAh2/Pu/B/g0IR5i4Fg3Dj2Ds0c5VOy6aGW5lc0a+hBZ2JXPaN+N8NAlXC?=
 =?us-ascii?Q?l5CyQY6s0JOrA/wkB5ehh/mEc5XNb9QqLfBmQmh6NsU+sOIDhL6bT437Xq59?=
 =?us-ascii?Q?tNh+/nZYbTGEW45S8SMU68186dkQoPtl8wm5xg1A/C23rnkmhpvwS19I5OTD?=
 =?us-ascii?Q?fzuOgi4IYeCi1OJbt/phGTHQ5lGhx7WjsTr94Yhh6FElhF5ULK4sBZIh8ZCo?=
 =?us-ascii?Q?t458PM7o8PQPdf9H1B7rQUIQ8UgEfmdQqKsOb93/8ulurz2S6aO+smi6KuB0?=
 =?us-ascii?Q?99TQTYMONJ5MvYJqOF6st9BhwCtne2xNZnkfy6NaHQ4olUHBoVuh6NF3GuWp?=
 =?us-ascii?Q?vyRZnOC3h/cirJAyGNWtHc5Y6C+wAaywxZnqkA9K5qaxc/eHDq4mDW78ZNZ4?=
 =?us-ascii?Q?EfaPZJcREqDCG2pNBXCaKTlsW6fJHMgDJjHQLf+Eaecc7POuJZyJSIAdKKKG?=
 =?us-ascii?Q?Xx3bxpoZ+OtJMn/5v3xoZzaS9LTPeZ48efnbR1ovkJWsWMGgoaLXg6NMCE+a?=
 =?us-ascii?Q?fCCQKe0HiyZZwhWfub3bXLvi4hwwKrLIPwqOG+4fORp3HIP9GD8lxLiMJDDk?=
 =?us-ascii?Q?kNX5HQd1k4eJwePcxFhcaPuWEPRQFlMUzkUahstjF7n8q0cc+iVoGMrVad9R?=
 =?us-ascii?Q?nYyF/sAnqXRIocRzQc/TzhMiozolNYM4lSpyjviXPzqazxdAM0BpEMvRugvU?=
 =?us-ascii?Q?OGEP2UAFXa4kg2H60tpW0bOE8l3n7eZDy8YHaGGnq6D75hrHKfa5mq18wBoC?=
 =?us-ascii?Q?/W9yu6e1tO+zepJ5crg9IuGxgoyR/Pg=3D?=
X-Exchange-RoutingPolicyChecked: WLSHqYFWwkMJTXD3lJYZ3qSfi20c5WoCeRrcULSpICqvy7Zq8oec+Dhivd6sj/5A58QnPEtGAdFdJU3BxaIkH7qMXWyjJ5eDPdkyeFyoyIPkmEhD3TykXlECHt+U7Etbl4WoJzZrJLnNI/sUfbM8x0lt0yoA9WKuSHONnNsl8IYFnmTUyEVlTDphXL2AbQk9+SRLvhS2NyKlI+UQ748Ri38X7/FViuFdokrTkn+Qy2sCsxVGZP7HdKaUvHMlRacpczTyRXgdwfTJKC6QE/3ne380rNVIkg5eiOnv2JRp0krIUdXrlXRc4EXKghve8w/MFkl+M2XDCVMqt5F1iiACHw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ce44ec-83c6-46c8-0912-08df4a75beaa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 21:56:08.1234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kg9gzVhhG6rSddGJwVAz6/n9wNbsk/4G35xv97BVGly/d70TP4WemifsJR8T12VGvY3lXdLB4C0I8nWmFMQkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8700
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

On Fri, Nov 20, 2026 at 12:38:22PM +0530, Bommu Krishnaiah wrote:
> Add a helper for replacing the migration fence. Assert that job_mutex
> is held when updating the stored fence and document how readers must
> acquire a reference before using it outside the lock.
> 
> Use the helper at each migration fence update site, and use
> scoped_guard when taking the reference in xe_migrate_wait().
> This keeps the fence ownership and locking rules explicit
> across the migrate layer.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 36 ++++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 57a81eda2088..99d4ce53f0b2 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -227,7 +227,9 @@ struct xe_migrate {
>  	u64 large_page_copy_pdes;
>  	/**
>  	 * @fence: dma-fence representing the last migration job batch.
> -	 * Protected by @job_mutex.
> +	 * Updated under @job_mutex. Readers must take a reference while holding
> +	 * the mutex before using the fence outside the critical section. The
> +	 * stored reference is released during final teardown.
>  	 */
>  	struct dma_fence *fence;
>  	/** @min_chunk_size: For dgfx, Minimum chunk size */
> @@ -273,6 +275,13 @@ static void xe_migrate_ulls_toggle_enable(struct xe_migrate *m, bool enabled)
>  	m->ulls.enabled = enabled;
>  }
>  
> +static void xe_migrate_fence_set(struct xe_migrate *m, struct dma_fence *fence)
> +{
> +	lockdep_assert_held(&m->job_mutex);
> +	dma_fence_put(m->fence);
> +	m->fence = dma_fence_get(fence);
> +}
> +
>  static void xe_migrate_ulls_fini(struct xe_migrate *m)
>  {
>  	struct xe_device *xe = tile_to_xe(m->tile);
> @@ -1433,8 +1442,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>  		dma_fence_put(fence);
>  		fence = xe_migrate_job_push(m, job);
>  
> -		dma_fence_put(m->fence);
> -		m->fence = dma_fence_get(fence);
> +		xe_migrate_fence_set(m, fence);
>  
>  		mutex_unlock(&m->job_mutex);
>  
> @@ -1862,8 +1870,7 @@ struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_off
>  			dma_fence_put(fence);
>  			fence = xe_migrate_job_push(m, job);
>  
> -			dma_fence_put(m->fence);
> -			m->fence = dma_fence_get(fence);
> +			xe_migrate_fence_set(m, fence);
>  		}
>  
>  		xe_bb_free(bb, fence);
> @@ -2097,8 +2104,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		dma_fence_put(fence);
>  		fence = xe_migrate_job_push(m, job);
>  
> -		dma_fence_put(m->fence);
> -		m->fence = dma_fence_get(fence);
> +		xe_migrate_fence_set(m, fence);
>  
>  		mutex_unlock(&m->job_mutex);
>  
> @@ -2152,9 +2158,9 @@ void xe_migrate_wait(struct xe_migrate *m)
>  {
>  	struct dma_fence *fence;
>  
> -	mutex_lock(&m->job_mutex);
> -	fence = dma_fence_get(m->fence);
> -	mutex_unlock(&m->job_mutex);
> +	scoped_guard(mutex, &m->job_mutex) {
> +		fence = dma_fence_get(m->fence);
> +	}
>  
>  	if (fence) {
>  		dma_fence_wait(fence, false);
> @@ -2463,12 +2469,10 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  		err = 0;
>  	}
>  
> -	mutex_lock(&m->job_mutex);
> -	fence = xe_migrate_job_push(m, job);
> -
> -	dma_fence_put(m->fence);
> -	m->fence = dma_fence_get(fence);
> -	mutex_unlock(&m->job_mutex);
> +	scoped_guard(mutex, &m->job_mutex) {
> +		fence = xe_migrate_job_push(m, job);
> +		xe_migrate_fence_set(m, fence);
> +	}
>  
>  	xe_bb_free(bb, fence);
>  
> -- 
> 2.43.0
> 
