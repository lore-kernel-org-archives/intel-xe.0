Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7789C79F9E
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 15:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B1910ECB8;
	Tue,  8 Sep 2026 15:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R47zNk/w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3875510ECD5
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 15:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788881336; x=1820417336;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wr6N2AkosgnkLQ+dh0eIs2rukAmZBlqth2pkL5UTAZw=;
 b=R47zNk/wNSTrbrKjUnGU3AqfzHOUxjte1Uk2+FFEObCm+wyQSJH1Hp76
 dn7HvRNK+S0CX/8by9UGERIKJ/uMBqjLTQTPjhZIvHUcs6Z2G7apuxe/5
 nefBlIZnLuQdfkIyvuhhSjUIHZMGSTnyHMQhQAy6/lr6N6ShbcX4znFnV
 PtznAGILE0DMThbTkXyDhiXLG5mFBp5OLwqEfQiKq23oioh6/9VA9bXnd
 qpTxWBPSL9DvtvO80ImdfGOLKIf8EVVmeO8Z9uynrPOLuXcdyh2PhZqbe
 UOzg37JNqg3bwKumPVYoOyw7NDtmOXBxR4Jtqaknbrasp/WKUsD/B9r9p A==;
X-CSE-ConnectionGUID: YWiPfGlmTNeSWanpQHXalA==
X-CSE-MsgGUID: tTBpLZBtR/O2a+B+D+DNJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="91798997"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="91798997"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 08:28:55 -0700
X-CSE-ConnectionGUID: BHb0DRh7Rb6B9hlVhXjBwg==
X-CSE-MsgGUID: LuxM+JqlR8mTt8A4X2pPHQ==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 08:28:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 08:28:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 08:28:54 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 08:28:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1HCLCFbAwD5+qzVfOL/qIZEMPd5/1BDdnA1Zgpy9DyQVrn8OYnqKi034eHuiK3VtFdWzzQeedJJqiHlptj2rVAMHHQuJLiwI5u5GwTDUnYrFiV62867zCL2uT3ete75e+IJrbterJVU5fHPMT/mwytIvvvDoEOULFO7owMqPO8LBnKe0MrgEN7zfUq1R4xGEN67bSOkVibubIS01vTsLSf/6xmzJlK6ieN2t95tvyhFahdqOw3K+W2lV+1ZncxQC5gI+2/8XH5vP8986eyCDV4Oqf8KmxW6SipfX4QKQ2juwI52vAIS/M2hbfoB7jIYVk13j8RXnHFbFlKvKnNP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAgxXi81iUaJyWPeD25JKaG5uFvOY2y4hcaeno40zpE=;
 b=L0HV65sRBaAXYWEha4bWv35wmHOarzSSxuJ3Oiqi1Dq8mAu99Z8u0VARlI9kdl2ugigvUMLNrtlQKWbTRozw7OZ2fzZNwbrOnUCSofHd4zHHdDlm6yOEYJE0cdHkdRmTTEvnJkn9Hr57DKN8AJj3+1lvYsFdo/2TEFbyckI6DkVza9XTVdQ4jC/FUN5Btl4ZItl25VMWqpfVZoaiU1K84pYesluMXVStIf2Dld82yKgZoIllo8HT1YD4ZyLWjr+Md0CvI7DAI83ANDtSYpM8rqfgvC5n22CRDT7ifYsH0R/X9Cqbcv14JD2TkOXI0e4CRlVcWwflzU75tCbyq1qPYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by LV8PR11MB8461.namprd11.prod.outlook.com (2603:10b6:408:1e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 15:28:49 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%5]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 15:28:49 +0000
Message-ID: <b8cc93bf-92ce-4bfa-94d9-aa29c57a05cf@intel.com>
Date: Tue, 8 Sep 2026 17:28:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 27/27] drm/xe/eudebug: Enable EU pagefault handling
To: <sashiko-reviews@lists.linux.dev>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-28-mika.kuoppala@linux.intel.com>
 <20260903154646.687761F000E9@smtp.kernel.org>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20260903154646.687761F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0303.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::8) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|LV8PR11MB8461:EE_
X-MS-Office365-Filtering-Correlation-Id: b3154464-3567-4a6d-bd77-08df0dbde1a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|4143699003|10067099003|6133799003|3023799007|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kaxMh/LWKwH4lJHJPkA5n3OCpIc/lTSVI627D8hLtcXYCCg7lw2YG1MV9DMcmb/W3lS7aghpvUjSrIXqqwVJqvHFj5fruVC2U53Ra8pIGCQp4hM6BXd3kQ1tS30WBGVmR2gJ6VE3eusLLBTKm68+8mITcSS5Kr4uukHW39NOwEWHVEY+p39ESVMHBo2VRsEhC/oflh3ELqxwoBKdSJk7kQozfpIaJxJXMOOyHSmDuWrdHShD5LNvxVhVcmOlTouqeP4Jym/4bUNNHPwCZgR13UVG1rbnDa8REuI2ejUIX5bExbpzF3cPeYT4sAXK8jifzMBGtLGnfji6dtw2+0ezS29A0U3t2Yvs/Xbhk3GQ9bmJJdiLlj3P41EdnBaFL5qRenNrPzYvU6vU0awv/H6pmuo9DlbMtf6e11MnHd8x1Mo7TeHypuZIP9KVOXavU6n1O4Ot9f5oCDtY+sHHTWb3Sjv+0vzU+lzDDacZBU3GCcVNrZfp9+SLr5GD0ks6buFVAwZRi5ybmT3Plf3opDfGkq7sK8rNfXsmUSzIl23WJI5hfVx+WduOyYbC/jngD+pzFZ4sD19eK51YjCXX+wtFwSh2OgThbdO0VQmQct4aZy0kcJlxXOejWlle0pJBdndX5p3tbZ/nNWjIg8tNOqUHuR8E2PePTr2XRTXlepxAeww=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(10067099003)(6133799003)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2hvQ1dkUEJWdzgrdHk2UzFSTFIvZVduUldSNnYvTU1LZWJhTi91TW8rREVF?=
 =?utf-8?B?WWkzczBrYm1XTVZiclNuODA2bHQvY1FKWG1QQml0a0h3T3NvYVNKNk5RYkpP?=
 =?utf-8?B?bThNQzFRNDcvN0IvV2JUZGRBNFdhN3FLcit0QmJOcDNQSUEwOXcweXZPTnU0?=
 =?utf-8?B?YkphTGFINlV4NWVCRGVOY0l2c0MycmFQdE5CbGhkNE5vdGtOS0p3S3Q0bTBD?=
 =?utf-8?B?U0JSaHJBUFQ2dmRaMWhxM1FHU2kwVEJqVm9PZTJoa2F6L3o2V1lzZFQwM2dj?=
 =?utf-8?B?cjBmYTBnM1Boekdkdm4zazBZUCtXZ1o5QnZDVFk1bXFrcnRFWUFzSVNTOGMx?=
 =?utf-8?B?emk5VkdxcFByUFRVRWN6RnZId2U1WmtKL2ZTUm9BclI4TVI4L09wMlpaSGZV?=
 =?utf-8?B?QTh3bWl3U1FXQkx5eTJOMHB5QzhDVG04YnBpKytNbzZYaEZxZWJpanV5dFpP?=
 =?utf-8?B?Z2Q0K1k1am9OU1MxK2JCS2o5U2ZjTnNaUjJEQWxtNUhWV0tGNzFYMERQNTFX?=
 =?utf-8?B?dDRLbE1SeGJxaGcvWjI4dEMwMjV0NlduYktMUmZ1QVZzRzlSaXlVYzJuVlBB?=
 =?utf-8?B?bGF2REpRYjM4VHowb1BBVWdFNFBKbzZIeXlFd3J3ay9Wak9KdlRHczhwRzFV?=
 =?utf-8?B?Y2NjTVdZTmd0VmY1cEFYZmYxK21EN2JSRzZnSzYweG00NDdJUGUwdkJSMWd0?=
 =?utf-8?B?NkJaelRxdWJqSHNvNWxlNURXZVVuSk9GaTVnUTlBTUorZzRqb1RXVE8rbDF0?=
 =?utf-8?B?Y2h3cFhORWpxYTFDV2M1bG11WFRuTi9MaUF5eHlFeWpBakhHVzNiSUR5ZURo?=
 =?utf-8?B?d0VnN3YrV0dkeEMycEpCSVZUTEVPcCtPbW5JdUpwTXpKQlV5cTU5WWhIWlll?=
 =?utf-8?B?R0dHZXF6bVRQUEwvNXpwV2phLzlLQzBqMGVJU2xUNGFIUzVkZFdvbnlzNmlw?=
 =?utf-8?B?UFA5UWVoS0Vvc1NTTVRCbFo2OVNQODFaZWQwR3hwWHZ0ZGhPK0VMeDB0QUYy?=
 =?utf-8?B?VGlyaUdlQVVMNnd3YUJ3cUIzU05GMVk3dS9OeWhZcEtmZkRKdzZIN1BkWjI3?=
 =?utf-8?B?QldQaHRxK2RJWVpNNThrSGJ4cXRSMUYzNUQyT0h0WDUvOW5keEE0OG5aWlpx?=
 =?utf-8?B?R2FIaWpJaTJ6eXEzeVg1VDN5dm01YnRDRUJWUld5ZEJHTGRZOVFXUlNMbWUv?=
 =?utf-8?B?REVrelc2MEVkM0VTaGg0VjVKWjN3R3pmVHdLWkt0K3Z2VTZCWlAwNWtwWG9q?=
 =?utf-8?B?QkpMaG1mdkloeWZrUEJJYzJyNjNrc0lvdHNybDkvYSt0RHpseDUxcTVRSHNR?=
 =?utf-8?B?T3ZuMjFodXpNUG5nZGFSckdBclpsQVA0OGo0YXR1UThvM3RlYXEyZjlDN09l?=
 =?utf-8?B?Nkx5dElJYzNDSkV2dWJYdG9Gd0N4Umpvb3JOL3ZKNWxrSEJMT2JnUVk5L3lV?=
 =?utf-8?B?cHh2SWVxdk9UcUh0OE5SYW8zVFVubk9IVU13QnR3WmtjbVBPeGZObzZnZzhE?=
 =?utf-8?B?UXlkZ24yTWE5bVJUVUtKUElJejBteTlmVjZZNy9sR2ZCT01WSnRmUmQ4MWpr?=
 =?utf-8?B?ellhOVVFV2xWeWVScy9zMDhqZUw2azYwV01QOEpJSXN6VnVaODhwSmQ3OGlG?=
 =?utf-8?B?c1dSSUw4eHhLMXFQSnV5Z09RbWFKVVF0eFRycmlNa2JEOG1Tc3hab2ZxZFYx?=
 =?utf-8?B?Zzg0T1RGZThTYld3bVdKU1BNb0l4UEs0STlEMjJNUC80Y2dSWW14dkQydEJv?=
 =?utf-8?B?MjBoNG9LL3hLMldzTFpyLzlNUWlBQ2NiNStXQXFZM1VBUEdjbzE4ZFdXM2pt?=
 =?utf-8?B?OHdiUkRHV20welMvbHI5VUZiSWp0K05hdFFxNk5EbGFCZ0YwL3FoT0xuYXpa?=
 =?utf-8?B?QmFkUnFXdXpMZ2xUMG5BeVNsek1FY2dpb3Qvdm0vK3FVMU1oaHhKTFNzS2Q1?=
 =?utf-8?B?cXRzdEFpeVN1RklPQ2graDhnVFAzR1Z1bUpDaTZQYnE0YUg5RGpXK2E1bElD?=
 =?utf-8?B?anBXNTlIVktLS2szVDhKTkdQOFU3UWFPWVgrTHY1T3lhUG5RSEVCSmdSZVYw?=
 =?utf-8?B?VkhraFQ1UHBJS0pyRnRzRVpDWkx0M1dDMW5ZODk0NzFFVXl2SU1jODQ3eW40?=
 =?utf-8?B?Um12OGt0cG90Y28rVGI5dFRjRXpUU2pUaWZncGVPWWczRUp3aFBzT0pxRTB1?=
 =?utf-8?B?UFo0VW50TlZyNGxCUjEwdGl2WlQvRlVFZ0ZqeG1ESVNCNWY5R2FXQkhUV2lK?=
 =?utf-8?B?NzY3bnNHSmVGaEthWUJXMjlCTnpFQ2dRQmxxamtvV0p2OTFlWk1obnlmU005?=
 =?utf-8?B?Q3RSTTM1dzltSTBHUkhubStNa215emdGSVlyY1FQN3J5c1pCMFl2dTJFczg2?=
 =?utf-8?Q?ozriJELw0et0CQM8=3D?=
X-Exchange-RoutingPolicyChecked: qhUK/p3NYvk9YlMvELhwWtX8fBIcbmY9gkeTpV8nJ/8Kt5tElI5waeaYV8ZnfVoKHUuWGLKG2sf5wpsB3OnSnkCZFLM8VbvMWsgeQWLM5xP3riIt0eDEoNDt8HL3d9y+vDV16dkygFXEjaoaj0PTequOZVDbVz2BD6ahRcG129C+L7Xg3AWeEq/puxPto8CvkrtNxHJKaOT5qJ8tK/gM0YzLkiSAhmpzc+O7b3OD0zie4U332dGJnGVr6SSADWtXGsegrZzohfB19nfRQ9vcpRu4OQaL22pmf0DS61lbCP8FcmoF1Vbh/yqHxk9HWEftru7kLW1eI6JmjsCec9SxTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b3154464-3567-4a6d-bd77-08df0dbde1a2
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 15:28:49.7091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AC8rXrViKiIHfEJeYXk1V+C3XIWSdYAEDmUkbKwioVw/i5mQ8SI7baNO35GcCm3/0DEgMy2V+ds7MBTJK+wmbFr2LWrF1I63Cc4+WEVKjrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8461
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

On 03/09/2026 17:46, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Temporary NULL VMAs for subsequent eudebug pagefaults are destroyed immediately after ACKing the fault, creating a race condition that leads to livelock.
> - [High] Successful SVM pagefaults bypass private tagging, which permanently stalls the finalization of the active eudebug session.
> - [High] Pagefault cache hits bypass eudebug tagging, permanently hanging the debugger session.
> - [High] `xe_vm_svm_vma_subtract()` is called with unaligned address boundaries, corrupting the VM layout.
> --
>
> commit bd171058301961cced31067feb0527d9f0b38c87
> Author: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>
> drm/xe/eudebug: Enable EU pagefault handling
>
> This commit enables EU pagefault handling for XE2/PVC hardware, allowing
> the driver to unhalt pagefaulted EU threads via SIP mode and a temporary
> null page.
>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> @@ -59,13 +60,14 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>>   			      write_only);
>>   }
>>   
>> -static void guc_ack_fault_end(void *private)
>> +static void guc_ack_fault_end(void *private, int err)
>>   {
>> -	struct xe_guc *guc = private;
>> +	struct xe_guc *guc = xe_eudebug_pagefault_get_private(private);
>>   
>>   	if ((guc->pagefault_ack_counter & (XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1)) != 1)
>>   		xe_guc_ct_send_flush(&guc->ct);
>>   	xe_guc_ct_unlock(&guc->ct);
>> +	xe_eudebug_pagefault_end(private, err);
> [Severity: High]
> Does this create a race condition that leads to a livelock?
>
> When this calls xe_eudebug_pagefault_end(), temporary null VMAs for
> subsequent pagefaults are destroyed immediately (destroy_pf = 1) after
> ACKing the fault and signaling the hardware to resume.
>
> Since there is no synchronization to guarantee the EU thread has re-executed
> the faulting instruction before the KMD unbinds the VMA, if the VMA is
> unbound before the EU thread accesses the address, won't the thread
> pagefault again on the same instruction and loop infinitely?
Replied in other message (Joonas)
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> [ ... ]
>> @@ -227,8 +228,56 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>>   
>>   	vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
>>   	if (!vma) {
> [ ... ]
>> +	} else {
>> +		/*
>> +		 * For non-SVM case:
>> +		 * Eudebug with active pagefault always needs to be attached
>> +		 * to pagefault since it waits for all pagefaults with matching
>> +		 * asid to be resolved.
>> +		 */
>> +		if (!xe_vma_is_cpu_addr_mirror(vma))
>> +			xe_eudebug_pagefault_set_private(pf, vm);
> [Severity: High]
> Does skipping the private tagging for SVM (cpu_addr_mirror) VMAs cause the
> eudebug session to hang permanently?
>
> If an active eudebug session exists for the same ASID and its finalization
> was postponed because this SVM fault was still in the queue,
> xe_eudebug_pagefault_end() will see no eudebug tag and return immediately
> without triggering eudebug_pagefault_finalize(). This seems like it would
> leave the EU threads permanently stuck in SIP mode.
First SVM pagefault is converted by eudebug to vma pagefault and faulty 
page is removed from SVM. Then any following page fault for that address 
is handled as vma fault.
>> +	}
>>   
>>   	if (xe_vma_read_only(vma) &&
>> @@ -239,11 +288,52 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>>   
>>   	atomic = xe_pagefault_access_is_atomic(pf->consumer.access_type);
>>   
>> -	if (xe_vma_is_cpu_addr_mirror(vma))
>> +	if (xe_vma_is_cpu_addr_mirror(vma)) {
>>   		err = xe_svm_handle_pagefault(vm, vma, pf, gt,
>>   					      pf->consumer.page_addr, atomic);
>> -	else
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
>> +		/*
>> +		 * If err is -ENOENT, it means that the cpu-address-space-mirrored
>> +		 * xe vma exists, but there is no mm vma allocated in
>> +		 * the CPU address space. This indicates that no memory has been
>> +		 * allocated in the CPU address space.
>> +		 */
>> +		if (err == -ENOENT &&
>> +		    !xe_vm_is_closed_or_banned(vm) &&
>> +		    xe_eudebug_pagefault_creatable(gt, vm)) {
>> +			u32 page_size = vm->flags & XE_VM_FLAG_64K ? SZ_64K : SZ_4K;
> [ ... ]
>> +			vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
>> +			if (vma && xe_vma_is_cpu_addr_mirror(vma))
>> +				vma = xe_vm_svm_vma_subtract(vm, vma,
>> +							     pf->consumer.page_addr,
>> +							     pf->consumer.page_addr + page_size);
> [Severity: High]
> Is it safe to pass pf->consumer.page_addr directly as the subtraction
> boundaries?
>
> The hardware fault address is not guaranteed to be aligned to page_size.
> Passing unaligned boundaries to xe_vm_svm_vma_subtract() will create
> unaligned head/tail VMAs via xe_vma_create().
>
> Inserting unaligned VMAs into the interval tree and page tables violates
> core memory management invariants and could lead to page table corruption or
> kernel panics.

For now, page_addr is 4k aligned.

>
>> +			else
>> +				vma = ERR_PTR(-EINVAL);
> [ ... ]
>> @@ -598,6 +688,12 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>>   		}
>>   
>>   ack_fault:
>> +		/*
>> +		 * set private after xe_pagefault_service() since eudebug could swap
>> +		 * the pf->producer.private field. Also needed when cache was hit.
>> +		 */
>> +		private = pf->producer.private;
> [Severity: High]
> Does a pagefault cache hit permanently hang the eudebug session?
>
> When a pagefault matches the cache, the code jumps directly to ack_fault,
> skipping xe_pagefault_service(). Since the service routine is bypassed,
> xe_eudebug_pagefault_set_private() is never called, leaving the fault
> untagged.
>
> Similar to the SVM bypass above, if the session postponed finalization for
> this queued fault, it will never trigger eudebug_pagefault_finalize() upon
> completion.

It will skip xe_pagefault_service() too so it's OK.

IGT: xe_eudebug_online@pagefault-read tests that.


Maciej

