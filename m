Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C19CA5FE0
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 10:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA51310E580;
	Fri,  2 Oct 2026 10:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZP1QJ1XZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646E710E572
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Oct 2026 10:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790937658; x=1822473658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EcWI7bBwnWsd4qrVij3rttyipBkyCokeEXofK5/MUVs=;
 b=ZP1QJ1XZ2RG/4gtqQwFM6I/3C/lq+5NCPhfGfx79Utknvy1tOgXkfgod
 4iWO0TvJZVIitFc5JBlzMoMHG/iYgIJsNmUzMNH5mQZPVjaxs7wBqckoj
 lDvOvGqLSyH8rbXF1Xw/LGrSKIBqxDydFZRS6uY/9DsWvuMf3/l6Kh6mA
 WnogcevT7sLDV82tLSg9R8VNKl8GdlTEH0awCAbIjkdfDDWr+PQQhoJwS
 TXojwYpHjZQwXDVXyvEnyhboeCfF6KInAun+k62JuliJ349xDFI/9PE77
 k7YTbzE31UV6CZn8Do7JtthF/UYfoRhPH6nQDWJ314ClnrLLXgLvdIrvZ w==;
X-CSE-ConnectionGUID: G2w46Yz0R5mxoag2jCszhg==
X-CSE-MsgGUID: DYPiVvRBTvKRY7REfXzoVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="108081737"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="108081737"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 03:40:58 -0700
X-CSE-ConnectionGUID: 1F5TrNM5QwWgwJVm2dNtdQ==
X-CSE-MsgGUID: xnyTl516T7u4L79XP1eJPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="275415805"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 03:40:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 03:40:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 2 Oct 2026 03:40:57 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.50)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 03:40:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHWnGaB7IlZ6a01iIhtuy4yQfP+IA6LGGgnBGFHeDtNppHcNSCI90nJe9tQPFZzd49Au8PcvcnkTDOoRGua80XSPLWqEAxfF6KLIkT/uF15CW/CJsfNKzZfB8k9BKcU7VrFylqc1AqFKyAMyC+UuuLgZlM/9txWEBaZE84bhkW1bKb03bJpILjo5svFIAeFp6x41ozNtmSsMLo0KgeLkaY1UUbjrweLPd/dvbCuGQNPkfq0Y/kkNP7oNAL8eihre9efEoH9Z4B8sdbOnqb++8UdQ7qwqfRVJbPryF5L5aRU63QOKu+/o6weM9SPLKkgP2ubK3XA4gJJn2vICFlb7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryIyBpct56Lba/brwzrzLlIn2TOsvDorlobjdI4K9MQ=;
 b=weZL2KwsVwSFgip78vs39Xi3ZAhRzL4Ajx/6ChqaWGIe29dER8vz8prIq9+/MIZZQQaAsBKVoOdKwxfqAoDK+d4aOlMzPqeCsEtkYPoTnOzFP4MYEJaEwMkCHEhEem1hXiocYEVjVmz8n1adgmAt0x3Mq5T/zF87anXMYE+eOoMfhKgTIxCHsIHop1eHc1JunCajXH/d1hzokrqipTF8RjOhASgtUx2z7+GROABke177euMhaQMAf6BMLAkY1f1JrUSAGmbT6BE7OakpsYgoSzvun94ENa1l40XAHQOKW66z7lW7efSHV/wQS/6go3ym6c0lqe1Mwz1dMr5rpOwLQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DSVPR11MB9577.namprd11.prod.outlook.com (2603:10b6:8:388::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 10:40:55 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 10:40:55 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 5/7] drm/xe/vram: Allow splitting a region into pools
Date: Fri, 2 Oct 2026 12:40:16 +0200
Message-ID: <20261002104018.3648425-6-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002104018.3648425-1-piotr.piorkowski@intel.com>
References: <20261002104018.3648425-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0282.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::17) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DSVPR11MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 158e04e3-98ec-4d69-73e3-08df2071a367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|10067099003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: QPxZxpMNlSsXKJ1A10H2rpzRa2EPi7DJj6TGRuKzIguxVfPbEYbWiXiEdsicMf9jqgTyAKURgGTgvi+QGm+iWRn8FTwRhz6ZEvV2dNtgJtuDOv7xcml31ex53+ZZN35for5hLvdqc+DThOrQotouYf/d603R4M32/pL3CnumytUw0TRaKtU+mQRV7k9CvJkn23oEGl/2S0AMYunuv85IVMcKzbprG7ld3EzeBSmCVG3eL5RPi1luEQL7QWeeuNO03y3C9YdqtyZaUbZnxN80w0cgTmNhqJL4ItotvoMt/sfHsjbo+C0F/9UUuByBZKjjgni4EyVpkbo6Wuzd6MAxX+HvkSaDJooWa29paf7SaDCQ/jBg7My73N9rTSt827hYbfis1DtzqGETBZdtSKYLjjZM1PUTs8Gp5JNeyhAvOvQ1VzDtovKw8sRNgsXcLkZGtw6QUn2zfkbMq9Qw0RGQO7wbIXzF2UzdVV6ojfcjCaz8w+Hi9g5HuM6oBPjBZKnXvI1Ck1McqmEVCfrAcNfUcjch6DTN2wnHLtvYP6TjNViSAo+ZksPilUcU117E2UpIMoeSy0t/r1ypCbJaWxumv6eNbLMVrT4xuqwB7TIUU1DHGNy6FGIFydI7f2W7XU90q0Qc6BmlgWrpBtWJ0r0gFDrk7jQkG13QFZL5E9X/Xxk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDJjQVl2KzE2UDBZc1ZZM3llUG9uV0xYRERxdThoYnVIekJqRVBVWlhoQytU?=
 =?utf-8?B?QjZYK0JuKytaR2VZaTlkaGU5UWxEemU2RFdsNVJSTllwd2t6QWZvbEwyS2dU?=
 =?utf-8?B?aitUdmg5aHREc3pLbEMvWWtHTC9nNGFWYTBCa0k2TTNyVXU2bXo1UjJaZlNI?=
 =?utf-8?B?bVlNRy9helpvVnVOVkpSVW00V1B4ZlcwNUlUdFdiQ3RUQ0R3alB2UlR3QjZa?=
 =?utf-8?B?bXVkWjFMMzdwL0xpK1FKUGkvcmxZV0YvQ3hhellTZGd0REk4ZTJjaW8rM2hw?=
 =?utf-8?B?cExxWjdUeXlpS2ZXSXlZamJVWG51WUlCdlhnSExqMDdiVHJTTkVOcjl2SzJ1?=
 =?utf-8?B?cnlqUkhUY0YzUUs3My83K1hDVmZNWW5PelByS01pejZ4MGZ6UXRNMXMySGU0?=
 =?utf-8?B?cmh6SElTQldzMnRmZ09Eb3ZNVFc0NDkvZHkwaFljUCt1SnR2OU1JeW03RVNB?=
 =?utf-8?B?ekphcDdPM0RheWJUbWh0cFBFbHcwVUV4ejNscHl6MmJ0d3NIUWtudkVURmFW?=
 =?utf-8?B?YTcwekYwUGZHd3ZtaytrRitNM3UzWTNOaVlmSzcwcXlnWlZyMDB1eHdOSnZs?=
 =?utf-8?B?OVpUd2ErMVNVTjFvMEtTTHVGMXdhS0FPaUk3S3pXdmVwSm1Oc3dLVnNsWDJW?=
 =?utf-8?B?QkxNZy8xNERuR2JZWm1mU0loTUl0TFEvZy9QYUhrTnpEVnZLbGQ0SlQvMkVC?=
 =?utf-8?B?ek9rUWRKRkZQZUFnUFd3MEhLaHNoL2V5allydnM2YlZSc1JlMTdaY1RNOGZK?=
 =?utf-8?B?L1ZlWURPc0NWMmpOZEdoMFNKZ0xMMjJveUtxaDVBUjZhUGxCVXJZb2FrbzB6?=
 =?utf-8?B?NUdEdUVBOHJveEZicFNTZHcvbW5IQkZSRXV1V29CMHZZemQyYXZncG01VG1J?=
 =?utf-8?B?ZkNTMGFMY3ZxTEZ5amxQN0w2OHc4ZDljL3RrZllmM2NQbGl4eGtFRUFjMEZI?=
 =?utf-8?B?YlBLVEJIUlBSZS84VkcvVlJVTnRpaWxnbXc2VEEvVUFjQkNJb3A5MDBpejg2?=
 =?utf-8?B?bTc3c2FPdFBqWFlPTDZ1Mkk5NXZTSVZNWUh4L2hJL0pGWjRVRFRpZitYeVhV?=
 =?utf-8?B?Z1ZlQ1JuWVcxTC9FNWxkbDdTZkpqQmVTNDBLRndGN0FXYUNWWkNCalJSYXVB?=
 =?utf-8?B?Tmc3dVdsU2hqWE9wdi9zbSsvUkswaktsdWVCQStkQk9pSWxQbTdkZHRZVGx1?=
 =?utf-8?B?QjVaQ2xOTndKZXRRMnowU0s3ZXhOakZ3Nm50THp6WURZeWczZ2RROEtkVjdo?=
 =?utf-8?B?MTF2aVdVTFlnN2dmV0JibFdkNkdwNGxaTjdVQmRzTFJTbThzeW9iWisrSWgz?=
 =?utf-8?B?REFZVGVmNk9BdjQ3cm5kalR6YkN0UG80enQ2aHNJWlBVN0g1Rlh3RVp6dEFT?=
 =?utf-8?B?cWNSdTBNell5a2NZbVlIMkkwTWxPdWtqYy8wcW0vN2JEOUgya0dHMGFERVVt?=
 =?utf-8?B?QjVmbllnZXE2VUxCOXNjUDBYWlZ4WEE0a2VwdS9VVkUwbU9uWi9JeE4rN3pN?=
 =?utf-8?B?N1pkRFg0Zm15Q3pRajcyeDhvMzAyMi9yTUQ3NEFXVUp2dDFYcG05QnRnUGZO?=
 =?utf-8?B?RmlFdkp4ajdJYllNSnhBZ25qbzRkSVlvZ25tRTVJa09oV0VXeFRFS2lKK1Vq?=
 =?utf-8?B?WkJuRkYrV08yMkJVSXJpNzlFYUI4OVhWVUtqb3IzVitzQnkyTGU2QU1pb2Fr?=
 =?utf-8?B?L1lzZWZnZlVLL2lYSG1MVmdSazhoTG9FaUpTUHlTOVk2cW92eXEyMDh0Wk12?=
 =?utf-8?B?LzlHN1Fudmd2VmJHdjVWVmJZUkFRYTI0bU9ENEhEYVlWZHRTZ2NNMm11REc5?=
 =?utf-8?B?VHpnYytERUs3bHNleXRnbE5TWEhMcmlRRWRPVk9wd0w2Y29tOFNsYmlSUU5Q?=
 =?utf-8?B?ZXNmNU9sd2tkYzZobEZldE9vY1VzaUtSZFhFakpPS1ZMV0RzRjlZQ3FrdjFB?=
 =?utf-8?B?bWNnc0JWNWlmNFBFejBma3c4Q3Vha2wwMHU5U2lDbWtweVFqb29scVY0MW9S?=
 =?utf-8?B?aEY3UU5DTHZmZjlCN3Q4dEdqUkhoYTQvYVNBcW1aU3gyZHhkR0U4NS9CbERY?=
 =?utf-8?B?eEZNYlVNUVZZT1Y1eTV3QnR3TXZFN0psdS91ekJPL3dkbkpjUGVQY0xjY0RH?=
 =?utf-8?B?VUIrT29CS3dzWlJmSFNBVnFJYnJtYlVpMzhpbDNZL21EQU56Yi9EdEc4dTBQ?=
 =?utf-8?B?K1VaZ1NSajJBUTl2VHdabWh4NldpOFp1SjBweFRySURHTHhPT1RPNzhzU3Fr?=
 =?utf-8?B?TmQrVGQ1ajJ1WXovbVkrVmFRSmJBcDZBL3VpbUNLZHJJUXpuakpxUjRYSVNn?=
 =?utf-8?B?dTlVb3NlUVE2alF4aTBsQjZMVW5FU3ZFRW13eFhsTUZlUFB3bE9EL1RleGY0?=
 =?utf-8?Q?swcu0enDwBBKVhHE=3D?=
X-Exchange-RoutingPolicyChecked: IVPyilJDXAH0l0F7lLSGcUzbNShV6QLLPL/l2PHMasKdvfAUupCFLNAok7133g/0oH/7ox04BnMdItaB6EZWyEY4qrSQbS3wSAq+vpicuAR4eRoQfuRSIpCDtwkB3pozP7aTQaMu7b6x7nSYkNJVqZnLa5v8U+egMRkfEfFiem20fWGvDCyhMGUUAaLWV1uh/LrkMaL1ahQCaNHWvwn+Hq6rVIZbz9WnAOH3Er5RmqD2Zz4t1tWSsOXOrMl1o1z/494AR3ZWoaJbm2gWXBU3F7xeVBEY/9gMbIPIPqLMYl2BA+Xg9++5QmYweL1MuKlYjx4FgUweDSHRVKeNCdpMsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 158e04e3-98ec-4d69-73e3-08df2071a367
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 10:40:55.7037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9JZsznJPeOcYFl9mPL5utGHGlZGNhxdFrpXR2g/HtsaN8/JrzuOpHj438h2pCuh7KRZUa7h2mZVL5uLe7abrfvYWEOwocf0t1k5URfHtLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9577
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add xe_vram_pool_create(), which carves a pool with a dedicated purpose
out of the low addresses of a region and shrinks the default pool
accordingly. This is the building block for reserving a range of a
tile's VRAM exclusively for a given purpose, e.g. the lowest chunk for
kernel allocations. Placement of such a pool is narrowed to the page
range it covers, and the VRAM manager backs it with a buddy allocator
of its own.

BO placement resolves pools through the tile, so creating a pool does not
by itself redirect any allocation, the caller has to publish the new pool
in the tile.

Nothing creates a second pool yet, so there is still no functional
change.

Assisted-by: Claude Opus 5.5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 88 ++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vram.h |  2 +
 2 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index ec95b53bc53b1..1df4f2514afc0 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -41,6 +41,18 @@ static const char *stringify_vram_binding(enum xe_vram_binding binding)
 	return "Unknown";
 }
 
+static const char *stringify_vram_pool_purpose(enum xe_vram_pool_purpose purpose)
+{
+	switch (purpose) {
+	case XE_VRAM_POOL_GENERAL:
+		return "General";
+	case XE_VRAM_POOL_KERNEL:
+		return "Kernel";
+	}
+
+	return "Unknown";
+}
+
 static bool resource_is_valid(struct pci_dev *pdev, int bar)
 {
 	if (!pci_resource_flags(pdev, bar))
@@ -297,7 +309,8 @@ struct xe_vram_pool *xe_vram_region_default_pool(struct xe_vram_region *vram)
  * xe_vram_tile_alloc_kernel - Initialize the kernel VRAM pool of a tile
  * @tile: the &xe_tile, with its general purpose VRAM pool already allocated
  *
- * Kernel allocations use the general-purpose pool by default.
+ * Kernel allocations use the general-purpose pool by default. A separate
+ * kernel-only pool can be created explicitly with xe_vram_pool_create().
  *
  * Return: 0 on success, negative error code on failure.
  */
@@ -358,19 +371,88 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->dpa_base = lmem_bar->dpa_base + offset;
 	vram->usable_size = usable_size;
 
+	print_vram_region_info(xe, vram);
+
 	/* The device aggregate only reports sizes, nothing is allocated from it */
 	if (vram->binding != XE_VRAM_BINDING_DEVICE) {
 		/* Until split, partitions[0] spans the whole usable range */
 		vram->partitions[0].offset = 0;
 		vram->partitions[0].size = usable_size;
 		vram->num_partitions = 1;
+		drm_info(&xe->drm,
+			 "Created %s[%u] VRAM pool[%u]: purpose=%s offset=0x%llx size=0x%llx\n",
+			 stringify_vram_binding(vram->binding), vram->id, 0,
+			 stringify_vram_pool_purpose(vram->partitions[0].purpose),
+			 vram->partitions[0].offset, vram->partitions[0].size);
 	}
 
-	print_vram_region_info(xe, vram);
-
 	return 0;
 }
 
+/**
+ * xe_vram_pool_create - Add a pool to a VRAM region
+ * @vram: the VRAM region
+ * @purpose: the purpose served by the new pool
+ * @size: the size of the new pool
+ *
+ * Add a pool at the bottom of @vram and shrink the default pool accordingly.
+ * Existing non-default pools stay at the bottom in creation order. All pools
+ * share the region, the TTM manager and the placement, while the VRAM manager
+ * backs each of them with a buddy allocator of its own.
+ *
+ * The bottom of a region is also where its CPU visible window starts, so on
+ * a small BAR device the new pool takes CPU visible memory away from the
+ * default pool.
+ *
+ * Creating a pool does not make allocations use it. BO placement resolves
+ * pools through the tile, so the caller has to publish the new pool there,
+ * e.g. in &xe_tile.mem.kernel_vram for a kernel-only pool.
+ *
+ * Return: the new pool, or NULL if the pool cannot be created, in particular
+ * once the TTM manager of @vram is initialized.
+ */
+struct xe_vram_pool *xe_vram_pool_create(struct xe_vram_region *vram,
+					 enum xe_vram_pool_purpose purpose, u64 size)
+{
+	struct xe_device *xe = vram->xe;
+	struct xe_vram_pool *pool;
+	u64 offset;
+
+	/* Splitting is only safe while no memory has been handed out yet */
+	if (ttm_resource_manager_used(&vram->ttm.manager))
+		return NULL;
+
+	/* A region without partitions, e.g. the device aggregate, cannot split */
+	if (!vram->num_partitions ||
+	    vram->num_partitions >= XE_VRAM_MAX_PARTITIONS)
+		return NULL;
+
+	if (!size || !IS_ALIGNED(size, XE_TTM_VRAM_MGR_PART_ALIGN))
+		return NULL;
+
+	if (size >= vram->partitions[0].size)
+		return NULL;
+
+	offset = vram->partitions[0].offset;
+	pool = &vram->partitions[vram->num_partitions];
+	*pool = (struct xe_vram_pool) {
+		.region = vram,
+		.offset = offset,
+		.size = size,
+		.purpose = purpose,
+	};
+	vram->partitions[0].offset += size;
+	vram->partitions[0].size -= size;
+	vram->num_partitions++;
+	drm_info(&xe->drm,
+		 "Created %s[%u] VRAM pool[%u]: purpose=%s offset=0x%llx size=0x%llx\n",
+		 stringify_vram_binding(vram->binding), vram->id,
+		 vram->num_partitions - 1,
+		 stringify_vram_pool_purpose(pool->purpose), pool->offset, pool->size);
+
+	return pool;
+}
+
 /**
  * xe_vram_pool_place - Fill in the TTM placement of a pool
  * @pool: the VRAM pool to place in
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 184850f4ed188..c45e4934a90c6 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -21,6 +21,8 @@ int xe_vram_probe(struct xe_device *xe);
 struct xe_vram_region *xe_vram_region_alloc_device(struct xe_device *xe);
 struct xe_vram_region *xe_vram_region_alloc_tile(struct xe_device *xe, u8 id);
 struct xe_vram_pool *xe_vram_region_default_pool(struct xe_vram_region *vram);
+struct xe_vram_pool *xe_vram_pool_create(struct xe_vram_region *vram,
+					 enum xe_vram_pool_purpose purpose, u64 size);
 int xe_vram_tile_alloc_kernel(struct xe_tile *tile);
 
 void xe_vram_pool_place(const struct xe_vram_pool *pool, struct ttm_place *place);
-- 
2.34.1

