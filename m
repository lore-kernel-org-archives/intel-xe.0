Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD3BC79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 07:24:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73AE10E474;
	Mon,  7 Sep 2026 07:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aw+ltL4X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD7010E474
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 07:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788765866; x=1820301866;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jSpZ0GKFW6UdWfea5HGiyhddiiXoYseuPvsNXa2iy0s=;
 b=aw+ltL4XuX75suEuqYy/VvLkNq2t0NuQr22uYJMo7T0QiT2Ub0ZpAtRK
 2ExpADTye0TuPn7ixSpeOepGOhT1TPL1jX7zmJWuKHvIcJ6OBtkYapsOQ
 cWFs2DTw/noLwQeeGj2S1UZSEyp55mlXKPeLIrfW/ZC1gW1msew6uTihu
 FGD8xcMkhOv1pY4tvCgt4IozjCCsaMxVXKUCVknxjDooCtQcM3Xb5PM2J
 ag8RaBMtHoew0odsnNen0A3DuouUtA3XiIDgs/ja+yZteFAIRVlUydXg6
 JZY2G8kHD7BnREKZrGbR53Svailrl1AHcK3nmMCBaA81mdJ20tiEehG7S w==;
X-CSE-ConnectionGUID: Agr7vGr0Q066QvRhVBRpuQ==
X-CSE-MsgGUID: cL1Z0ABbT2CcOfN8F+1rZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="99760559"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="99760559"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 00:24:26 -0700
X-CSE-ConnectionGUID: N1GxaK6DS/i7Iz1o/PhA7Q==
X-CSE-MsgGUID: 0YIJHJ0KT9ab12Fce0dLiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="270111911"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 00:24:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 00:24:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 00:24:25 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 00:24:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tY/gTzCipNQcvtuwAeE0AkFEmoA1cCeTEwqpzZ+ib9zWsrTxO0IvhZ35lkdU4PX8x6/cahJ2AgZk9+oUEy/mWoXxMdygOSIx85O3ZZkzqkaoocIx0WAyZ4yMluzIxZRwJpLCwMs9LlrXJYis2ttRgh291MfsqVE9iVgXdf3+cgV9wTWSzrE/W0F/c33HyWK4IlapIO1y2fn0AYm3jSOdDkKwtYtO5FQDFcXx2XE7LowcX6TWfitAVfY4SmS0VM7qwFm56zyryF5WAO5hTyL11nk5hyyOMReqML6KcDwDpbY0+i0YiH8uj3YweYeq0s0ojs1YPRSGlY9cTyrOxoBfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+ZXw6R4dG1LkZmY/k50VrvDaFLplFVkdYlTdbPKdEU=;
 b=JzRrRH5+Kh+Dv8UqTtb1p1HzFjjmt/OQ3eZE9ErezUcnepYXExWx3TLNX3eHqpUPCnsXYcTAfd07xCyilt9UcM581vGzoZwULaU0tO1y2CZdKDuyT3PAzcp+tBoDu2Zv/hsGjfZMAUG8wisinOkOZjVh4/6Z04PHAqqcoH9BazDiLVzrjIJH2SQ58X65h3dtV/EmIw7OUspWm8WJyv1emRoVc13TD1PpOJF4ju5XVb1KykNMlTRbma8+eWi1nwOSfju7p59LHUovA21nK/jW88l2IsvQpDM/zLOzlirVM9BcHfsHOxL07DcaoN8Bp+l4gokdV75rZCWmTrPZeT8LXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by LVWPR11MB9905.namprd11.prod.outlook.com (2603:10b6:408:3be::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 07:24:23 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 07:24:23 +0000
Message-ID: <87ca1466-be15-4417-9ff2-16715365fedf@intel.com>
Date: Mon, 7 Sep 2026 09:24:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/xe/debugfs: Consolidate wedged_mode debt into
 xe_wedge
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20260831042633.1760474-1-raag.jadav@intel.com>
 <20260831042633.1760474-5-raag.jadav@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260831042633.1760474-5-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0036.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34d::8) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|LVWPR11MB9905:EE_
X-MS-Office365-Filtering-Correlation-Id: ac078f7e-98af-4568-5a5e-08df0cb10a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|18092099006;
X-Microsoft-Antispam-Message-Info: NXePywtDIialyA7qGmtOL0IQcB1DbDjcWVfTxFn2X2Kvvs9jUKq+Ve3Fhv3BVS6ofQKa+7QqsWMJCrJijshBJWZUTraVFZmZUXLH4YlrnckzW6C90oXy3fQtNsDWSQTS7k4YrULjYwE6yeeORSawiCFow1pOo9o8ipC/NgGJ7is5gj7qnlgFvAtlH1CX2MPPFbJJ7KlzcXqPpVdJ+WsuNFCrnGLghhoXR3NNde6f6vhMNlFcPAfpbktQ/PIGcRrn11eVK56DNx3f9MKxnEVaWfRQd8q0RKuMjbDbbx0aErcItB068WzyqrKQzBzQQGEbnbVpupOOkh77HODIe5x2ye3Agp7SyjEBoKgEqMbDA/TZ41UztEOCWBSzCgdPj1+1V3Bw+7eu/FZx4B84T0JG4F5dUkm8FXAdHudXcxWheNm7gtnQgsl/ci+kOG8uKyMBz8ZO4VD+W4LRVlQbIrK4a10T56r+273HyRyUy9L8wbE/S1NmDXW62YL/6Tpbj8xvZYn1LVW8tVZdE7pKzXhWlQs5O3TW/wYoS712aysLyNkpgNzb2yhquW1eGt3+2BHBoBxWsHJAa5X/8+l8hfKkfDRvgZG7fk1rUMubW9zYd1WMYRWRjmOeBFt2PzmemnPW/lSZW+CWtoZgQzAxS+8LnhOTvWLIFaYVeizJu60lHVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(18092099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUl0VHJsaUhCcTBUVEtnRm5pV2dybThpUHVYVmZFUzh6d3hFaWZocHJucStv?=
 =?utf-8?B?Q2huamU1b3UweWJQTEVyUVJPV2tNK1kybkxuZXpNWHA1QXlJK3dGK3hxdUFr?=
 =?utf-8?B?SzRENmlsMzRrcGVBWS9nNml2QUZCZzJpU2w4aUNkTHNDc3NXdGwxeGJjYXdI?=
 =?utf-8?B?NzhMMjNrYXlOdEM1ZzQxY3pGZS8xQ2FucFJQL0VTT1RRQ2l4OGxacUpDc1hh?=
 =?utf-8?B?OFRIN05RQ3diN3JCVFpKYUpmaXk3QTYwVlZxWnc1ZXVaOVFBbjB3SWc0NGc3?=
 =?utf-8?B?QzcvMWlnaExyZWhiaHcrUFdESjJXViswU0IrUmpXcG1jQ1ltUnRvYWtrSE1L?=
 =?utf-8?B?bjBkV2prNzE0eFZhbVJ4OXdSU3BTTGtMUllOdm9KRk14VVpNYTQ2U1NscUFv?=
 =?utf-8?B?c2NOVGczUXBPNjhDdkordFRLRVVBbEZxNHZtdUQ2VFNSeS9zT3lDZUlUVXVt?=
 =?utf-8?B?RUZFVURyejhxWWJDYnpZNFhoWmJ3eFlyODI5dUtHMkVLdlJrNHdWaTRYWHpY?=
 =?utf-8?B?YzkzcGdNekpWN3lrYURHaHdOemxCNHFmRXIvUkMxUWVXaktIdkhmUzBseURC?=
 =?utf-8?B?Yi9FMENVb0FETWRJSzBiQnNVaFhmY1FJYWY0MEErTlh4elN4N0puOXlXSDBP?=
 =?utf-8?B?TGdyd3oyeEpscEFhSE5mMHRjNDBrQlVudGVVTzJLZHJoNVF0VHErNmYzZ1pp?=
 =?utf-8?B?TVlOeWxOckxOVnBZaE40aTNKT0ZkaWhpRUt3N29NYnJMajVybFVzSTEyWjNt?=
 =?utf-8?B?VXMvbFI5S1piTDYyVllpcXdTUlZTdmpVRHFmZGxrZldBcjhXamZVKzJwSUIr?=
 =?utf-8?B?UGcxQkVlRlQxV0NLMHkvNDkyNWFadUpIQ3VZUXJ1djA1NXQzc2N1Q0N5UzJ4?=
 =?utf-8?B?Yjdzam1oeS9JNDNWQWhzdjVrT2RhZkVGYVUvMWszLzBKaXd3TG5BTUR2UkFi?=
 =?utf-8?B?NFlpcjhyaFRJWjBCMGRNdGNEd0gzSXlUZXNVeHZlTWxDbVhhRkRLYlhGVWRj?=
 =?utf-8?B?Q1hoaHd3Y1ViV3U5dHNNTFVONDAzZHhtRy82YXZINnF4MHd4QkYwSld5azdS?=
 =?utf-8?B?SjJlUlpHbzduMmFKWWJseW5UcjFsRjE0SXgzRktuQk15cUJOcm5McXp0bnhD?=
 =?utf-8?B?eDFQMmluMW5JSXJpcnRwMnJuNkNiM2JKNWF3S3l4a3haSFliL0tud09ZNDJy?=
 =?utf-8?B?OU9EVVZHd0gzOUVUZVdVVHJCYjY2bnpyN0xXdUxBbURRMldNaGVWNERtaVha?=
 =?utf-8?B?bGI0Rm5zQUFNM1ArN2tBVERrRGwrRTU1UzNiS3NTYS9HQkdSNndEcEZyb29N?=
 =?utf-8?B?ajl5Vys4MUkyeVRXNHNLSThKY000WFAzdHRGUEpvMnMySEFTeklUQVRSVkJv?=
 =?utf-8?B?VDFqUTVzSEpBQnhRRHU4aEd2dWNib1llZVZnNEh5d1hMZUxYTkV5MkZDZFBv?=
 =?utf-8?B?RFVkOURTMGpzUzNNL0pZNEtWa29hWkZ0SVFVc2szVUkzMllrY09hL3FhdW9k?=
 =?utf-8?B?aG1JMXRQcFMvcy9iT0ZmTE80THFFelB0Vm91akQrNEMxVnIrNGVQK1NQYWxu?=
 =?utf-8?B?aTlWazFGMHJoQkczUU0ybndIN0JjVFJHQTdpZVpjaVJ6WnNkSWVLU2FlaWlF?=
 =?utf-8?B?MHpwSENQY2xXdjlBME5ZcDZqdVU1SCs3NEptZGx3dTJqZFZYTXFtQ2d6K0JV?=
 =?utf-8?B?NDZ2NzY2UTl4WitCc0E3RGV1UElkUHJPYWRJNjR1dXFRYlNkUFQvOHdGMHB5?=
 =?utf-8?B?a3R0Q2dmOCtYSkVxTHZQVGlxeVd5S1dJbE9JYi8yM0lWWFlIYitBWGNUcjB6?=
 =?utf-8?B?dzBiOHZSZkh5dGFhU1prNjhXaXB5MmFGMk41ZTNlTHdiSjN4M0R2VTFtY3ha?=
 =?utf-8?B?UlJESW5sWXA4Ykt2aU93dUhNaTBRNmdlaVJpSUR2dVFTN3VwNDF3SjBtV3px?=
 =?utf-8?B?aHB1R3pIVHpQRGgweERBOWZTemU1cGZRa3RDQkdtcEZEZVRLTDZlUkpjYzUy?=
 =?utf-8?B?TWJrTENwNTVtM0FYYXlhYjhzZUJkcjl0VUZ4UFJHQ1ZnYThuNW9KTE1Cem5y?=
 =?utf-8?B?dkF3Q0trdmVETHdJYU5vNjAwUjRrSkJPd1ZLb0pWbVBxb0FTVWtCMmVHSzZS?=
 =?utf-8?B?VFVXaDRURzhaS0dXN2thc2pBc0cxWWpMUGlCTCtoVldkYzRyelpJdk9ieFdh?=
 =?utf-8?B?U0czZW1pNk96NE0vZUdqbFI1TUk4em5QejFZN0kzaE0yWjRrZkV1eEVMcTF1?=
 =?utf-8?B?SWdrSlJsRE1KWkkrR0wxVVF2VTBBV1NoZlYrYkNVSTJ5dnVmS2FHaVhBWHc1?=
 =?utf-8?B?aWtIcy92OFM4MGlkdWhxN1Z6YUo1Nm1KQUFvSE9yVVkraXl0Z1NTZz09?=
X-Exchange-RoutingPolicyChecked: CxShv6GmqamEKzzHqRsT6/44sPkP3bF2scXOR/IYxa+D/Nq01Son9QXgsqOEox81vp2qO1EaG1srJJ/2pFLRCM/TE3I5DYME5Zj39TkPtmi0Tkmv/WjNT2rO3lfMDpKqYBw3/yyTTqu6yM5XNHEDAgpjkbUSxVgAtbrFW/no5p52asbKxk7h0q81uHX8kX8ajN/KA/dxEvFM55pvpaadkauV0sEVZDG5QGZXgD4pBqkHrZitJBlRK0osUcIgW62qd5S4ZovFFpO9okeFF73WAmwpZOtXXL91wY/j5pYInfuKGxI+kiOmLnV1Ihm6dDJCk0w1v6/+2NNEgqhmKq9R9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: ac078f7e-98af-4568-5a5e-08df0cb10a5d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 07:24:23.4838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucKrZazKjFZ1XLqwNJvRc+7+kRQJWM8uGB6Qf3RXdq/YkrSPJsFhBfZR9Om7ibb4n0/o/AVk/x21dvwG9SUpeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVWPR11MB9905
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


On 8/31/2026 06:25, Raag Jadav wrote:
> Now that we have a dedicated xe_wedge component, cleanup all wedged_mode
> implementation and move it to xe_wedge for better maintainability.
>
> No functional impact.
>
> Suggested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c      | 65 +-------------------
>   drivers/gpu/drm/xe/xe_device_types.h | 30 +--------
>   drivers/gpu/drm/xe/xe_wedge.c        | 91 ++++++++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_wedge.h        |  3 +-
>   drivers/gpu/drm/xe/xe_wedge_types.h  | 45 ++++++++++++++
>   5 files changed, 131 insertions(+), 103 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_wedge_types.h
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 28135f84e286..9caeb357b865 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -18,8 +18,6 @@
>   #include "xe_force_wake.h"
>   #include "xe_gt.h"
>   #include "xe_gt_debugfs.h"
> -#include "xe_gt_printk.h"
> -#include "xe_guc_ads.h"
>   #include "xe_hw_engine.h"
>   #include "xe_mmio.h"
>   #include "xe_pagefault.h"
> @@ -34,6 +32,7 @@
>   #include "xe_tile_debugfs.h"
>   #include "xe_vsec.h"
>   #include "xe_wa.h"
> +#include "xe_wedge.h"
>   
>   #ifdef CONFIG_DRM_XE_DEBUG
>   #include "xe_bo_evict.h"
> @@ -374,58 +373,6 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
>   	return simple_read_from_buffer(ubuf, size, pos, buf, len);
>   }
>   
> -static int __wedged_mode_set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
> -{
> -	bool enable_engine_reset;
> -	int ret;
> -
> -	enable_engine_reset = (mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET);
> -	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
> -						       enable_engine_reset);
> -	if (ret)
> -		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
> -
> -	return ret;
> -}
> -
> -static int wedged_mode_set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
> -{
> -	struct xe_gt *gt;
> -	int ret;
> -	u8 id;
> -
> -	guard(xe_pm_runtime)(xe);
> -	for_each_gt(gt, xe, id) {
> -		ret = __wedged_mode_set_reset_policy(gt, mode);
> -		if (ret) {
> -			if (id > 0) {
> -				xe->wedged.inconsistent_reset = true;
> -				drm_err(&xe->drm, "Inconsistent reset policy state between GTs\n");
> -			}
> -			return ret;
> -		}
> -	}
> -
> -	xe->wedged.inconsistent_reset = false;
> -
> -	return 0;
> -}
> -
> -static bool wedged_mode_needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
> -{
> -	if (xe->wedged.inconsistent_reset)
> -		return true;
> -
> -	if (xe->wedged.mode == mode)
> -		return false;
> -
> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
> -	    mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> -		return true;
> -
> -	return false;
> -}
> -
>   static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>   			       size_t size, loff_t *pos)
>   {
> @@ -437,18 +384,10 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>   	if (ret)
>   		return ret;
>   
> -	ret = xe_device_validate_wedged_mode(xe, wedged_mode);
> +	ret = xe_wedge_set_mode(xe, wedged_mode);
>   	if (ret)
>   		return ret;
>   
> -	if (wedged_mode_needs_policy_update(xe, wedged_mode)) {
> -		ret = wedged_mode_set_reset_policy(xe, wedged_mode);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	xe->wedged.mode = wedged_mode;
> -
>   	return size;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 7d83f79f27f4..2b7114e9fee1 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h

Shouldn't this be moved in the previous patch "drm/xe: Introduce xe_wedge"?

Lukasz

> @@ -30,6 +30,7 @@
>   #include "xe_sysctrl_types.h"
>   #include "xe_tile_types.h"
>   #include "xe_validation.h"
> +#include "xe_wedge_types.h"
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>   #define TEST_VM_OPS_ERROR
> @@ -45,22 +46,6 @@ struct xe_pxp;
>   struct xe_ttm_stolen_mgr;
>   struct xe_vram_region;
>   
> -/**
> - * enum xe_wedged_mode - possible wedged modes
> - * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> - * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
> - *	when critical error occurs like GT reset failure or firmware failure.
> - *	This is the default mode.
> - * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
> - *	any hang. In this mode, engine resets are disabled to avoid automatic
> - *	recovery attempts. This mode is primarily intended for debugging hangs.
> - */
> -enum xe_wedged_mode {
> -	XE_WEDGED_MODE_NEVER = 0,
> -	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> -	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
> -};
> -
>   #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>   /**
>    * enum xe_page_size_alloc_ctrl_mode - User BO page-size allocation control modes
> @@ -525,18 +510,7 @@ struct xe_device {
>   	atomic_t in_reset;
>   
>   	/** @wedged: Struct to control Wedged States and mode */
> -	struct {
> -		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> -		atomic_t flag;
> -		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
> -		enum xe_wedged_mode mode;
> -		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
> -		unsigned long method;
> -		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
> -		bool inconsistent_reset;
> -		/** @wedged.work: Worker for wedge handling */
> -		struct work_struct work;
> -	} wedged;
> +	struct xe_wedge wedged;
>   
>   	/** @devres_group: devres group */
>   	void *devres_group;
> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> index 92973133a6f6..04d8c5666be1 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.c
> +++ b/drivers/gpu/drm/xe/xe_wedge.c
> @@ -9,6 +9,8 @@
>   #include "xe_defaults.h"
>   #include "xe_device_types.h"
>   #include "xe_gt.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc_ads.h"
>   #include "xe_log.h"
>   #include "xe_module.h"
>   #include "xe_pm.h"
> @@ -160,16 +162,7 @@ static const char *wedge_mode_to_string(enum xe_wedged_mode mode)
>   	}
>   }
>   
> -/**
> - * xe_device_validate_wedged_mode() - Check if given mode is supported
> - * @xe: the &xe_device
> - * @mode: requested mode to validate
> - *
> - * Check whether the provided wedged mode is supported.
> - *
> - * Return: 0 if mode is supported, error code otherwise.
> - */
> -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> +static int wedge_validate_mode(struct xe_device *xe, unsigned int mode)
>   {
>   	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
>   		xe_dbg(xe, "wedged_mode: invalid value (%u)\n", mode);
> @@ -185,13 +178,89 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
>   	return 0;
>   }
>   
> +static bool wedge_mode_needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
> +{
> +	if (xe->wedged.inconsistent_reset)
> +		return true;
> +
> +	if (xe->wedged.mode == mode)
> +		return false;
> +
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
> +	    mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +		return true;
> +
> +	return false;
> +}
> +
> +static int __wedge_mode_set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
> +{
> +	bool enable_engine_reset;
> +	int ret;
> +
> +	enable_engine_reset = (mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET);
> +	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
> +						       enable_engine_reset);
> +	if (ret)
> +		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
> +
> +	return ret;
> +}
> +
> +static int wedge_mode_set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
> +{
> +	struct xe_gt *gt;
> +	int ret;
> +	u8 id;
> +
> +	guard(xe_pm_runtime)(xe);
> +	for_each_gt(gt, xe, id) {
> +		ret = __wedge_mode_set_reset_policy(gt, mode);
> +		if (ret) {
> +			if (id > 0) {
> +				xe->wedged.inconsistent_reset = true;
> +				xe_err(xe, "Inconsistent reset policy state between GTs\n");
> +			}
> +			return ret;
> +		}
> +	}
> +
> +	xe->wedged.inconsistent_reset = false;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_wedge_set_mode() - Set wedge mode
> + * @xe: xe device instance
> + * @mode: wedge mode to be set
> + */
> +int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode)
> +{
> +	int ret;
> +
> +	ret = wedge_validate_mode(xe, mode);
> +	if (ret)
> +		return ret;
> +
> +	if (wedge_mode_needs_policy_update(xe, mode)) {
> +		ret = wedge_mode_set_reset_policy(xe, mode);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	xe->wedged.mode = mode;
> +
> +	return ret;
> +}
> +
>   /**
>    * xe_device_wedged_init_early() - Set wedge mode passed as module parameter
>    * @xe: xe device instance
>    */
>   void xe_device_wedged_init_early(struct xe_device *xe)
>   {
> -	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> +	xe->wedged.mode = wedge_validate_mode(xe, xe_modparam.wedged_mode) ?
>   			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
>   	xe_dbg(xe, "wedged_mode: setting mode (%u) %s\n",
>   	       xe->wedged.mode, wedge_mode_to_string(xe->wedged.mode));
> diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
> index c6f16b10ea69..b31a682dbff8 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.h
> +++ b/drivers/gpu/drm/xe/xe_wedge.h
> @@ -9,12 +9,13 @@
>   #include <linux/types.h>
>   
>   struct xe_device;
> +enum xe_wedged_mode;
>   
>   void xe_device_declare_wedged(struct xe_device *xe);
>   bool xe_device_wedged(struct xe_device *xe);
>   void xe_device_wedged_init_early(struct xe_device *xe);
>   int xe_device_wedged_init(struct xe_device *xe);
> -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
>   void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> +int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_wedge_types.h b/drivers/gpu/drm/xe/xe_wedge_types.h
> new file mode 100644
> index 000000000000..e6084f151c62
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge_types.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_WEDGE_TYPES_H_
> +#define _XE_WEDGE_TYPES_H_
> +
> +#include <linux/atomic.h>
> +#include <linux/types.h>
> +#include <linux/workqueue_types.h>
> +
> +/**
> + * enum xe_wedged_mode - Possible wedge modes
> + * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> + * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
> + *	when critical error occurs like GT reset failure or firmware failure.
> + *	This is the default mode.
> + * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
> + *	any hang. In this mode, engine resets are disabled to avoid automatic
> + *	recovery attempts. This mode is primarily intended for debugging hangs.
> + */
> +enum xe_wedged_mode {
> +	XE_WEDGED_MODE_NEVER = 0,
> +	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> +	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
> +};
> +
> +/**
> + * struct xe_wedge - Struct to control Wedged States and mode
> + */
> +struct xe_wedge {
> +	/** @flag: Xe device faced a critical error and is now blocked. */
> +	atomic_t flag;
> +	/** @mode: Mode controlled by kernel parameter and debugfs */
> +	enum xe_wedged_mode mode;
> +	/** @method: Recovery method to be sent in the drm device wedged uevent */
> +	unsigned long method;
> +	/** @inconsistent_reset: Inconsistent reset policy state between GTs */
> +	bool inconsistent_reset;
> +	/** @work: Worker for wedge handling */
> +	struct work_struct work;
> +};
> +
> +#endif
