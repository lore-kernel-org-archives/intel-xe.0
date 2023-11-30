Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA93C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 17:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0D710E750;
	Thu, 30 Nov 2023 17:46:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305C410E750
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 17:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701366376; x=1732902376;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jvQ2FnXdjeDS9Eu+dHeCpqoSxdmFHuPTURqVSXMGifc=;
 b=HaCn9qfvVvpFQ/l+P5kMzyUU8vk29x5rlInzihxiHHZlez7NR8QqHpDT
 EKug6UYhZMAg5wvsMzW6hPd/h/CcRIggvPzkk/SsksPoiDHFKOW/Xz4C3
 wR0ZTO9L4Q812kK425P7JWOso6bAfk2MYiXFYzCCgOe7SmUl0F4o6Tp90
 2gC7TO0uj0ew1N6dCreYtiYks5822CjMzWOQDQuuYpILtTvNefmriZXaY
 Bdfi2vJFStXLTiooQupElCP1fqXGqWwiLKb2oYYmniF6xrXUJLRlcP4Ve
 eP+H0SOZPkbkQlh40G2mbkPJXQJPtyTkaVa9ny+/Wu/Q5Tmd9c11enaw7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="248932"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="248932"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 09:46:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="17481222"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 09:46:16 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 09:46:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 09:46:14 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 09:46:14 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 09:46:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0ZPnnHw5Cic0fu2N0J17v+3D+HmbVllQ4+aPzQBrU8DidlQKS0WaZyzWKnBqM8CmhNZtVfuHHQELUbdtuG5UUG6njnl3NlLscbaDi4O86QBOjJzCOuPaX9FTGLalhRKRQdcKe5fJlOwlESHXpXuAvruaAGESBAAWTjC8xjV6KegsI4flWPX34f4MO7dYtJuDoMfkmX2qYWrchDzX+V3EEle/dsHsRGhtmJU9cF4/31u5LvVK1xPYbDw0GxnJHxQI89CqOcS/et7zgFhAIryRlPz71RtKGTqtNrUQMCNVAJbOClTVz+JjlY6W9VAa3fmN7vTKxd92J0QS6scBMfWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6pOnB2GQTwHGKAmhS6pmcUrZ3isgaY8F0O1XnzMhms=;
 b=jx+nlHGKKchEl0+JYeygqbwU2RK32CFiwfnOTwrTMfQRgLJ7UVvLIod5lJ9S5zLxHXibr0SerCqgs6ZgjYZKxe/mLM2+D4ysAzft6JbNUeSfh740+mIX2YapgseQwYguKLYN5517N3eXKLF9Qz17eLT8Frf0Ck90TIFHzdQpu0IOZSUXX66EBqbKv+56Mn5y4WH8rH49LhypCAprSs+vy0igi/5KibfKuVMwSdExEA5QOq1fmK74m8p+jQZTEcoKTA37wjAQff+royWQGrmD3fnYWgKifkHCAXf+ZbsqKV63rLIwJC6jYqJfKzxzKikeV1Xaz8QrrFBEKC/60qG3cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4537.namprd11.prod.outlook.com (2603:10b6:303:5d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 17:46:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.023; Thu, 30 Nov 2023
 17:46:11 +0000
Date: Thu, 30 Nov 2023 11:46:08 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <uuv67u4h4mrned6xsdyvyknzlau4t4faxfbn3wdqs6ect236nu@fp3263ivgjfv>
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
 <20231129214509.1174116-7-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231129214509.1174116-7-michal.winiarski@intel.com>
X-ClientProxiedBy: BYAPR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:74::38) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4537:EE_
X-MS-Office365-Filtering-Correlation-Id: a376dcd4-1b93-440e-7670-08dbf1cc3d99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cow9lzbI8fkXJ8MYpRERC1yFpDMCwAaN2hicIJlPkZFcgW+2bp6BhwDDLTqgKC6LR4IB1CLs4XZuQi0WXgTU8nojTZQ59thwI9Fclm5RRPKlufSW4GdjdJXlp66CG13xiC+FV6mbD+ROj6BSA17BRsdj2CFmWoAFaENfB7MIuMQFpT9bY90Za5MOoki8Vq8hhOCWCUL87rMcEKfKhcJoYS65nQMrFUqp0WpMgYvo2/ec9kA4rzDsFuKz0em4DQPF0TYX00WP3DZTwbyc+546Xj50DBozrAnPDw9rv9OfZ56NoAWJKMNrX+4/wm+nFxwbOzRvWJmD2rDgh8xyvplZ2Nj8shtszRz4J1Vqeiu6pdj1+DxVOFpR/rPLE/Au7C2yqBpKS3/gV15rLiVZ5Wct2y1l1I5Ahjxj0KSwrrUdwow0TDs+Y2gmM1kVUz+myh0vTs9vVEg5Opvj6BCoT2/KwEjODpoqg+yYmX1sqqYOwBkKj0zXgDVFAfZg0m4oZZvgj2ND+7OjcZQUCILtCpZNkOnzcNp7aNouldgzpR+rp2yfrpqts2N2DItB2hyoGvuf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(83380400001)(82960400001)(38100700002)(26005)(8676002)(8936002)(4326008)(86362001)(6506007)(9686003)(6512007)(6862004)(478600001)(6486002)(6666004)(66556008)(66946007)(316002)(66476007)(66899024)(6636002)(33716001)(2906002)(41300700001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1FRVXo0cGdaVkhSRmY4bkkzUUNzWi94TUpuNnVUaDJQSGl5T2RMRjRGbmNN?=
 =?utf-8?B?SG1zNGVHL2puT2lvY2pvNjh4NG9aSFY2elBDamg3OW1YZW9FbUQyem9rSVpJ?=
 =?utf-8?B?OVRVS1NDQStQc2w5aDRYN3FMdE1YRzE1RnRYMWRsUUkzWEI2em40eXgwU0sz?=
 =?utf-8?B?Q29haS9kUWl6OUVkWDJUaGREd2FlTy9DQUdWQnJQSFpuTjFlTStIeEZ6NmZ2?=
 =?utf-8?B?NWJEYUdLallPRGZsOWxjVWE2WDlwRFQyWEs5Y1NaMFZUQlJjMSt3YUNRT0dw?=
 =?utf-8?B?ZVlJOVRrVG5FTnp2WDRJVXVGbFdONTlIUWVrclltakg0RklvWUdnOENUd1lk?=
 =?utf-8?B?TzNtL0ovS3hvbzUrTUFvczUvNHJJRFVBUnVxd21mZ29hYjcyNE5xUHBzZVF4?=
 =?utf-8?B?OVBtYVFzQjdrM05lbFJXY282TC9sdmpOWXRSRkRUV3NDY0dSU3FBOHVxM0hp?=
 =?utf-8?B?aDdFZHdEYUlXU1JaQ1NNNEZRb0hnR3oyUTRmMkZCRlJzSU5zTGplRWxqTVdy?=
 =?utf-8?B?Q3hlS1E3ZmVyUVpyZWRkaTc3OXBITk5aWHI1Yjl0SmVwbW5JWTV4a1pkRjJC?=
 =?utf-8?B?MmVlMUgwWmFBQm1raEMwZjVwKzZNeFY2VjFQTThHbmdVUGJuV1pUc0tjZ1Vj?=
 =?utf-8?B?cklzUmRIVmsxdXBrbVZMUkxRWlVHK0FMQnBNUlhkbWEvNkRqZ2g4SjRqSlhk?=
 =?utf-8?B?OGx1bVlORGE4MVQvaEVmV2o4dnIwSkJhb3ZqZ1JLRHgwM3MzRU95NUwxVGt4?=
 =?utf-8?B?ZjdkUHZYdWRMS0dJRThqNUF2UDZoZm0zbEJ3NVBldjdYblhCZTdEajFsTlJQ?=
 =?utf-8?B?L2NCU2ZwQjdiYzUzTEh0NEhOZVJzTzllbXBsTGZpN1Nic1pQRi84SW5rZ3Ir?=
 =?utf-8?B?dzhuS3haY2htUjlDK0w1R3dCVXMwUXJHenFaU0J5L2ROVFNEU3hzOVVTM2hl?=
 =?utf-8?B?WGZKWkc2eDQ3cnpyK0RtUERaNWx3MnlYWGhiUVlrenVQZHVLQVBIQ01naXVY?=
 =?utf-8?B?RFplZGpGRHIyVE1Md0NYaGlETUtoU2JVQmdncy83eHlMOWZFYkpPS2thaFg1?=
 =?utf-8?B?QXpBRGdBS3Blc3lRZ2pEemVsTWJMT3hPS3dMWURiSkdYQzBzZVBsSGhPYStn?=
 =?utf-8?B?SDh6aGt4MUNlUmhqcFdjbXlST0pYMTRsVllTUk4wVURxUGY0TzNWOG1JckdS?=
 =?utf-8?B?RExEOHhOVHBvWkEvampEYXduK1VJVE5lVHJLMlBHOHgwdlFtR2RQcFNPZFlh?=
 =?utf-8?B?YTF0RElNakRrV3BEU2JvT1lVYUhOMG9meHZKSWMzamJoTGJJVS80UlBZZXky?=
 =?utf-8?B?aEwrb1BxZHdFNDJwSXFacWswZ1hSOVQ4TlkzZi9CQWVZNjh4RFdNWmpTYllp?=
 =?utf-8?B?S01RdTYzRzlZSWpNZUhmNXE0bnlQWTZ3YTZEODJEWnVtRUdwQkgybUc3eWE2?=
 =?utf-8?B?NVc0azMzc01INmltclpsbHRmRy9yMnpFaVZtbWVBUXQvOUh4b0xKSTY1cVJt?=
 =?utf-8?B?clJWNm15SC9TVDY1QmhXenpDL2ovemtYQ2JBVENOcktvcHF1WjA0UWlDTkJQ?=
 =?utf-8?B?U1FPMnN2VlFOSTU2YlJ1WDh5RVpzS3F2THpRUHloY0RodWRKcElnVng2akFm?=
 =?utf-8?B?UXBPL2NHWEtqYkVId05rcmVRSUJWb3VFTjd6K3N5UmZTTGhFNkZvMG9LNzNP?=
 =?utf-8?B?RXhwbnpBOS9HRHJvRHI2UVhwVlhIeVZyZ2premdjL3hsbWhoVDRKWEFURVlG?=
 =?utf-8?B?cWVwQnkzU3RMMkN4anZIY24rb3pCWmplNlBlaVZvVVJNSlVsRm9KRHVTbHBk?=
 =?utf-8?B?NTFSMkczeFFQVjhXUWVVcjZwV0orbU8rNjJmd0xQWWY0aVRaV0tkRGlManIx?=
 =?utf-8?B?bHhnYkxKLzFuUi8rdmFpaGtCbnpoaEwrWjZyRVVVMU9xVmQ4SVpUZW9wOHd0?=
 =?utf-8?B?YnBHT0crTUhLcExGS1hTK1lnMjNwRk1FVHhid1JKUlFaeG1zaWV1OU9IQ3Vo?=
 =?utf-8?B?ZjNxZzN1amV4OEErNFJET1l2amMwaGtJZTNWbkh0RHhqV1dVbVROem5zUU9s?=
 =?utf-8?B?L0ttV3Zodk5YL3BnVTVieFI2ckwwMy9hdWlmRDViZnpjZXo4YW1wek44c2pq?=
 =?utf-8?B?aVJPK0NZaHlqWTI2WUg2YlcrTGtybTg3bUphdENjb1R5TGVsMVJUbGIrZlFk?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a376dcd4-1b93-440e-7670-08dbf1cc3d99
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 17:46:11.3854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HiWcJcapKUTyygKybkHlzXzf4DPLLGoNP/oxqPl9wotH1nXt1kW7cDZNFlAeGtZNeA+tEFHqK/efDEIwVjiC0bxTtNtrfgl2L7AMiAtLQ3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4537
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [CI 07/14] drm/xe: Split xe_info_init
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 10:45:02PM +0100, Michał Winiarski wrote:
>Parts of xe_info_init are only dealing with processing driver_data.
>Extract it into xe_info_init_early to be able to use it earlier during
>probe.
>
>Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_pci.c |  1 +
> drivers/gpu/drm/xe/xe_pci.c       | 44 ++++++++++++++++++++++---------
> 2 files changed, 32 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index 306ff8cb35cb1..f2cdc9bb4612a 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -143,6 +143,7 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
> 		return -ENODEV;
>
> done:
>+	xe_info_init_early(xe, desc, subplatform_desc);
> 	xe_info_init(xe, desc, subplatform_desc);
>
> 	return 0;
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 074ed456eba6d..e5f1fefcee120 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -535,6 +535,35 @@ static void handle_gmdid(struct xe_device *xe,
> 	}
> }
>
>+/*
>+ * Initialize device info content that only depends on static driver_data passed to the driver at
>+ * probe time from PCI ID table.

The preference code width is still 80 cols, even if we don't warn if it
goes to 100 since some times it's better to keep it in one line rather
than split, which is not the case for comments/documentation like this.
Everywhere in this file has comments up to 80, so it becomes
inconsistent if we keep it like this.

>+ */
>+static void xe_info_init_early(struct xe_device *xe,
>+			       const struct xe_device_desc *desc,
>+			       const struct xe_subplatform_desc *subplatform_desc)
>+{
>+	xe->info.platform = desc->platform;
>+	xe->info.subplatform = subplatform_desc ?
>+		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>+
>+	xe->info.is_dgfx = desc->is_dgfx;
>+	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>+	xe->info.has_llc = desc->has_llc;
>+	xe->info.has_sriov = desc->has_sriov;
>+	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
>+	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
>+
>+	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>+				  xe_modparam.enable_display &&
>+				  desc->has_display;
>+}
>+
>+/*
>+ * Initialize device info content that does require knowledge about graphics / media IP version.
>+ * Make sure that GT / tile structures allocated by the driver match the data present in device
>+ * info.
>+ */
> static int xe_info_init(struct xe_device *xe,
> 			const struct xe_device_desc *desc,
> 			const struct xe_subplatform_desc *subplatform_desc)
>@@ -546,10 +575,6 @@ static int xe_info_init(struct xe_device *xe,
> 	struct xe_gt *gt;
> 	u8 id;
>
>-	xe->info.platform = desc->platform;
>-	xe->info.subplatform = subplatform_desc ?
>-		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>-
> 	/*
> 	 * If this platform supports GMD_ID, we'll detect the proper IP
> 	 * descriptor to use from hardware registers. desc->graphics will only
>@@ -575,14 +600,8 @@ static int xe_info_init(struct xe_device *xe,
> 	if (!graphics_desc)
> 		return -ENODEV;
>
>-	xe->info.is_dgfx = desc->is_dgfx;
>-	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
> 	xe->info.graphics_name = graphics_desc->name;
> 	xe->info.media_name = media_desc ? media_desc->name : "none";
>-	xe->info.has_llc = desc->has_llc;
>-	xe->info.has_sriov = desc->has_sriov;
>-	xe->info.bypass_mtcfg = desc->bypass_mtcfg;

now we have a conflict since this got renamed to skip and there's a new
skip. I fixed this locally, but then noticed the split is not 100%
accurate. Why don't we have skip_guc_pc in the in the early variant?

Does it make sence to have both xe_info_init() and xe_info_init_early()
receive xe_device_desc? It seems to me we would have a more clear cut
split of functionality if we had:

	xe_info_init_early(xe, desc, subplatform_desc);
	... /* find the correct graphics and media desc */
	xe_info_init(xe, graphics_desc, media_desc);

btw, subplatform_desc is not used in xe_info_init()..

Lucas De Marchi
