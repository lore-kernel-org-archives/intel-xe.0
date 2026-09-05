Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B59C624D3
	for <intel-xe@archiver.kernel.org>; Sat,  5 Sep 2026 13:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9156510E116;
	Sat,  5 Sep 2026 13:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oh/wV5mF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CE010E116
 for <intel-xe@lists.freedesktop.org>; Sat,  5 Sep 2026 13:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788616557; x=1820152557;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=VUWGjxM1eZzS00UD8dF5d0RfQ7RCROeQCdDeyiq0xxw=;
 b=Oh/wV5mFD9MFZL5wF/gStMwtiqLc24Cpd8/WBQu4noZpeLCO5zE/qspN
 aISUXER6UogTv99vnuoDLdVPVNN70inT6fo2UclaFW/LqtiF17CAmv2P2
 3RGNEyFbkbAwsozJLcVqUg3LDjchx3wduBwyELmQRSvqsDqTG/tht2bNY
 uFEgPSkukiZfZichJhuOTJOvvqwDPAcfECSy8yuSaCcBSFKAq/X8rpe/u
 brAb2ydc6qWfH8r5vXjAkOwsu+lDxJ8F2AgnFzwlRNViP7Frz3wnBVpTA
 LmJOmh+v3RM8Hhki09kPtGrMh3dC5As+hpgvAUFvkSX3zaKoliRbYUJtU Q==;
X-CSE-ConnectionGUID: p4VK6QsoShKvsP69TKufmA==
X-CSE-MsgGUID: 9s7JFHX9RM+JaAF+UxePMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="100448952"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; d="scan'208";a="100448952"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2026 06:55:57 -0700
X-CSE-ConnectionGUID: pk2UWrYDQT6Ng0X3wk9kVw==
X-CSE-MsgGUID: 8MM58gXKRiqiFzNzq58/Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; d="scan'208";a="266615555"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2026 06:55:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 5 Sep 2026 06:55:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sat, 5 Sep 2026 06:55:56 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 5 Sep 2026 06:55:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PElVN0eXVooZoI6Vrpg6y2BdI5hGSszRtbVIpnwBK9XD9feNh42LER3jVvQ5TVVUUeJ74ssRs0Y52rOhHrlod8kG9jVqrne9in4Nb4N//q1AB3UU3SlrmBpbVX0BRM7kIj+G2AfNtlWt0BkmtVpUC8YS0+XxNMuFBlq0Casl33yGFNuFytWoeOb7DBV842JV/917yLGbo0+LasI2COioWVGdzabCGxUO9OFjo4HsJkBiJEKmlvem/NRHLgYdPwxH9Zc+EspAnXCxpz2CzRkQsQeIcW282OFY7UNgTfSq0HCyLdQVXMjiv4c1KYm42QlZCWhbbj8Z6MwaRHsuRvFH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2w1sTZnWlNq/ifgc6ntHCjOspTDoyg/4A33IYHJqqT0=;
 b=rcYBQvHN+sJMFgrJXwehmAFIuXxZ7Aql1skI6+gPpI1vylrGoEbMNO4CG2r9SrIWHXs1DJjRjdSjtS0F7XsWVib2/HrKC8u7W4aDPIDAxi2G648Bp2VS17VTZRHWwS8ySJJHEDW9ep/pPdLvXHzYGqSRnnsOhkbz7RlwtyVCl4Hvu3k+Y93egTqnnlGHGvquLlpKXqOV0Gj655Wy8+5T31aZ1jGlkrTRPLVCeRu3U0aTI3gvtsBDLaqmU6ozF9tP7KNCLAum1TVWk2Wiuts3jKs+Et+gWo8VUSj71ZHA8mLkuLJqBoQFoqQEsz/NopVZeFoe0jy5swoztpB/ypKjig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 13:55:53 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%4]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 13:55:53 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 4/6] drm/xe: Drop redundant parameter from
 xe_probe_info_early
In-Reply-To: <20260904170531.516-5-michal.wajdeczko@intel.com>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
 <20260904170531.516-5-michal.wajdeczko@intel.com>
Date: Sat, 5 Sep 2026 10:55:49 -0300
Message-ID: <87wlsz7qfu.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::8) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB5177:EE_
X-MS-Office365-Filtering-Correlation-Id: 040a2361-565c-4c86-b1bb-08df0b5566e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: xLy4NNVt4Lnm2SAef8FMqh6WSXlXedxe9nqLF7OLMfSYbTmw2zmyiokU2aKCb9rFb1UCnuzFjlGqT4D7JLXE/LxSKFFrPzrblp1BuEAAQR2Dr2e6Cp6up0UhEeB1I9eMGJSNduE3Wi85YoTcyl1f512QiODPNCCJzmF5QojGmt2x+zytnQx4b5hrAJUJJa/jNIimumEVdWFBdNWv8SwN3+W7x7dxkMj3YEeAFewl5jmzkAGbCEPyPCiDqSa0AQH1JeRtGQpAW868/zN9W7TWvn75tbVtfILFa0efCV8qRb9/v48UpI4GIm2mYCLyhTcDCFw5lXsUHA/Vl3eLtIb1EXsoGL8FAA2sNFO1HTuzqGU8gaSvzFx2YsL6HyrYUOnRJNbnoUIFkr95iueVE1FuuHATL/aYDDaR6GTyHMlzhZrORVxXB96wf9scN2MjElMtFeM629JTrHfgvj21KjVtKl34Jhv0M+nXlIKHTCRLLY8646zE32mIu771VQHAIM7Vgi1C55DGKzjC5OjrZp6pk74T8hb0BtIbtGw9dh05darf1Nc+Mm+aQlmjvyyq1Ecmjj9wmk94Or/mGkTdsISx0CC8CWDRnZzAOJ5tj/G4sbcAYNLGlGUNqqSuK4c3AOR8hVYrpoPq21hZzWis+fkhjj4cbDcc5ubKcTeuoed/zag=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Cyrl6x9LeS73d/zSxzCcs8OuKkUy+4Y/9lj4TRLZ+CMQhSCz6EYFKhlAyEW?=
 =?us-ascii?Q?B3codadF9rfV0cNJb+FYYegg0aZDBsU9TNEPQ0p7pKt8uoI2fdjPl2D+xIsq?=
 =?us-ascii?Q?JFW500V4iXIvSJDWayeDd9v0HVQ9bncqFg9eMm7ijrUYzC5pvzXB10riU2/V?=
 =?us-ascii?Q?ExacZFdarZYTcKEQ0v3BwMKr9okKm+uSJDMxk7zZg3+sT3KAQ9Npr/n06nTw?=
 =?us-ascii?Q?4GZffwzs8Tsvh3HnlIgAZGUTo3XkQy2J0HZCv+57TYjVaTUJix7YoPhTx40g?=
 =?us-ascii?Q?Mz/sJSNr7PbCzsoDIoa46BV+a1Q0pJeTC7PMjTZu3nd/R6sn9o7lYohj+f0f?=
 =?us-ascii?Q?xtC/f82Mpt1rQm0UdjRjBw7q6fsK7TEYBWVA+VaSHr1lqcfgcVfSBrX4nh0F?=
 =?us-ascii?Q?+FaBbb2iDIiseUbg0g/MP2bApfTI5+RPOMzGAesk5I1wSphUnj3mSKWZLwXk?=
 =?us-ascii?Q?kKeC+XiTaICBRulk2dJI0PsorYV09kTjiEQcb8c1FstRLEzdyWJTLdbUT57E?=
 =?us-ascii?Q?A6RQ1Orqy+37GsftripWSR7NDVFJFl3fCkaaeNx2wMlexUfEMIdOywq65Rck?=
 =?us-ascii?Q?6puGXGobXgT7Z94iT/fHLS+KWCnwv3nzkw3G8GGb2jg6o2GWePiQZ9Gjplot?=
 =?us-ascii?Q?Hrez8B5cQego+W26FeFGvRISJOC0Ft+GpXZE2IjcqVrj/kuY9CD+MztXOLHP?=
 =?us-ascii?Q?v6zBtMXW8xzo+hPY4HFkl2yz0X+7oX82Q3S6m6WgmMllonm/nNgcfBbpZXg+?=
 =?us-ascii?Q?+YRLK0MZAnTBsd6j3YlvD2q+5lDKrix4ktcQ6ityx8sMMaHL11OA+qNQ50Ks?=
 =?us-ascii?Q?UTdDxZeMeVkFbg3U4UT0Sxuy7GMgZsU4W9sI7ALvV5pm7yk6JFHuD2nX8aVG?=
 =?us-ascii?Q?j58A8CyUm9h1su1QgjNfTXzi/08b7uba8er4QDYAnxLuPg2Kdx5zKQnGRY0j?=
 =?us-ascii?Q?p2JIz6n5u+IiK2pNIMuwk0fupXNNd4JJN+PLNsTqpzaAeLZykEdecK2XucC/?=
 =?us-ascii?Q?BzWvLvljjsjznwfn9oEe9tjfLjTzlyfCz4XDWWahwNgvBgISgR9FOglINT6T?=
 =?us-ascii?Q?zZtCtFE85Qha+INcEmY13oKFhOdLZKcuU/aRxXyLu/HfHYgw0BpkUrm1j3tY?=
 =?us-ascii?Q?BkGC8qO8s2FSxhlBwMPmEkLGHss3pVUqufWow90F7ssH0t2FUYMvQLzUV2U9?=
 =?us-ascii?Q?eB0qjExVsc+H8l2CHbZQkuwdaI/locP2tLAAqAVZaCmI/J9MZAbvuPMsKC7U?=
 =?us-ascii?Q?EXLrcLQ4XPxm7CMBs5K9BQTWpuN+oYzIOOdeIhdexfZl57WnEJp84Y7u/gDb?=
 =?us-ascii?Q?COOTPxdSmrIG6yc8xpHoxKfHmBlBqvWgBNkd7zMkvx09TeFxK5pt4Jrspa+z?=
 =?us-ascii?Q?bH5bTSDaOPtUeOLnD1td2kifSvGlzKbPO/lqauHSDhoGK8+66/Pe39VKe67T?=
 =?us-ascii?Q?z/R3E3/YAru1/twFRU5RmH6utmgzkTQ2U8MQ6YsyJgDwYI8qca7l2xt2RHdj?=
 =?us-ascii?Q?iABEBjcyY58M1YVKcLlsktXMuQdfaOpdkQeSGxtnR1lmI0UoMLkIREAD0WPS?=
 =?us-ascii?Q?RkoSnb5cZnwEO1Pce6d9SEX3WlifdMjNlXprdgfjCD6s40o/9rVtDnzQwUYX?=
 =?us-ascii?Q?NaHF2fvFGt9N2t0yAI1bkQvBLgRV7eAmKB4/N9aNO4EEI2wFkY2Jj5eiBx87?=
 =?us-ascii?Q?/gKsrYuIYcaII6LdUsy+zJSwqDZbsrr+3TEx7cP+G+8ZGbuF7fwsYVuelDzS?=
 =?us-ascii?Q?R3jdIwex/Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: QwOfnukSe2dDZ2ORMhV33aCMEGiBiQ1K8V8wWoHjdAcoRsJkYwdc1ujDWpz0IIlh3S2ObYby6HNlgKzBwWWL0Kr1wH2CEV6gWgsVzfCzVXzHh9AXzGeFBM0T065PcyXxlGtAagILENeG9l9tsi1P40G9Tb7oqmBIxorsY4/+CMZF35vKyglBa40y0kXkAeAQHWKtG+9RPPqcTOyAircLp11Q+pmOiHEHUMRKfol6fJNgq40VMETcVTfLoaFS+7mpyD7C1s+qdzo40J9kBvZG9oaKkccc2guQLF5WA+eQKwhTV0alChbvt3fmKCInbpn6OK4VM68IN9Hp4RxKb7kjCw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 040a2361-565c-4c86-b1bb-08df0b5566e8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 13:55:53.7400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8M0jly1lwBN06wAVEgpknFXk966xxve4RfOywb4j6ojT6HBgYx6bHQ7uvWW3kXUnuQFPZvgdlbkJ63CKYwVww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> We can now obtain the const pointer to struct xe_device_desc directly
> from the xe, no need to pass it as explicit parameter.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index d19478c9439e..6ca1ec311a4b 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -753,7 +753,6 @@ struct xe_probed_info {
>   * Probe from the hardware the info required by xe_info_init_early().
>   */
>  static int xe_probe_info_early(struct xe_device *xe,
> -			       const struct xe_device_desc *desc,
>  			       struct xe_probed_info *probed_info)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -761,7 +760,7 @@ static int xe_probe_info_early(struct xe_device *xe,
>  	probed_info->devid = pdev->device;
>  	probed_info->revid = pdev->revision;
>  
> -	xe_step_platform_get(desc->platform, probed_info->revid, &probed_info->step);
> +	xe_step_platform_get(xe->desc->platform, probed_info->revid, &probed_info->step);
>  
>  	return 0;
>  }
> @@ -1218,7 +1217,7 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
>  
>  	pci_set_master(pdev);
>  
> -	err = xe_probe_info_early(xe, desc, &probed_info);
> +	err = xe_probe_info_early(xe, &probed_info);
>  	if (err)
>  		return err;
>  
> -- 
> 2.47.1
