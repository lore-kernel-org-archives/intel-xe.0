Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0F2C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 06:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F6610E180;
	Mon, 23 Jun 2025 06:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BkjftiwO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C925E10E180
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 06:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750659976; x=1782195976;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h9CmAy1P68TNe4PETiqqFY1WWhHS6CT1nZkdE5OIGYI=;
 b=BkjftiwOw7BKvlTp/luTRoKgpqdoHAkBA/eNs2olLrTw+ul/Mtj7lRXk
 EJuYSEcx+9lchjJAkR8WdlAp3etCN0X5BKZFZpTlBScNvd+p6ZzMM1KbB
 TqIYq/V2grblPqDGN2VFT+0wBb/FHdjj9Hqm9w3VGTWWiuUxD6vnYlAZu
 zQGhPOWqi3jyQLrQoeTf3NaRTkSk/M9Xyeulxn6qjDFPP76SWoAdXePZh
 ZqtuQcPxRM0WrEBPIoaTx+JrUzozoH5wuR69x/eQ+BE1DjqbX6WOUwk/G
 7hAICIL6PCKUq6Vlzmg+QuSWxngL/JhrDpAMihl39t1T5jVAhElS4KE3z Q==;
X-CSE-ConnectionGUID: k/xAoDn0TS2nM6kdVhinuA==
X-CSE-MsgGUID: 86k+rSxYQKehgbAt4+n8Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52941224"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52941224"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 23:26:16 -0700
X-CSE-ConnectionGUID: PF2EL7z3TBG7oei2uFyAPQ==
X-CSE-MsgGUID: sLLP+BV+SHOwWcV2d2pIHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="150977321"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 23:26:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 23:26:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 22 Jun 2025 23:26:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 23:26:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rmz5NEE198nbtH0oB7rcilyZlcHHrrVeH25NQI+KfYEA5fNUXn6JgJ43wiwhukx04gZgs4uShjODwIhppkBRpVeJEs8V9xM+ykViZuvVJskOqVKAJhZlYjnHIsmej2dD35eTyaiQM8Ml5lPcNY17Zib5NyZqx6uIyumsx+fjGpc0LvdFxopYYYdRokkP9YSZBoSmj7bvSmtFVrhjtS+9SRSodRs/P8iQDaNW1gEC2jdrasaTN+KFPZ6zQJVZmJ6xpeqBMfF3hYT7PwVbdsyAEc6BsVgzrylGsxk3e4aL/YeQSkFPZ4wntKvOJv1wLviar2k0IpoUT6EelXRQaqlBcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zGtaYf5tZRMsYj/Y2SQ1uLmLvQFYWvCdbhW/vv1/ig=;
 b=dEfhVzXvyrnzB1meQD2USrwiHwjylkLntzaZprF7DqZqY1MMM3nl8ocJ/XGp4ajqXKb8FWdnV1fJ02KLvrI0AojpLGbcljGWNThCXEcsUMMIx24cpwLNROljA9A621m1Dl43mgEJUIJOExxSd5XThd5kvnZKtYf9tMMbiI80q83ZI5xwOrTLjj4sS0xwEozYevSzEoBNVLbeIgVWv3AYrfhffzlB7kg2PCs/MZ0aFSzBZAvilPe7HkeygFUkI0vR7LKdaIDd2fE7R0hqddtKaevRX1LWFHferu6Wx59TMMm3ys0vCWrh1SRq5dQYHFUfh1BVev38T9fdVTNSCHSqmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MN2PR11MB4520.namprd11.prod.outlook.com
 (2603:10b6:208:265::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 06:25:58 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Mon, 23 Jun 2025
 06:25:58 +0000
Message-ID: <2e4cabac-1861-484f-8797-e39dba80cd9f@intel.com>
Date: Mon, 23 Jun 2025 11:55:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/20] drm/xe/svm: Add
 xe_svm_ranges_zap_ptes_in_range() for PTE zapping
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-9-himal.prasad.ghimiray@intel.com>
 <aFjegyCdeNlytbH/@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aFjegyCdeNlytbH/@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::32) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MN2PR11MB4520:EE_
X-MS-Office365-Filtering-Correlation-Id: 94fc74af-66aa-42ee-a263-08ddb21ed107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZU1sV2NkRFc4UldoN1IrTUJ6cFdEdTZHaFMxdEVMYmUzcFV4b2FFVVh2Tjlm?=
 =?utf-8?B?eWVvRkJoZkNPUk1kOGdoLzR3V0FjSTRMOUIwQkxjSmdxNGVlVHBIR2dXSVFu?=
 =?utf-8?B?dTFpRUhaVG1JQ09ZRFN2ZFJKbWRsd2dRcWk0cXB6V0JINzliVUplS3VxV2ty?=
 =?utf-8?B?WlZrWE10ZVlDZHVWR0s2Mk0zbDZxdU5YRDBJMGx1Y1E2TWpENGE5b2ZlMExK?=
 =?utf-8?B?YWNrMmpVYWFKSkpIeXcwNnFKempJMVBHL1JCZEVBRWFUcHBqdGpnbVNXMURF?=
 =?utf-8?B?RFpLZGFFN3JFaXFyeDg5a29acXEzNE5LY2h6RVY5Vys0Nmg4RDh3K0pIL0xs?=
 =?utf-8?B?Q296dXpiN3V4V0dyYk1WUHBsa09VTGlCSXo3ekxRYU4yM3BCaDhON20vWGl3?=
 =?utf-8?B?SWZpTlU1TENxMTRKYWFkclFKN0lqNmhVZFBaNDZLQlY0Z045bVRvTGJxenJ3?=
 =?utf-8?B?c0ZPT1pCUzFpaU40UjZ5THhjSkVOQVhpeHJJWjkraDltSWx4N28wSkJmdFc4?=
 =?utf-8?B?eUx6Z245UmJMVERqMWp0ODlNQ05NU2RwMnBkY2NUaHZCZ1FVcDV1QnhVRHRN?=
 =?utf-8?B?ZWovOFVmanp0ckliRHduMW02REo3SzYzdTl2TFJMdDhNRDNFQk5RZ0ViZ2dU?=
 =?utf-8?B?eENITUJXRlRBSGtIK2dIRjdZUHk2TGo5QXpka2hsVm5zN3pjbXdwTlN5SXR5?=
 =?utf-8?B?TXlPME9HMnpZbnBEdWZib3VyK1RMUlhuNjIwb3dSblJ0M3BYdGtDcGR1dExJ?=
 =?utf-8?B?WXJTSjlBc1U5OCtxTGtqZndMTit2T2hiVE5BQVBWS0g1bDh4TkU0SmFqYm9n?=
 =?utf-8?B?cGV2aW9aUUMvUlhRWmEwNS8rd1l1emZVZ3lDUDFCM0dtWEJ5dmYvZktwU0o4?=
 =?utf-8?B?R0hrQkFZZzJrL0pUYStlZytwZ204dUUyWjhQQSszd0E0d21HRVV3UHNGYjZh?=
 =?utf-8?B?TGQxSS9rdHhvdTE5TnFjdmZCcVdHODJkMkFpMTBMRWFPN1B3T21ydUVDd0hR?=
 =?utf-8?B?NEtGREMzN3pHbkdRUUQyRDFQajhLeUFZeXNnUktCMTdxbFJVMU4xTDhEU0tL?=
 =?utf-8?B?YW9jeVhXZlBaVDRjQlBBTDF1WHkySkNWV2xIb1BaOWdmbTQ5NnE5SEtnZ1Fh?=
 =?utf-8?B?YVQ2N0NES1Rza0ZWZjlXaWFVUGpaS1hSYk1QMW5reCtITnB4TUZmLzRlOHZn?=
 =?utf-8?B?NGJFZ2J5QkM2b2d3cUN6NlVKQktqQWs0TmthMzByVGdUc0dLV0dhRVhCLzBM?=
 =?utf-8?B?Q0pYREZKeVQ2aWxpd2lWTktreTlFSlJaOGJOalJUQWY2OG5sWnFLVmQxdUpM?=
 =?utf-8?B?WlRucjRSSWlhVzhjT0JudFFLLzlNVWppU052OXArRHBTSExjUWpmdTFHRmEr?=
 =?utf-8?B?VjdWUWxXRGZHaXllTEJtSGVPcjRmd2dKeDBGaDVTYktpaW95MGNzc3cweEY0?=
 =?utf-8?B?UG9CaUp4ZHkrMmI5MEU4Z29hOExxVFBUSlY2ZEVvN2FFYWYzWHdrQUhpa0JJ?=
 =?utf-8?B?RzdiS1kyT1BFZE9lT0EyU3BSZytzUlFucEZSTU9QMFNVZjhMYU8xMVNTR1JE?=
 =?utf-8?B?TlZISi9xanQ5Uk1pb0lZbTNNS2xwODNGYnREVWQ5T080ME9OZ0U0ekNzMHM3?=
 =?utf-8?B?WEFkWEg2MUhmMDJDT0lPNnNRZURCNHdGK1YvRFBYcGRJNGdmM3dRSWh6cUZt?=
 =?utf-8?B?RWVaMUM4VXR1cHJTbmxiejRwZXBoVE9QL0JmeXp3eGRaTFVZL3BJODNhYnI1?=
 =?utf-8?B?N3VQK3NZSWhoMDVIK1NFZDRHZHZBYWxtbXh5MnF3M1VXRVpsd1BYMkp5d2hS?=
 =?utf-8?Q?7Mm2ng7WeqaGQ9XU7Q99H0ffDWayCWsYRbTgs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVIrMmEwNWMvc0JvNm80ejlYVFYzZk9MVVo3MUtaaUI3Y3A3ckFPWjk1YTlu?=
 =?utf-8?B?RytjWnlvUCtSSUgvRGtETElMV0V2VVBWVnZlRklOcFlzMmxDWkVESGEyUC9r?=
 =?utf-8?B?TW5RcDR1U1l3bjIxNitScksySDRBZnZ0T3lmTE5NYllCU21PMWhKU1F0ZjFr?=
 =?utf-8?B?UU81T3RvSEZDUHlMOVdWdm9UYm1TbURaRXJoOE1EaFVpUjZIanYzUzV2c01Y?=
 =?utf-8?B?OGkrNHFSUGVUR0RGdVRReHQ4NDJDb3kvL2J4cVcvemtrUnZmdWZLT0FrS3g3?=
 =?utf-8?B?M2c4L29vaDJOb29qem92VldKNFljTDYyeVgzMzZlZmhUYnkvMFpaYVlmbTkw?=
 =?utf-8?B?bzkyalBRek42OUUzQVZLczlyYm1NdWpSNjh2My9ocjVva1Z1bXh5SkRkNis3?=
 =?utf-8?B?R0RBRzVpVkZ4QlQyWXZzb0lQOFVEQ3ZtaFI4YXJvRUJiTHdoeGNMVzNaYnFm?=
 =?utf-8?B?b2lIZSswYWxGRGU4MnlONW5NV1BmUy9rWVI4MU9FdWpoMElNT05tNGNETEpo?=
 =?utf-8?B?ZzBPSFJRcDhGWVZTRmxKTXBmOFpyNXIxSTRISkM4NHd1RWlqSkdLVzNWdmc2?=
 =?utf-8?B?aUZtWTQyZklZZHUzMXZVT3pPemNuemgrTm93TlRkbGI5eU1FRXNZd0N2ZjJW?=
 =?utf-8?B?V2pZNTRjaHVSOGhwSGVvRkZ0TjhLRGlqSlRBaEpCT0trSDkrWlF5ZDI3VnVC?=
 =?utf-8?B?QUdoeXh0aTMzVjZRMzQvSlA0eEtBRnJzQ25TbXdFNkZTdG1XbEZMcWN5WVhr?=
 =?utf-8?B?V3liaWR1RWNMQVJ2Y1Y5cjBnRExMV29uRGwzQmNvNTNQOUdIT2hoY09SNGtD?=
 =?utf-8?B?VW9PKzBEdlJKeDA1a2hIWENFNFg2L1RSUndNOUt1Z0U1eDFpR2FxTE1Xajlv?=
 =?utf-8?B?aVg5eTRGa005YTlFczhoa2tEOEVTVDErOHFONGtZLzBDUHp3eUFKaGoyRVNn?=
 =?utf-8?B?bkFlYXV3Z2wyTVZpVHZjeDZQYTk4dnhsaHZxNUNlam5ZNDFlamFvdXM2bWxz?=
 =?utf-8?B?dVoyZ1I5SnFXMHZSQTMwMkNDTmRBVHFuajhSenkwZSthMlRkWXhSRlJ0UklZ?=
 =?utf-8?B?eE5GSU8ycmQ4K1d3WjNrMXNrcXJzUGthOWZHL2d5cHFaMVBLdTkyWkUxaVk5?=
 =?utf-8?B?dnVUSFNBNHV5aW5QZEVSZnA2ZXhVSFh3ckdlbHRYak5kRkxCeE5xM05Mby94?=
 =?utf-8?B?SHZyU3o0TFI4RmUzZVBneXFGbXV4NzBiczNqNjEwVjExYjEvUzREbFlRY1BW?=
 =?utf-8?B?eFJXaVNNSHN6OHIrZU5YWmZKNkZxM2h1NEd2LzRNRWxLSVlyaUxZVzA2ZnlZ?=
 =?utf-8?B?cjRWdjdXM2s3SDNwYWU0YzdwNXcvNWV4bDVuZFZ6bFJDRGkzZ2JyUFU0dmJC?=
 =?utf-8?B?WWl5K2xXWGlqM0sxWjlETkpMSGhwVlBjbTI4KzhhMXdETXNNenVaQnlaUGpQ?=
 =?utf-8?B?WmZWSXQyMnNZTnlSMTBVZjNMREtuRm93VmJ0VUN5cENGSkQ5NHdTdUZLTEE0?=
 =?utf-8?B?TWlzamV6TU9FeDZPWTN0c25NYmNBS0ltT0hnb2V6TkVZKzR5UzU5azRQd3lu?=
 =?utf-8?B?Q1FuUy8wdjU3djgrMHdpUGR6ajlQWXhDVHVSM0pick0yYTg1OEtML0crLys3?=
 =?utf-8?B?SWNISkVpRXhER0s1VkRYOURtYVN6QlBENVNLZ1NoL1k5VGttTjI3bjZBYU5H?=
 =?utf-8?B?UGo3cTF4b1dGSS9GY25iOE1RNUZBZlp6aVltcFhRWDN3MEdlb0Mrek5rOHc5?=
 =?utf-8?B?UjZPbTlEdmdweHVCekswbWFVRG5ydExvOVpLNy9PK0ZncDFNNTNhbEMxenZu?=
 =?utf-8?B?Nnc3YXkwa2s1SDVWNGhIaUVWTk54S0VEQk1QTllqVy85VDhrNWR1UCtzMG9H?=
 =?utf-8?B?TnBvTUNYajRKTDdiNzRraUswejdEenE4MkhDM0lUWFk1bG9aN21Uei9wWTFo?=
 =?utf-8?B?RmpqWUhlRC96bDMrOTMrRzN3NTVmQlhML0xZRkV5RmFoS3pvVE5jV1RhSTlj?=
 =?utf-8?B?aUMyL1hQT0U5RkhGMWxSTjYxVmk1QW5rK1VjOEdXK2Y3c0crM1ZxclRNdlBJ?=
 =?utf-8?B?WFJjRnc1SFl4RDVvR0tIY1dnYmhWMUYzVFZ4N0taNDBLMUR5Z1E4ZmI5L2ln?=
 =?utf-8?B?RFpNb0NDSnZsUmRoVGd4RS9sY0pYTjArNWQzeFVBQVdSNmpIL01zOFgvc0c5?=
 =?utf-8?Q?gIt8eiKwEMLzw6GtMxltyVU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94fc74af-66aa-42ee-a263-08ddb21ed107
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 06:25:58.5839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nibeCDG6LzlDEvmv318Lvw0ESuNmm8co7W2AL9qNHgdiCcAWE2dNAo7glAHetqyxjOQb+ShCFuN/xrdPqLezMSPSnYA/Sis8BI69PrJ5jIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4520
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



On 23-06-2025 10:26, Matthew Brost wrote:
> On Fri, Jun 13, 2025 at 06:25:46PM +0530, Himal Prasad Ghimiray wrote:
>> Introduce xe_svm_ranges_zap_ptes_in_range(), a function to zap page table
>> entries (PTEs) for all SVM ranges within a user-specified address range.
>>
>> -v2 (Matthew Brost)
>> Lock should be called even for tlb_invalidation
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c  | 14 ++++++++++++-
>>   drivers/gpu/drm/xe/xe_svm.c | 42 +++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
>>   3 files changed, 62 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 9177c571689e..9a390ef10852 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -950,7 +950,19 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
>>   	struct xe_pt *pt = vm->pt_root[tile->id];
>>   	u8 pt_mask = (range->tile_present & ~range->tile_invalidated);
>>   
>> -	xe_svm_assert_in_notifier(vm);
>> +	/*
>> +	 * Locking rules:
>> +	 *
>> +	 * - notifier_lock (write): full protection against page table changes
>> +	 *   and MMU notifier invalidations.
>> +	 *
>> +	 * - notifier_lock (read) + vm_lock (write): combined protection against
>> +	 *   invalidations and concurrent page table modifications. (e.g., madvise)
>> +	 *
>> +	 */
>> +	lockdep_assert(lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 0) ||
>> +		       (lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 1) &&
>> +		       lockdep_is_held_type(&vm->lock, 0)));
>>   
>>   	if (!(pt_mask & BIT(tile->id)))
>>   		return false;
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 2fbbd6a604ea..19420635f1fa 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -999,6 +999,48 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>>   	return err;
>>   }
>>   
>> +/**
>> + * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
>> + * @vm: Pointer to the xe_vm structure
>> + * @start: Start of the input range
>> + * @end: End of the input range
>> + *
>> + * This function removes the page table entries (PTEs) associated
>> + * with the svm ranges within the given input start and end
>> + *
>> + * Return: tile_mask for which gt's need to be tlb invalidated.
>> + */
>> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>> +{
>> +	struct drm_gpusvm_notifier *notifier;
>> +	struct xe_svm_range *range;
>> +	u64 adj_start, adj_end;
>> +	struct xe_tile *tile;
>> +	u8 tile_mask = 0;
>> +	u8 id;
>> +
>> +	lockdep_assert(lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 1) &&
>> +		       lockdep_is_held_type(&vm->lock, 0));
>> +
>> +	drm_gpusvm_for_each_notifier(notifier, &vm->svm.gpusvm, start, end) {
>> +		struct drm_gpusvm_range *r = NULL;
>> +
>> +		adj_start = max(start, notifier->itree.start);
> 
> s/notifier->itree.start/drm_gpusvm_notifier_start
> 
>> +		adj_end = min(end, notifier->itree.last + 1);
> 
> s/notifier->itree.last + 1/drm_gpusvm_notifier_end
> 
>> +		drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end) {
>> +			range = to_xe_range(r);
>> +			for_each_tile(tile, vm->xe, id) {
>> +				if (xe_pt_zap_ptes_range(tile, vm, range)) {
>> +					tile_mask |= BIT(id);
>> +					range->tile_invalidated |= BIT(id);
> 
> /* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
> WRITE_ONCE(range->tile_invalidated, range->tile_invalidated | BIT(id));

Sure

> 
> Also, we need to be careful here. If we can fail after this point but
> before the TLB invalidation completes, we could break the notifier, as
> the notifier would skip the TLB invalidation. The code, as written, can
> only fail if the CT channel is down — in that case, all bets are off and
> we are issuing a GT reset. So, I think the code as written is okay, but
> I’d add a comment here indicating that there must be no failure points
> between setting tile_invalidated and issuing the TLB invalidation.

Will add a comment.

> 
> Matt
> 
>> +				}
>> +			}
>> +		}
>> +	}
>> +
>> +	return tile_mask;
>> +}
>> +
>>   #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>>   
>>   static struct drm_pagemap_device_addr
>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>> index 19ce4f2754a7..af8f285b6caa 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.h
>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>> @@ -91,6 +91,7 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>>   
>>   u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>>   
>> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
>>   /**
>>    * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>>    * @range: SVM range
>> @@ -305,6 +306,12 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end, struct xe_vma *vm
>>   	return ULONG_MAX;
>>   }
>>   
>> +static inline
>> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>> +{
>> +	return 0;
>> +}
>> +
>>   #define xe_svm_assert_in_notifier(...) do {} while (0)
>>   #define xe_svm_range_has_dma_mapping(...) false
>>   
>> -- 
>> 2.34.1
>>


