Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9E3606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 22:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IlPD1Y7s;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=STWiQtxK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242F810E9D2;
	Tue, 24 Nov 2026 22:02:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CEC10E9D2
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 22:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795557728; x=1827093728;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=66ltvjq2bbejKuIAie/IvqkapDo7KQ5sQmbI3GaxVUc=;
 b=IlPD1Y7sIZs1KoXx8XH8I9x/dEO3uLndOgloej+Py0NuayKxQCypAZF4
 MGaWzXGSbHD+zc65eUDt2tTcBhjMwX8UhPJQN/KyRgmYGhOeX6YHhQ4vr
 4b9sSR6s2KwZVU29hRV3CIbT9OM1hvgPk/X8JUE+xYHIIeu3jyh7TXYUz
 t5zEBVeT2BAtYN2viHthSBUmP2naHSKz/cMQJ2bFfm6txFylDcFEs0ZLj
 o/lY+C93v6cwIaL1ACu8syjayWtjJUW7m16n3vSE4Rd5iS54PHHX5bdl2
 CwzVeNLLvk9QYmtH9z1Ijr/gMtYPruLi561x2FpvSZkbfVCUbBn0z+dX7 A==;
X-CSE-ConnectionGUID: rycDlywaTSO4PLW/LwA3vQ==
X-CSE-MsgGUID: xT1keGELSHiD0Y8BhtoiSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4418134"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4418134"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:55:20 -0800
X-CSE-ConnectionGUID: XUJmRO9nSVuaQbBNinM7zA==
X-CSE-MsgGUID: TV5gmq/GSP6uTNdSWzY2ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11881273"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:55:20 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:55:19 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 13:55:19 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:55:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXNouyaXXhi1qtBjbh3m3IA7xto7zJjU/ZEt2oRd8ITB6i3bXa8jlP4KQN92EYkvE2pFxEYpi6k8W/kFoKpFek4lzrnSNHBOld4JjCfjI4C6k0y/JuH2oofvUgFCpRLd8svJg4utG29Ztmd2RyH1U05EKWffsPtQo7PONtiZBVlEKoW5X6+/9XBHadINlvB0jnfDPp1YvIVt301JpITTGrSlHJKadMXYn936iLlZY6q7bBV74WDDYTZQMNETQInmSnHunAasYvtBOnDcYFOcF5xnYt8chZj1ivfcr7veCxQAMjcRQUTzUcXjMk2RHHmgS2lV2o3qJFzPnrvOmzvgVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMQhTQ1e14hEo9iqVChunAtNM+ll4crYgwudhmM91Wk=;
 b=wF3Qy3aSHU2F0a7l3rVOZKkwe9NnxmNJV+JaRiw5g2YU/pih+fhPxZPmwrJt37dj7qF72iLEG7/s7ZEmCNysChnGvKkq8jgBeLKeV+68ejcKyU0d4BwN5L5VhSvt9IRwWF85UsGThafP99ZxN4dTFYeBiuUCsdQCagw+PcNWzmPqoQ3geuna7/JAE6c9Ywpf3aJ1j74O5Qnxu3UJ/5EUsTIcVIePIw7MSAPmzg3Cgq0BMJeTFH9oKda+xMHA0xuQF58i9LlB+ZErjZs256TB5Zo/t3UIDzMd13cuBAKRc0wZAezpU9J8YDrARbDw5CGg6uk+10ekUYegdju2vTJxWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMQhTQ1e14hEo9iqVChunAtNM+ll4crYgwudhmM91Wk=;
 b=STWiQtxKHwS17DIBxvdAvfD+0U1v8JZeGU8CCgBdZlXFArX60BoCFi2NtVD6/Lte4imcaxSwV1S2r/9oMS3Qookxxq3TaxLYR8cnS2GLbgxD8ILby4e5gK9JyUa1M2BWcDe+EZ9r77n38hgRgWUm0pqrtYRIK29Qm7kdHIc6f08=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 21:55:13 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 21:55:13 +0000
Date: Tue, 24 Nov 2026 13:55:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Hold a fence reference while waiting for
 migration
Message-ID: <awYHv1B7eQwexn8L@gsse-cloud1.jf.intel.com>
References: <20261120070822.3834209-1-krishnaiah.bommu@intel.com>
 <20261120070822.3834209-2-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120070822.3834209-2-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: BY5PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::37) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 672f8d75-f761-48a8-5e9a-08df4a759df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|11063799006|56012099006|4143699003|261022075727099003|261028144727099003|261102123227099003|261021121427099003|261009223027099003|261026140227099003|261022105027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: pbnefGR9o2J2zByrowUQEG56DuHwJBXFaibWYDhWh/dWlEN6ksxvkXspEcr55l/6JB+itoN5k/7wOXHC3tlUV9mr0wYg80KfQwxI04nvjXakjFA/PujZrj41x7a8/mqMzMxbk1IpmuAzA7Wziz2hNFTU7z1OcwArTIqvuZEj3+xUxbvHT/solqjTuHQXQJoq+oqfO/Cu6+HgjtM++sR5PKS1hcLhKKaJdpPHb3Dg4wJBsDkOwd78O4cPWo54hLD72hOMdRYeos6GD6p2L/AwpHtg86JfpPoOGSMaZR+0C/4Vb1UduBYNWDqWECAc19BMgvps88nJtf4Ky5FZiJBEEKOqBPa/1Ee1AwZ1diRZ4KdDjwJJ/eTgE5UNueagWwVmm4NRWC09frS4VHe3jGzGzKgnUBKGr2RpbBFhSM4C3JExL/IM3pRayoofc/f+CMyw3k34bwryO/RYJVYHw9buwRsNVpgtfAN+eqShxzjrHbhuLv4nbYW9XfUKHXKFVw2D6p26r1IZ0HrRWJgViOUfe08OLzzKpngZM0BUQplcY9JxgQJIxcFcxOXNsZA21hHtuNLM8csrCEwj+KS2WtWotD1h/c+ylwZExGXxIW+xhKdUwihOKrzzsh7Kb/vDxHMopvpuKtUpim1fgnq3SYRdfeTQ+JWxJrGiHktZ4lGkDoQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(261022075727099003)(261028144727099003)(261102123227099003)(261021121427099003)(261009223027099003)(261026140227099003)(261022105027099003)(261021123027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LtBS57ReXNHh5AltCZE7AEhGCVfhlY6LwTKn5jwS7r8Wu1HQF+puoHVkUJaD?=
 =?us-ascii?Q?+UpZnbYvGHfxjKwhyls5Z7VTrNdG2T9WntI/4uxlWWPRwaP7HyLuE61UE0rr?=
 =?us-ascii?Q?znN+L2bS9CiYkRfkSN9r/a7KGU3/oZ9zY/Qh0iV6ez/4Pz0Yd0JDNg8h2uYH?=
 =?us-ascii?Q?nSq0U3Tp25o+XAhpuo6pvS6A4QH+ZqJKKgYjCvjK/aXf37qPy20B7gL3tgJ3?=
 =?us-ascii?Q?iyTZJbOAbXvNgNTKf43hdbciROytXvMyFiWATZFhBQMJTRAbmTSFiQ4JvXbU?=
 =?us-ascii?Q?iJWE/kgqYDzGCmN1pn/lCLlwEGH4oSXGkliP/raBMFelOs8JBouuu8WAvEqn?=
 =?us-ascii?Q?Od/d5TiUKF1RWZjOBNyJOXXMHcdu82xwSmrjhcw6nnG4N9sB0RjkIwZ21AWq?=
 =?us-ascii?Q?uKNzofRRd7/+rj2wIxhsvTdFI1roy22fo5DgFai1/IdEEBKSCXks5NJCm4LJ?=
 =?us-ascii?Q?yYEgkuC6UFSphZe0cyoZkys8VH7tT9kloHXJlTjBa59DGSzk3fl58jDI75YM?=
 =?us-ascii?Q?tOGnGyZW2z1w5ToTqaLYfB/xAulJTFK1zze7v2S9xuHMccaRpKl85Dbv/ocv?=
 =?us-ascii?Q?GhJ/TOVUS9muU3VbcWpL4xtGD9uZw7dpT1R/MYasmwOF1d/PKqQrVU/qLHLf?=
 =?us-ascii?Q?RcwkeVcA2/SSNYdCb5n+2obkEh+G71uXilGJsUnkUZNVHU1nHLDHn3HsSezH?=
 =?us-ascii?Q?5WteeEj+FTWLHFDrp2cKHa/pfWtwX1G/o0ZkAev/ISEOwRy25lV5C1FlolKn?=
 =?us-ascii?Q?oohBe1l7qASmirCPOE4/MrA5p6tXo7lpGhqCVyT12NyCisZBnW9h8dEgVQtV?=
 =?us-ascii?Q?LykYYgi2FHAWe/oL3hLQL5Z4FDlIzYiYMcRQqgBro067x8x3cvqiqyj1eX6g?=
 =?us-ascii?Q?hpEyGcQHdzsaJ0WGDCTvNJOK8Wyml87khWs196j3ZBO9M8hAdujBDeYXCk09?=
 =?us-ascii?Q?M22ANTzuVvy1coWFULwTc9EPK/yIfvi8ln/09spgGO/1mJs9r/kyKi2CbPWn?=
 =?us-ascii?Q?FSvZArCvFYXVZBoDx0M/LXtMLfJGwvYfM/DpmE3BU3O/2ovIP4VK19EbEuAz?=
 =?us-ascii?Q?i0kFeqTRBAQ3wijYqPlca/7ElC6xC6XbBDsPuyR0mC3bZ1/z5Dfa61u0KAPU?=
 =?us-ascii?Q?aV4t+480FwYUdLkCTKQVYfzz7DB5jgcjNpbJmGlsGy3A+bsriyL4lfWw7V8c?=
 =?us-ascii?Q?xkPb8gK0pfQ8GKGycwcXI6Igy9Wjl4x8w5yD4388XEM3p92JzJN3O54k2wfO?=
 =?us-ascii?Q?GipdevlhbUM87Kwsab0ToxHf0azWQYHxGOtiEZ/BjGpkECB1vjaTRdZcFCVz?=
 =?us-ascii?Q?Lr9ynUUGsd2DhldYSLrdRF/nqSywiJCvVt4n4uEnWEAZedp8aJjLLpfpAT8+?=
 =?us-ascii?Q?HFj/gDOnDtEFhtC8/EyLUhXX/jnQXXL4DzjYzmi3G5NJ+XhORk6AErfrpKKR?=
 =?us-ascii?Q?M2opdUKmN0H7ebqQQUe88APaFjzH1kp8Shv5AK/bIN6zRlHx/wXOJRtjAZPn?=
 =?us-ascii?Q?7a1ifPyU1mk+cMXQqSu6yPEN1+cos28u2BBOWpAR9Z++xGykFCwQhDasPktM?=
 =?us-ascii?Q?G42V6ws2uDt3juBrbzv0DLoDjkuA/p243RlfU2XgdpgwSWQmbExyGz0AWVtd?=
 =?us-ascii?Q?t+xoz6hci9b5aXD/IMSn/3UDaiKa8zf36yjWh6Ou8xD8Re7AxA+HGbq6N7L6?=
 =?us-ascii?Q?/2AJngBKLIYM4Kt9wdvFnba9FBkm+nupg1Zwk1bh/Txl7Z8nlmowWpVIERof?=
 =?us-ascii?Q?sUduAjoK4/isuDCNxRi9+cAjCSwQ348=3D?=
X-Exchange-RoutingPolicyChecked: WoI1z7rEQimmwKxe54hm314SgqV56iesYCwj1XE3gbdx598whl2YlnbhdgJSXDejPD1CJdhRtcA7J7Sn10FBI2XheLgZflaLYlrZKmErMcADMpOUxGBpUpETtC4qCoUiTlfVliNczRBs1A/oS8IGQWbLzjQOiDeKWYx5NYNr+XA5pAkpb8meXl9HnAD0xhZC3XBhsMzKUvnRjAIyHhAPpsRxOHrKr9UqCGE+O7RPSYscwBxBGv6gzoGcNkWr853ti3ihDCKofAcIuZ3sSXEnVkoofnZVCbpeH15ClefZpQN2kz4riR7eamIb7JNIFuRUzGw23NuckJMWZgPvcZWy3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 672f8d75-f761-48a8-5e9a-08df4a759df1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 21:55:13.2968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzVBuUVjoioOOBNidkE9WnfxGvvBV74W0iLbjSFzX5V4zX/uCqp7YXB4OseTzZBzQ56JbXzLwvIksBvCwiIzXQ==
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

On Fri, Nov 20, 2026 at 12:38:21PM +0530, Bommu Krishnaiah wrote:
> xe_migrate_wait() reads m->fence without job_mutex, while migration
> submissions replace the pointer and drop the previous reference under
> that mutex. A concurrent replacement could leave the waiter accessing
> a fence whose reference has been released.
> 
> Take a fence reference under job_mutex, then wait and release
> the reference outside the lock. This protects the snapshot without holding
> the submission mutex throughout the wait. Callers must still quiesce
> submissions when they require the migration context to be idle.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index d7a8d8ecffe6..57a81eda2088 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -2150,8 +2150,16 @@ struct migrate_test_params {
>   */
>  void xe_migrate_wait(struct xe_migrate *m)
>  {
> -	if (m->fence)
> -		dma_fence_wait(m->fence, false);
> +	struct dma_fence *fence;
> +
> +	mutex_lock(&m->job_mutex);
> +	fence = dma_fence_get(m->fence);
> +	mutex_unlock(&m->job_mutex);
> +
> +	if (fence) {
> +		dma_fence_wait(fence, false);
> +		dma_fence_put(fence);
> +	}
>  }
>  
>  static u32 pte_update_cmd_size(u64 size)
> -- 
> 2.43.0
> 
