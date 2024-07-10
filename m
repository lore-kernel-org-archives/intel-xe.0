Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3F1C38150
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 04:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFFA10E5BC;
	Wed, 10 Jul 2024 04:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Plp5gmuP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DAD10E5BC
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 04:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720584178; x=1752120178;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZOu+TEPV0CuFh/4+SjoQTKuR0rgDOnD1A0RMLOmZntk=;
 b=Plp5gmuPwxUKKkfBHzGq4aYl35prjYA8ecRMWOkv4yK0vIDXKY8tftc3
 Fzd3h/EyLOVzqq1Ffye+GAR92sDO8pLqRNBJLaebomoMBGay8eIpGTqlX
 unmCtFOZWN+MlhO52eyuM3bP73C/IVPaP//7Q8hBCtIyQrLY81dr6vvue
 /G7AHFscuYSpcJ5CJrvBefNzG/v+WZoBPsqTyrSbvTpMzvf/6yIYuFF5s
 /2Mu0OJowA7tOSZIAqJ/f3GDEFGz5XiMoYJ7xXE1FESorv6kkWWYQ4ftA
 xDnZ1tQ8kwao1a7Xwa+8NB0j5fA8B1IfgWw0pCbXBFaVeZvLZP/bZoCkh g==;
X-CSE-ConnectionGUID: wYoWqoV8SNGBZ0q11C48Xg==
X-CSE-MsgGUID: 2a+PRxvAS4S1NxL3aSrjcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28552717"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="28552717"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 21:02:57 -0700
X-CSE-ConnectionGUID: YcMYFBbxS2uLWDfcZI3VFQ==
X-CSE-MsgGUID: X1RXcYmtRaKvoiwUSQRV1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="78803609"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 21:02:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 21:02:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 21:02:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 21:02:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 21:02:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h32FPGfV7K9BKPgKE6YUgVJtrTuZ6pAT7KcCJCnwtmzmLZAaR8kVW3j6SaCLPji493PalWAp4ZXc3KxGYA4f8SjZYpV+LDIUwQd/2VSVbAYngjUdH2rM0yOE2Z9NMsrB2V3Sq0ysnnqx5axVSgLyTjU9IvQTpFz/eeP+gT8w6heVylTuc2SQnWQbGFMXz2gvC6tCHf/+Vnq0ZV+fZe/p8XUHuOFx/CwKiyISy3lvCw4G1RH1r7VJxQcmL9yIjtaYn5dNDipFHdRv0wLQ6twyuYmUyRubV9VNRqE2Ee/IcXXIM9HeCtBHXUUCJSr+ZDzkM5qDvXJvTbPTUFElc5BNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tN5Qxapx/Alhfokz1US3kcWnkkoAyWsqakFxWA+AOVg=;
 b=Q5tZxdwmGlt8z3UGXsq1se1ZX3nMyKlTyhh2xwtP/VuncGZHhh8ZqcWtw6a2pLVQArqpI9j3qBnZFhNXZUoNJVrfoEmeuFuee2qtduwzz9uT3lH+Gk9tFFFc9zS9DI8jeCa5w56zVy6qzKnbJgIplRVPpWHSC1FXI/PQtVzv6loO4yB8ZQR/kjT0E4197OCXV8pd6VpfALGjnoWMS19jlIGKQ3kXGq+KCG60lHbEAcAIIlpQIrfOvtOkLLETFgjyrqHogdAsfK0kLoUldQ6YgFoCKdDWeH6pocjrg2c+ajaXFld4fs6dHs5c0YW9I/1j0cUqpGHEmwpU3wrFqw727w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by BL1PR11MB6052.namprd11.prod.outlook.com (2603:10b6:208:394::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 04:02:46 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 04:02:46 +0000
Date: Wed, 10 Jul 2024 04:02:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <nirmoy.das@intel.com>,
 <farah.kassabri@intel.com>
Subject: Re: [PATCH v2 07/11] drm/xe: Add xe_guc_tlb_invalidation layer
Message-ID: <Zo4HummYXa1NjzlD@DUT025-TGLU.fm.intel.com>
References: <20240708040331.766264-1-matthew.brost@intel.com>
 <20240708040331.766264-8-matthew.brost@intel.com>
 <0fcfed77-b9d5-4716-8adc-d18569788c64@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fcfed77-b9d5-4716-8adc-d18569788c64@intel.com>
X-ClientProxiedBy: SJ0PR05CA0155.namprd05.prod.outlook.com
 (2603:10b6:a03:339::10) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|BL1PR11MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: c0cd836e-acfa-4ce8-b8e7-08dca0952832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?I2Dba6jShaV1heyTZ5099p/0jJbse1g41JozRAGVmzFJIBSXnm3prqw5Q7?=
 =?iso-8859-1?Q?wIT16HYewVHlZBDH0noukzkPmvCGN3F7vNC3jmDPUdqJrQPx8jCPO5zV+7?=
 =?iso-8859-1?Q?msuc8yBvvxynjjimpddppOUDMKIRzl0kzbkj2QIE+28BggRqKNvqmS+84s?=
 =?iso-8859-1?Q?XTBwPzNEAhxn84tn4nPJcallPygcaFK4tFjcrLgmcqWdRZt5rRPupFtXI1?=
 =?iso-8859-1?Q?ob6agzRJKN/bESsRN76UuY31P/vbp94IU78YnCfKS1Utdud8ccyfYH4czk?=
 =?iso-8859-1?Q?fNLy+/ouVQtpJ3Qs3j2oPiN9mzZCZ1MBtucZ9Hrd8OAcFXJ9Vzz2D/sMYv?=
 =?iso-8859-1?Q?G/OawDHXlHR0NvUvpms07KCBF5i5+oj5ff33lmcpooWpbzYu0wVvjWUIy7?=
 =?iso-8859-1?Q?emOklWqNAySG/r3Z9CcoKA9cd0YAF0pbIaqsNt3ETnX33bJiEuK4s0OoYm?=
 =?iso-8859-1?Q?9nsr47Ni8TEs6K4tlqa5M+PPGly2uKQRRJMr32XXCpDQIO4noaLmTUVyFv?=
 =?iso-8859-1?Q?8bwkDv5olVbz9rGbbd6ybwzGor8hW8cqPtq8iX0cVyxTuHc6rHxiYQZCDT?=
 =?iso-8859-1?Q?Kg/Zzo8ic9/uRla+9n43lR+7UT2Wu0qFpdzNMMVNbJeYv2hbO9a/5PQi2v?=
 =?iso-8859-1?Q?cG5vjAo7x4aU1PJimmiT4Oyi2zcSKi9V9XBiNYnwPQSFR7r4vpzcr+H8DP?=
 =?iso-8859-1?Q?q7ckLNEEbEibd1Sbeg4Jz2BJT8+dFKkGw+yM4hfkk5P/B750iz90PtYNaL?=
 =?iso-8859-1?Q?VwLFXfhgJXR5cArvcymog7/oPDck144YlqVX85E/+Vy4Q/1gHgOskfypQe?=
 =?iso-8859-1?Q?ABhxEdly4zvmxAadnp5t6/Ig0+OWDLzGgrWJwcsKEQQs8V3TLH4y7lgqGH?=
 =?iso-8859-1?Q?g6/ap5+5U+gyabBslZjc0EzKVT9f3HvjKcwo6BA8zDzehG5Mler+oh7BeM?=
 =?iso-8859-1?Q?FeZf4dRJy9IMPppHGX7svbufpLGzbHFdlDQW1pCLRDL9FRyqLAJJ3excnG?=
 =?iso-8859-1?Q?7BhhG1ev95t4eTiK7RwR6Gnn8DcDDRYOv5x98vKmWPTqwp0UGwchpNYpAo?=
 =?iso-8859-1?Q?WzPNLFO6m4Yl4x8WOXmmXBOiSSjwbCwd+78mwXFyz4yh/UfMEkPDXwCglg?=
 =?iso-8859-1?Q?CSqmiYGjlzqgD30Ctvb4Gfr/zKaOWRoOfgmAethJHoW1i4l7blfj/5ViBP?=
 =?iso-8859-1?Q?wrPRcxbqqn9hzcEGhM4cDXIabnIYr5LEnf0pFbmT1iGbo4WpbDx0unbl9m?=
 =?iso-8859-1?Q?xuZ05mgT+oOb7tqUcgAow/1dL4MHlLRVG7ELC8eVTjKYxBl8Xg9dhkaTOj?=
 =?iso-8859-1?Q?jUSjudKjSRRvMmkVTPwPZss9WyjPZFGEphOqKkT+Gy1B/qQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?D6Ty9Xm2S0kCcvWEbSXJhqiSg9ykXK9hONWf9ZG0y4r69saxdwW92g4rIq?=
 =?iso-8859-1?Q?3OHq0Gu6aL5yuJeYzXI6ylciSHmvpBwJwK+Z+QfovadR1qwuRJYxirUHYF?=
 =?iso-8859-1?Q?hWHlZR9X26ePCKPFsSR4SCNYOeSbrgCbYXywoGtO8QKfwrUMmAjEYZ6OEv?=
 =?iso-8859-1?Q?ULGjAkZ7BInn4lrcAFueQub+2rHbh9ZYDH0BOMmfavMhEJ0a/XAhRi/AHP?=
 =?iso-8859-1?Q?MYnM2Qk9QH5+hrqq3sjziX39QdU0sEp+PJTcxGGXPyLyXTfHumH5xcxqn5?=
 =?iso-8859-1?Q?VEVCjv83QjfbqfLDnE2UcNp65dezev5rBBGsqpxcVsQYajHz13ROzjMnsE?=
 =?iso-8859-1?Q?hMgnQrLzEnUuyHVQxSoEuIKfImjBQwwHZXY98GD16ZxbFs3BuC3fP4MIjT?=
 =?iso-8859-1?Q?EMab7PE7+h13jfq4e08HILzunkHTjmIITlWckguvxdy2M+Ey2VdbU82dY0?=
 =?iso-8859-1?Q?PG8y19FSMKxz8k2TZCw1OuO1xoUOO0OMLKT+DXrwmAr0hCzX4hGZmolI3N?=
 =?iso-8859-1?Q?FP2dGDMw6sCBiNUpBYlzI3Ul2qA01/v5c47UFwPklB6w+wFtynL4OimcuV?=
 =?iso-8859-1?Q?R9vsmu3xRQNgrM7X2zFC0pWJfvqUId2WNlih4dfEBCPq7HVj7r4sQ6sH7T?=
 =?iso-8859-1?Q?fgqmD6rhcyEGPQrkwk5sVbUCiJSnyFltRBqvcQDw+hzHxB0ADvbpY2CW/u?=
 =?iso-8859-1?Q?2cT5AAwDnhlQiVN/6CWSCwGHB0eODEGbfNbPhYvz4N5b/hMRbqvMxLoiKX?=
 =?iso-8859-1?Q?HLRg9aGjf9QthlqW1qQbEHjmCcVRJS+tDvlAEdBONybqSlLSCTOoTYsrs1?=
 =?iso-8859-1?Q?bQtRW9Y8ubMrvvIoBfx/pq/dKd4acc6tVqDZyZwizy0C+wrEaQqHhLn5zN?=
 =?iso-8859-1?Q?rDaB3oDwrx/vfTVUtAymM5rmxQ/NFYWvBZyPJWk3QKp5BOTE/iZGD+F7hb?=
 =?iso-8859-1?Q?JlhigIOwARjYVNyUirnyfFFRbsI3tYEnWkiGJU1kq3LwllH9flzVId0h2a?=
 =?iso-8859-1?Q?DS438werz82bHpK3tJtkBxRFl3SczbA5gAAm/g6SB5H1QIJ6cyHCUeLiAo?=
 =?iso-8859-1?Q?oEGJ+usWRoO9Pwf1Tf80yCSdUFR/28lUrcbCppQEPcyOkEvUCdCkDkIBic?=
 =?iso-8859-1?Q?Uq8y7Hw3EjjEvmG8S3m8ssMfl5CrmMuVQiLjn4+qI1HBULCLMHWBrwhh0/?=
 =?iso-8859-1?Q?vMAxKDXO89qy07fdoNMNWgU1/VPTjcSiWMPBG5XdVgkqzSRRqe3KteuUdR?=
 =?iso-8859-1?Q?SCdTBtS5sUEcwGa8ybbQBg8MwFrjw302Kd4A8eWjpG4cnlJ8bGut682sjm?=
 =?iso-8859-1?Q?D9+jWAeKugsGRgVksocKlmqxM/p0Zy5W9CX5+QeAkL5KrwlxO6JO0LTeTD?=
 =?iso-8859-1?Q?dre/DXQUn04ag4Aq+gGsCIYshYx0EtgQ/1R/IveIY1ou+cy7c20GVjdPkg?=
 =?iso-8859-1?Q?GJfrlvjQtVciIAY8Yq0gwQujxX4F9ujTBgoXHRU0SkTl+p+G3ySryJpLfR?=
 =?iso-8859-1?Q?tnZfM86unidJPIrukDOb//fO6TqisYLOLJk4acgRQCRkf0RK9p64VE9x4L?=
 =?iso-8859-1?Q?ifge1a82cVw2SCaQZqIEWZLEaTFNenUUf/Xe56bpLrZTLgSyta8H6TdbJh?=
 =?iso-8859-1?Q?aPnrPDcUXuaUCaEHvDgsFXvbNVnuA7jkSmrVtS3gvWyZ7qR1zNAhOXlw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0cd836e-acfa-4ce8-b8e7-08dca0952832
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 04:02:46.5899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVbSAwzpRX4YwTxIAMW3X4r4IFioThpvID8gVmmDU3S/sl2b9uPAceD4UFlxs+9PpznS8+OvpyRGtlojH5M4Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6052
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

On Tue, Jul 09, 2024 at 11:31:59PM +0200, Michal Wajdeczko wrote:
> Hi Matt,
> 
> few nits (as usual)
> 
> On 08.07.2024 06:03, Matthew Brost wrote:
> > Move GuC specific TLB invalidation into dedicated layer.
> > 
> > v2:
> >  - Remove XXX comment
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile                   |   1 +
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 121 +--------------
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |   4 +-
> >  .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  13 ++
> >  drivers/gpu/drm/xe/xe_gt_types.h              |   2 +
> >  drivers/gpu/drm/xe/xe_guc_ct.c                |   2 +-
> >  drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c  | 143 ++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h  |  18 +++
> >  8 files changed, 186 insertions(+), 118 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 628c245c4822..21f4ddf1a946 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -83,6 +83,7 @@ xe-y += xe_bb.o \
> >  	xe_guc_log.o \
> >  	xe_guc_pc.o \
> >  	xe_guc_submit.o \
> > +	xe_guc_tlb_invalidation.o \
> >  	xe_heci_gsc.o \
> >  	xe_hw_engine.o \
> >  	xe_hw_engine_class_sysfs.o \
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index 79d1ed138db5..4b7b5f8205f9 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -7,13 +7,12 @@
> >  
> >  #include "xe_gt_tlb_invalidation.h"
> >  
> > -#include "abi/guc_actions_abi.h"
> >  #include "xe_device.h"
> >  #include "xe_force_wake.h"
> >  #include "xe_gt.h"
> >  #include "xe_gt_printk.h"
> > -#include "xe_guc.h"
> >  #include "xe_guc_ct.h"
> > +#include "xe_guc_tlb_invalidation.h"
> >  #include "xe_mmio.h"
> >  #include "xe_sriov.h"
> >  #include "xe_trace.h"
> > @@ -85,6 +84,7 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
> >  	spin_lock_init(&gt->tlb_invalidation.fence_lock);
> >  	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
> >  			  xe_gt_tlb_fence_timeout);
> > +	gt->tlb_invalidation.ops = xe_guc_tlb_invalidation_get_ops(&gt->uc.guc);
> 
> what about force_execlist=true mode ?
> 

I do this in the follow up patch [1] in which I add support for multiple
TLB invalidaion clients and allow null ops or individual ops. Open to
reworking how I do that, but take a look their first. 

[1] https://patchwork.freedesktop.org/patch/602561/?series=135809&rev=2

> shouldn't we have nop_ops (or direct_ops) and let the GuC code replace
> ops when selected/in use ?
> 
> >  
> >  	return drmm_mutex_init(&gt_to_xe(gt)->drm,
> >  			       &gt->tlb_invalidation.seqno_lock);
> > @@ -157,97 +157,16 @@ static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
> >  	return seqno_recv >= seqno;
> >  }
> >  
> > -static int send_tlb_invalidation(struct xe_guc *guc, u32 *action, int len)
> > -{
> > -	struct xe_gt *gt = guc_to_gt(guc);
> > -
> > -	xe_gt_assert(gt, action[1]);	/* Seqno */
> > -	lockdep_assert_held(&gt->tlb_invalidation.seqno_lock);
> > -
> > -	/*
> > -	 * XXX: The seqno algorithm relies on TLB invalidation being processed
> > -	 * in order which they currently are, if that changes the algorithm will
> > -	 * need to be updated.
> > -	 */
> > -
> > -	return xe_guc_ct_send(&guc->ct, action, len,
> > -			      G2H_LEN_DW_TLB_INVALIDATE, 1);
> > -}
> > -
> > -#define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> > -		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
> > -		XE_GUC_TLB_INVAL_FLUSH_CACHE)
> > -
> >  static int send_tlb_invalidation_ggtt(struct xe_gt *gt, int seqno)
> >  {
> > -	u32 action[] = {
> > -		XE_GUC_ACTION_TLB_INVALIDATION,
> > -		seqno,
> > -		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
> > -	};
> > -
> > -	return send_tlb_invalidation(&gt->uc.guc, action, ARRAY_SIZE(action));
> > +	return gt->tlb_invalidation.ops->tlb_invalidation_ggtt(gt, seqno);
> >  }
> >  
> >  static int send_tlb_invalidation_ppgtt(struct xe_gt *gt, u64 start, u64 end,
> >  				       u32 asid, int seqno)
> >  {
> > -#define MAX_TLB_INVALIDATION_LEN	7
> > -	u32 action[MAX_TLB_INVALIDATION_LEN];
> > -	int len = 0;
> > -
> > -	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
> > -	action[len++] = seqno;
> > -	if (!gt_to_xe(gt)->info.has_range_tlb_invalidation) {
> > -		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
> > -	} else {
> > -		u64 orig_start = start;
> > -		u64 length = end - start;
> > -		u64 align;
> > -
> > -		if (length < SZ_4K)
> > -			length = SZ_4K;
> > -
> > -		/*
> > -		 * We need to invalidate a higher granularity if start address
> > -		 * is not aligned to length. When start is not aligned with
> > -		 * length we need to find the length large enough to create an
> > -		 * address mask covering the required range.
> > -		 */
> > -		align = roundup_pow_of_two(length);
> > -		start = ALIGN_DOWN(start, align);
> > -		end = ALIGN(end, align);
> > -		length = align;
> > -		while (start + length < end) {
> > -			length <<= 1;
> > -			start = ALIGN_DOWN(orig_start, length);
> > -		}
> > -
> > -		/*
> > -		 * Minimum invalidation size for a 2MB page that the hardware
> > -		 * expects is 16MB
> > -		 */
> > -		if (length >= SZ_2M) {
> > -			length = max_t(u64, SZ_16M, length);
> > -			start = ALIGN_DOWN(orig_start, length);
> > -		}
> > -
> > -		xe_gt_assert(gt, length >= SZ_4K);
> > -		xe_gt_assert(gt, is_power_of_2(length));
> > -		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
> > -						    ilog2(SZ_2M) + 1)));
> > -		xe_gt_assert(gt, IS_ALIGNED(start, length));
> > -
> > -		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> > -		action[len++] = asid;
> > -		action[len++] = lower_32_bits(start);
> > -		action[len++] = upper_32_bits(start);
> > -		action[len++] = ilog2(length) - ilog2(SZ_4K);
> > -	}
> > -
> > -	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
> > -
> > -	return send_tlb_invalidation(&gt->uc.guc, action, len);
> > +	return gt->tlb_invalidation.ops->tlb_invalidation_ppgtt(gt, start, end,
> > +								asid, seqno);
> >  }
> >  
> >  static void xe_gt_tlb_invalidation_fence_prep(struct xe_gt *gt,
> > @@ -278,10 +197,6 @@ static void xe_gt_tlb_invalidation_fence_prep(struct xe_gt *gt,
> >  		gt->tlb_invalidation.seqno = 1;
> >  }
> >  
> > -#define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> > -		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
> > -		XE_GUC_TLB_INVAL_FLUSH_CACHE)
> > -
> >  static int __xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt,
> >  					 struct xe_gt_tlb_invalidation_fence *fence)
> >  {
> > @@ -420,7 +335,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> >   *
> >   * Update recv seqno, signal any GT TLB invalidation fences, and restart TDR
> >   */
> > -static void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt, int seqno)
> > +void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt, int seqno)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	struct xe_gt_tlb_invalidation_fence *fence, *next;
> > @@ -469,30 +384,6 @@ static void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt, int seqno)
> >  	spin_unlock_irqrestore(&gt->tlb_invalidation.pending_lock, flags);
> >  }
> >  
> > -/**
> > - * xe_guc_tlb_invalidation_done_handler - TLB invalidation done handler
> > - * @guc: guc
> > - * @msg: message indicating TLB invalidation done
> > - * @len: length of message
> > - *
> > - * Parse seqno of TLB invalidation, wake any waiters for seqno, and signal any
> > - * invalidation fences for seqno. Algorithm for this depends on seqno being
> > - * received in-order and asserts this assumption.
> > - *
> > - * Return: 0 on success, -EPROTO for malformed messages.
> > - */
> > -int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > -{
> > -	struct xe_gt *gt = guc_to_gt(guc);
> > -
> > -	if (unlikely(len != 1))
> > -		return -EPROTO;
> > -
> > -	xe_gt_tlb_invalidation_done_handler(gt, msg[0]);
> > -
> > -	return 0;
> > -}
> > -
> >  static const char *
> >  invalidation_fence_get_driver_name(struct dma_fence *dma_fence)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > index cbf49b3d0265..ee532ad64aac 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > @@ -11,7 +11,6 @@
> >  #include "xe_gt_tlb_invalidation_types.h"
> >  
> >  struct xe_gt;
> > -struct xe_guc;
> >  struct xe_vma;
> >  
> >  int xe_gt_tlb_invalidation_init(struct xe_gt *gt);
> > @@ -23,11 +22,12 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> >  int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> >  				 struct xe_gt_tlb_invalidation_fence *fence,
> >  				 u64 start, u64 end, u32 asid);
> > -int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> >  
> >  void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
> >  				       struct xe_gt_tlb_invalidation_fence *fence);
> >  
> > +void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt, int seqno);
> > +
> >  static inline void
> >  xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
> > index 934c828efe31..1abb8692d14b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
> > @@ -8,6 +8,8 @@
> >  
> >  #include <linux/dma-fence.h>
> >  
> > +struct xe_gt;
> > +
> >  /**
> >   * struct xe_gt_tlb_invalidation_fence - XE GT TLB invalidation fence
> >   *
> > @@ -25,4 +27,15 @@ struct xe_gt_tlb_invalidation_fence {
> >  	ktime_t invalidation_time;
> >  };
> >  
> > +/**
> > + * struct xe_gt_tlb_invalidation_ops - Xe GT TLB invalidation operations
> > + */
> > +struct xe_gt_tlb_invalidation_ops {
> > +	/** @tlb_invalidation_ggtt: TLB invalidation GGTT */
> > +	int (*tlb_invalidation_ggtt)(struct xe_gt *gt, int seqno);
> > +	/** @tlb_invalidation_ppgtt: TLB invalidation PPGTT */
> > +	int (*tlb_invalidation_ppgtt)(struct xe_gt *gt, u64 start, u64 end,
> > +				      u32 asid, int seqno);
> 
> do we need full "tlb_invalidation" prefix here ?
> maybe just:
> 
> 	int (*ggtt)(struct xe_gt *gt, int seqno);
> 	int (*ppgtt)(struct xe_gt *gt, u64 start, u64 end,
> 
> as this will used like:
> 
> 	return gt->tlb_invalidation.ops->ggtt(gt, seqno);
> or
> 	return gt->tlb_invalidation.ops->ppgtt(gt, start, end,...
> 

Good idea, will change.

> 
> > +};
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index fb280f058cdc..4b9740a68457 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -169,6 +169,8 @@ struct xe_gt {
> >  
> >  	/** @tlb_invalidation: TLB invalidation state */
> >  	struct {
> > +		/** @tlb_invalidation.ops: TLB invalidation ops */
> > +		const struct xe_gt_tlb_invalidation_ops *ops;
> >  		/** @tlb_invalidation.seqno_lock: TLB invalidation seqno lock */
> >  		struct mutex seqno_lock;
> >  		/**
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 7d2e937da1d8..b09423590f62 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -23,10 +23,10 @@
> >  #include "xe_gt_printk.h"
> >  #include "xe_gt_sriov_pf_control.h"
> >  #include "xe_gt_sriov_pf_monitor.h"
> > -#include "xe_gt_tlb_invalidation.h"
> >  #include "xe_guc.h"
> >  #include "xe_guc_relay.h"
> >  #include "xe_guc_submit.h"
> > +#include "xe_guc_tlb_invalidation.h"
> >  #include "xe_map.h"
> >  #include "xe_pm.h"
> >  #include "xe_trace_guc.h"
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
> > new file mode 100644
> > index 000000000000..b6fd61bb77ba
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
> > @@ -0,0 +1,143 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#include "abi/guc_actions_abi.h"
> > +
> > +#include "xe_assert.h"
> > +#include "xe_device.h"
> > +#include "xe_gt.h"
> > +#include "xe_gt_printk.h"
> > +#include "xe_gt_tlb_invalidation.h"
> > +#include "xe_guc.h"
> > +#include "xe_guc_ct.h"
> > +#include "xe_guc_tlb_invalidation.h"
> > +
> > +static int send_tlb_invalidation(struct xe_guc *guc, u32 *action, int len)
> 
> const u32 *action
> 
> and len should be unsigned
> 

Yep.

> > +{
> > +	struct xe_gt *gt = guc_to_gt(guc);
> > +
> > +	xe_gt_assert(gt, action[1]);	/* Seqno */
> 
> it would be nice to have that "1" as part of the GuC ABI,
> maybe at least as:
> 
> #define H2G_TLB_INVALIDATE_MSG_1_SEQNO	GUC_HXG_REQUEST_MSG_n_DATAn
> 
> xe_gt_assert(gt, FIELD_GET(H2G_TLB_INVALIDATE_MSG_1_SEQNO, action[1]);
> 

Yep.

> > +	lockdep_assert_held(&gt->tlb_invalidation.seqno_lock);
> > +
> > +	return xe_guc_ct_send(&guc->ct, action, len,
> > +			      G2H_LEN_DW_TLB_INVALIDATE, 1);
> > +}
> > +
> > +#define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> > +		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
> > +		XE_GUC_TLB_INVAL_FLUSH_CACHE)
> 
> maybe it's time to convert SHIFT-based GuC ABI definitions into
> mask-based and use FIELD_PREP as we do elsewhere
> 

Can do this. Will likely do this in a patch after this one as existing
code uses this. Can always squash that patch into this one if preferred
too.

> > +
> > +static int send_tlb_invalidation_ggtt(struct xe_gt *gt, int seqno)
> 
> shouldn't we take "guc" instead of "gt" ? see below
>

Nope as this a vfunc.
 
> > +{
> > +	u32 action[] = {
> > +		XE_GUC_ACTION_TLB_INVALIDATION,
> > +		seqno,
> > +		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
> > +	};
> > +
> > +	return send_tlb_invalidation(&gt->uc.guc, action, ARRAY_SIZE(action));
> > +}
> > +
> > +static int send_tlb_invalidation_ppgtt(struct xe_gt *gt, u64 start, u64 end,
> > +				       u32 asid, int seqno)
> > +{
> > +#define MAX_TLB_INVALIDATION_LEN	7
> 
> this should be defined as part of the GuC ABI
>

Sure. 
 
> > +	u32 action[MAX_TLB_INVALIDATION_LEN];
> > +	int len = 0;
> > +
> > +	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
> > +	action[len++] = seqno;
> > +	if (!gt_to_xe(gt)->info.has_range_tlb_invalidation) {
> > +		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
> > +	} else {
> > +		u64 orig_start = start;
> > +		u64 length = end - start;
> > +		u64 align;
> > +
> > +		if (length < SZ_4K)
> > +			length = SZ_4K;
> > +
> > +		/*
> > +		 * We need to invalidate a higher granularity if start address
> > +		 * is not aligned to length. When start is not aligned with
> > +		 * length we need to find the length large enough to create an
> > +		 * address mask covering the required range.
> > +		 */
> > +		align = roundup_pow_of_two(length);
> > +		start = ALIGN_DOWN(start, align);
> > +		end = ALIGN(end, align);
> > +		length = align;
> > +		while (start + length < end) {
> > +			length <<= 1;
> > +			start = ALIGN_DOWN(orig_start, length);
> > +		}
> > +
> > +		/*
> > +		 * Minimum invalidation size for a 2MB page that the hardware
> > +		 * expects is 16MB
> > +		 */
> > +		if (length >= SZ_2M) {
> > +			length = max_t(u64, SZ_16M, length);
> > +			start = ALIGN_DOWN(orig_start, length);
> > +		}
> > +
> > +		xe_gt_assert(gt, length >= SZ_4K);
> > +		xe_gt_assert(gt, is_power_of_2(length));
> > +		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
> > +						    ilog2(SZ_2M) + 1)));
> > +		xe_gt_assert(gt, IS_ALIGNED(start, length));
> > +
> > +		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> > +		action[len++] = asid;
> > +		action[len++] = lower_32_bits(start);
> > +		action[len++] = upper_32_bits(start);
> > +		action[len++] = ilog2(length) - ilog2(SZ_4K);
> > +	}
> > +
> > +	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
> > +
> > +	return send_tlb_invalidation(&gt->uc.guc, action, len);
> > +}
> > +
> > +static const struct xe_gt_tlb_invalidation_ops guc_tlb_invalidation_ops = {
> > +	.tlb_invalidation_ppgtt = send_tlb_invalidation_ppgtt,
> > +	.tlb_invalidation_ggtt = send_tlb_invalidation_ggtt,
> > +};
> 
> maybe it's overkill, but what about using the following code layout:
> 
> // pure GuC code
> static int guc_send_tlb_invalidation(guc, action, len)
> {
> }
> 
> // pure GuC code
> static int guc_send_tlb_invalidation_ggtt(guc, seqno)
> {
> 	return guc_send_tlb_invalidation(guc, ...);
> }
> 
> // ops glue code
> static int tlb_invalidation_ggtt_by_guc(gt, seqno)
> {
> 	return guc_send_tlb_invalidation_ggtt(guc, ...);
> }
> 
> const struct xe_gt_tlb_invalidation_ops guc_tlb_invalidation_ops = {
> 	.ggtt = tlb_invalidation_ggtt_by_guc,
> };
> 

I'm going lean towards overkill.

> 
> > +
> > +/**
> > + * xe_guc_tlb_invalidation_get_ops - Get Guc TLB invalidation ops
> > + * @guc: guc
> > + *
> > + * Return: xe_gt_tlb_invalidation_ops for GuC TLB invalidation
> > + */
> > +const struct xe_gt_tlb_invalidation_ops*
> > +xe_guc_tlb_invalidation_get_ops(struct xe_guc *guc)
> 
> since we don't use "guc" here and don't have any logic behind this
> function, so maybe easier/cleaner would be just to expose ops directly
> in the header as:
> 
> extern const struct xe_gt_tlb_invalidation_ops guc_tlb_invalidation_ops;
>

No. I think my idea was in this layer we could detect the GuC version
and potentially install a different set of vfuncs.

As I type this we probably want a different set of vfunc based on
xe->info.has_range_tlb_invalidation in the current code base.
 
> or since we may want to postpone GuC ops registration until we know we
> will use the GuC, expose function in xe_gt_tlb_invalidation.h:
> 
> void xe_gt_tlb_invalidation_set_ops(
> 	struct xe_gt *gt,
> 	const struct xe_gt_tlb_invalidation_ops *ops);
> 

I think this probably overkill but something to keep in mind if we need
to decouple setting the ops from TLB invalidation init (e.g. we don't
know which set of ops to install until a later point in the driver
load).

> > +{
> > +	return &guc_tlb_invalidation_ops;
> > +}
> > +
> > +/**
> > + * xe_guc_tlb_invalidation_done_handler - GuC TLB invalidation done handler
> > + * @guc: guc
> > + * @msg: message indicating TLB invalidation done
> > + * @len: length of message
> > + *
> > + * Parse seqno of TLB invalidation, 
> 
> only this part seems to be valid, all below belongs more to the
> description of the xe_gt_tlb_invalidation_done_handler() that maybe we
> should explicitly refer to ?
>

Let me rewrite this kernel doc as it is just copy / paste that doesn't
really apply.
 
> > wake any waiters for seqno, and signal any
> > + * invalidation fences for seqno. Algorithm for this depends on seqno being
> > + * received in-order and asserts this assumption.
> > + *
> > + * Return: 0 on success, -EPROTO for malformed messages.
> > + */
> > +int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > +{
> > +	struct xe_gt *gt = guc_to_gt(guc);
> > +
> > +	if (unlikely(len != 1))
> 
> this magic "1" should be part of the GuC ABI
>

Sure.
 
> > +		return -EPROTO;
> > +
> > +	xe_gt_tlb_invalidation_done_handler(gt, msg[0]);
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h
> > new file mode 100644
> > index 000000000000..44408aae6955
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_GUC_TLB_INVALIDATION_H_
> > +#define _XE_GUC_TLB_INVALIDATION_H_
> > +
> > +struct xe_guc;
> 
> forward decls should be _after_ any includes
>

Yep.
 
> > +
> > +#include <linux/types.h>
> > +
> > +const struct xe_gt_tlb_invalidation_ops*
> > +xe_guc_tlb_invalidation_get_ops(struct xe_guc *guc);
> > +
> > +int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > +
> > +#endif	/* _XE_GUC_TLB_INVALIDATION_H_ */
> 
> IIRC in Xe we don't use decorations for closing #endif of include guard

Wiil delete.

Matt
