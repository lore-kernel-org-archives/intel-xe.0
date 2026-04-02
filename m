Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAE8D6AAE5
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 16:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69F710F2B0;
	Thu,  2 Apr 2026 16:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cR40PWt1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911CE10F2B0
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 16:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775145990; x=1806681990;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1JnHoraP360cR3j9SiKTicITkFo+df9TOo6ziHlabUo=;
 b=cR40PWt1ItiKJC1/NrDcODxJqqnIWK2waNSa/O5rS9hF4EbU1KCw+qgA
 RNK1DTwysuLPMKS9GbWOSWy6zLjPZtKkGAqQSa0KgjhkgcTPP3ep75ogX
 I8CMSuw7UYa1iOj3lNKoo7wD6sLar0GRfgS2MqC0YpjvLTgVZXSw9CMkp
 WmnkyjmVt3ulOSa0GhVXYnV2oMbnPbc3CAJYBC1TvODUzLpZ033RjSbLX
 bhZxiWvMtbtAcFQHvB+UGeRUo2xq/0Krm9wiUG6YdyNXcZfwsEy6LPxE4
 xiY4wBOYZ2jiDUvFmQQcZ85BW/obEm+bBjq3S1OVldaWedxXAmHV9TymP g==;
X-CSE-ConnectionGUID: NvkctV2oTIGRU82eowwyJw==
X-CSE-MsgGUID: wkwSDiWXTIOPlffihcQGQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86828122"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="86828122"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 09:06:30 -0700
X-CSE-ConnectionGUID: f5iKiqRkQCuNHrwvhKo8+g==
X-CSE-MsgGUID: XDr2yfS1RMyUswosl5bktQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="226016147"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 09:06:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 09:06:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 09:06:29 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 09:06:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERCj0vyy8ozZzMsvnaSJW1F0/EnLxuBQC0IGbRt9XjUpTSKS8RQguSNZh+rDq0JlTh36yxub7kgOfocFC8hT9kx9GEz7phFrv2qbxJZ89aLfxCy+dx4FqeU3R0FXQI0gbGvpIYkC+plbYctHTnRLtdxjA0oHhBVRYyteCan6owIkbVGzq52CieDodNb/sE6uayUjkVbY9q65Gg+2EDbyp6/mKxsOrxJxj45ayW75sl5I0kR31Ywkx3F4Ro2kvrSE5FUfnCy+ZROhGaC40OHS8IxVh7eW0rPUncccEJm3MhJzTCXdSGtF9CYp5CbQYK/BWPHBTHTVJ2ozAJKfvaFcsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBWx22jU+PhoH5L1VEHJD+75nOgdMr+nD0fgJeOUuP0=;
 b=b92KG9PmFEftZ0HSBbYJrhNpXAKdCyQeslbzBBepCF6Ul3PEBH3aXxwnba0oUsnVemju3/kFE7owOIF/b3Ei4UKbDHuTNyDb//lzOLeda4Utl8P1fWtnZ/lJLKFIq7VofAAJ+oKRlLFpZEKVuWnGiw8UAW8Ktz+NoxbC60waq5IqPeVn/yW297LVj5luW04ShcPIXVRwpsBDFcTYMh1o5c6x7rBN0pBTb+CxCz4fBw7cKCv6WmB6d66vCz2qHkPIsPPAQ68PuUahufgIbOk1+zV7ihemL1udB47wzWcvZ3/F2bThxT+uRF9BNvG3CChTI5bvh7GIwTQYjL1+dyknOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 16:06:26 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 16:06:26 +0000
Date: Thu, 2 Apr 2026 18:06:22 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 13/13] drm/xe/pf: Perform fair scheduling auto-provisioning
Message-ID: <20260402160622.vbxrgiavxzv3rzrj@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
 <20260330204046.567-14-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330204046.567-14-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR0102CA0092.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::33) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SN7PR11MB7539:EE_
X-MS-Office365-Filtering-Correlation-Id: b57e1df8-b077-4ad3-421e-08de90d1cb2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: aRXfoZSSc1dO2cHDOwVVAVr9NAIOLuFilroNgn23BnSelne4lOnXFbPLabmAFmt2KvNgLfgHPjrjEmG1fiP71fWiDvlpAYKWC3CQo4JtwEMmpp/lCOoIUKy+0vv0kIDs8IIzI/dJrSPs0wXiia87LFg9y7lGMt0otXvlojQgEhUiyxzWhYU7I29YkvuvSg22h0HWEcYYiRNwfzQHldxtTV8ZYlchp2tLKa4jzvB13FP9avHmiTwrfsDgzEnS+UADRCElfzXXuf1jrV9H42eH3214O8s/ocNCaen8YTyKVuc/BSLVPMUyD5K2yhrtuY9Yfu+Uc/WGwp8nHNsP75kbaokxQhElLr/NXsLwhbce5zwuGS+I9AT7yPwRQm9e2lLLNEEWXVOyaYf3ZAyvW8S6UwqfWDPN+lCC2+v93ofusDX3dSy7Fy+YTPSlXMAoQybAp/K+dShmnmfzrf0ynsEFFBLKydKX8f/DtczTDt2BvLiuNXO/ejpxyt3T6BJJoCzOTrgNZGlAkdkDuszBi0wJ7jV0Mw+0GrZl7clDtCMtdh02GLMeYBgRbV8uGFfY48zp6LJdPs04+PkM9BwGmhlP7ABdo4YoPJcMar1EKQSq83AJ3ClZS0cqu7NN9dvp56bwlEKuREb/AnB+iNIIdhZl1ZrJvPcJWuajCIQ5m1a9C6R/CcOl4U7pdFxGdbEzn3rRw5+lY/65nxwKVAYQ5HR60HeBBdg2FnNLT4EP1m651ZQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWF0aGNGTys0eWdtVDVZbnhQaEt2a2FtN1NxUDdCaWxsdzRyZms1WXd0Nldh?=
 =?utf-8?B?QVdXRHhQZWFOWCtobTUzSWlKL0xuQVdMdHl1eGpHSTVBY0l1K1FaTzlCeVRz?=
 =?utf-8?B?QzNzTW9Pdjk1eVRabEVEWjl3c1BrMGtjVnUyd0tKdFlaL0VpaXZ6RlpqbnZx?=
 =?utf-8?B?dTZDVlZqMkdYYWw4TUZ5aVhTMSsvK0FjbkFLL0ZaUnFFaVNjWlNJY3JuREJH?=
 =?utf-8?B?Z3pORWxpSU1VbjVlbi9YR1RWYjBCNlFtTENXbmVLTzZQSjdVa0pJMlNNZENx?=
 =?utf-8?B?dDk1TCs1SE94L2hHdnhpOHZyL050SlUwT1kvbGxwM29IV1BRMm1pemdhSzJj?=
 =?utf-8?B?T05JSFJaZlpPZ0dmVXZrcWdPbGUrVFNsQ2MyejhMa0FOZ25VejF1dkFCeGpz?=
 =?utf-8?B?YVMrckZUcmJteVQ3OEtLSFNiVUlORFFkeFpqRXB6WnBBU3FzM1lGZ2hYanRN?=
 =?utf-8?B?WWNjekhqbkw5OXVmdHdkZUI1QVZDcWliVmJOTTR3R0U4QWJuOU40Q1loUFVj?=
 =?utf-8?B?TjZvMXFLd3BWSCtnejFTQnowdUVVMUhIdVhFS0JWTkdTSldRM2Z2eW9ETHA4?=
 =?utf-8?B?ZGNXaW55QUNuMi9KZXdaVFNuMk0xUnZRSzhiNkJHd2RXbnVkamtMWEd2UDZH?=
 =?utf-8?B?WEpFeTNZcGxWWHZ6NDAvbHZUaE9qN3B0NUdaNGUvRlRLcVZEMjRPNHZ2SjZk?=
 =?utf-8?B?T1FEZTdjSlk2WnRzVnE1S0NkSUhqUjJucHkrZjlPYW9FRE1vUkZRRWZvTmpy?=
 =?utf-8?B?MTFia0djZStRSDRXaHpiUG1mVmJmYytjYlA5YThTaXdPZjVrSmpLUFpsclR3?=
 =?utf-8?B?ZHRkcGlCU3ZGYVkrMjdIOVkyTWI4OVhBQnhOODZyM0JHM3V4bmVodlVXVXZE?=
 =?utf-8?B?aW9OanJSUGlnd2dyL2MwYUUxSWEraDdUYVhOQnVWdXdKbXVRbHBXdmI1LzJx?=
 =?utf-8?B?aC9UNW5NMEhxQW1CSlA4Rmw0dmRESlZmS1Qvbnp6YnQ3WXZ0ZlloWEdiSXIr?=
 =?utf-8?B?SUJSR2U3L0JxKzJHM0ZTS1RSRzhQK29sZmpNd1ZrTzcvQ0ppYzlOREs5TTJ0?=
 =?utf-8?B?cGNtSDc1b3JDYkxLam4wK3RPWmNTaDlCdy9LSFNHUmNEdlgwS3RZUU12MHdq?=
 =?utf-8?B?Snc1NHg0eWZTUi9YZEVBODhtV2d6MGpyRXpyRnkwZ3pKSXI3S0o0L1hySWM4?=
 =?utf-8?B?clhoZkRyWCs1YWJ1NkJZcHFEdlQ3bHk4YTFMZ1B5UFdmV0xNL2VreitHREVo?=
 =?utf-8?B?WkEyOGdIajJaQlNvRkpKVi81eG5CVjZHLzY0QTdKdkQ4Y2FzQ0pZbTE2bmVq?=
 =?utf-8?B?N3JhSFZIUGVtSVJ3ZHZvZ2lyOThrcjJaK2cxVnlCZFEzYmM4WndML21KRzg1?=
 =?utf-8?B?Zyt4ckM2dEtwTExpbnk0Mlc3ZUlQYVVWZ0xKMHpneUJIbU1JdHBUZHgxTEx6?=
 =?utf-8?B?ZzlUZFl3dVhRMXQ3OGp5T0JjT2E0ZXcxUmozaXh0bUdnL1Jremg4T0UwOUxO?=
 =?utf-8?B?UWdnVXgxQ1ExZ1JUdW1NaHlHL04zYXo4cUlsQ3haWFoycGtPYkNVMVp0ekJq?=
 =?utf-8?B?SFhXL3B6Ui8yK2kzRTI2aGl3OFNOaWQwRGJ3TXRsYzMvM3Y2Q0dUajFidHlr?=
 =?utf-8?B?cWViSS9hM3lHUEV5MWNCUVRYNEJEQnRvUFN0UUpZSmxMN2dLbU5tUFpPZlU3?=
 =?utf-8?B?ZWVOdDg1Yi9YdS8veWVuajUya0dnV0xXa0V0TWJyRnd3RndBZ1QrOThRR1dD?=
 =?utf-8?B?UkZHME9NaVVONEZIa04vL2w4QU9kT2lOOVlHYjZaOTNDblV5MDhMYUEzYnRo?=
 =?utf-8?B?aC80OXBxSHN5TGp1Y01zR0I4Y2pZNFVqeHNRaTVUWjM0TVVkUktrY1NmSGht?=
 =?utf-8?B?MDY4cUZBblltTFZFL0xjOEMvczdrd1VhSDdEWlgyYVVscTN5TUNTTXlWbjNv?=
 =?utf-8?B?K0gzc213ZGRNNUR4NTJ6MFVERUwzdGlIRm5MVC9OUU9hTFFZanpMODB5Q0lO?=
 =?utf-8?B?NVZMOEd6dG9yZTh3Q0NtZnNab0pZU3JtNHhDYjVkb0tONlFoRDFjRVlZS3FG?=
 =?utf-8?B?a1JnbEx5TDdwL24vTDNCVHh0SlgrTm4wUUtJc1FKa1JyeW9aZ3BHRkhBMmMy?=
 =?utf-8?B?UEJSai9wZFlTRGJrM1ZXNFg1Y1l0YjZsQXFxT2x6bWJzaXFJRkdzbUd3Z3FE?=
 =?utf-8?B?NW9USThBajJLc2tjdm4wQ3QyMlNIeUxmSmxDUlJTVFR0YVFQNFVNUzVpaXZ4?=
 =?utf-8?B?R08ybGt0R0tVQ250U1pFZG4vN0NOKzhZc3hsdG9iWm9jL0tLdXUxMFJIaWFn?=
 =?utf-8?B?QnpWK0JFVEkwK256K1VDeG14elNtYmlSVWV5WFBYemxGZWU2TyszMXFHaWhY?=
 =?utf-8?Q?yqn2C3cGLlxaOxxY=3D?=
X-Exchange-RoutingPolicyChecked: WGg9atMctsk17MUsjlCWhHjOLJC21UhY6jyb/5bK3LVVbw0xNNoZGiTLRx3g1eUvP9fs9Z4t4Tw7HlHPKaDJEtN9Xl75ptLK1bewguBmejMCFE4f2Md/HjRkaJ4rO/t8d1JoDmtH14OlMJDvHqP0kN424reAgQvTqGHukVVgUZsI4UAPwJdwTqGbxPyOBHdoNlgHZ6OD1fqBHljEmDzuapLIKZ9k7jTSGTZrNi1UsP6OjUABl50oJzCEQDdB+ya168JoxD+IV2vHHT2qmgEqgm6Z+U/bqQa91WlfD6FjagXGh2VAwBPC5HN5T+cbeVG8Ko6CjnXjT+7P6ZVQW40t6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: b57e1df8-b077-4ad3-421e-08de90d1cb2d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 16:06:26.5989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1I/87+lWwyBzoG8F4WAHvm1/EtJH3BZKpPhEIqbuNpMJfPS7ivv8vhgI5jVwW4VNm3lBcFoc1VXSi+ekuzdLi5HAk7QT5TVczXKV0xIEw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7539
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2026-mar-30 22:40:44 +0200]:
> Default VF scheduling configuration is the same as for the PF and
> includes unlimited execution quantum (EQ) and unlimited preemption
> timeout (PT). While this setup gives the most flexibility it does
> not protect the PF or VFs from other VF that could constantly submit
> workloads without any gaps that would let GuC do a VF-switch.
> 
> To avoid that, do some trivial auto-provisioning and configure PF
> and all VFs with 16ms EQ and PT. This setup should allow GuC to
> perform a full round-robin with up to 63 VFs within 2s, which in
> turn should match expectations from most of the VMs using VFs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 85 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.c |  2 +
>  3 files changed, 88 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 7f85d6629fec..a2babef5e5f0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2661,6 +2661,91 @@ static bool pf_non_default_sched(struct xe_gt *gt, unsigned int vfid)
>  	       custom_sched_priority(gt, pf_get_sched_priority(gt, vfid));
>  }
>  
> +static void __pf_show_provisioned_sched(struct xe_gt *gt, unsigned int first_vf,
> +					unsigned int num_vfs, bool provisioned)
> +{
> +	__pf_show_provisioned(gt, first_vf, num_vfs, provisioned,
> +			      pf_get_exec_quantum, NULL, "EQ");
> +	__pf_show_provisioned(gt, first_vf, num_vfs, provisioned,
> +			      pf_get_preempt_timeout, NULL, "PT");
> +
> +	/* we only care about non-default priorities */
> +	if (provisioned)
> +		__pf_show_provisioned(gt, first_vf, num_vfs, true,
> +				      pf_get_sched_priority, NULL, "PRIORITY");
> +}
> +
> +static void pf_show_all_provisioned_sched(struct xe_gt *gt)
> +{
> +	__pf_show_provisioned_sched(gt, PFID, 1 + xe_gt_sriov_pf_get_totalvfs(gt), true);
> +}
> +
> +static void pf_show_unprovisioned_sched(struct xe_gt *gt, unsigned int num_vfs)
> +{
> +	__pf_show_provisioned_sched(gt, PFID, 1 + num_vfs, false);
> +}
> +
> +static bool pf_needs_provision_sched(struct xe_gt *gt, unsigned int num_vfs)
> +{
> +	unsigned int vfid;
> +
> +	for (vfid = PFID; vfid < PFID + num_vfs; vfid++) {
> +		if (pf_non_default_sched(gt, vfid)) {
> +			pf_show_all_provisioned_sched(gt);
> +			pf_show_unprovisioned_sched(gt, num_vfs);
> +			return false;
> +		}
> +	}
> +
> +	pf_show_all_provisioned_sched(gt);
> +	return true;
> +}
> +
> +/* With 16ms EQ/PT GuC should be able to handle up to 63 VFs within 2s */
> +#define XE_FAIR_EXEC_QUANTUM_MS		16
> +#define XE_FAIR_PREEMPT_TIMEOUT_US	16000
> +#define XE_FAIR_SCHED_PRIORITY		GUC_SCHED_PRIORITY_LOW
> +#define XE_ADMIN_PF_SCHED_PRIORITY	GUC_SCHED_PRIORITY_HIGH
> +
> +/**
> + * xe_gt_sriov_pf_config_set_fair_sched() - Provision PF and VFs with fair scheduling.
> + * @gt: the &xe_gt
> + * @num_vfs: number of VFs to provision (can't be 0)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
> +{
> +	int result = 0;
> +	int err;
> +
> +	xe_gt_assert(gt, num_vfs);
> +	xe_gt_assert(gt, XE_FAIR_EXEC_QUANTUM_MS);
> +	xe_gt_assert(gt, XE_FAIR_PREEMPT_TIMEOUT_US);
> +
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (!pf_needs_provision_sched(gt, num_vfs))
> +		return 0;
> +
> +	err = pf_bulk_set_exec_quantum(gt, XE_FAIR_EXEC_QUANTUM_MS, PFID, 1 + num_vfs);
> +	result = result ?: err;
> +	err = pf_bulk_set_preempt_timeout(gt, XE_FAIR_PREEMPT_TIMEOUT_US, PFID, 1 + num_vfs);
> +	result = result ?: err;
> +
> +	xe_gt_assert(gt, XE_FAIR_SCHED_PRIORITY == GUC_SCHED_PRIORITY_LOW);
> +	xe_gt_assert(gt, !xe_gt_sriov_pf_policy_get_sched_if_idle_locked(gt));
> +
> +	if (xe_sriov_pf_admin_only(gt_to_xe(gt))) {
> +		err = pf_provision_sched_priority(gt, PFID, XE_ADMIN_PF_SCHED_PRIORITY);
> +		result = result ?: err;
> +	}
> +
> +	return result;
> +}
> +
>  static int pf_provision_threshold(struct xe_gt *gt, unsigned int vfid,
>  				  enum xe_guc_klv_threshold_index index, u32 value)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index e9314f0a9b4e..2ec62c12ad5c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -78,6 +78,7 @@ u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
>  int xe_gt_sriov_pf_config_set_threshold(struct xe_gt *gt, unsigned int vfid,
>  					enum xe_guc_klv_threshold_index index, u32 value);
>  
> +int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs);
>  int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
>  int xe_gt_sriov_pf_config_sanitize(struct xe_gt *gt, unsigned int vfid, long timeout);
>  int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index e11874d689fa..0ec7ea83f12a 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -41,6 +41,8 @@ static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
>  	int err;
>  
>  	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_config_set_fair_sched(gt, num_vfs);
> +		result = result ?: err;
>  		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
>  		result = result ?: err;
>  	}



LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
