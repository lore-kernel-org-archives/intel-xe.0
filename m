Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FD1C5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 18:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4305E10E12C;
	Wed, 19 Aug 2026 18:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXx+TQLV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047D810E12C
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 18:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787164467; x=1818700467;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XsTo4A5hiCLqhlG57X3tlv9zOD0hEqdmFks+P/iR40I=;
 b=DXx+TQLVoGI/OHWecSmW5yIxNxkDUYjm4Mu6R5p16XPG4kyCDAg17PIX
 Q4g2lPmzyptvslmMZVHWBorHmfEnt/qv3wQ/78VWpNYlNRojleQ8dc6cd
 xik0m2NY1liJA3jRH7ihoOxfmp1OTwVs6qGYvL6oMIuVzZ+Fu5chqb3xu
 cR993MzopDCtuut6Rs9CWUI+c5dGJshcjyuXIEDu/TtY8CrzKIklw//S3
 Zamualpu+MvV7Fq5YKHPl42IWfEhXu0+GB5XUHiwzvL/nOQug9ayjgZKO
 n3mM+2eJzI/dpAVn91uPrMtPi0aURUGft6s4ZuvedrMkq/502W8fTzZUE g==;
X-CSE-ConnectionGUID: 2qqroOs8QpK1c+Lvp2ZcVw==
X-CSE-MsgGUID: a81cDSYrSAikjeu+aOqw4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87561803"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87561803"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 11:34:27 -0700
X-CSE-ConnectionGUID: nKZgoCRgRByH0aCl2waowQ==
X-CSE-MsgGUID: agp066nrS8OxePd2F96HDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="269491419"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 11:34:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 11:34:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 11:34:25 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 11:34:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILYXANtbSiaG/VqNTDeXZvIne4M6CNjfvCcLf7ACUWXT3HTxlR7xNDMUtz9VISY28P0/j8N2Wx6vEj9EbpG31eYBd8mX21Y1FteEfyO0j3783akXo0O5U7arQwCZVLuDB9hOkxlZBXJ/hLl9z2iZIv0em/dvab0SAWtdsGoU/utXV8HDK5EFgJ1dX2xW4OcB3D9MfeRmfbNcGjyorQ5ScY1ugUGy/nuZBSji+vCaHvJW/zvhJ/Kx/rF+l+bnLxhQ9ATlvnuPHmT2mkGdgp6SVgldZdTz50CZp9dB3z5nZQuCph8WnpYj08UccZ/kEgTDw+OPF5+WEONQFqZzTeqEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jonZX+SUbPsoCKlJ1utg8IaD13Ggn03F1Hlf6h8AG0M=;
 b=pxzEF9c+SegdXVGvPjPxXFUPbvYWw96q6KzsX8COVoU21wm0ADf31WLjoTloL8YqYJGeFmsDgsQ+X3TLSD/FAFJVlX/PEDazHyzSqsa3mNpv17hwYog/9FmngIIEhbuOANWCs0Z9ISdFFumHqM9vuXkSmoTg8vJ3ulm4e6iZyXD+dXSc0goHMcf9BQgwmuoM/S4VuR3I134P8OMv70Ge6nRD1xpPig06faNJVQ9HJ9k4JrZkR/zXDUxhn/grrrRvY1e50QHA+xdgR1jUXDVH3K39DFvYyQ2LsvAJ3KEc3D1g2cAEb3aJTzbkaZhmUqud/wkNvdUPBUp4y/LY5+u9bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6378.namprd11.prod.outlook.com (2603:10b6:510:1fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 18:34:22 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 18:34:22 +0000
Date: Wed, 19 Aug 2026 11:34:19 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/xe/ras: Report internal HW errors from CSC
Message-ID: <aoX3K4p6DUE2UmUM@soc-5CG1426VCC.clients.intel.com>
References: <20260818231716.731788-4-umesh.nerlige.ramappa@intel.com>
 <20260818231716.731788-5-umesh.nerlige.ramappa@intel.com>
 <cf79e487-327f-4d24-af63-7986944ba1fe@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <cf79e487-327f-4d24-af63-7986944ba1fe@intel.com>
X-ClientProxiedBy: MW4PR04CA0197.namprd04.prod.outlook.com
 (2603:10b6:303:86::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: 70ed94a6-2c1b-4f93-4a17-08defe207cd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|6133799003|4143699003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: UgDUVtS2f75LWixFLz18QzftBe4i6AdxpYgaPxf4H9F/p6OLNWOvILs3LlRz243txZYouFEeP6+oqqLWj3OhK6+Z04Pj5zTJhnXa53OFoeI/udp3tPYBZheK98+5+5obQOBeaaI0UyVZMaEUWkgcZRiO3cgbgC97b1Tci5yZiTH1v1dmuVlOD694OIxv1yqSOTDrrqRkN9usWi6UjHpOHE6L5joZljNPbkwG8fE175OapXHa89l7QtMtN30oLaWK5x7iqJ5wcc/0Zmm3WLUToiN4d8OCTXnAPV/LNZBT3qdQIODdEdWvamkmg325epotxya6Lkg4IrbHGFFMPEHjtCeU82K7JsB+S7jHyj3X2yMy9HebolOGVAf/W2Ay8Z3R10/7hzELqJPGAB2PSJ4RkaWwJdmtdqCvzoehL3bBwDhZntoU+bGkIBkBE/kRPC7DdojVBW3W72M4FpZkEzkk3G0rt84d9Z6gHtU83pKBDCu3KBD0p653FAK5kShSBClHRj87LSjV1bTt1mwzAYUYXgfdNvVE1izHtgVVlSIh00c0l0BVoPMoNgEyjDtsA/1qHhCdSxWYtQKbovlAOyUWJuFc9rhsA2z7SOtLR2sMhSSoS9ZNbXBKtnLMfMj2gmZR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(6133799003)(4143699003)(22082099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnJicllyYmhWZjZhRVhaSDdkcm9YTVFiSU9IcDRBY3ZWbUN4N0o0WDR0YjRD?=
 =?utf-8?B?bHJrTDVyTUEwdlhIOWRRUjVuOVNONFVkNU42bFpNYlRmUXFWWXUvL09LQzlU?=
 =?utf-8?B?RXNNOThBTVdEOTJKWDJ2cE5taGlqMU95aG5iUk9VOFNtdVMyelFIRDFiNThI?=
 =?utf-8?B?NzIrZ1dqcG9kcVJnOTJ6YTQwZXVGazU3eXprL2NZd0lPM0VJM0F1ZjN0U0pU?=
 =?utf-8?B?KzBGeCtjeDRFUysyNkF2SU9yTDFLbTF3VkZCWThJc2NNbFpsOWV2T3RBZ2lF?=
 =?utf-8?B?QzJhZWlvaEZJQnZ3dy9jUUtSQitmZmxTNytTenVyTm9jZ3h2WCs3Y0htRUFu?=
 =?utf-8?B?bmRIR0dUOVlyOCtZR3NZY0lEZTJibDh3K3RJRWVqMkVsdk5ET2FVN3YvblpD?=
 =?utf-8?B?VHVjamdIajNTNVc4and1ZTg2eUY4U1BGN1NaWTJvR0JXMzVsR2NST3RGM0Qw?=
 =?utf-8?B?YWhwcG1DMGx1bVNGcld6UnVUaWVTeXgwMkp2bDJNTWQxQVJSemU2a1VFRjJu?=
 =?utf-8?B?WHM2TzdiM3hINXJ2Ny9PekhiNTExRWVqckZPVEZWZkt0VUFUaGZ2d0pib25n?=
 =?utf-8?B?V0wrQjczUTJkcmVwYzA2dktoeS9DZnE0SHh1UWZrakhEOVRaZlVIeHNERExS?=
 =?utf-8?B?MU9oK2xNbkREZHhHWXU2VUtlc1Y5Q0QyUzRBWVBkdVNyYkxWdndGbStoTmtp?=
 =?utf-8?B?Y2Z4dTdubkZhMHNZQkdFZ0N2cFQxMW9rTU5BNkUwenBnZDdiRFVld05BWWhJ?=
 =?utf-8?B?SHArQncvclF4bHcxY2NSLytLeWo1cTdTVDNpdUtYVUl0TmZmaHZLWVdtcW5h?=
 =?utf-8?B?QzMrNjRjT2xkek51MnR5RWpGUEd0b29zNVU0M1ZTb2FudHRwMGNPdGZUVkR3?=
 =?utf-8?B?aUdmbUhROFo5b3NSTmxNNCtXMmozZjM2WW9TNzIwSUZqTEg0VUx3Q2R4Zk5Y?=
 =?utf-8?B?YU9DdnkzRGVLeFJuUWhXTlByT2NhT0RtRmlSaFpTVWk0UXNDZU4rRFYvaGZ1?=
 =?utf-8?B?Z2kraUkwb3NiajNKNWVNNExYaHB5S0xndk0yQ01sR09FdlFTT3BNb045WDd3?=
 =?utf-8?B?YVZ1Vi9EcktPNTYyMllUMmtwU0R4WlJza05uZWF2WEIwRmszZEJMcWdsR29k?=
 =?utf-8?B?TzBtUE0vYktQYzFKdzZueVhiYjlpcXpoRnl2bGs0T0Rwam0za2VkdDBINlQ0?=
 =?utf-8?B?MW9IWGxiUmJxaVBGSlhjRm0vYUpXOUl0RGR6dCs3UFh0YmdjM0tTdXBwRFpn?=
 =?utf-8?B?cnJBZVhPMlY5d1UvTDJZQUZwQ2J1VkUrdENPYWw1R2hQUWVuQ1hhbHNpTWFB?=
 =?utf-8?B?L0hHMGRvbitBVWhDOHprMk5NcFJrR0RqMVVNZ0dCRmIxNTZxUSs1RGVsSnFj?=
 =?utf-8?B?ejZDS2E1RVVVNi9XdGVScFV4QlBzNytqbkVqeUFnSGxOZDlXZXp3NlZLVGVr?=
 =?utf-8?B?R0lMTnMvL3Zpc3NFRHRxMDc5RXlHNXJpbTVnSFBoejFHaWJRU1ZQc0x1NE1E?=
 =?utf-8?B?WGhNUkh5c0lOdDhyV2dDQUtzaUZBL1F3YUhYYnlYUHl4L20rTzBveEdGQkdw?=
 =?utf-8?B?bStqT3JNOEp5Nk5vTnJRa21RTjNDUVV2MitnNXUzRm9XQk1lT1FTSXhKT3hD?=
 =?utf-8?B?bTJUMnNWRmlzVFozTXoxK3dBQzJJSXlENjJOT3FDZGk2RGFnZG1DbmFKWURW?=
 =?utf-8?B?NStvdkE3V1BuaDVSZHY0K3p1aldDQXVtK3R3MEwveGpDc1owQzBOUjJqdGc1?=
 =?utf-8?B?VzRVOFJMa2pSRzgxTWJoaVorK0VWckRDdjJGME51NGMyaE11QnlPMzFOcGMz?=
 =?utf-8?B?MWtFSHV1bmg2L2FCZXllR2JrUkVKN0JlSU1RMXZWblNTQXl3R0M1SDRuRGYr?=
 =?utf-8?B?UzJqUzVFSzRCL1Y2VTZHRWsxeTFtTGp3Z0k2S3lSMEh1L3c4cjloc2MyZHBP?=
 =?utf-8?B?bklVMUh6c080ZWZzWDZ4U2lYWjIzczE3UnJOSkFCQjhkaDVXaGtlRzliMzhp?=
 =?utf-8?B?THk3VUxSSGthVWxlMEk1amh0NkNWaUZpd1RCcEZuZVJQeEFybGV0TkJxYVVL?=
 =?utf-8?B?WWVQT0c4SU5qNHY3MnZPNC9nVVl3dVA4aVBpVHNiTXg4SCttc01yeEhEVEhZ?=
 =?utf-8?B?QTNiSW9NWHNGck1ibm1nNnEwd204VUdpbjZ4c2cvNGpBMHVvM2dFTVQ5eklt?=
 =?utf-8?B?WEhVaVE3Z2tHM2ZDNW1ORlJYRCswUlFTRlY3dU9CVHRlRnhjYXRXbFRPRFc0?=
 =?utf-8?B?NXg0ekZBNkFqWHZNYlVZaWdBZWdTREwxTTRndHpwOExmNzI4WmJzQ3ZwdG9Q?=
 =?utf-8?B?MW5IdyszaE9GSS9Hclp3RHBxaHB4MUN0dFhLOUwrY0xjd0lKa0ZLL0t5Sm1s?=
 =?utf-8?Q?hA1kMhAoI/YaeqmW961W/s0B/uHYscUQBVgQ4?=
X-Exchange-RoutingPolicyChecked: rV8WJ5RPN8L4mA8/7/uRPMi/jg6YV/Qc24oAsGjWspxZCTqwTLNVPyPRyu/E6Jqh5ah3q8qEh2Dz48YuXTq8QE1J7JRdVsWLwsk0rnokwAAL1L/PbTNJ1hZTE9hxWJNGeCD2uAsfdlIUt4u1liacJXtXKzZSUR0yxoSayHZBUZguTp6z7NFCKmjT7QzGoOATQ1loLroD+qjWbY6k+pSSYiIXB4PltbiqCi8UlZXG3K3L+EhCBHtOa40mj+BnuRVxezq8t0Fk21jDLjkteh2RdgdXoiF3FxffWda4oNcHlxFCeHo/vKwWztqV7LU/H4QPopa8FsFxmygVg12xMqJHmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ed94a6-2c1b-4f93-4a17-08defe207cd9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 18:34:22.2413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5aEUw0bSsTF9Fx9XMyX7YfdXjZL3LSFRJBthltXaMvfkK3xwdvi35NTYtk+QiRZLIPyMfbytI0IwqY+eoBQm+YiPLAnc0ijFTqiWizJvXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6378
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

On Wed, Aug 19, 2026 at 02:35:45PM +0530, Mallesh, Koujalagi wrote:
>
>On 19-08-2026 04:47 am, Umesh Nerlige Ramappa wrote:
>>Report internal HW errors from CSC using the xe_log_comp() helper. Since
>>the error triggers survivability mode, use CPER_SEV_FATAL as the
>>severity.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_ras.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>index d25d25f77531..13ae54afedf7 100644
>>--- a/drivers/gpu/drm/xe/xe_ras.c
>>+++ b/drivers/gpu/drm/xe/xe_ras.c
>>@@ -342,9 +342,10 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>>  		 * is required.
>>  		 */
>>  		if (csc_error->hec_fw_error) {
>>-			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
>>-			       sev_to_str(counter->common.severity),
>>-			       csc_error->hec_fw_error);
>>+			xe_log_comp(xe, CPER_SEV_FATAL, SOC_INTERNAL, counter, sizeof(*counter),
>
>Better to use HW severity rather than hardcore.

I am not sure the counter->common.severity maps 1:1 to CPER_SEV_* 
definitions. Michal was suggesting something like this in [1].

cper_sev = to_cper_sev(counter->common.severity);

xe_log_comp(xe, cper_sev, SOC_INTERNAL,

I can give that a shot.

Thanks,
Umesh

[1] https://patchwork.freedesktop.org/patch/745833/?series=172039&rev=1
>
>@Badal
>
>Please comments on counter ( as I know, you need counter + response 
>for cper preparation).
>
>>+				    "CSC %s detected: 0x%x\n",
>>+				    sev_to_str(counter->common.severity),
>
>Once passed correct severity, no need to log severity.
>
>Thanks,
>
>-/Mallesh
>
>>+				    csc_error->hec_fw_error);
>>  			xe_survivability_mode_runtime_enable(xe);
>>  			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>>  		}
