Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65934C2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 22:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E52910E970;
	Thu, 15 May 2025 22:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VY7RG56a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A499B10E96F
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 22:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747346899; x=1778882899;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ro1+BAegeXTY8ieR8ulevZnXo7N6b8hWADBIbZ/BADA=;
 b=VY7RG56a0U/ix6gNNnCTGJVsPFm9uO/gtS2WtzGZApZcW/11ON3eEdx3
 fGDOtlmQTPh7MWHtdMw3cVVBVBJGQBZ7y6Qe1OBRNFNazTR6mf+qo3q0E
 63YHcMuPRvoQYebsyn/nB4h491sl43KKMiaS1YRBiQvFuLGyPpSD3P1Mg
 sGrmBA9pwLnX7NEzZzCX7qUJvslcOjDKqaRkUMZUsEp/xHEd9DJSEng/p
 GP+k/Ka7sYjehswwIOFI7sS8ZnXRiV9zvrbg88W1rC3oTvVGzslahC4ER
 zC+af0neI3gGAQEAzAAG/GJDX3op6lWCe72OwGUBa+ZQP8RG0Ot5iYTao A==;
X-CSE-ConnectionGUID: rb48BQHDRqWVN6Xo2xdegw==
X-CSE-MsgGUID: NdNQc4LWQg6hylHngWoLCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53109879"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="53109879"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 15:08:16 -0700
X-CSE-ConnectionGUID: gfKyC7p3RGe0pRd0jRQWXg==
X-CSE-MsgGUID: NSdHLrMNQJ2laGjhJG5cLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="169573520"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 15:08:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 15:08:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 15:08:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 15:08:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hL1Ihq/H3Y1CTIGEi4/beua5371oYhzrj2iGEDnKwWfiYUaVE+VEGruM9oHf0AUGVUYecpw0bxVVv0Wjg8B5n/jV9Z/7yefdSU0z5k0IxgftVzBM5XncWVMNOlvWNZHXh19WpbyJ/gJhjuTNFYKmk/PNuwcr3e50Aa/1saA49kBYN1/g4ulwr1ctu9+rzxFMzFN/QNKJhCnJ/z8mWgngFiTg0P6gSD+mgI3clX93yrJ8oReTSQCvO7yfwU0CpC5V1GBYC2teiqC6oZnVNvnZSPFewksO9qTAOXpzfsD5WzUd/BHCLoxIpEeqIo84Xo6xudtmy35f5WkrBa0u/EG9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9h3A/tFna/hwoXOnGuE6dO99rNC+DXHmF+/7lLI3jU=;
 b=oxpoJi3ArkP+Jdjo6px6yCjCzx8d5XqOLhOH5dZeDu7YCU3m1NIe5827rLzJEM5YSUPWmHNro2fCbYS95euxvl7b3PPfTh4VBrgpdvAm4RknOQnSxBrbc/MA6x9BwhZ+5UOCr4iEXRv2LcdL3A47kmdeaMq0OTR14lbwIY0vXjgbwZTAitrzC0/pAebnfAAmzE5wjK6Oap0qvBhkokSBwu5dHxfLboDQU/EdF3PzqNY9PmGpXPBWXJCPNViHKZuVgMyJCuDDRLSsU4Y98nO6dopiC2r/tlYVjKcj3ZsdEiOlNSJraUgL/rXvLAoFDU/4XYM/KepyIWKmcaxOfYmogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by SJ2PR11MB7716.namprd11.prod.outlook.com (2603:10b6:a03:4f2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Thu, 15 May
 2025 22:07:29 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 22:07:28 +0000
Message-ID: <335737bf-8133-4cdc-b7ea-015ecdd9ee1a@intel.com>
Date: Fri, 16 May 2025 00:07:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/7] drm/xe/vf: Rebase HWSP of all contexts after
 migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250513224952.701343-1-tomasz.lis@intel.com>
 <20250513224952.701343-6-tomasz.lis@intel.com>
 <41a9b0d0-a60c-43fd-9736-ce6229431ff6@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <41a9b0d0-a60c-43fd-9736-ce6229431ff6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0010.eurprd02.prod.outlook.com
 (2603:10a6:803:14::23) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|SJ2PR11MB7716:EE_
X-MS-Office365-Filtering-Correlation-Id: 44656e8c-9c62-4d79-bd4c-08dd93fce197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVhRR2M2UEhKTExLWmlWMVlpOXlacno1UUs3am4yaUR3S0xnZWUzS1d3UkF6?=
 =?utf-8?B?Q1ZiWFVxenZsaDRZbGlBZHlDMzhHcjN2M3JMenhTcE82MHlzV3ljWjJ4c01U?=
 =?utf-8?B?dThjS2hSblFJeUErcXNCQ29QM1VQWE5odHBGZjdUc0RBeElFUjRpTEpoRG5I?=
 =?utf-8?B?d3BiMEhwb1A4OXVaMjZSN3JrUUtrSzErdnlsUWJZUmlIQWJSRVJDdTM0Tk5U?=
 =?utf-8?B?T2hFQy9zOFRVK1NaNlFOREh6NUNSbER1YWJxRVRua01BTTB6b2VZdG4wVkcw?=
 =?utf-8?B?cXFFS2VFODlpaVY1VCtlRVRJRVQyTFNZNGl0UENPckIwRlNkcXU2VGVDc2pB?=
 =?utf-8?B?dXlMWUxhVGNmek85a3o5T1lTbFc1a3dQVEVkYWF2cGZXOUk5Qk5Gb0lPRGJP?=
 =?utf-8?B?dkFwc0NXaGw5cTBSRm9IdmxDL25qeTcvdlJRTGEySTkzSWtHYittN0ZlMUVs?=
 =?utf-8?B?V2NZUlhTaHBSQ2g0NTV2RkFobU00T3djRXZnSzdPL0Uvby9yTU9ZajJRVWh0?=
 =?utf-8?B?N3REbFc0M3JKRWVURnpqSDliR3hiYlJlaE9vZVNIeVI3OTRRc2VNL0Z0WkxL?=
 =?utf-8?B?YVlQNGgweWlzU0QvcUF6VU1rRmUxTEl0Z1dHaWF0WWlYdXptZjlXR3Z5b0tS?=
 =?utf-8?B?OEJCYzkrbWp5bDVoUm9XS0JQZWtzTjZlc2tLZXpKa3JQVFBxMkNpUklnS3I5?=
 =?utf-8?B?bDYzWmRGeTJER3JNMEI0OXF5RTV4b1RrQzlLdGI4WXBkMjZodGF1eFE2c0Ex?=
 =?utf-8?B?amVPeHhldE4zcFMvN3dFL3pibkhZdE9VLzQ3Lzg3YkxOdEZVT2J0anVoemwz?=
 =?utf-8?B?NXora2Z2Z0pGQ2lJeEgzNEhvM2NuSldYNXJvMis5RlhxNWh1bWNWalMzT3Uy?=
 =?utf-8?B?NWlZYWs2dWpsaVhJWUxiSGRuVCtrM1YvL1kyUXNjUmRYUGFwczZMdFpmdFMx?=
 =?utf-8?B?UE5uREl0WnJ2MHhlaXFsT0t6QUFNOVBzOFRTRVNqNFhtUU4yYndDaVk4T29U?=
 =?utf-8?B?Mys4OWdnNzBBOS9KVm1uejBlNVRPMXdGNEsveVBTVFJTTXJPNGtFYit3Zi9G?=
 =?utf-8?B?UjYzb3Bsd2YrZUdmUVdIM0Y2L3RCYUI2a3R5b3o2SjJaL2t6MHRGbFJmR2JS?=
 =?utf-8?B?ZjRuUHlMZVM3Rm9wQUVLclh6RFF5ZThETG45czFoQUcvRnhFTWpWdFM5MEo0?=
 =?utf-8?B?ZUNLcFo4MnJRNTQrdnVUbXF2ZkxQNHhxSW9sMXZmM0tHNTFQV1cyWXhYOVFh?=
 =?utf-8?B?cjFvZjduVTFOSnc4dFFCVDRhOXROU3piV003R083WFJweG9LSnVGcStIeFpH?=
 =?utf-8?B?ekJjT1o1ZU9YY1g3aDVFMnYxdjZxdk4yNTM3MTVwSzdnMFdBRGFUbzMvUjVo?=
 =?utf-8?B?RDdvbmNPNDM3K0U3QlZOdGtSVzgyTW1PazVqZ1FTSDNrV2U0VEtlUTdCaUEy?=
 =?utf-8?B?ZWN2ZXNjcGN2TlR6d2pFaTNkWFZjZHlndi9YTTFNMHY4Yk4zbHBaY1Vodith?=
 =?utf-8?B?Y2NsNW1VNjgwUGU3SjFJZjU2aTV1THV0Ykc0K2dHY012cUFIM0F5VkFld0pt?=
 =?utf-8?B?TmwrZXU2QVJER2gyVUZXakR3ZGoyVjIrWVhYSTlrcDZDWVlzZ3VTem1RM1o3?=
 =?utf-8?B?OHdrOWxPblprSGwrMWRpNG1JVzNxSE9xUDhzdnd6WUYxVlo5YUQ0djBlN05z?=
 =?utf-8?B?OW5QVzVWRFFzdFdIRVlOK0ErZXJBWHRobTVqQjRFVFl0anhSaDdiNW5wWmdE?=
 =?utf-8?B?U1V5NUFwNmZrcEpkY2Q3MU81N3hXV2tTVCs3WmlFK0tJTUFHWTRJVGtPQ1oy?=
 =?utf-8?B?N1RWRmdyaVlReThpbkV5VzVjV2VZakF2YzRnRWE1Y1hTWUZFZnNQMXdMUkU0?=
 =?utf-8?B?WUMvQ3ZXWVM1YWlPamtrMVV5bXVLNG4xVVc4ZEVWbEgyZVY0OExwMGpIZVVo?=
 =?utf-8?Q?6xz3rjNtT0w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3QvbFhWSTdKbmFKc3UydlZtRDM5NXdWWGowZzFwc3NZUGZTYjJ5NXpoWmR4?=
 =?utf-8?B?bUJqM1hDVXBTOFdzb2ZCWjhLREIvd2tldTB2dGgybUFUR01HeW1JNlFEYVMx?=
 =?utf-8?B?eitWZWlGYWpFamM5clE4TmJ3QXZaYnN5SVFRWlVrQmdMZ0M3eW85d3lZMEZG?=
 =?utf-8?B?Zzl1eFRJNWtFYWlDOXRpeERwdVdVT1hySVlqNHFINHpLZW5JRzlZWWVTWVA5?=
 =?utf-8?B?YkxxRG5sSWpQOW9sbGE5ZklPVyt6MENOZ0tkSlhzUysrUFZyZHIwSGdEdU5C?=
 =?utf-8?B?NlJ6cnNjOEJXa0orZkNLU0ZkalcrbWFaQWZ3VXozMlBFbllocU5UMW9GK2pW?=
 =?utf-8?B?b0x0bFlxQ1NqTVh4V1F2WjFyMU5MU3ROMjdncVpLVGJZSDZoN0VoQUVONTAv?=
 =?utf-8?B?b3laUkxjZW9OQ1lUMlhzSGF2SjlQWTNIbG1tWklPaGxMMlk2N1FUR0o5QXVK?=
 =?utf-8?B?cUtndjNTeGl2RStmUktLNmNDM0RxUjZNU0djZ1U5bmtwQmhncVozRXFPUXg5?=
 =?utf-8?B?VUxEY01JRmF6WU54bG1FV2xkbnc2L01jMjZaWWFXcWdGR1NxU2hHdFc2cG1L?=
 =?utf-8?B?SXJPbFlmeFZ4QWVBT3pZR05yc2hLZmZLMnFWMHRrM2NaUDhxaW5UUlB6bVNk?=
 =?utf-8?B?TE9scEtMQ0o5bU03Q0htQ1FnL1cxOGpBR0RWMlZUa3MxWEo2dmZuNmVGdFE4?=
 =?utf-8?B?dTI0ZjFJdzRiSXhMdU8vdlVhdGUwcGEydWlyY0RuVWZseFZmdDk4ajMwSE8y?=
 =?utf-8?B?eitKOUxORjJpMVY2bmpJY1ZGeGJYaEdGeFBpNUxLTUIxYTFxb0tGWjgra1Q0?=
 =?utf-8?B?TVBOTXV2TlYwK0dTN2taUVdERWtDZU54cHdmYmQ0WTYwM21uNDZmUFBNNXc5?=
 =?utf-8?B?MkRHUFZWOFIwbnRSQ0V2SHI1OHRFUFJjRVh3djBVV0htZlNKSW1IV0o3WFov?=
 =?utf-8?B?WkUycUtpeXdjdys1NlpuQnZNeE1VbjJ3YnN0NytPdmU1ZWFEYzVmSzQ2U2FY?=
 =?utf-8?B?NVJTSGRIT2QvYmczNEFZbk9heFBsTHpINkVQc2JJOFJXM0RqS3hCY21xbXVv?=
 =?utf-8?B?T0M0RSt2UUxsR3dTZW4ybGJvMlZHWVFhOFZ5Rm5ZWGZrWEl1NkYrcHFwd0Rw?=
 =?utf-8?B?cFkzbDNTYWNWWEp1R2ZFWTIyVFN4eEtwVVRPQXQ2L3NqeGRXaS9YalNEb3ZO?=
 =?utf-8?B?OHllWDUvRTlIeE9qaXlrUjJXRlVPcytpd1dMcExrak05YmVCUytoTFgwdHR1?=
 =?utf-8?B?SkxNRVBPRjg1c1FiMTJvUmF0dzhpUmpGTlZxeUZtdE4xemFyUU94ZWI5blJj?=
 =?utf-8?B?dXMvMHRaa1pianpibDFVVWNob0JXVmo0VmU2ZHQyL0JPYnpiUkFjRzB4ZVZW?=
 =?utf-8?B?M0hKNSs5SHkveVIrUjJsdDgwcElqMktyU1Ywejgxc3lNaHNvQnB1S1EybTZK?=
 =?utf-8?B?Zi9JUGZXVG8yTEROY1diNFJ5ZXRCMHNnYWcyMlpnQ1I3V1M1bE9vbm5TQjAx?=
 =?utf-8?B?RW5XY29LN0JqaGthUWIwUWMyNlBSWG1IRmtiQndYY2xhWnFjUGdWbHJ5Vm43?=
 =?utf-8?B?TlBJMUx4b2lrdXowRnRCNUFPRDI2WktRc2V1Y1hwbFVFbWYxakM4ak8zY2F1?=
 =?utf-8?B?V2FDK2s4L0NTZFB4VTZYVUVCOWVRU3Q1S05CV3liZkR4V0NsWEhJb1d6c1da?=
 =?utf-8?B?MUZDWGh1bGFTRWdWSGR0YnVjYjBMT0ZkazhUbjRuQ3k0VG1MbG1LdHFXeFFY?=
 =?utf-8?B?T0VPUTdXSENrc0czZ0V2eGl2Rm1lUmZaSGZyaEZKTDhrcFdpOG4wQmltVGFr?=
 =?utf-8?B?ME5VaGJ3VFZuU0VMNkZMT2VUbDNZaDFzTkpNN3I4NkpWT2tISmgyVHBuOHAy?=
 =?utf-8?B?djJvYVpQdU1leU5ud3pUaWphWGJBZGpzVlFRMHp5M0FRRzRnWExXWitzTTNa?=
 =?utf-8?B?TkZnMzBBTm5ITURtRXZjRTRtREFHMDg3WXNwQllnSGdPdW9pSll6dE5qbk5I?=
 =?utf-8?B?bHdWSWNuZURlaFFtRFhBVUg4dk8zb2tTaWVTTVlWdG5mMG9WZTBFcDR5enR1?=
 =?utf-8?B?YldxKzYxcXhnNkNEZ3RXNWo5ZDRIYkdLblg5MVVhTWwwUEh1WVpTblJ6dnJr?=
 =?utf-8?Q?pOKWhChm/nS7x20287GoFKPyr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44656e8c-9c62-4d79-bd4c-08dd93fce197
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:07:28.7288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgAsCWDChNeLr0A1YTvB/FFXsTcxUiQXqyzoMQyT3Jb23/bIHh7WMvrYNuTOlwgjBxcoHO96whh28TtTNQg9kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7716
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


On 14.05.2025 20:37, Michal Wajdeczko wrote:
>
> On 14.05.2025 00:49, Tomasz Lis wrote:
>> All contexts require an update due to GGTT range shift, as that
>> affects their HWSP.
>>
>> The HW status page of a context contains GGTT references, which
>> need to be shifted to a new range (or re-computed using the
>> previously updated vma nodes). The references include ring start
>> address and indirect state address.
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_lrc.c      | 18 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_lrc.h      |  1 +
>>   drivers/gpu/drm/xe/xe_sriov_vf.c | 35 ++++++++++++++++++++++++++++++--
>>   3 files changed, 52 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 61a2e87990a9..43e1c18e1769 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -1184,6 +1184,24 @@ void xe_lrc_destroy(struct kref *ref)
>>   	kfree(lrc);
>>   }
>>   
>> +/**
>> + * xe_lrc_update_hwctx_regs_with_address - Re-compute GGTT references within given LRC.
>> + * @lrc: the &xe_lrc struct instance
>> + */
>> +void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc)
>> +{
>> +	struct xe_gt *gt = lrc->fence_ctx.gt;
>> +
>> +	if (xe_gt_has_indirect_ring_state(gt)) {
> xe_lrc_has_indirect_ring_state(lrc)
ok, these are equivalent at this point of lrc life.
>> +		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
>> +				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
>> +
>> +		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START,
>> +					      __xe_lrc_ring_ggtt_addr(lrc));
>> +	} else
>> +		xe_lrc_write_ctx_reg(lrc, CTX_RING_START, __xe_lrc_ring_ggtt_addr(lrc));
> did you really run a checkpatch.pl as promised?
Yes. No issues here. "check" is not an issue. Single line should not get 
a code block.
>> +}
>> +
>>   void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
>>   {
>>   	if (xe_lrc_has_indirect_ring_state(lrc))
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>> index eb6e8de8c939..e7a99cfd0abe 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>> @@ -88,6 +88,7 @@ bool xe_lrc_ring_is_idle(struct xe_lrc *lrc);
>>   u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
>>   u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>>   u32 *xe_lrc_regs(struct xe_lrc *lrc);
>> +void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
>>   
>>   u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
>>   void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index ab91ac68ef5f..016faa29cddd 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -7,12 +7,14 @@
>>   
>>   #include "xe_assert.h"
>>   #include "xe_device.h"
>> +#include "xe_exec_queue_types.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_irq.h"
>> +#include "xe_lrc.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>> @@ -223,6 +225,34 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>>   	return ret;
>>   }
>>   
>> +static void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *eq)
> this function would better fit in xe_exec_queue.c
will move.
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < eq->width; ++i)
>> +		xe_lrc_update_hwctx_regs_with_address(eq->lrc[i]);
>> +}
>> +
>> +static void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc)
> and this one in xe_guc_submit.c

will move.

-Tomasz

>> +{
>> +	struct xe_exec_queue *eq;
>> +	unsigned long index;
>> +
>> +	mutex_lock(&guc->submission_state.lock);
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, eq)
>> +		xe_exec_queue_contexts_hwsp_rebase(eq);
>> +	mutex_unlock(&guc->submission_state.lock);
>> +}
>> +
>> +static void vf_post_migration_fixup_contexts(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
>> +}
>> +
>>   static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>>   {
>>   	struct xe_gt *gt;
>> @@ -303,9 +333,10 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   		goto fail;
>>   
>>   	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>> -	/* FIXME: add the recovery steps */
>> -	if (need_fixups)
>> +	if (need_fixups) {
>> +		vf_post_migration_fixup_contexts(xe);
>>   		vf_post_migration_fixup_ctb(xe);
>> +	}
>>   
>>   	vf_post_migration_kickstart(xe);
>>   	vf_post_migration_notify_resfix_done(xe);
