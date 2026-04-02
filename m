Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD4ACC6B1D
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 07:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7F110F096;
	Thu,  2 Apr 2026 07:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="naJOgNMe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE2D10F115
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 07:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775116519; x=1806652519;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PHTXcGFsRX6jsth+YGnd/qvrmJx7o+t6ycdD3DJSxiY=;
 b=naJOgNMeP0I2tSpnuf83FspZLp8oa4MkUwFaUyp4m9+c5s9+q5m4s/Ry
 yRX86sQx8ffhVMqrDiIR2fgQX+AgaF/1X+i9kHMwlkuUMLFIIMRD6cUZn
 s6CLv4CuRzhyXKP2UYE/Q9mzgQZWLUK/51H9x5Rq9zqB+ZiOxDuGu5xF1
 0tBfuWqcqm26+rK2xRX4NFzShrxxT2G+k4xFefxLYJo+tdy4LuzfeeZG5
 IAHWVRo8Gvblas88f0nK9GwMhqAxGZDVabsMx5LOh4TsHjk3u+Ov5tAuf
 b7bFcrBfV6bYTxa/K1j1sTpgMhVWD9FzYnA7+NA4UIBg3ApFa+A6pfXuF g==;
X-CSE-ConnectionGUID: fnlamX+zSS+3k1zvEbuR/g==
X-CSE-MsgGUID: PQdSUhfKQRiGRkDOSSx8qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="101620365"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="101620365"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 00:55:19 -0700
X-CSE-ConnectionGUID: 57LQxa2tTOW4EBpOJISUDA==
X-CSE-MsgGUID: EkxmGsVXT2OkDpIo0Q5Xnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="225901687"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 00:55:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 00:55:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 00:55:18 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 00:55:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixYN19zk/T7w25Y2ZnBaed3N9N/koB+H9wfyggnK88/oUGInTHlb1MhTNpA+cAAm5xKM5mZKu2U35lgWBufCwvC993A9PNeeCClzPR9ZMaM/UzpS7E9ZKdhoa+EEK7b29Yqh9D4IGJBDLZELNozo4Mb5a5JfqQ/AGNTbW9/IiOGmM5pba5x5y1f4dL5nETYo9ZpzqCEnbZxQfPnoK6IDRWLqGqF+ESEykeFu/1q+QDVWOma7aOjW+HwZ1oyVYnrHUyso7kmDUQg7vQUiXxDU7ds7cY4rVAcoOn3A02hiQgfzCn9pBR3sCud0pEc10wz2hBxXYqk4MNlousxRwy8jjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzzIWHgEORftjHrQYjHlSJ9JHDREw7qn2yGHNEqEV/I=;
 b=XZ+c8xZEyzii90/YMondvRcMk2hDw5X3ccDeyVLS2IiNGgV+3oGruhS5LSTclJfB+4vQaVMavPa8IHUkaGeR/Utbjo8OxYeHd83Ye5v9FTXzUm7x/Ld/PXSlixBzhe86gXY/Tcr8RD74+u2DymyUd729ykqYsEYqiP/+parLda2bNFH22qJ7o6sT1WgtH54PMh0LKaw3SWiLt+qjS/vbqOxS0L/YcTpV/YD9sQsQ+G3+5FE2FQuSg2fdDbW7k+IwgV5Cqbjib81alcuengF+kXr+Nakkr/chhWTUIXpzc5pjLDtowTijRa7KnBOynK6PAd1OqSd0Wpa+Tkwckml/1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS0PR11MB6518.namprd11.prod.outlook.com (2603:10b6:8:d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 2 Apr
 2026 07:55:11 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 07:55:11 +0000
Date: Thu, 2 Apr 2026 09:55:06 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 02/13] drm/xe/pf: Fix pf_get_sched_priority() function
 signature
Message-ID: <20260402075506.yrtc3t4qstfmwo6c@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
 <20260330204046.567-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330204046.567-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI6PEPF000001FF.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::913) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS0PR11MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: b8788e6f-3aae-464c-1bf3-08de908d2a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: YJvRB+G0o2Z+yoPKAkwq14lmkeieylsKoIsVZC73qWuTxKppdVfqV5J/4/j8JdWM6aNsmGu2JTJDzstijNzGwOXqYPoCe9TGO0CTnubFa6iW72ZgVo4DMypphGNr9LlFMOLq/Wo9BymGGm7vMGfBlYKmArZ3CbW6X/+/vZhY6woUHyMkuQ2aiPAXjcsoW6gmBZ/QnYMMvikYhfd+Ua+7y7mr/HAkZsrjilBSg1EERoOXJqVIaA6daH6s2nAIJSeed8Hcxgi9M0wCnFTxQPqjIe3/Ot7oKnwQSSZBSw0me0NLkQYY+NfflXKqvLGdKXZgpWwb7fdarVipLS1gr6ZjcI1bL4cWrMISBkfntWPY6iau2yqdXxQAy75wX4LDZGoAk6iWWrGiQMAmphqk4P6AuiI/YXPwvpvDuqN2HOZqwW744L23/dC1gTbGd3/JoN/6yAj/4K9cYkVDDNIJ0xW6fYS47d3P5Np4YpQBp+ZJyVMCyLi9N4pUFUyMUyZ5vePT0rQR0SJF3+LlNXkDETi916B1UPABsrD6j1OPWC4wQe7FK1vh1yU3Fd8BfdBKVTYFO4aFNkpEh43l7pbo3UI8zvkYimfAZZEPPsJmP3w3bclyuANfDu1a0IvxlTFJJX4u9WFOHjpAHfrjcrTvsxuI/JP+wQqHPrFmImvQo3kMtr2RtiWj8Blb2CsDDpj9wwdlGOefm7Pk9SE5spfCx5XpO3QzsZCXiQZLcmglP8lI5nE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TncwOTV3ditJZ2dTd3YzaERTeTllN0tEUy9GWnIrTEFMdHdIRk04SW9KUjhP?=
 =?utf-8?B?c3ExVTB0SmM3MU9USkdqcWIzVy9BeW1nZ2lWV1RMVGlXMXg3MkIvMFZ4RElu?=
 =?utf-8?B?b2tVc3p5VHFVQnpxblpxRWlZV3BrR3FXL2d3eS8xRkN1bTJrQjVZV3pTc2x4?=
 =?utf-8?B?VVZiTHhtQmMzcndsb2VHT05zNVZyTGt3YWZhQzlrdHIzZzZXSDNydzhwWDFp?=
 =?utf-8?B?VjdXYlJhbWlUY2RQYi9HQnVGalQzTTN1bFFOalczbVk1eVFLTTZaSGlpNlRM?=
 =?utf-8?B?UkFxVFBiamRhRERSN1E5ZUpRY2VTT2M2aHd1a1NvbjJQTXdiZFZYS1B1WkM4?=
 =?utf-8?B?RytHVHVNazREZXhYZjRhR2tjb1F3alhVenZhQURGRmYxRTNITkJRMnl5V0U1?=
 =?utf-8?B?SlNCK3oyZDREZHN3SW5zVUZYb0p4ZTViOEJoeU1URnBUMmtaazZVOFRzYnAv?=
 =?utf-8?B?M0xKdkVJV0sxZEg3QjVLRHdueXNUWk9lVEF0RkJsRzhWRmVuZ3VqQUcxYVg4?=
 =?utf-8?B?Q1UxajYrc3phbTFkTjJTVFBBQ0dieHJIOEI0emV4Wmc0cDd3UFV3WFRZNE44?=
 =?utf-8?B?T0tVamQ0VEJ5MWlNR21sQUtDQjRDVDBadGtSTU51MUw1Uml3djE2VitoK3hM?=
 =?utf-8?B?QVpoVHpWN2xFd3M2aldOWDIzQTM0eWZVb0ZDc3V3bVZ1eTQwY0h2WTM3d2V3?=
 =?utf-8?B?UllJUXN2WG5xZnBwN0tTZEdkditwa0duUEdyWmJiRVNXaDNMcXh1Y1NZeWQ2?=
 =?utf-8?B?UUlMUTFoMy90TWd0NWIydXZRZFNHbDlkckx5MWtwbFBzMlRXOU1aZVUrU3Y4?=
 =?utf-8?B?cWpaZmRtZmlnMjFiTVRkYWhhM25sOHJqZU5SbFRIaUo2RWNoYm9WeHJndWZB?=
 =?utf-8?B?aGVQb1B6d040ZDhuemRxRE5vK3FMaHZTSEllK0xTc1hha1FWVUhjQXRvMVBL?=
 =?utf-8?B?QnJKb0hHMmRzUXlzL0FZcHBMS0hzd1Z3YUJCdm52S3ZJcXlDR1NlYXI4S3NK?=
 =?utf-8?B?UlRoZUpOdEFhdnpXMXFEQ04vRTZ1SStTQ1FmTkNFV1o0V2lTR1VVMlV6Q1pp?=
 =?utf-8?B?alRXbW8xVFpHMEhHMVVpN2N3R3RHQlBzaVRFbUFoRS9Fa2pWQUFXUk54QTJ2?=
 =?utf-8?B?T0tybDM1NjJpRVBSWTgvRzZZRklJbkFhT3U3QTdrZURReFhpOHJQYzJOeHk4?=
 =?utf-8?B?bHdROTdNMU1lZDJuQ0ZLR0EzNlM1cGlCdCtFcFZWalVQVlV6b3JydGZ0RVFR?=
 =?utf-8?B?UEpvbHB2RHU3YXM0c0VwWVU4OXg3aG9KWmlMV2xrVDBRSjVUUjRrS1pZb0tO?=
 =?utf-8?B?bHF1OGZ1Z3JUclczZFBrZ0IxUTczNUZ1bXhWWWZrYWdJT1JhYmNwOFkzVDRu?=
 =?utf-8?B?YUg1Q256WXN2bktaSFhJL0dvOXB4TE9VeHIwSTVHYkxkWlVrV2JVVHJVMHZE?=
 =?utf-8?B?NUdsNGZIaE8zUVM1VnJTZUovZStrSlp0YWJSalFBSm9rSXNJelNoSFZkb2VM?=
 =?utf-8?B?SzFOS0lKTDUyZmx3RzRVSkkyTHg0TUJYSDVrVzJOSjNjQXVRUFFJSTNDZXFU?=
 =?utf-8?B?YVhES1JHZXBRSjN5Z1pPL0dpM0N6QVA2ZnpHTXJYTFBnWUplb3A4R2dIeEhq?=
 =?utf-8?B?RGdEOVlvbGVacUw1QUlXWVNhQndJQzJVRTJxaHd5RlRrQTM0TzhpZ3R1K2hi?=
 =?utf-8?B?bXFxL28vKy9pMkFlUU51Q2Z4cktCS2VVNHVwcXdhcFhrRTF3aGgwVFV1NHpJ?=
 =?utf-8?B?QVpydFJqandnekJDakc3RTNWYy9heE9zWU1JcjF0KzVZWkcxVlR5NmV0amtq?=
 =?utf-8?B?UEZQSHdVdUZValVaL2NVWHFueWNoZVloWTFCZ1lEQWIzUnFuQnh3TUVWVUcw?=
 =?utf-8?B?OGRLMEFEeXRBRmdkYUFGZnlDNmhueCtRNUxHUGNOc0VlWjNlR1hlL2dGOUg2?=
 =?utf-8?B?UnpRSEkwY2xmRHYwSWJVUGE5Y1hIVEx5eHZJRmI4dXZJeWlndE90WVFqcGxV?=
 =?utf-8?B?TnBEend5ckdhVXBxamhTd0J3cG45ZUlEMHNtTldiSHprM08vbWs5RUNIblZr?=
 =?utf-8?B?L2RyWUdocXExZzNoYUIvS2pDOG9mTEZIcEhRTHRyNXVBRXdyN3Jia2NHdmtr?=
 =?utf-8?B?M3dzRmdNNm9mRGpGajY5T3RUSHBsd052WXNkVU9BbkMvWWtPQm83VU5NK01Z?=
 =?utf-8?B?d2RQYkxZU2N4VHRaYWlldmxhSzd6Y25yZHg3aTZZUlhkUCtzUHYxbFA1R0d1?=
 =?utf-8?B?TU82OUNOWm1mK09pM0xQLzkvQ1BjS0U1cFEwS3ZZWnFLYVpxZlAyQmYzYWcv?=
 =?utf-8?B?ZG5heEFIZFNKODJrcUh2RE1kL1NGZi9VOUhFMTRrYTdYb3RlcXh6WTYwdHJh?=
 =?utf-8?Q?eggiK+NgvWgazR8Y=3D?=
X-Exchange-RoutingPolicyChecked: Jr6CyvpIP21yORKOIdoHNUPCkHq1Fx+lRhRRgxtE9KaiH1fja3ZiO71DYYb+25t863bGjnsTtTryQLxswXankhJgLc9m/91/tepP+Bueo2lAE+QouTD/OxxY6DfB5F5uTDaZ303BH1hBy1tBDrByNaT/JxMndZgdRaJNdo9y7xGjPbaeXNI7jQc8dQuuZdG/BfQ6t4AYor8TaJluoNER8g+86HA1esCdEG/kjXgZfxrfawDyHA1KKFFYrxseKM/Qc0T1inE+OeLjiVWz/KzOuw7ZHYgeZoWP8zGWToKuV4DJCyDkLiJT/CwtrMuKenP1SV21bR3LbeMkWd4/JFi0Vw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8788e6f-3aae-464c-1bf3-08de908d2a8e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 07:55:11.3058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HaBj+lLwPA9vj0SDRP0s4edE/Ebr4bIghl28EDFk8yk8JPT9LgNqbX5gt8TOH8JxMKlXUaG40Wpl9qo4Zt2UZNx+N7CXjTDjAtwTfXV0i3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6518
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2026-mar-30 22:40:33 +0200]:
> The pf_get_sched_priority() function returns scheduling priority
> that we defined as u32 so while it works we shouldn't return int.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 2f376b5fb088..658e9b048751 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2500,7 +2500,7 @@ static int pf_provision_sched_priority(struct xe_gt *gt, unsigned int vfid, u32
>  	return 0;
>  }
>  
> -static int pf_get_sched_priority(struct xe_gt *gt, unsigned int vfid)
> +static u32 pf_get_sched_priority(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>  
> -- 
> 2.47.1
> 

-- 
