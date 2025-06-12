Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DD9C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 22:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13E110E1C2;
	Thu, 12 Jun 2025 22:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KiMWE7tX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8060D10E1C2
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Jun 2025 22:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749765691; x=1781301691;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e6Zea6T4Q5ZknpHnET+5sfwuKVz94a74LYNRC3nxAKE=;
 b=KiMWE7tXRGJZZfOvCOacxIRtvHldCegqNPD3GX62Khtbb5adimag3fvV
 ujGrRaYBb6iclpCBfoCzQoc2c0G9SH61RtIrXcvCubwQQRCchO94tzvRg
 3l9j0QSJ/fsk3ro4C76uWomxhnqS1XdUOKvvixo+BIpRzes17v3B1tYq2
 r5RC/tKb8W/AVM6VXjaqOZDS0ZKkmfXW+IKNIalCbpBcHsimZVyjUIDVN
 Zk1hMzarL6IrP2QmQLkAHlm+hVkjdNFHGF2N7mGBI9IoIrJdkKja3cPdX
 veMzNL8/j3RKh5AzhWOV0vDJOWhQjREflxMKi8eVB610QDg26/Lbnzzu1 Q==;
X-CSE-ConnectionGUID: Y2IbrRrfQjmV/A2RhDNrgw==
X-CSE-MsgGUID: LA1yWg6BQXul2dMXyihZeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51078715"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="51078715"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 15:01:31 -0700
X-CSE-ConnectionGUID: TyYqUYLjSFSybJih8iR3GA==
X-CSE-MsgGUID: hVSM9dDWRlK0Hz6F41s4Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="148538096"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 15:01:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 15:01:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 15:01:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.76) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 15:01:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTzTaGx8IRBW5paZ3+3YKY6KcYE+aJS+Ij39OuXJ30RPr7pI72OYaXkCJFRUznm5DY/gQRQKDJ6zSKD/EST8v+HBOgS6APw/hFp8afymiSt1/1hAyNcg04UHjyB/7Jjr+UEmuN6bASw2WB537Dvrno5nQSH0UrPXy4qVr9JTghlTdWo2woXAX4mBEAhkBtv2NhniORAWxjziSBbweUmp9oBYAJoCmBRDO3rGdZ2lNR4tqQ1G5BGtcBKw9o7zJlQqWTr7yhm7SKNV8+iQ+UL7miaLpKMUSxLMMeuu6EqL6Xs+vbrC81FC80+hz/H9iShv05JSXsYtEDThAwU8Hk2V+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6Zea6T4Q5ZknpHnET+5sfwuKVz94a74LYNRC3nxAKE=;
 b=yjFl/ErRt5S+HJ2z5HlabjjDQ2ekgyMU+EcY/PqI1vTR+V7I2lZbwDZY/oF5n7/vZvOwMFQbR969yVVJ77yQgGxMEZJCFsXZFDfwGuJUIwhgP8xGnd8KWjMcT7lrjASjmH3YVKwM7NE0QU1JY/9jGyhFw8ADI5USqoDUB327vtJLmWL237L9TNeVNjIVs4F9wFiSX2GQfyjpK69jVSJiMrVFNdym3IRJT6MGWxMRape09YCUiYAekiTLnxmjp62WAgZ8F9PeP/Kor8u81CPANA9abuXu51JT3EM526RXLSY6Oxxn5Q6Yj6p8mfDoYmWQZjUmkwc4Y1dh1h2e9iXefQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6691.namprd11.prod.outlook.com (2603:10b6:303:20f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 22:01:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 22:01:27 +0000
Date: Thu, 12 Jun 2025 17:01:24 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/guc: Clean up of GuC 'CTL' defines
Message-ID: <7oht3tqf6ujmr35ti3tspdepy4nuafvfrvzz47oiix2njhhask@zty5d4x5s4jm>
References: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
 <20250611210553.3756700-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250611210553.3756700-2-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: fc21957c-2de7-4e43-8537-08dda9fcae13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cHxb76xZLt3PQs6HF4kVkC0+flKV5qzOwLHPs2vqcZQ3CSWfHul0TFN7Qpai?=
 =?us-ascii?Q?/vZGHCwmSE30PWyKZCaBgAiSrLZrutqjtrtiGs7FaL5McMiMnX4c3JzMx5Q6?=
 =?us-ascii?Q?QqZTrZ2GVZCegAkUsaV6aXbc5jExXWF8bG8ffB03MHZTIaYl5pgVEPOs7oEp?=
 =?us-ascii?Q?W767KJ8bwIcHwVqY2ac6UEix+yzoGXTDaqtuSSewYLZ5EhpJSKue81UBXxfN?=
 =?us-ascii?Q?s0nzRfM4FGq9oIGfuMJaVkWGJjQgpE/MJJdPYWmoK276ckCOUHeJbO6Z9Ead?=
 =?us-ascii?Q?F4Gm1wfsVfQzOyAoWrr6DYLs5LkPxhMcf+6SIej+Fip1rkHS3IxN8Q+TGeee?=
 =?us-ascii?Q?NSp1OQE6INrYaP/Scu4Ij/CPJ6jPyewvKTJwcveHFPxw3Np+vqiowHGjtl1L?=
 =?us-ascii?Q?OP9KdAbjWL1/squli4qMM7Subx9eITnvzH595/V65frwFFFu8qKhAONrw482?=
 =?us-ascii?Q?35j0Abd1cIcIjNMYn6dhIWNfUC+Yfc5cChRExKrlHuQDe1+I/1AOzCPXfqn7?=
 =?us-ascii?Q?tyABNykFlb3a8q2sDHGw5NcXoBY3iT4wIBry1gJ1X/uIVh2q0mpa3Oqi0eUN?=
 =?us-ascii?Q?o+yNP7usvUpgEWYPKw9q5n20L8+zgkKP4ote6pUyw6FtwQlulxULm75ojpGL?=
 =?us-ascii?Q?yLfjPuYo6GCOpLO84dMX+f0vFS0lb9lcXU/zEznakkYMzGWzHO+vlTNSs7Tx?=
 =?us-ascii?Q?jIykuAh05hsq+8P/Zu5A78vh1Sngti1LV7L4wjwwzgT3OEVdSU6rgObqhe4F?=
 =?us-ascii?Q?jNHj9IWkkv8gZeFUSPcLmqkSmtzDdm1d5fXJ0uU53KJVhP4qiCAd3l1N74Mf?=
 =?us-ascii?Q?nM9DEQM8YehAolnG/RpK/nPcEVLkScoYm5aySVPc6JVP/CbA5p4DhhUQYvQ0?=
 =?us-ascii?Q?9cmDeD5zuMvBjc0G6dletS9wuEyb2UMlXUZM7Y/GLtnqr3MQZxWrRwXTf7HM?=
 =?us-ascii?Q?LQNsG5o9b4B8IVvCk0o7DWLEYBcGlp+iM/O8GlnWY7fhSUMtmkMpZD3VYvIO?=
 =?us-ascii?Q?Eiq61vp3KGR2Qxv+llohCG98I0IiGy9V0727M2UqxMVnCg4lYcree/K16x95?=
 =?us-ascii?Q?FfNAJVRQMk4TLtIn2ee8tKlIrzCLj/ux6NFJ5zGSYYuvq9SMoQ3Ytmt0pG/S?=
 =?us-ascii?Q?RcgQaZdp1zinYkxuME+ZZ48OVRlLoKCv8agUcbAer4MN+KRts9nesF7KYLYU?=
 =?us-ascii?Q?H5XJBQO14bEKLYAuaAstGwgNW6wEq9jB50Zrx2pq2Z66HD9dkmE8N00Gs/EI?=
 =?us-ascii?Q?1HnoT+ZDhFxVRt1rmzK5+e/tpjleh9R0YXDfu/7GSH5YA242K7T2DyPHahik?=
 =?us-ascii?Q?L3HvntZn1rR32bt/mFkJGJB4Z2tHi+ydEcvRpfDYznm6c77zwdPhqAuEqg7e?=
 =?us-ascii?Q?HnhFBI5Mah8g7SCHPeSQmZt5jNWT8WBbH1dutbaKSPT9q0fWtQGR2OhJ8C83?=
 =?us-ascii?Q?FCo5LjHbbU8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FVtP1Z5VhnaOzFlPUoot0jDwnN2xC2Y2PM07XnyRO9sDRpL0Jga3/EQCapsQ?=
 =?us-ascii?Q?ta7h70pxUup/NyNgeuc1rg2LcQFZgKcumxmrCvzcdZnRjjNUOnmwCs8mEngF?=
 =?us-ascii?Q?f0Z+EIV3V5IpIMpf8wOMVae6JILtvDzMskEBM/mmo9KEVxgY3zXQgGHwqQtE?=
 =?us-ascii?Q?s1W6R8dly7os2Hws84e7WnPhu+pLCamks54PGBkbILFX++8Xp64e9SKFxErZ?=
 =?us-ascii?Q?Ogy5zsunDJzgYdCRm+q0Gr/L7ZDXdG6WIcSIjCQzoj8+rkJYAVKhRnLiCMLG?=
 =?us-ascii?Q?qgJxKttLerpitAvX1urQ4fWvrzxUA34Wb0avzq9abcFJ9Pk7Xb4urTpuhNc8?=
 =?us-ascii?Q?aFnEKD/RErH5h6OWhTB7LAXq5/iRuIuwPE4Xtiw38jME9Fhma6N1onkPfXxF?=
 =?us-ascii?Q?D4+zamhlaCEb5Yrv1p/r/rHNC9IOCwA95xZoK/VbDbJ7Dl8xsfEjc/Fvk7BI?=
 =?us-ascii?Q?uAlxHiONlwSAWgkGlZepe9EIsfhSyuGOMeVSl2+UFrFovUmsgw+uoL9O6+K8?=
 =?us-ascii?Q?wE+G5kQP4cwBCK+an0ZbL/VxyUHgH2bmLIOvVlgBpv0ki+NfsuE6r/q9MvKe?=
 =?us-ascii?Q?5RBOH5MU5bGgE5tdOxEjtLULdncB8efiZv1NM98mAAPx1B+k68hcZjZ/9O3s?=
 =?us-ascii?Q?jAy+KoGenuB9unuarZKbeIYYxYmXF81wl4vDrIcHd89tR4lYX25cXYVc+ofr?=
 =?us-ascii?Q?NnpCJbXx3qwCzWFLh7ECgiu+n0bYzbENu+WhuO1hx/utWcmlb1Bl5p6WOWR2?=
 =?us-ascii?Q?5keEPttjedzpQC5oGFyAsmS6aLiipGpZ/TfPjqsyPmwClAe8n0/pQ7+pYprB?=
 =?us-ascii?Q?OpWuEHkYuyDGPX5Vk5Tu4eXMesMnnsYaxeg0+q56CbX6YoPuNK55oqwBj2+A?=
 =?us-ascii?Q?UX3sBhUctR9eUEQvRNSlFGKL5OmCNi4n3nnTaCvvYkbonGfV/P/Z7Kf3ZaYF?=
 =?us-ascii?Q?LdcW9TBRkU0T9iMtanZBSkNQDYlJjuxim4st3j+/X+M4tVoT36V2ge2jp5RM?=
 =?us-ascii?Q?ujh7dlLox065noHDPyDJFQ0oWurXVHBlQTUo9bKdNqPZt8krHl5C7h7vQh9w?=
 =?us-ascii?Q?eB6V57DWj6w6Y7Die50CFCdJFHgLIlkvXTD1VIdC9mmBErXGdUo7KNQVdSWl?=
 =?us-ascii?Q?4rOaTxUZ+0L5Hb8rWj9yD/zdP8qL7IUYRH24DkKvTSQ9baDSJJ+/JhcMHRra?=
 =?us-ascii?Q?brEo7POHtxc6oiNjLdHWKz/P4N/jagTM3cdDUl0JKcGmE/lC5qHqWc7YRMai?=
 =?us-ascii?Q?5/m3McyXK9XapgENNsjujI/YZ/L4O/39iFvPrCtgcJnM+4C324zpDKZ9e8Eq?=
 =?us-ascii?Q?56xudw8qLkHKAEts/L3ZTYZVLBGg2s1/xsHnAYYEqNvpBkjm73ASHna5kDW3?=
 =?us-ascii?Q?BHfJoVDUC2lsIPy6c7MYWqO+sBuTh2JVTRXI4AV/Ki1iV7d+5rLc+q4hQAu/?=
 =?us-ascii?Q?QJCIleqN5Sj3ILKYugXv0zUzrx0oR37+hCRrA6HPByGQzwhxiJHXMv4zRmcc?=
 =?us-ascii?Q?DWpdrPydu3bVs/WAT+5AEjT0qQnkQA4ohWMp78eD0IARN/IQ46bmQg4QgGKx?=
 =?us-ascii?Q?JshdC4d+on2Y9x6oXzczkxOs/VYeBUHj633L1d/SUnqI3nWXrJF0rUVwk7km?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc21957c-2de7-4e43-8537-08dda9fcae13
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 22:01:27.5934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNnxsXFLfIMFPZJyKbraH/Uh8IcEcA91KFKXwHE6Lk04cbi2VJ7XDQuaIfBCDzF+bruwuDKCP3c79/BLBb+rSejCr37wF76wAR0UbbhVXJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6691
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

On Wed, Jun 11, 2025 at 02:05:52PM -0700, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>All the field generation for the CTL defines (used for GuC init data)
>were hand-rolled rather than using FIELD_PREP/REG_GENMASK/BIT macros.
>
>Also, there were a bunch of macros defined for verbosity settings that
>were never used - it's just a number from 0 to 3, why do we need a define
>for each level!?
>
>So fix that all up.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
