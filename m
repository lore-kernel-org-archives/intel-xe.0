Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CC4606A33A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 08:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aDNCsrxG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359DF10FCD1;
	Wed, 21 Oct 2026 08:57:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F4510FCD1
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792573072; x=1824109072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kRrAK5iw44TM6svYwH1IB83+ajhNANQxs7iDqSriOdY=;
 b=aDNCsrxGDlwnAiuFz0gihkSTTxsWTXCiphstMw131WUQcK0xnSgIYFAx
 C6jvnoQvx1SedfEd/jbNZ5b+dr6TI/tXluqni77eT2xhmhYvUfEpPE9m/
 L0dLLplQYRLsWOdLcGVKjGUKGNAvgMuf2AegprCY4+0xMirBXq8BDyPhK
 q4Ji5Al7t+ACdYlh8uuDaSzRPP6AM2RSZfzQuQMlCppcezq0JFXyUmXZ+
 3zSZ/LWglNAqRpUAENF+I3qdCx3Ln0EKRwq8qO6Ht6nQhcUwVCTlWbqMa
 mdlez7OMZ1y+w2Etr7rKECVsEvXypojKHeT7cvqTLCnQvIuzsQ1IydC9r g==;
X-CSE-ConnectionGUID: tRkX8AM7QPqsBQaOSdbu4g==
X-CSE-MsgGUID: ZSbnZlPDSLG3HXOlQ3daQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1166923"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1166923"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 01:57:52 -0700
X-CSE-ConnectionGUID: HtPjXrFkSoWmObbv3uTJhg==
X-CSE-MsgGUID: Mht3V3OFQES4CCKSzAMB0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="4870830"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 01:57:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 01:57:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 01:57:51 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 01:57:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kl166Eta7cspDq7BncdWQi0eP7HOHJkq1DzSPz6ucib3Dp3HzHWwXlgcCnDfc7zhkGqnsERpIppe24tGUAmPWthIUCEUS0pHeZaCT1o2BhL5vd+q7+VthPWn9WIt0Z1/wEXS8uOaxet4Owm4tdLGVHS8m73PUIPSnRJjq/zwVkghDsReRwlvyD0WgIHWGQyuFsvgKg3m4EmHnN8RNRB65Q5lpk8FaCmOd6XW6CwpydirhHBYxn2E0wT3P4Y7VqsNWl9DlzHwThkOD0cP9hlMcxtRP7YGgnRLs1qcOnErzcCuz4XAKGYl7LLA8cCVF0Ztca0Hpv8qEZacOhVHwR/fQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A33tb1tgJA8l7x53QO23iGYoWT4mqoY9V/KvQmmb1n4=;
 b=Jr3wjSZ4EGqMlhWOKqU8xahoGn5WxEutvr/ppGKSldsyXJaZZz+v65t5l7QEbKlVilZPvXZrpGW6WYcfwpC8Z7FGraWDr1cpuDxVZZ6w6z1SiLN1SwMpnd2XIkjqsJj4i2ZpVM1SsB7+8QEWxpZ641FFT3WHMYTC1E0nGYmy7FHq7U6DyOphGRi/sxpP9TYr+NQxCp/f6M3i6dW4hR3cDdSiMuJe3lsv2SaVn7Yv59+i9SEbg603Uv+jf2U7UvieK4yMft0xMM1y1jRmjB996HkzJunEmIzYPmJJ8nx4PVABe2jKhl8AKrsVS1y3idIPwa5iUfeD57AqICWCnjVEvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS6PR11MB943645.namprd11.prod.outlook.com (2603:10b6:8:499::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 08:57:49 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 08:57:49 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Tomasz
 Lis" <tomasz.lis@intel.com>
Subject: [PATCH v7 1/5] drm/xe/ggtt: Assert lower bound of GGTT PTE address
Date: Wed, 21 Oct 2026 10:57:12 +0200
Message-ID: <20261021085716.709503-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021085716.709503-1-piotr.piorkowski@intel.com>
References: <20261021085716.709503-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI5PEPF0000098A.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::80d) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS6PR11MB943645:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c93da0c-4306-460e-2dab-08df2f516220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|11063799006|56012099006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LLkDHJ5ISEB0qcxnR02iD62RJwk0D5qKt2oiGeiNvTwODo+v+2CoE5LEvIZRvQXHL1e/03KwtjGyZiKT5xBRPp3ZmwAjqsiPiqMBebgoTGE2xHTael8qHJ/x2gIWwt3GhjHRQwtGcdZwYoHjx7kWeof/f9mN1xj/1bXt+CfQiZQY3ySzeYirri3uSp9U/DIbCikgF/uoGTZ6t1RdeG/G4av3YQo6ZJ1Yck/L0GNUHgXuiJoEDvy99Lnnn2lRpw1AGBehUU6WaiUWJU9Ah+om/rxd7bDszCIA/tbA/AZ83Vq8ZjT0gyi7jiBOdHCGtExgp42dDN92eSY/HiEDAf62CIAFbT2uRwJeXQoXMZlKkDIL3JJtSnnhWV2/2zCX5pltB2tiM0JoriWr9AsXqfp8e2lZX3G7KmXbTPfAewbK1QNEEjRQEyNlEGcIlr8apeCGDt+if08trhTLyxESqmqS845M3ydHm4MOHCguW5bAGeakwpNUkIFj/WXs2r/kP9pvGLSEZQ+GtD4m0Etc8Sak15WKVgYwCXHeywV+91fGsVNB6ByimHGSCfXJS4qSmEThGn9Y4Bn3PHSIhjZDCYdvoJGIAeJR3GtE4brG4iP6xeECCURIeTqG1kb7yPuVpBWrMD3EAL/bbx4BBtR4i6Fj2B0EifBh3r2hi1BKWIrE0Q0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFB2N2dXbzBac09mKzFzbUhtT0pPOEUwb1UwTEowVkIwZEwwc2FTWVJLZnhn?=
 =?utf-8?B?S1BnUXJELzZvc2FEaUc4V1JhWmxYM0RvbkQxTk1YVjROOWlFSG1qMUVoQTQ5?=
 =?utf-8?B?QVU3WFEyWTg3dDRtZjFXdkNpRGd1dXNYcGpKNC80ZkQ5V2wzRSs0WGpkQzB0?=
 =?utf-8?B?YzV6UFFiVW1rK1FZUVF5dVd5TU1FekF4d04wTnM0Nmd0TmphQXFJVEVXZFAv?=
 =?utf-8?B?eExVZm5Ba2VyZ21hWTdld2VuZ1UxWktULyt4SVN5VWQxZUFvenN3L0MxU25D?=
 =?utf-8?B?aStVZUZuMzN1MVI4SWdnVk1QQTBWMCt0UFpPdkc1V2NCUHJuelZ6Q3JqMHBU?=
 =?utf-8?B?TC9PWUNoNGJRWWdZK2FHT2NhVmlqODZQRzFReEQ3TUYvelR0dXM0TkRkSkd4?=
 =?utf-8?B?a2EwRS95NVZESUcyY29yNmpIRVhKSmF3SzFnTUVPeU5GRkdCdndQeUNYeGRM?=
 =?utf-8?B?SlFONkFkWnVzd1EzZG1FZTMyUERkaE5SZUsyaTB0NlQrTXRsVy9GRU9kY1ZC?=
 =?utf-8?B?SzN6eVZnUk1YT080U2wrZmpSNnREY0h1Q3h6MnhjM2NocVJTQVhTOCt1Q2J4?=
 =?utf-8?B?NHRZWDdkMjBrT0VTZGRNTndJR2Y2QnVMbWpvdjRRc3FQdlZxWlBaV2NMZGlC?=
 =?utf-8?B?NWJlRkxGcnNPMUcrQjlabFFNenVLQzRoMHExNkZXL01zTWRGbDhqTVBoMVhV?=
 =?utf-8?B?cnNJYnhob2ZkeTYyV3l5US9iQWFndzlJWDdxVUJnZEhHb3IyZmdZWWhWNVpH?=
 =?utf-8?B?aFc2T2ZzTHB1cnI4Tm0zM3YyOFBySXdxb0VFNzFpVyt0bU81ODY1bXMxNTJX?=
 =?utf-8?B?WTgyQnlnYUFUcDBQT25hZ292V3VTV2RnT1NXUGxGa2J2M09wdDNOV2hodjdl?=
 =?utf-8?B?dExLanZ5VVVmSE5rdjBndElKeENHRE1La2I3MWQ4Z045VjhlUWcvaEJ1bTBi?=
 =?utf-8?B?cjB6Z0VvcEhyakV0N1ZCNUF6YmhXSUpLME9ORU1hbHl0QUVZaUxkMmdjM0R3?=
 =?utf-8?B?QzRycWxRZnlyTk5DaDdvYSsvSTUxY0ZKWUVTRWxrNFBrRkk4emRLQzBzY0tm?=
 =?utf-8?B?T3hLaU5Nakc5c09YMTZxdkhVektkZ0QxQU04WEdCb3kwTzRzUWJpNjFCaXpO?=
 =?utf-8?B?NG5TYmhhL1UvQ08vYTJ0QXFVa01Bd0dockJzNkp2alM1cElIeC9kK2lSNklM?=
 =?utf-8?B?QmpxZGVFV0MvNkU1c1hnaWdKcmU5UlBwbVdORUc5TWxKTG0zWldhTjhpeVJU?=
 =?utf-8?B?Z2pHYUZGVkRkUFdzTU12OUwrYkk2Sy9NdHFTUFdETEptbUNnTUY3ZjFGRFQw?=
 =?utf-8?B?OWV3Z1Zrdk9WT1J1aE9JR091SjlRa2tmZlZyUXpibnRsMXMyb3hoN1AvcWhS?=
 =?utf-8?B?K2IyZ0xHRFdBV2N3aVpwRnBnVURnQ2lNdkhMQ0tmM2lNbGVEQTQ2c1hRRjdJ?=
 =?utf-8?B?TjFGQnNISDFzeWxHRGpTaGYreGo1V2RpWGc4U0FWTy9Cb3JnVm5kUE9FTU1X?=
 =?utf-8?B?ZDBzOFdoSDBYNitlV3BLK3RSVWdjODV0Q1JaQlVIQzc5WFFSS3VjK01xbVRI?=
 =?utf-8?B?QXMrenV4RGxpclFTQjhPeEVTWDY2T011WjEzSTk4c1luMFA1R2ZHTTBuVnJ0?=
 =?utf-8?B?ODBJOUNYQWwwYUJwYzJhY3RXSlg0Wlo0Vk5QWW92b055eW9tRFlLYklYUFl3?=
 =?utf-8?B?QmZ2bW5uYTE4U0FYMzNkclVNSGJEMFhtanZuYnd5OGNvNDYvbmk4N0tYbkpx?=
 =?utf-8?B?RXZtZmZ0WWdPOEUwd1h5KzNUWnUrN0VOb1FqaW04NThseXpOQVZnMG1mNm5i?=
 =?utf-8?B?R3ZBNHAzM2Q1ZGdzNkxQbkF5WThJRm1GTnd2d0cwM1pUeTdRTTk1aWZlcmxJ?=
 =?utf-8?B?MmlCWm9JMC93c29BOXR5MHZ4dk5uQmpTOE5vMlhaMGUxRlVIVFRBb1V5MGZM?=
 =?utf-8?B?RGxUWnJHNUxRdmx3aWx3OG8rSnIvZ0d2ZmZnUFBsK1k2NUtrNnFhLzJISEw5?=
 =?utf-8?B?NWxJQUZOcXZWVHVGMUVFbk9yY2xQd0F3aE5pUHUvelEwQ09YRHFkUTRydFA0?=
 =?utf-8?B?RUxxSXJnWnl5VUxjKzhTNmw4M2FEUFZLVDJmM0I5UFV0WW9yNmlCTHFmWmg0?=
 =?utf-8?B?bVh5Skl1MWF3c0pLMzNYeDJ0WjJYenI1SWxtN3I3OU9uL1JtU21jbmw4bU5q?=
 =?utf-8?B?VHBCRnZraDdUQWVESlUxajdpS251SS9QNXdoek9QNzZsWDArTGtJZm5ncUNy?=
 =?utf-8?B?SkduTnhWNnhLWjVBWGpmditWbUhkeDdmSnIvZmVYMU1uRUVrc1kzQXI5c05r?=
 =?utf-8?B?NVRuWHU0TWdHaWZ6bnBkZnBLanloaFl1aEUyRG9Rc0VLK2F4azJBUWlQKzdI?=
 =?utf-8?Q?uaw9llBKYqKO15tI=3D?=
X-Exchange-RoutingPolicyChecked: 431Cybh4nrQkCMo4rVslMpPKYA4HABnsW+KvEw8KzaZVYH5Mo9OWVZzsCVGUpKeVDtlTZhVwp9FLhR9aovW+jQBcZ8D0QfKTFql3S81J55jMhw9J40BUoC+4oLZtfZqTEzxsMNiKpitrOXMC8yveG6Ni9FDV7/PZyBmpJB88Zf6fWYVQ0pAIaAHI/4zkNuT6MizjnbfK9HOeuYVTlYaPrJuIRRHT7AnJbhWQ72hk1TcosrCvMZ6eIqdpF3VEA/kKiBAED2uH04iYalrK6kKljF0y/CJYpgOEgkfA7mYEifyrfAR/+FnwWu+CSZIY3BxHc9lBl21fdZtVR6AvTDW+Dg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c93da0c-4306-460e-2dab-08df2f516220
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 08:57:49.5835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYrNb6v9V+cnV5a1jYqRbx1aeNPyv3bkLe7n1tLFJMBPRTMwwSM/GYVNVZBxqT4U3jA36gABz0CGHFo1PLDrGcrbuzyJcbZEDu3Hl+EIRU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB943645
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Since ggtt->start was introduced, the GGTT range no longer begins at
address 0, but the PTE accessors still check only the upper bound of
the address.

Also assert that the address is not below ggtt->start, so that stale or
miscomputed addresses (e.g. after a VF GGTT shift) are caught as well.

Suggested-by: Tomasz Lis <tomasz.lis@intel.com>
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 773777afc68a2..2d890fe74c1b0 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -240,6 +240,7 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt)
 static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
+	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
 	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
 
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
@@ -254,6 +255,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
+	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
 	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
 
 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
-- 
2.34.1

