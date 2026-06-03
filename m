Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8960DCD6E57
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 16:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C2D1120B9;
	Wed,  3 Jun 2026 16:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="adG+lt7t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73CB1120B9
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 16:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780504312; x=1812040312;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/XIXA0n4LaGtZJb/RlHaga3QT/rbdMa0Gh3qB2m4CGY=;
 b=adG+lt7tqscRgSmm4rIC/0zaadEZx/lT5cWfYuY2yw/EKeR9jGYIuggi
 +fbRYbUWydw1Pun6D508tRbo0bG7YdB4eYqW9aSptmu7Lfvz3L6IqFzAl
 l1u6pFbwq07r/31LaVguOBQhc0n+o4PYLYD54hC39txNBUpEV2ooKx07j
 XaVf0DNVZf9WDtYoXHFGVCe8y9QtP2dXiE7bTBe0BLjLjGN26DsboLCKk
 fnuPHPqPe0MtbKjNZya0Sme42Q7lHpLkWnSpZed+cCSs1axibMe4+CDDA
 ptHuKWg0/8LTpyKdzmc/aAxRg6HK22Kte/Oz/aH69ORicQZ2+qicYIbrY g==;
X-CSE-ConnectionGUID: HQiZ8rVmRuaTIxyA1ndnuQ==
X-CSE-MsgGUID: borgLcKjT4u177hzz00J4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81502672"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81502672"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 09:31:51 -0700
X-CSE-ConnectionGUID: xB5D96byTK6aAjBxW21SDA==
X-CSE-MsgGUID: Qh5rZWeSRkGcCFy642ZGOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="237947381"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 09:31:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 09:31:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 09:31:50 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 09:31:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ab/BFnKVgUWrc0rs05dmM1j99FEEjHLk6UCBvgzHs/VmKRPRuBtjYCm8PN5BPFbiCkNaG2OLmRSV9XAkkOpCFetznKN2UJXLP8miF4jpcnR6CRuIsFwDWglBKZyHS8BF3Tl8hy2vHqgaEDfSfz+/PlrCb3R9GzVfou2CeWbCEGuVlguEt2iVmwuuijAZlqtTDd5d3LLk0EhiM8ytSbepsQJpG8CS9n0kciILEsSTqEYIVleop3oKxqHSyYL3yQT194Sqd7mPzzr1dvx6+sG8FOdSbpBCC329ovNBp5DPk/iqu179H+de4T6dUOaLdRgO5LqKvSq/V3XG4NJE138RBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cw7NJ5JLMXzEPrAP8/YV9yf5hHDFQgEOQi8cshZ4SpE=;
 b=TMx8nnZnWnKwP3lDcswlrEp3tWlLRu4E3BDeyKH7c1ltoZ4DDTqUMMqz6Q8mlXJPE6oQpqGjCEhO/AWvDRofWYFKeG7vcQhata9sgggtVpdjtPCc/7Z16TQVbTcL7NTyh0jDOlWUCBKzDTQYuHHsGROtTI8oKf2MfLJOFjEgx3nakSkO+5AvBk6tAXNXshb/McNSuN4n4sXmAdlJFPyQjNWzMZSGFeEAFEaMKAAHnsyvIOvBAbgyfKqhnZNh4SlOp1E/vqmFbFvAM+qPoQJvQ+nYeThRWrlrBfA7Q8cQvdAyDvCJjwxQMAgmEZpfzDKzkOLtyT/l9ei+uVQL/d8uiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by BL1PR11MB5222.namprd11.prod.outlook.com
 (2603:10b6:208:313::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 16:31:48 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983%8]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 16:31:47 +0000
Message-ID: <5f49eefd-a984-4d96-875a-87173a99a775@intel.com>
Date: Wed, 3 Jun 2026 22:01:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: fix job timeout recovery for unstarted jobs
 and kernel queues
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>, Sanjay Yadav
 <sanjay.kumar.yadav@intel.com>
References: <20260603150059.157355-4-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260603150059.157355-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0280.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::18) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|BL1PR11MB5222:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb40457-0cbe-42d3-75d1-08dec18d9b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 6fWWWcxRfr3u/ibBYyHwHWCuBLRoEVbbqoV+jOuUOTv7hexedM1SjLYj0BLoQZVPg2tQE6tE0cDfgJMSiI3p2gAXWbENw8hLKSffmRfc1QAb+LHqH1H1S49xMIyz+1fFHccXx11ujTQ4imkT8l2AnBO+Jc+RHFWGhqfT39y42vSANolKA9b1HbKnzaAf8mBTSzWZey044D7zlnZFn1y/LKoNbiCDVKp0PAa9CrJNcZbhYnrkjNmIlS3abEvPqoiBmFIoo/SH9VJg9cvP06r2rH5nmWbPlZsupi+Q43DXa5iAn9xawvBHf4yc0nSMLLHoWzWiHsX/rKE/TdctTLHdn9Isxmh/cZoICkWQppimVKXW8gyru3TpJ/Smyef5xmTsigfR0CJ8sY3W5FDpoydN0Unh4CqAFxXcTFLeX1knzp7q+POao3iU82oAinDVHpmJYupMHUcKT1LMGIbTTDXm50wTZb5VCrrgKhK+CWfP1XlSX83s3rtMWxlAlOMVa03f8xRJ84vEH0BpNrWW9U+R8daK+UGRRkU9ukJdFTEGGiesdBHmNATBLMi0ckJePs6WB2W1AhSFMXWAB/VOUNpD538pPayg65x9wzN51QEysbnAGkpG6e1NFf0o3VyGkAr6jgQVHjXuuB3pGrMFHM3Ifya4o5GcAbjcUzIDCW/PB/cabLbK3xvDrkj6FoEKqzUO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(6133799003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGducElVZVBXdGZ2aUtORHhzWTh4VktrbjV1bDNDZ3c2VnQxdzV2TFZ5TzB3?=
 =?utf-8?B?Y3dLZ0N3dnJRa2FQT3B2YnY1bCtnOEMxMllUUlNQa0l3cG55Y1diUC9SZWEx?=
 =?utf-8?B?WTMreHRUc3ZtekgrSEg4aW5pb3dvZjRGUC9yT3QyVTJzU3ZUSWJNNGZQdm5q?=
 =?utf-8?B?TmRmMEpQTTlESTQ5REFDT0UrSU1manAzd01nTFhhb0tDbzgrSkVSRkROcGJ0?=
 =?utf-8?B?Ty91OXlCYmlwNXNrR0JiODZ1WXY2Y0VjNTZLcVV5R0xJUVVlUk9hZjY5cjNZ?=
 =?utf-8?B?TFR6ZEN5enVGRE8zS1pJZ2cvYlNRSTV2alZqeFZvS09BR056MERQOVpyS1E0?=
 =?utf-8?B?ZWoyV1ZvUU5iNXNSVmJiVzdXYWJzMDNWOWFyaUpOb1NnQ3QxODZSZkRuY1V6?=
 =?utf-8?B?Sm5ydEo1ek5yMHlINDFYUVd5Qkc2VmlBNU9sbzdEU1VYMGF2a3BDYmw3amJo?=
 =?utf-8?B?ZjZEeFArOHVieVUxbDNnTUVsM2lUZll6RUFsTHVhTm5JZmJoa1IxZ3dwZ1pl?=
 =?utf-8?B?Ui9SbGgzdUlJNVZwb0JHc1kxU3A1TlhNYVRUL3lraFhPSG1xM0pFdGNDM21B?=
 =?utf-8?B?ekt0TVlXYVc4c1Bub0wyTE9GZmZ1RWxkTkZZTGVrWEQ0TFVxUjN5L1NhTGpj?=
 =?utf-8?B?Y3RmaTYwUEdldEFraTZpZFpZZUc1ZFFvaStmNFNmZFkySUpCTXA4VjY4Qmdi?=
 =?utf-8?B?ZFc4S3dJZFB3VmpsNGxhZ0xUQStLVnRvK043ekllamRzL1pjRjdVbWc3RFd5?=
 =?utf-8?B?Nmc4R0c0UGU3L2daM0NoekdObjlqMThKTTRqRWlrOVJDaUQzbjA3NXFaUXF1?=
 =?utf-8?B?UUdmQUM3bkJzS1R2dE5tZ2tBYWF3byt6QTI2QWM1OVVtTFh5U2pCSk45NjEv?=
 =?utf-8?B?MjRWZXpVWWh2S2dHVjVwSDNMeXE3blJyS1RuajY3NTVPL3ZxbEwvQUNPWXVT?=
 =?utf-8?B?NzFpODFCZ3J4cVFIalZFeHFSNEgvd0kvS3JDOVdMMG1QL3RyTWdNUTU0Z2tV?=
 =?utf-8?B?Y29Ubk96TmxyVnlpNHFtWFhuRFVPekNaWndiRkhDN0ZLVzZhZWo3YTZtQWN1?=
 =?utf-8?B?UG1kUHlWcWcreUpzd3ZBVGxhV0FMU0tJZ1BaRDZ0OU4zWmdZWHhWTnRWQW94?=
 =?utf-8?B?Q09ENTlPNnZkVm9xZGUwWjRRdnN2eFdrNVpnRGJJRVdiSSt4N2xJOHRMdGxy?=
 =?utf-8?B?Wk5qWUdEaGlsNVdhWHVBckd5Tm9vZTdkckJDMmdneTdEWlFFS1kxRW1BNEhn?=
 =?utf-8?B?QkcxU200QWZHU1EwL0FwUEZGamFJN056NTJkaDV3RG1WYkQyNlgvT0w1NDRF?=
 =?utf-8?B?eWR1aUJaYmlwbkFCWWJZL0IybTA1Rmx3N1BmZGtObXI1WDl6alVpY202d0s3?=
 =?utf-8?B?RTJya3AxVG1xaHgzTGkvUnR3TGFqQWlTRDFIQlEzWWZzeFpnbzRXQWwzVXBp?=
 =?utf-8?B?TWtyK0NHbTZTbVQ5QTU1QWVLMnlJZmhqU2IrZGE5K1JoUTJPMTA0M014bG90?=
 =?utf-8?B?QTBhbDNxRjF0ODNFeWtNWGRvU3FxRkVpbEM1SGFSaG44cGhKVjBUdDBkc09n?=
 =?utf-8?B?OHl6RU5mbE4xZnRTQVNUOHc2QzR5MzZGQlFFV2d3cW1pMVhRdHBzektNU2pm?=
 =?utf-8?B?amlzV01xUXQ3aE8rT0lTSGJxRk1PaW1TNEsycEN2UXdxSGlneFpEZjRjdjRD?=
 =?utf-8?B?YVo4Y3hMRFFuc0NrMnBKWGltRXdzUFVOQUFacDJYMXhJck54TVlIaWxMTHAx?=
 =?utf-8?B?MXNuSldjdnNhT2EzRVRjY1kwRWhqOGdiWmtOUGdaU21CcS9meDJNRjlBU0Ra?=
 =?utf-8?B?MmNrWDA2N3hwcWVUVU8zRmFMK0pLbmNnMG5zZzVMbGpJS3pHcmFCZ3FXSEhp?=
 =?utf-8?B?eHhXMjZCNmNGalQrb25xQ29IeGZDZnFFSGNPY3didkcwOUdBbEFiMFY0RXZQ?=
 =?utf-8?B?YVNVY1ZwSTFrRUxTMDhJRk1VVEN5QUx4bVJRQVFnU0lLNncreEdwNW9iN3pm?=
 =?utf-8?B?dlBKTk93ak9yVjU0bDRGRUp4SnBMWDRuUE9kTjdFeS9NZFlTN2Rsa2s3ZkZy?=
 =?utf-8?B?TEpQcW9kN3V4TmpSc1laUUZQVnZOU0tOTEdaM2NNZDdvMFMyT3JqT2pKU1Zn?=
 =?utf-8?B?Y0dQdkRUdkVsTFNid0I5Ykc0U3ZldldyRFJwakxBMU05Nkk2ZS9seWM2RmEx?=
 =?utf-8?B?Q1NsRE1kOWFVeFVRdWZLWkJ2enlsRHBSdytyZFdHVW1DZGkrUVZ6S21SZjVp?=
 =?utf-8?B?T3g4aDBCbG92WGdqNFNCNmlqUGhraHh3Zi9aMEZwOUdiTys0My9Fby9kdDNH?=
 =?utf-8?B?cmxmdENpWGJ1QmtsaVpZSmMwV21mdzYwRUtpMEdLbkNZbGpjSGJ5cFhjUEJl?=
 =?utf-8?Q?6+h7togAN9IJbp8I=3D?=
X-Exchange-RoutingPolicyChecked: TpvDK/yk6DsWImsUWes2mKNRjM2agpC+HQvr645LHYK9KdptGg4Bv3r6XjwQfaQgsfYTh52UFSdfOj6REIFkI0F8wF1cGy3aIi5czVZ8pAn/B1HmwK0hOeD0AZ2vHWj71JIrLhD4sWoaXxCtPAmGRWwQGPNH9dHhTB93wsiNIRtYdAPiml0Ef4X7/Wac1UTGopsDhb8qSSpHdXX/QZLsbZ4V2vChD550sFF+EVKACb8WFVEgY7PkXabd5TGH/SuUUyJNjuoR+k0j28m3ZyxkudaQciVBgCPJfLjqpKo5AE2QPudxPiVLY/DYbUe2+ZbKc/eBnRWQuElwHlssw/VPrw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb40457-0cbe-42d3-75d1-08dec18d9b8b
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 16:31:47.8876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: to4bNc1DM0kFKmbGM9Re6QYWptc4Lmtdf1T/KfbVERG6IGUC15hQnrlgRnhkTj2t/r6c6CdmptgWfK44aRXEBFp9LutTy7OvJL6RcQzp0h4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5222
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



On 03-06-2026 20:31, Rodrigo Vivi wrote:
> Jobs that GuC never scheduled were silently errored out instead of
> triggering a GT reset. Kernel jobs that exhaust all recovery attempts
> should wedge the device rather than silently fail, and userspace VM bind
> queues should stay permanently banned rather than being reset and retried.
> 
> The queue is banned early in the timeout handler to signal the G2H
> scheduling-done handler so it wakes the disable-scheduling waiter; without
> it the waiter sleeps the full 5s timeout. For kernel queues the ban is
> cleared before rearming so that guc_exec_queue_start() can resubmit jobs
> after the GT reset — a banned queue would block resubmission and cause an
> infinite TDR loop.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 31 +++++++++++++++++++++---------
>   1 file changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index ab501513d806..bbccba367626 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -158,6 +158,11 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
>   	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
>   }
>   
> +static void clear_exec_queue_banned(struct xe_exec_queue *q)
> +{
> +	atomic_andnot(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> +}
> +
>   static bool exec_queue_suspended(struct xe_exec_queue *q)
>   {
>   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
> @@ -1376,7 +1381,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>   			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>   			   q->guc->id);
>   
> -		return xe_sched_invalidate_job(job, 2);
> +		/* GuC never scheduled this job - let the caller trigger a GT reset. */
> +		return true;


Sounds sane. But Will also need clear_exec_queue_banned and GT Reset for 
user execqueue, if job wasn't started. Below changes mark it only for 
migration queues.

/Himal

>   	}
>   
>   	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
> @@ -1622,19 +1628,26 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   			       q->guc->id, q->flags);
>   
>   	/*
> -	 * Kernel jobs should never fail, nor should VM jobs if they do
> -	 * somethings has gone wrong and the GT needs a reset
> +	 * Kernel jobs should never fail permanently. Attempt GT reset and
> +	 * resubmit; if karma is exhausted the hardware is unrecoverable so
> +	 * wedge the device.
> +	 *
> +	 * Userspace VM bind queues are banned permanently on timeout
> +.	 * No reset is attempted, the ban already
> +	 * signals the G2H handler, and the queue stays banned so the job
> +	 * errors out cleanly.
>   	 */
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> -		   "Kernel-submitted job timed out\n");
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> -		   "VM job timed out on non-killed execqueue\n");
> -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> +	if (!wedged && q->flags & EXEC_QUEUE_FLAG_KERNEL) {
>   		if (!xe_sched_invalidate_job(job, 2)) {
> +			clear_exec_queue_banned(q);
>   			xe_gt_reset_async(q->gt);
>   			goto rearm;
>   		}
> +		xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
> +		xe_device_declare_wedged(gt_to_xe(q->gt));
> +	} else if (!wedged && q->flags & EXEC_QUEUE_FLAG_VM &&
> +		   !exec_queue_killed(q)) {
> +		xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
>   	}
>   
>   	/* Mark all outstanding jobs as bad, thus completing them */

