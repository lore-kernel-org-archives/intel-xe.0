Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EF9C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 17:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612FB10E06D;
	Wed, 12 Jun 2024 17:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzE7QoJ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B05810E06D
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 17:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718213278; x=1749749278;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=XCJ0zYY8l99Bh15XvGZ83yG5F2uAupxjg7YxDu+7AkY=;
 b=YzE7QoJ70fICVHn5OE1Log+yksMWVKApDiYSH+dmye2LH9dGMLbOcCrY
 wqHNpPDan8NFDO5FJbV9KoMaKFK6yJEeCc941ixWG8/xvsQUYA+kqgvDI
 D/BkALAM8qjnvARfD/adS045Hi8nG6ZdbNuZTX3Wvw04/kFxF4QRYkkhk
 +9w1lARokUx1LcA9fCkSsPfkgjp+qGg7wZVImbIwUlsLyu74GoB5lPQTO
 mqN5guX2rXE377blJf/z76ewMzM92g2Y5HDYoHR2f1v03UFX/qSGK7vAw
 EI/KQlMrT+EEdGy0pf4kGuOogMzRn3KmEasiITqvIPOnKaGUS7n7TG/m9 w==;
X-CSE-ConnectionGUID: iUP86aDUQsaaUD4sJ6wf+w==
X-CSE-MsgGUID: li4tcSCPRD6QxtiCDZbosA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18773396"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="18773396"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 10:27:57 -0700
X-CSE-ConnectionGUID: xQ9Ds92pQsCNqTfV5nQOWA==
X-CSE-MsgGUID: wwn3bjabTRGU+5tZoOB0nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="39927093"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 10:27:57 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 10:27:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 10:27:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 10:27:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPJRyWTXxfVj7Blht69u9cet/tH8OcVFIWPWls3jEDL7Trz03yzcSTI8hamFKBJb+UXMC1F7sVrUFKKhxSezwDJinIPTmwclfZiblsWppx2OCfnVAkAn208KpTIiA7pJrzuDYYjl6TDCnPGvZ8NGlvNyNGuJQNJoih99QGlBfndsuIWbFJwx2Hr/fl3alkDsCBlVU/vl0hqw16qczCsmJ9958xVNVMzOz8qWyIeWFDulVz8zJuqOCtpCai03Zj4RUvuBrIvwir28dVSXaGr33QexKe038DNw9EfFyMIXRit9gql2OuxwBhKpZyBCqyHtM9/yXNNXxlZvPmUkA5//8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuvOiqwQU6rnKip7e38KKDGoeLx2IVhRXBqSt9zMmbg=;
 b=BixUQgd1mnkW8JqDF4zRc4oNax7ZeXfuhG97EcwsXv3pej9ANLUsG4m3g28CdsohSSNPzkLPehzYxMhqqaw9xaERXDSx4fD+la1LdzmDpJ+iGOHMQM8+/+k9F+ee71E/1SYLWSMCY9LbfaUODOryTfVQ327w7qzs5LlkWY4rdHoefvW/hv3sXe3Mz6sMv5rXnwykPZLWgF1/5ZXVenUhRQKRkJE8yPymMgELpNR/G7QrWOHqScrTbVGbF+BnRbPYG4Gg7tgEc4lX414yRyPcLZVXeIv9icLO6q8IGDv2n1Kj0kgFNuoZTeHqjR+vNyd9nq8M2VO0ZajFCyJBeQZaRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ1PR11MB6130.namprd11.prod.outlook.com (2603:10b6:a03:45f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 17:27:49 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 17:27:49 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Date: Wed, 12 Jun 2024 13:27:46 -0400
Message-ID: <20240612172746.245552-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::10) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ1PR11MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e57af62-2b82-4c04-3eb3-08dc8b04fb0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REhZM2x4aE9qNjN1VmhPaVJneDg0bnVRdCtwWWppcmljSXBHQVl4Q2RVS3cz?=
 =?utf-8?B?OXdHZ1hiMWJtdkN0OUlqSjZNbkdpdlN3ZDlKREVpQlFrN0NTMWJlcS9NaFVE?=
 =?utf-8?B?eDJDVFhtVjBrQ1E3NW4wc2dpYXBoT0pEY3VjYVU3ZlR2UWxuS1FEK2RLOWNG?=
 =?utf-8?B?WEYvSTFTVE5ieXVrc3lJSk9lME1nY1UzOXRvQnpNcEJtcEFKZ0hRU0tVbTVl?=
 =?utf-8?B?dUgyVEFOdlMrUDNjTE42dm9DZVIyK3N2TlJmOFpDa1ptMS9QdGFINnBxZGpo?=
 =?utf-8?B?QzVSOXBJaHZzTytLeHJmQWt5VWx3dVowMlU4VFJJWEVXbnpTMzZGRURHY2lF?=
 =?utf-8?B?eDE5czViWUNSUzdGVFVjQmN6V244T1RXbTRmK1JISHZ1SzhlN28yNms5ZTVB?=
 =?utf-8?B?YTEvTUFZckdjVkZ0SGkwRUpHcTlFajk1Vmt6Sm1wL0ZENGNZUFA5M1p2VlBR?=
 =?utf-8?B?M0VxNlhWV25YdVoybmpuZExZTHhmVksva3QrM0ZWNDR6cGhTdHdwOERocmM5?=
 =?utf-8?B?YUlST0d0L3pvRGQwQ1dONkhTTXlaRnhuNXlHaGhkZDB3TFBUYkVZS2pmS3Jo?=
 =?utf-8?B?THBFSk9MTkdBVVEvOUhKYnZYTHFUUFRwRFFZOEhCbzA2R0JZY1E3YjhmZ1h5?=
 =?utf-8?B?SGJuNTEvNEJ4SzlUYzlvck53aTNSYU5Rdk85bnFxU3dHN3JGeVBiSyt2ZG4r?=
 =?utf-8?B?ZUMvYnpSTW8xeDdlajhqakJ4TlRRdjFkd1JxL2dFYTloUkE3RDk5TEhTem4r?=
 =?utf-8?B?eWZjVnpRelMwSktBUDlhblNEMElkVWQzQUxjRGRKVDlsUkxoYUpKaHdoVEJJ?=
 =?utf-8?B?QXBMaGJWVXZ2VDQvditqb2FEMFVxTTYzSURUb3FWdHUxdzFFQ2FWS1ZRczdn?=
 =?utf-8?B?L3BUZ0ZZakFicHZDM25pUi9QTGRmNCtkdURrMnpiTStRVk5YWnY1OVZpazgv?=
 =?utf-8?B?OW1vQjZtby94MWV0WlplRUphMXl0SU9LNWxleW0vYTR1MXlTa1BseSs4Zklh?=
 =?utf-8?B?dG51ME9IcVZIS0ZYMXBlTFZkUGFjYzV5Vlo5MGVlUkYwRDZSSnNIWVozOXBP?=
 =?utf-8?B?V0lHYWRLNlh4TlFicC9vb3RoVGRBZWEzd1JMYWJRYm5xSzNmd3FEWjhpU1p4?=
 =?utf-8?B?L2NnQ3d1T1BzTmpmOU02bU9Nd1dUK2M4MzFqME5jZU1zVzBjNXhLOWQwMUVr?=
 =?utf-8?B?L3JqMDlOUUlUZXphdGtDZENhL253VmlQSXdMTUJvRGJiNStIdDBMU0lzRVZn?=
 =?utf-8?B?aEQvVFU1NFlCenRtdXpscmFKZzc3d1pOSzJOUXhhUzM4N2d4Sk5XTVdqVnFW?=
 =?utf-8?B?SWRpK3FJUFhYY2xrNUN2NkFTRVBVdjVPK0tVQmFCQUhIbzlSWFpmWnZmaGtz?=
 =?utf-8?B?Y2pPM1NscU8vUGxEYkJWOVBLek9NMGFBcURnZGdWSVR1ekRxczIyWUQrZU1V?=
 =?utf-8?B?SFZzL3hVdGwyTXlEc2tQM1VjTzQ5WlgwYTFtS3krd1V6RHZNa3ZWUC8rZlcv?=
 =?utf-8?B?RzU3WUVXOEZNeXNIM0xnVzNMWlJEalVGSS9NY3E5Q01vVnQwMDVmMmllSzUy?=
 =?utf-8?B?OGVwa1AzN0l3UllLZFd1cFVEdkpBdzJUbkZTa2dRSjVwVng5VkNmN3p1UGV0?=
 =?utf-8?B?L3UzN3B5aTlESVFEZVoxWGxhTS82NFovaWh1Ujh6dHJub2pJdTFNL1hNQjBk?=
 =?utf-8?B?QjNJMlBHWllldGhSWnRPbkVjTVZpTWIrRjZrWXh3aE9KTlhwK0FqblpFdFha?=
 =?utf-8?Q?0yozw3aQsyjfB9tPrIfzFH9DowcZyZxKkrJv1jT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2o0N1AyOVFWS3NmSm1VcnBobTU2R3NXWnFNM2RGcFVQRE1wdkZ3ak0yTHds?=
 =?utf-8?B?M0MzYjVIQWNmUUtaOU1UR1V1N0RmeFd3TWhUNENaaTJUTm0wYmxKaTIvdVg3?=
 =?utf-8?B?bkJzajIzMlF0ZERtbHRzQldGT2dYazUwYXpWN3lCUGN2QXdYSHU4Z09XWkNI?=
 =?utf-8?B?QklzWlRBZnRGdmV4UWFmcnk2MDhkR1RuYzdXREwxRVJSQktodERHTnFjUG9n?=
 =?utf-8?B?L29nQjE3eWJrc2hhdHRqUS9paWFLbGxUd1ViQUJWdmpManA3ZU5Fbjk1d3M2?=
 =?utf-8?B?NTlZcDlzMmlIQzgxREZ4QWRSaXFIcnRjNkNNSm93UDk2ZlN5aHpWc0tKZWE0?=
 =?utf-8?B?RnZ4bDMxeURyNThZVGtjaTBpMFBRdXVlUlJEZUI4TU94MElKdHFvZkZka2Ns?=
 =?utf-8?B?akt3UnRVL0RtNW1BbG9OV1VDMXQxVjRHQ2tNbUZYREdFS1RDVHRNclp4WjJC?=
 =?utf-8?B?MGM4ZUdidi9jWWxVS0xOSXlnMi90Z2NJMHJnWlpvUG54T2V1cHhkTGovUW5Q?=
 =?utf-8?B?b0NuSDYxK1JOY3FqWHBERWlTdVByM3M2UmUwVkhPNWMvZHpaQlZQY1Q2NlNr?=
 =?utf-8?B?R2RUTFhhZGUrUkNTc25lb0lRUEVvVGx1L2hjOHpQaVk5NFFid0lZWkZpbDg1?=
 =?utf-8?B?MXduL3JwMTFaZVFmWXVPTHdXcWNreWxCYy9SbnNydWNJTmNXc1htdFJpTlBv?=
 =?utf-8?B?d3ZHMHBmVCtqbW16VllSaUVQcXNwd2RTK1YwdkxDMUc5YTNmZkNOemRaT0ND?=
 =?utf-8?B?R0VjNE15c3ZVWkR4cTNlK0c0MDZhVG9YZnZ1V21rNGJuVktQZXpwdmVYYUxx?=
 =?utf-8?B?TmIrWlB1TEhjRUxUQUN0T1NyRFJ1NG1QQ1piR1lNekF0QnFpSmFQTllzU0ZM?=
 =?utf-8?B?M1FwWE1Ud0x1U1BMdUU1ekQ0VkgraXVOVjdQRERZeWpwdVdiMlI3VDBTTEc1?=
 =?utf-8?B?ZnlwMlBYVERPcHRBalBpQ0k1cmdTU0Vub0lySnN1RXZGWEhEalhWcUVwZVhh?=
 =?utf-8?B?aE13VzYwUmhnNlc4SmpZQ2s1U1FoOXphaWc2SS9pSU11YXBySTI3QlIvcnNt?=
 =?utf-8?B?ZitCaXluaXBtSzVzWngwbU9MTVdwRUdzdTljczNRM2E2dU9sUUc3ZTRZbDdS?=
 =?utf-8?B?S0VubkhrM3U3YzYxQklRZnJqd1liaFFzRW9WS0IyaER6QytUREYycnMwU3VI?=
 =?utf-8?B?VWNseCtSL2NFaXF4Lzg5UGhNYzFmVXcxVHpwMU84aWRTdG1md3Y5NTZGdHlp?=
 =?utf-8?B?TWphVDRFWjBMb1B2VTh5cVdyaFNYZEQ1Skg3dHNzalhxak9BbHR5cVNXaTVX?=
 =?utf-8?B?eXkvMDJaSjEvOGQ3WmJmczJxRHFURnZxaTNJQXg1a2lNUUlRK0tvQjcwTTlY?=
 =?utf-8?B?RXNCaFRJRzR3WEhjRWJVTi8ycDliMGJVZmhJb1ROZDV0RVdMamZIZ3pmalUw?=
 =?utf-8?B?NFR0bkFWdzNFN0VMS053cnJ2SHVBeDhBenlKaG54c2JtNyt4WXl3TUxFcHM1?=
 =?utf-8?B?aXVSUTVpRjZuNlRLR1p5SkNhTDZEVWxPTEZEayt6a05pZjBOaU5RYktKMzRx?=
 =?utf-8?B?dmxJanhhZk8yY3V5VnlmWU9BWHRvOC9rczk0dWxEWE1yWHdJcTBGWDNMSDNa?=
 =?utf-8?B?UDlkK1Vsd3R5RXJzUGs1NS9zenBQODFFdGhtMlJGMDRJNE1tWnNzR3RnVC9z?=
 =?utf-8?B?VmoxQnM5MEx6Sit2NkU1cjNjcDRRa0VFT3VwcjlFMzNGeDcvZFVlNFBObjJ0?=
 =?utf-8?B?WnJ5MWxJRkxZNnF4b05lS25USlZmQitWSjJIYjFlcDNnWHVTYXJKdkhZc0ZQ?=
 =?utf-8?B?Qk9kbzlac2gyaCtESEZWdHR2WFV4Yzg2THVmZGdiTzJjN1NzVFkxZXFUdW1T?=
 =?utf-8?B?QXJ5azhXYkRTM2NNSGJHYVJ0NkpqV01nOUw4NUVSS2xMOEJoazNkL2VidEEv?=
 =?utf-8?B?N0JlbUtQRi9UNDFrS2VvQ2FhTDcrc29JanVmWTg4SzA1YXVTbncyc0VjVjd0?=
 =?utf-8?B?d01JZFhBTkF1RkRzSUl6dVJLM1VuTXA5c1lzaFRDb0x4Q25WVTFydFA2RCtK?=
 =?utf-8?B?b1NCeGNJT1c4OENvSUFIS0ZobW1aVDhHTWg3MEtMR1ptc1BJSzY1NmM4cm5q?=
 =?utf-8?Q?wmOnU/Kyfixzn9T8UpoRwT/Jg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e57af62-2b82-4c04-3eb3-08dc8b04fb0d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 17:27:48.9860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aELyxsLKd9hKhc3KC4Y4ndFHjucP3xMznLkvknKmpQESluLcnQPHCiwsO4Mb0ZcMGmUK+FgcYPYgZZr4vhHh0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6130
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

Defer the ggtt node removal to a thread if runtime_pm is not active.

The ggtt node removal can be called from multiple places, including
places where we cannot protect with outer callers and places we are
within other locks. So, try to grab the runtime reference if the
device is already active, otherwise defer the removal to a separate
thread from where we are sure we can wake the device up.

v2: - use xe wq instead of system wq (Matt and CI)
    - Avoid GFP_KERNEL to be future proof since this removal can
    be called from outside our drivers and we don't want to block
    if atomic is needed. (Matt)
v3: amend forgot chunk declaring xe_device.
v4: Use a xe_ggtt_region to encapsulate the node and remova info,
    wihtout the need for any memory allocation at runtime.

Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c |  10 +--
 drivers/gpu/drm/xe/xe_bo.c             |   2 +-
 drivers/gpu/drm/xe/xe_bo.h             |   6 +-
 drivers/gpu/drm/xe/xe_bo_types.h       |   6 +-
 drivers/gpu/drm/xe/xe_ggtt.c           | 112 +++++++++++++++++--------
 drivers/gpu/drm/xe/xe_ggtt.h           |   1 -
 drivers/gpu/drm/xe/xe_ggtt_types.h     |  21 +++++
 7 files changed, 111 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index a2f417209124..b54d8850463a 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -153,7 +153,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 	}
 
 	vma->dpt = dpt;
-	vma->node = dpt->ggtt_node;
+	vma->node = dpt->ggtt_region.node;
 	return 0;
 }
 
@@ -203,8 +203,8 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		align = max_t(u32, align, SZ_64K);
 
-	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
-		vma->node = bo->ggtt_node;
+	if (bo->ggtt_region.node.size && view->type == I915_GTT_VIEW_NORMAL) {
+		vma->node = bo->ggtt_region.node;
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
 
@@ -322,8 +322,8 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
-		 vma->bo->ggtt_node.start != vma->node.start)
+	else if (!drm_mm_node_allocated(&vma->bo->ggtt_region.node) ||
+		 vma->bo->ggtt_region.node.start != vma->node.start)
 		xe_ggtt_remove_node(ggtt, &vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2bae01ce4e5b..c807c0fe8d4a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1072,7 +1072,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 
 	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
-	if (bo->ggtt_node.size)
+	if (bo->ggtt_region.node.size)
 		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
 
 #ifdef CONFIG_PROC_FS
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6de894c728f5..79e77dac48f3 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -194,9 +194,9 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
 static inline u32
 xe_bo_ggtt_addr(struct xe_bo *bo)
 {
-	XE_WARN_ON(bo->ggtt_node.size > bo->size);
-	XE_WARN_ON(bo->ggtt_node.start + bo->ggtt_node.size > (1ull << 32));
-	return bo->ggtt_node.start;
+	XE_WARN_ON(bo->ggtt_region.node.size > bo->size);
+	XE_WARN_ON(bo->ggtt_region.node.start + bo->ggtt_region.node.size > (1ull << 32));
+	return bo->ggtt_region.node.start;
 }
 
 int xe_bo_vmap(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 86422e113d39..d905fa5e1b52 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -14,6 +14,8 @@
 #include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_placement.h>
 
+#include "xe_ggtt_types.h"
+
 struct xe_device;
 struct xe_vm;
 
@@ -38,8 +40,8 @@ struct xe_bo {
 	struct ttm_place placements[XE_BO_MAX_PLACEMENTS];
 	/** @placement: current placement for this BO */
 	struct ttm_placement placement;
-	/** @ggtt_node: GGTT node if this BO is mapped in the GGTT */
-	struct drm_mm_node ggtt_node;
+	/** @ggtt_region: GGTT region node if this BO is mapped in the GGTT */
+	struct xe_ggtt_region ggtt_region;
 	/** @vmap: iosys map of this buffer */
 	struct iosys_map vmap;
 	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ff91fd1b7c8..d683c27761c0 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -389,7 +389,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
-	u64 start = bo->ggtt_node.start;
+	u64 start = bo->ggtt_region.node.start;
 	u64 offset, pte;
 
 	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
@@ -398,6 +398,74 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	}
 }
 
+static void ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			     bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	bool bound;
+	int idx;
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+
+	mutex_lock(&ggtt->lock);
+	if (bound)
+		xe_ggtt_clear(ggtt, node->start, node->size);
+	drm_mm_remove_node(node);
+	node->size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	if (!bound)
+		return;
+
+	if (invalidate)
+		xe_ggtt_invalidate(ggtt);
+
+	drm_dev_exit(idx);
+}
+
+static void ggtt_remove_node_work_func(struct work_struct *work)
+{
+	struct xe_ggtt_region *ggtt_region = container_of(work,
+							  typeof(*ggtt_region),
+							  delayed_removal.work);
+	struct xe_device *xe = tile_to_xe(ggtt_region->ggtt->tile);
+
+	xe_pm_runtime_get(xe);
+	ggtt_remove_node(ggtt_region->ggtt, &ggtt_region->node,
+			 ggtt_region->delayed_removal.invalidate);
+	xe_pm_runtime_put(xe);
+}
+
+static void ggtt_queue_remove_node(struct drm_mm_node *node, bool invalidate)
+{
+	struct xe_ggtt_region *ggtt_region = container_of(node,
+							  typeof(*ggtt_region),
+							  node);
+	struct xe_device *xe = tile_to_xe(ggtt_region->ggtt->tile);
+
+	queue_work(xe->unordered_wq, &ggtt_region->delayed_removal.work);
+}
+
+void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			 bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		ggtt_remove_node(ggtt, node, invalidate);
+		xe_pm_runtime_put(xe);
+	} else {
+		ggtt_queue_remove_node(node, invalidate);
+	}
+}
+
+static void ggtt_region_init(struct xe_ggtt *ggtt,
+			     struct xe_ggtt_region *ggtt_region)
+{
+	INIT_WORK(&ggtt_region->delayed_removal.work, ggtt_remove_node_work_func);
+	ggtt_region->ggtt = ggtt;
+}
+
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 				  u64 start, u64 end)
 {
@@ -407,9 +475,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		alignment = SZ_64K;
 
-	if (XE_WARN_ON(bo->ggtt_node.size)) {
+	if (XE_WARN_ON(bo->ggtt_region.node.size)) {
 		/* Someone's already inserted this BO in the GGTT */
-		xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
+		xe_tile_assert(ggtt->tile, bo->ggtt_region.node.size == bo->size);
 		return 0;
 	}
 
@@ -417,9 +485,11 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (err)
 		return err;
 
+	ggtt_region_init(ggtt, &bo->ggtt_region);
+
 	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
-	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
+	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_region.node, bo->size,
 					  alignment, 0, start, end, 0);
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
@@ -443,43 +513,15 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
-			 bool invalidate)
-{
-	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	bool bound;
-	int idx;
-
-	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
-
-	mutex_lock(&ggtt->lock);
-	if (bound)
-		xe_ggtt_clear(ggtt, node->start, node->size);
-	drm_mm_remove_node(node);
-	node->size = 0;
-	mutex_unlock(&ggtt->lock);
-
-	if (!bound)
-		return;
-
-	if (invalidate)
-		xe_ggtt_invalidate(ggtt);
-
-	xe_pm_runtime_put(xe);
-	drm_dev_exit(idx);
-}
-
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	if (XE_WARN_ON(!bo->ggtt_node.size))
+	if (XE_WARN_ON(!bo->ggtt_region.node.size))
 		return;
 
 	/* This BO is not currently in the GGTT */
-	xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
+	xe_tile_assert(ggtt->tile, bo->ggtt_region.node.size == bo->size);
 
-	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
+	xe_ggtt_remove_node(ggtt, &bo->ggtt_region.node,
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 4a41a1762358..75511b5f43eb 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -30,7 +30,6 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end);
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
-
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index d8c584d9a8c3..bea66aa0d843 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -36,4 +36,25 @@ struct xe_ggtt {
 	struct drm_mm mm;
 };
 
+/**
+ * struct xe_ggtt_region - GGTT region node
+ * It needs to be initialized before the drm_mm_node insertion in the GGTT.
+ */
+struct xe_ggtt_region {
+	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
+	struct xe_ggtt *ggtt;
+	/** @node: The drm_mm_node itself */
+	struct drm_mm_node node;
+	/**
+	 * @delayed_removal: Information for removal through work thread when
+	 * device runtime_pm is suspended
+	 */
+	struct {
+		/** @delayed_removal.work: The work struct for the delayed removal */
+		struct work_struct work;
+		/** @delayed_removal.invalidate: If it needs invalidation upon removal */
+		bool invalidate;
+	} delayed_removal;
+};
+
 #endif
-- 
2.45.1

