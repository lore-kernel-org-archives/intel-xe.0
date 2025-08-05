Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63EFC87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 11:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B84710E654;
	Tue,  5 Aug 2025 11:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EbXGwI2S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F3810E654
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 11:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754391929; x=1785927929;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7HetVovkZ1ucrYSz2JEYB9gkUDPBj9IOpCt3tuu8MWs=;
 b=EbXGwI2SVcHJAo7KGGB+tItQRtDMRzjAZf5pU+7ek4jj/SX/XQRNgHry
 bs/WVN5tjAStYqhxQYczjUztNVEF5CLP1YMPJYcMdNRg+it3iz8nauKY7
 zRNAWznNxBjz20f6ADGCdCfHhuJF4dlyFdMj+O6q/l894SLe4dqAFNVos
 92HgyL3y4i/o836CiOMv+kFu0ALTAgULrzLeDlGnakrcf6IPoz+5I47Fx
 sggPKYnaB5iSqXHHfd5LMRrdyYKh8XZBRxAFeik0FBmugkjd7CH5zYmvI
 actkwxDXPzMqjGMgzDvz+LYwXjK75igJ+GRQ71Nqwys9SUYL8+NRH2JFB g==;
X-CSE-ConnectionGUID: KyJx6HnQTPig+qbqoin80w==
X-CSE-MsgGUID: E0BfF59uSH6cTM8q9n0NEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56821907"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56821907"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 04:05:29 -0700
X-CSE-ConnectionGUID: a/f1ybU2Sy+7940+3KnKtg==
X-CSE-MsgGUID: qQN67FbKToa99mpmCIJIYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="201653849"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 04:05:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 04:05:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 04:05:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 04:05:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KN+swfBV6ucWtg7I5SRABOVG0GouP6s+RdU3GABm9y/Y5KshxGgy5KOOh+lhkilh2m40jqJNn0RpGZFkbg5t/58gC6R4xuIvv5/MOnW9TQK/Jd77+vvczNao8drv1fAERAEsr29QXerNl9bY6hZsPkYc+iYYV2pS5N5aepgPcJH+fzc6Lt0KqcmsFUiW1HiY46GBsOwpXRSCzCTWiiPHjQNANhrhaFmoncCfMDHJZzILtG+sqIhyoTC1QN11cc7WZ9P9AcUJDtsW4UKwtbAjHyYSGnA3qwVXjVnQ4jvF/xVfVn940uLRS0TPwFrURPJzD082Kp5RISUIvJB9++e0pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZzgzA8ZGglsh4WHCvRtiYArDkaT5TPQ7SJNeXWhVrY=;
 b=TvWQ6vzGYYFmSP2Xt7nxE51vHdM3nVRa6dZB7Od+aKSBD6NyNcGuFZJltyeJ1QFELba2XmO+q+Avc1bx7Uej4ITWBsMjsK0SyVXZXvFM4Z2fKgBWttPEMVvNFB2WG/N9agozazcQ28N+RyflMlrfbuSyyCO1Ryn9wDDSh/0d3meCpfZ19iX9TVbP+C0jfjJ5jJIvEb1DQ0V1AcT9eTK+207HVXvAs/xm1tG09i/Ot27o3DsoZb6PSYRPjoqiqanBQiPAo09On7F2QWW/U4J5IhfBoiushGe1iNVjH0E41VgTCGI9kUNnA+jRVzIRNDZbJ+NZR5g/5xYBS/+VNt+XqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DM6PR11MB4530.namprd11.prod.outlook.com
 (2603:10b6:5:2a4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 11:05:25 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%7]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 11:05:25 +0000
Message-ID: <0e367b81-4942-4635-8a43-a3fe70c4a55f@intel.com>
Date: Tue, 5 Aug 2025 16:35:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/25] drm/gpuvm: Support flags in drm_gpuva_op_map
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Danilo Krummrich <dakr@redhat.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>, Caterina Shablia
 <caterina.shablia@collabora.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-4-himal.prasad.ghimiray@intel.com>
 <aJGBclFODQhleoZk@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aJGBclFODQhleoZk@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DM6PR11MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: a80cef09-9a60-47b3-a86e-08ddd40ffa56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajg0NzhHUTJ1MXlkVDVhZGc4MHZOWDVsRHVFdEFOd09WRHVCaVovNnpncS9i?=
 =?utf-8?B?MFFZeUF6RERwRkxxWTVZRmkxa2ZBeHVYenVFZ1VmamRpV0sxeS9KdGdMNDZO?=
 =?utf-8?B?TjludFlIcUU2LzM5aVlaZ2FrN253T0N3ZWN4eFFyUlZSN2dzbDV3M0JwWU9u?=
 =?utf-8?B?ajl4NHByakR3RzlKL3B6Nk1GSmdLdGJzQXFqVEVRY2JJaXdwaTBrbDRnRFI3?=
 =?utf-8?B?azZoSENueENESG5nYjg3VGNaMUJIa2IrRXdKNEViZDhlMS84MDJPbjlqNWtC?=
 =?utf-8?B?MFd4QTZtUUdONU5JeTNSQmhKN0NmU3o3Z3Y1a2tGUTRYNklIa2IwMkN2bzN0?=
 =?utf-8?B?QTB0T2E1NHQzQit4ZDhOdEJKUm51WEpvRXdrOFRucnV1WXdlNzBpdlo2S3B4?=
 =?utf-8?B?U01pQVZoemtSbS9hcHJIL0s5YTRUOHdNSnh5VHdWcm5kUHczTFA1bHJucTlJ?=
 =?utf-8?B?QzYrUFpsMnVQYzN6cGJMWXMwWk9HTU16L2FaS1pRdnBVZFQxczdEYkU5dkdX?=
 =?utf-8?B?b1hXaFp1YW8rNHFoR2Y1TVB4OFh0UXE1QTlDMjMvVTNhNDl3Qm9vbVNVaENV?=
 =?utf-8?B?cm01blFXOUF3cC8rSGszTWlsdzk4TXBPY09zeHNiK08xa1QxVUZudUNFL3ZG?=
 =?utf-8?B?a3NLUTNsQllzeUpWMEU4Mkc4WnlkeTJmSjdtakVPeHpXaTlmeFozVkttTGND?=
 =?utf-8?B?NWwrbmRXU1BDdGVSZVByNm1EVFp6ZGtvK1J6aGRlMk00NmFrYmoxdUttSnJP?=
 =?utf-8?B?dTc4SWg4akg2NVJ5VXkzeWorRUpzMWZBNDNQRVZLU01UTFBqNk01c0dObGJq?=
 =?utf-8?B?TWtRTHRJaUVXUXFJVzhzR2lDWEZ1cEhKZXlyYjFsaG5iQndoVkxUVWdqSEFH?=
 =?utf-8?B?Z1N2WFlpNTM2K1d2U3doK3pkRzJGU25LdzloWUkwY2Y3QlZ2YUVmK05iMmhB?=
 =?utf-8?B?V0g5c2xsc01lSFE5cFRFVTZMK0E3WjBKYllaSHZqNlJEa1FrbWNKM216R3o4?=
 =?utf-8?B?WDk2Um5XR211THpXNEszbGF6dHlIQXJIV2sxT1pjRGFlVnU4d3dIVzJHSkJz?=
 =?utf-8?B?WFUvaHVOQUJkNEhtcUlHL01acjlSYUhLR3JZR3lIUWRxMmd5dkhxd3U4WFRG?=
 =?utf-8?B?MnhXZkJLc3ZiU0VBV08wUWhVclhxd2RpalA0ZUQ1MVpsZjJpRUV0TDk3bTBG?=
 =?utf-8?B?RVk1ZzMvUHhaN1lza25zNWxTWThWZE9nRVo0Z292SzNrZExxcC9tRmdFR2dw?=
 =?utf-8?B?SUw0RVJXWFlEdzdtNUYyUGpYSWRMWHh5bkJSaXJIdzd2YUw3VHVLRnRSaTlj?=
 =?utf-8?B?M0JQSXJ0SERYOUxPK1IzTGRkVXhwaURrWWt4cTQzRGxPTFlHMG1nNlF6ODNZ?=
 =?utf-8?B?YjZySzA5TGJrWmxuYW44WUpaSGRIN3JZcnVUNXBDUjZxRmdDa1RkUDcySU0v?=
 =?utf-8?B?UWdEbkpJeDk5L1Iva2ZLQVlqUk9wdGlSTnRnRlpicGZVWkVINVBxNnc3NThn?=
 =?utf-8?B?WlZIMGhManpSN1ZHVCtTQXRKNmlnREJBblJOOXdNbmZHTkNZK1N3ODhKWkVV?=
 =?utf-8?B?aFo5eWtHUkcyQnZMam5wVkpWcW1XdWcxdm9YUTZGRXZGcFBzUGZqdW9XRmhu?=
 =?utf-8?B?dy9aSkxFeFc3aTdQUlNzY2EycDYwY21BVUpHUzYybkZsbXVHV3krWkgyVHY1?=
 =?utf-8?B?Um5mZlhkb2VXbTBGZ0paYmhqRzQ4TEVDc3JOV2E4V1lMTEk4azZNd1QyY2Va?=
 =?utf-8?B?T056Sm56Ym9SdFRYYWI5ZXBnOFdrK3FqVUp0VkRjUW5sdGdIaEpyZGFRWFIr?=
 =?utf-8?Q?BtXjPSVTcQX26ALEDVPGNFL7e/FtTFlaHCbCI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0l6aS81cTF6Mk1XOXBiY3BnZ1c0RklScW9CWWlreXVDRS9QWVNnRExMZTdY?=
 =?utf-8?B?MXRUL1FlUjQxQ2x1UE9uazhvaFhJLzRtd0lMZ1ZjOGlENjJ0OGxlMTlCSnh5?=
 =?utf-8?B?WVY3NWxrSFNDMWdtR0FkaWtjRlZvWGtXQytVTGljVWJPL1Nya2Yrb1BDekts?=
 =?utf-8?B?M29RYzdrMEZEUnhqNjI0WXBleUVlQUhFNk1LYXhrT2xZTWQrM1U4Qy9aMndL?=
 =?utf-8?B?MkcrUndvY2l2YUFaVFBXOW1TMEc5UENOU2xYWlljV0ZlQUJtbDJxRWhIckFE?=
 =?utf-8?B?NDN4SHQwVDFjWW8zVHQ1Z25aM3RBZjkrL1BDTGdTZEF2ZVdPTEhUV3QxSUR6?=
 =?utf-8?B?ckpGV2hTUThJQU10TXF2dE92b2dSQ0dHWkZVZFdManhhampqV3lsMzgyOFBz?=
 =?utf-8?B?TmplM0F1MjlVRCtMMlh2YkpDV0dEbzM5eElPZHZEekNjd015elUxbms5M0NX?=
 =?utf-8?B?OHAvOS9LNXZjQndiRFFLNCsxVDNZcHg3QmlRRFJTdEFrUmwvbEJUYVlpNE42?=
 =?utf-8?B?RmEvNy9ydFlTZkU1MHk3ZkpTRE1zYzNHN0Y0NzBXdEN2UnYyVFc1SUVQNXlj?=
 =?utf-8?B?YWFabHBNYjZLaDhVWHlqRkg5U3VrWWoxNHg5b09idkhkTk9uL2xNL2Rqek5h?=
 =?utf-8?B?N3NoTnVSZ2xadTNSMTBBbWUwRjVkRjFpS04vQkNlTzMyMlcvdk1pelg3TDJU?=
 =?utf-8?B?Tmh6ZGRrRXd5NE5ESzhSWmZBSWlPRFhhV2VvcEs1UmFWd3pFSHN0YWZSOThR?=
 =?utf-8?B?b0JUK1pkNkNITU5nVkNGRDg2Sk8wdk9PQS9VaW83WEFlbTFZZzdBaSt0bHVR?=
 =?utf-8?B?K281WHFFYTNaaG5EQ3FqUEMvekoxa1NTOW41bmJwWGdjSUJiN05JWFpWdzFt?=
 =?utf-8?B?RTNIVUMzY2E2YmorNjIwOTNUN2ErSTlDbThncmtrUzJtd25kdXhZeEJkQ2Ux?=
 =?utf-8?B?ekRRMmliMHNmU2JGdXBWMGxUZHQ3WU03eU9aWWZyUlNocVdJWXk2bDZORVJO?=
 =?utf-8?B?anJPS3BrOWlBN1NIOFEyYmRtR09xc2hUZmE2QzI5c0owYzg2aGNoK0ZlVnZj?=
 =?utf-8?B?ZVp2Q3l4Y0E2MXNVU0ZoUjA5enBZVE5NWXNEbGFpSFgzQzNGMDFhdmVDR1Y0?=
 =?utf-8?B?Ui9QK3dqa0J4ZGNndEp4clN6dEIxNHRzdjhEZmw3b1RwUTY1a0w1bk1IQThQ?=
 =?utf-8?B?bFZZVGkvU3RtdGRsNnVkSDB3UDNlZlZwMmRLY3lTa0RDRis4NkEwRDVCeG91?=
 =?utf-8?B?RTIweEltcVNzSGVvTWJ6blJ1dVJ1R3MzRUhmZjJ3ZGVtZ1QrUlQveWordjZi?=
 =?utf-8?B?NnUzdjdoNkxoZ2RsNEo4WTY0SGtJVlpuaHN3TXluaXdLbitqYmg0b1U3cVdV?=
 =?utf-8?B?RDJQSHVtMVVFem9vWXV1OCtWQjF3NklMK3lveUtsRUlpU0hyT3NkKzMwMk16?=
 =?utf-8?B?emVodTV6OTUwa2FBY1BhSkM4bFdBZlQyTHhtQ0JlclBpUUJ3eG5HR2duUXk2?=
 =?utf-8?B?T1E5eTliSTIya3A0UmVKc0dMMUFlbi80aFhtY0w1SDBEOWtPMG9aR2hHL0dH?=
 =?utf-8?B?S2tlbVkrc01yYlEwSVhwK1pRbUFDelB0WG5ZR05DMFFmbHNQZUZhTGlwWjEv?=
 =?utf-8?B?alZFNk5Pand5UjZ3RFhhWm84Mit5Zi8yd05XcitSZU1LQmRkS2hZdzZrYzQr?=
 =?utf-8?B?N0FTcE1FSVJlQXhFakhOVkRGdi9VQ01HcDZhdDRTb0Z5VWRyVUVxLzJtOFd6?=
 =?utf-8?B?RWQ3NXliMUticGZ0bkVXRksrRTg3SnZ1SVJRMVZFSXhlMGdDdm1wV2p6Q0Qw?=
 =?utf-8?B?MHFYZTE2cnRTeW8yT0NINUVDQlhDNmM3QzJ2dEhIVnladGZNNVBFak55amlx?=
 =?utf-8?B?d2RDeCsyNVZYaUduT2NUOXZpTmsxcUFsbGx4ZVUraFR3OVVFdHlIRmZuYkx4?=
 =?utf-8?B?MDRKOUNRUlhXNndkMzFUc0pOeXJ3YlVibi9LMUdDVmJMZjV6YjJqMFdFYmNC?=
 =?utf-8?B?OFVaOWNBdVVMdjVxSjJ5OEo1dnNpUWEyN25kMXljYU1ub3Urd0lVcmVIV2FH?=
 =?utf-8?B?QmtvZUlrUmZ4RUl4N1F3K0RFQzRuMlRwUXBJVzZ3bXMrNFg2TWpJODdYUVBH?=
 =?utf-8?B?K1hGeEJ3VmZwNWRzREl5cHI2SGc5RWs1VzJKWERzNTIrZDl0WFF5bUwvdllU?=
 =?utf-8?Q?NM2Gi/Go/kURjY3lKehXySA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a80cef09-9a60-47b3-a86e-08ddd40ffa56
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 11:05:25.0176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVXgejX8RQwdmf293oN2p7NLGmmxrEr5EbUaaWYO5DirFUFIMY4sWc+A28Ok6HsKh2NXo1zjx/oL3wK46skminWq1fUb7G7zQKl02/ZFyjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
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



On 05-08-2025 09:28, Matthew Brost wrote:
> On Wed, Jul 30, 2025 at 06:30:28PM +0530, Himal Prasad Ghimiray wrote:
>> This change adds support for passing flags to drm_gpuvm_sm_map() and
>> sm_map_ops_create(), enabling future extensions that affect split/merge
>> logic in drm_gpuvm.
>>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Boris Brezillon <bbrezillon@kernel.org>
>> Cc: Caterina Shablia <caterina.shablia@collabora.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   include/drm/drm_gpuvm.h | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>> index 2d24d000f2ee..75c616fdc119 100644
>> --- a/include/drm/drm_gpuvm.h
>> +++ b/include/drm/drm_gpuvm.h
>> @@ -810,6 +810,12 @@ enum drm_gpuva_op_type {
>>   	DRM_GPUVA_OP_DRIVER,
>>   };
>>   
>> +/** DOC: flags for struct drm_gpuva_op_map
>> + *  %DRM_GPUVM_SM_MAP_OPS_FLAG_NONE DEFAULT split and merge,
>> + *  It cannot be combined with other flags.
>> + */
>> +#define DRM_GPUVM_SM_MAP_OPS_FLAG_NONE 0
>> +
>>   /**
>>    * struct drm_gpuva_op_map - GPU VA map operation
>>    *
>> @@ -847,6 +853,13 @@ struct drm_gpuva_op_map {
>>   		 */
>>   		struct drm_gem_object *obj;
>>   	} gem;
>> +
>> +	/**
>> +	 * @flags: Bitmask of DRM_GPUVM_SM_MAP_* flags.
>> +	 * Use DRM_GPUVM_SM_MAP_OPS_FLAG_NONE (0) for default split merge.
>> +	 * It cannot be combined with other flags.
>> +	 */
>> +	u32 flags;
> 
> See my comment here [1], I think the flags should be in
> drm_gpuvm_map_req rather than drm_gpuva_op_map as the flags are only
> used gpuvm side on op creation, not driver side when consuming
> drm_gpuva_op_map.

Will update it in next version. Thanks.

> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/666205/?series=149550&rev=5#comment_1222150
> 
>>   };
>>   
>>   /**
>> -- 
>> 2.34.1
>>

