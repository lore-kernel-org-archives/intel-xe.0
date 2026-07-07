Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2D7C43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 19:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A4B10EEDF;
	Tue,  7 Jul 2026 19:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFjvtbzu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E1510EEC4
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 19:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783451289; x=1814987289;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W8ahWlNeatoPntwvWPgT8bW+j+TfHyo1D37+LNhy13k=;
 b=JFjvtbzuKIjI8fGPtzVTIprIEe1gN9M/WuQs/7f3uJ/TMe9XMC35rslW
 M+/SSYYEqzZvZQgabHk/NaqGXX6SrRo7QSLgbQOYVcW/TMq1tN4OEbHx/
 +Ouc/PwODfGG8oPcINlUoRWqlLcvYAQ8pPkwFRmJUvNwxGLBoeehrI/hF
 ZWZPXxIw2Ks1FUfvXZinK9Y/nqyFde9eHEJP36VeMo0DqjEDtoNy5ybBF
 Oh+noAESqDpNktN27ZL26n/m2K8GLkctGNTqrpTtJwRTlvvE8+4UuVUSA
 EkVB3yNGCUoxNiUs/lPgRDk7SaU7+beeDQvxuj8cr8AWlJ3PIjg1+rlSW A==;
X-CSE-ConnectionGUID: KgGbiujzSw6uuAYQh1G0DQ==
X-CSE-MsgGUID: oMZQN5W5SDauKDo+Dhn12w==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84135031"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84135031"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 12:08:08 -0700
X-CSE-ConnectionGUID: pWTsNahZQUKn9flMlZjmSQ==
X-CSE-MsgGUID: u63zvGczSXO+T1E+WuIBrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="252336516"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 12:08:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 12:08:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 12:08:08 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 12:08:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9rlBCykHMgXrk0pMauYDoSDFDGEgQNf/WhLqoIyQKScmRYBV5rJJkzCdLo7e0ORrx/8S+16wMn02bRDHRCx7qf6EXMFx4K0BrtM1RxqazXiIqyytQN3GxBs9uYXu2sOuCHFo/C7KTDx4CKhtSvh4/KyM4WYnSEclOmJZHEC7mkhieI/Am+sD+/Q3lgZ0jvvKsVK9IL0JT31xka54MhVfPAMUCEjjxaukJG9w7w5RAO4zChqA/FM5SSAiD+1XPIMDm0m+RPeKGqljYkDmaY2Y2vUWlXPgBcO6IlvpzKeQhwXOedI1Fy0Mjs26mVyh0XH6O3oPdMSGutIAZUrggdk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8ahWlNeatoPntwvWPgT8bW+j+TfHyo1D37+LNhy13k=;
 b=iB8uj85KbE2TiK9Kf0iHNHQO8G5N6OleOLSuouHMxcsDR5FGLQel61mySIavfJeBpZn9LlOqReQdtn36BEQFx2ftQCtRWinToPefVSrVgWY4QR/84AhYtn4gSre83qyIU0ZHkODBF670DgV1/XgIzJBQpYQGEQ1SVVSxSztG0l+u0pgmhAk779PH7akHDdjEKJJBF9gxMuUmac2OFyrnOmbPn12y2qvbzDRalb48u3cKgYTKJzylrqwAjHNHTt/vLIdcz5hYHC+0D4u3eqolrTWGmOgeS6UKxapsClT9MB3SiyaiKb7E4OUciZFJ0MZQOy6542IUsn1v+gcnvZapfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by BL3PR11MB6458.namprd11.prod.outlook.com (2603:10b6:208:3bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 19:08:00 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%4]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 19:07:59 +0000
Message-ID: <c0ad3fee-6a0d-4a17-88da-1faeb2c1190b@intel.com>
Date: Tue, 7 Jul 2026 12:07:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Add support for WA 16029897822
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>
References: <20260706224344.2723462-3-daniele.ceraolospurio@intel.com>
 <20260706224344.2723462-4-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260706224344.2723462-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:303:b6::7) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|BL3PR11MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: e27cb4e4-d753-41d3-7c50-08dedc5b0fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|4143699003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: YacXc0AgtLSkPWFchnBBnnbb5rmq2wwYZUubYzYI+n1NTM2IqE3Issa/IxYn5LZxUBfBBNyWEnS0s0P1u+YEf7h2qLf0g0Sj1NsYO1/Eo+gUY6rnwNInoYyICOmBqroVAFufJidIhU3tePjd9jvyyjwNvIHQThYSWPF5yUZdsJ/zMlFMNGHHalMOgG/ui4h8BApRtaL+1uelsR7oJr2W6gs6kojM99gPbYcMGctPaN1bWXGD9wxmoVA5tY6/B1aX+QMqKi1pXo6GXNyuyR1YwEkCtZw9GEtRUgXOtizDHb/Sns0NEmzH9x83Qgu+iwI0LziI0HT1MzmFZFCbTnWbkvCdKIIid7o0iROAKS2lsL3fz0bdBfs2NlyUeYySLyQrhFai4ZnVKZ6efhjmLEVvykJl7QO4qAFggCdwYfOt2/H9tGyiNGzXpDzEOAI13olPKHnZ/pkAQcuPmPlk7KGHaSbejx/tuC83F66ScDcSNzYRUaurcUa5dM3KFd1GHTFbd4pTThkE0DiMNA10sA4fcBlRTIiYC35Uf+kx6kWl+NEHWsZiYclJY9QssFaNrb+HoFKVJ176MKV6/gQWjAnQMciX5yLTxcfpd43x0utwsM0Z1iivHG2KMYMQ3kyou8vk3aOUYdkh78gpVcXdX/IH6QkNwJaTlLo0/cXhKS33UOk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(4143699003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDNHRzljTEp1aEhjdTEwa2xlbkVhb0FGbi9RRHNXbEM2MUZIQzFVMjFiaWkv?=
 =?utf-8?B?QWVva3RydE9EOHdKdFgvK29BY2N5UjhRUEFCV21QeEUwRUFtVFhGK2ZCcHZE?=
 =?utf-8?B?eXV6M0ZWRm5PeWNSVFppU1ZCR1hJT0pXYnZtUi8za1YyR2ZjcExNNDBFeVVM?=
 =?utf-8?B?cGpwdVZudU9PbGp6TlVCUmJObWdzNE56UGNNQXUzWjAzUGYxckp6YnFRY2li?=
 =?utf-8?B?UXM4bjRTakFKalFOOUd1cDJubXFtYXFsbzNpTnhhVkhGektSU0tyRTM5VmN6?=
 =?utf-8?B?ZmhRdUFIRjdsRDNnTnEyR2p6QWhaUFkyMHRKeDh2SEFtSVQ3QjczLzhRVW5W?=
 =?utf-8?B?V2RuMlkyUW1jekFYNEdtNUZaYWkwWmZIQ3RKZmNYcCtXMVBNdm1DazJZOXZx?=
 =?utf-8?B?eTUwcmRUeXJldHN3dUNBZXV3QUR2WFhZYzZGUUdCTnNDd3g4ZzZLVW15MzRY?=
 =?utf-8?B?eUNwUnRtRHU1VXlLM0V2VDQxOUNBSGtmVDlndHZNd0xmYjZpdzNLOXYydjVj?=
 =?utf-8?B?dmt3RWpDbVVQSm9HRDdyWlo4MXpqOWRpQUxTSXFhcjJvbVRuci9iVnJ2cEc4?=
 =?utf-8?B?Q3lKQzlPSjMvL2syQklsaDV6a0kvb0JmNlNyWUZ5LzN3ZkxqWFAxaHh3UUVj?=
 =?utf-8?B?STI3SU9RMTdjMUQ3b3hyWlI2OThIcnAzUEExODZubC9tNFNlVmhGNFY4ZldN?=
 =?utf-8?B?TFZNZFVqeTZFbmJIWG9ESEFzNDFWQjZSVTdldHAwMHREcnEzS01Rc1dWRVY0?=
 =?utf-8?B?bXZzcGlEcThHM3VONmVqZXNCNDdBckVIMmN6eXlneDZEMnUrSGJTdFdQRE9x?=
 =?utf-8?B?ckxmd2dMSFNFUEpkR3o4cTJFMHR0SDkzaDhKbDU4OWZ5ZE50WTBta0VWUmtN?=
 =?utf-8?B?NGZ2K0tpNS90T29GbGgzMW1vUFBzSU5kaFFqdjFLbkNPSkJtS2c0UTUrTTQ3?=
 =?utf-8?B?MlE5dXAzdEMwbEozQjlHNnFYVDBxT3hwUnkzMkZzcUgwQ2hGY2NXLy9nOExY?=
 =?utf-8?B?NTFIajdtdkVKOUszQmJSdGlvNXYwT05hRDJxaCszYXpjZE9ycTZpR3hDRWU2?=
 =?utf-8?B?c3FzVVlYTi85ck9RbkhzQU95TDd6WUdISm8vWmQyZHRUT2h1dHU3dEVuVXlV?=
 =?utf-8?B?aFRwRXY3UUFES3ZRa2Vod2VyakNIeHd4UHJxQjRsQXBhN016Rk01WW4wY2xn?=
 =?utf-8?B?Rzl6UkFGYlNlTDhKRGVoNXFLU3NodmN3Y1NIMXV5SUxjZlRlUXBhWUxKRHJH?=
 =?utf-8?B?cyt1WmdBMTdKdjcwRGhOYUgzTWdtdFY2QTd0V3ZoRVdKbEVkYk1LKzd1TzFN?=
 =?utf-8?B?SEw4TTR0M3h0SHQzWHJxdFBYbHUrRUNZcjYxcW1SeWpXc3B4OWdOMHlzdWkz?=
 =?utf-8?B?TjZtbnVBdDhBc2VGcDRnMG1kZURMRWxXN0hIRlFnS0RFT1k4Z2M1TDVoeXgr?=
 =?utf-8?B?aGZ0Q1c2U25VWko3SWp5aXo1d1Q3d2Izdk1OYlk1enV3bkJ2NGNrVjJCb2pP?=
 =?utf-8?B?cW9HWU5oaHV6SGZyNStMNzg2bWJLeVpBTmNGeUVyYW5JbFl4TFYzeE1YNmtH?=
 =?utf-8?B?aHQzbHRaeWlydnc0Mkc0TllKc1QzMnM4elZ2dWZnQ2Jua2ZJM1VsbmVhUU4y?=
 =?utf-8?B?dk5WVWZjcDh5a0QxRWhlK3dFT2JCVW9oaGhmZEZzY2xQQi9JTXVwNU5kVjlI?=
 =?utf-8?B?UHZUWStNK1JRSUlncHdNaXl6N0NHQTlhUmxYKzF5SkxTNUNXTzhUY1JhMzV6?=
 =?utf-8?B?ZGxCbmZuY2RaZm1kV0FuTTlKK3pUb0VjZEhqSXdEbHcrOStWam42L3krbTE0?=
 =?utf-8?B?cWw3blNwMjVLSXF3cWl5aFppSGRLSnVJbW5ZcjN2WVJlWVNGVFZSZXZMVkZR?=
 =?utf-8?B?V2RheG9XT2kwN0tlNlFKMzBpQjhZVS8zaWgwRGxKZC9YS1pudW0xbWVKTko1?=
 =?utf-8?B?OFNBWm9ScTFTL1FIR25wVGRIdHZGRUVqcGJ3aVN6MXZPMXhVQ1dPYktHRHRY?=
 =?utf-8?B?SFZSU1c5NGhIVll1cjMya0NmQUtnSWFoYXRCMUFWOFVsK0o2cXhMWWVhZ1dL?=
 =?utf-8?B?TTdWTXROeFI1S1h6ZDFkeStTcGs4NTRwVkxMOTdKeGdVeUIxSE01Ukp1dGVn?=
 =?utf-8?B?VlA2Vmp6WWd3eW1zbUE3aTRxZFBwUENDb3B3VVVyQ1Izc3lxQ2psc0pIRDlo?=
 =?utf-8?B?dXFURVpKTWtnOXQ5NXJBbmFmMWxsT0pDNkF4VFBQT1ErVnhrM0VQU1k2VytK?=
 =?utf-8?B?ODNLOVZKZDVneXZrZEUrYXFqL1lubWZDSW5OOFNPRkl2eTVCZGI5ZDFPRUkr?=
 =?utf-8?B?L25oZ2gwWTF1S005UjJOazEwMW16L3dKbWlZQzQyOHU5eHpPQWMrRkxUTS9R?=
 =?utf-8?Q?XECCHu3YVAHWs+3s=3D?=
X-Exchange-RoutingPolicyChecked: oyU72MZSHSlTq362G1Lbj/cWC6g+SFt2gbmmfQ30yePpeOzFDpio7nNmrqpvq7qwFPjkY9Qezt3xq83Sbk/JwcnnKmXDJ+gqj5qUdAO5Frx364eWM4mZVwUt6xaQr6la2K+5orBLVy4aHIfB7CPQuJD9dubXpw2JxsABbrTqr77vmvk0JJ+u8KLFCkQBaki1wA61BRL8kAdm4pnCZ/Mg837YSXeTcdjKqClnmpHvoWrhlP0LYVyOFf6uaqk+oZGce+CqhLjm88+P3NAQczdUzo+IQYa4iYaxJ80Xc29rqa6NzZJNWsoVDiNs/v26u6qyNa2cbzW4nqK+JufO1FZGIw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e27cb4e4-d753-41d3-7c50-08dedc5b0fb4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 19:07:59.9048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gta0DGILHYskG63IMYEDipNCa1yUu2pte78o/CTGt/seOmAw26XnJ0Q+HRNnstxVSUPzGIylecVKDM28fa1/6192k7LFB/3Z8VhNY6ODWzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6458
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

Looks good to me.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
