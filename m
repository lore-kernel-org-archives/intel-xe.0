Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BECC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 22:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6566710EC69;
	Tue, 23 Apr 2024 22:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XeQ2PzwN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8550610EC69
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 22:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713910707; x=1745446707;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=AlvdMAzoy4i0h4jx4Z0GdVdSTCtYm0sezHSI+yLkXbA=;
 b=XeQ2PzwN/OGj82WaBdsJuwe8sCDGHBs32IadknTfUKvNP4lvd9gxHxrQ
 oaFnuIfFd0oM/PTG8IcJQddCfI2ewEv5spvqmZHIr5koGu6kIlYG9WK7X
 K3DFLtd2QLeKHj3+4m9wjpFC9UvLHzib6cfg0FOvX9WNyx2ZLDh5Lc5IZ
 KC98dmqM/B3IQIc9PHMZEiI09sQ2FxW6yfliwePRSzrc5HQmMfBiu/3Vl
 OktOV6Griwql1CN3940ItPKyaAClODdtNJvPakor20ED+5mvqKjwMClM5
 2nnA8JzfhXFm75lw6t9GGh2otiMv7ya58xqDfleoG8PHLYSnGwoSWn8lh w==;
X-CSE-ConnectionGUID: pTB5j88rSsKXHYW9Uu0kaA==
X-CSE-MsgGUID: 9GgcOa7fRTaqJhRZDxhBFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9392581"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9392581"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 15:18:27 -0700
X-CSE-ConnectionGUID: WWeXCaikQsCkVtNpia6xiw==
X-CSE-MsgGUID: tkw0GItbS6aoPINkFBaaKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24551103"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 15:18:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:18:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 15:18:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 15:18:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d18igQoUVcsf2SAQrzWiyl+Gc+cd3dfX0ho9IcJc54SI4LglARpezgSkEeg93CsBRPenmqLomYYAWuUertIaOWrXCjXNeobC3S5nzeJTo2dsUeM/rgxT1FhvjgbvnyLIkB0Nzo7AZnnkYq3XVSUHLmT932M7gAtYWoNB+R4ggab1DtUn82Tp7HK4vYU71S4jK/tctXu9zJp9m1XX6wFmIYLaX1bQvAE+NkGMkOAtXSXSSeDhZo1oqWhOYlW3l+YeVxa2+D/7XX1/ry4hslFMDGAj3589BrZxZGB6wr3iXO6gHBbamE1dLh/K4vphADrgNC4KgKNOvG3lUM69gxEO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxFAINKywQY/9GZZ0cMUQChGt3+jdY5dIMvHVsnLXa0=;
 b=bYGZpUKiZu1aFAOUw8TTMiyrSvKALdTk2k0VCCj1sf0UiYV39F67K3Z6F5T4edq/frzkRh1nPGFT5bwNEQItloj5HJpt4yFDuXa3ZuDV61CzniUA9EiS6aoLP6IHMrlUE9JFXk838fPQqNPMvOVPtIe4acCtWqIFF6thrCw4dKeKNn36Z6mu86OX1YD5AneslOFL/WLp2B0lPaeMlE0v1DG+tccj/UaQv9thBbxejxZX9qNufp/UIqxHm7Kb3c8olNRYJxV1+ubCc3uckxqUalTA1JVUY93nk+eo3vTMcZNJoArLU7YtWokew3/sxcB0ERLBwX3q8v9hmXTFhEzUkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5080.namprd11.prod.outlook.com (2603:10b6:510:3f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 22:18:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 22:18:21 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Lucas De Marchi" <lucas.demarchi@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 1/4] drm/xe: Introduce a simple wedged state
Date: Tue, 23 Apr 2024 18:18:14 -0400
Message-ID: <20240423221817.1285081-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0052.namprd07.prod.outlook.com
 (2603:10b6:a03:60::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5080:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e188a7-18e6-4daf-6600-08dc63e348f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2FiRHhuTmtxajE1K3c2b2kxMXVmaFh6NEtXbitVeFAxN3ZlQmZxSW0vRjBQ?=
 =?utf-8?B?VDlCYWRLWGx3NERLdi9xLzJNcmxjZzVOUWNMY2xZd0lzbFVoNm5NZWlBMlQr?=
 =?utf-8?B?c0k1Njd6cGRZSnQ5UjJkTVlDODc5Q0FQdGJXaVV5WG01c1o3TEZwaTExdm5r?=
 =?utf-8?B?TGw2ZXpSZ2UvZ3laVVJQUi9RMlBuc2pMalRXRVpKVGtwZjJNN0Vud1V0VzlQ?=
 =?utf-8?B?anh1OFAvZUw5aDZpRk5MeFdrQlpHaVpjWGd0SDdwNllOSTJOaitMVE1oSjlq?=
 =?utf-8?B?cEJGcVhnVW16dUhpSERrZmlGZ0E3NVlwZ29XMW9kZ2NNQk9lcDQwckEwYWx1?=
 =?utf-8?B?N240dWxvWTljRllLYStITThZTG9NQTh2S2tGM1VjcG0zVVQrSkNRRjlPVTVm?=
 =?utf-8?B?Z0pWWEhiaitYWmx3M0NOTVpESzFWSUFDVE5QTEJyNGFJNHJMcXQ3bzlaZ1RY?=
 =?utf-8?B?aFJEMDljUzdZSkY3SmhMc0RXZHk1bVVORS9CL1lBei8xWE9pUU4wa2F3aFhC?=
 =?utf-8?B?S2VBMlM0bkRzVGhLWjZoY1NEdjYyTERVVldGUkN0Q1NvVndvUzUzeUk1czlh?=
 =?utf-8?B?K0JjbGsraDl1eE5GMTJLOEhvdGVXT2NDeHoyQmlnZmtKemp1QjEzK3lLQnUr?=
 =?utf-8?B?MCt6d0pjeFk1TnlSMHYwYzJoK1hVOHlGWlV3U0JFdkE1dytyWkdkeTBCd3lK?=
 =?utf-8?B?M3QwcFNqQUVrZTcwWjRPVWNWYlVNbjI5OFBTWWpjVUNFYUYzWFJJNVFVb2JQ?=
 =?utf-8?B?ODlvWk5lTloyOFpaY3VHTjdPMExudmFybU5ocUU0ZzhJRTFyZVliNmRMZ05O?=
 =?utf-8?B?NFdwWjZyNHNiNWlYemxKWjhJVDRlMGVLVkovbURKaHNXTTVURitaVDNSc3Nx?=
 =?utf-8?B?bnVvbk1CQzhSejVySVBSU0xIRHU1NlN6TWJ0cjU2d0JlVE5jcldrQy8vdmFS?=
 =?utf-8?B?Nzg3blhsdnFnZzZrWWwwV3ZHU1I5NXYyUEdUQzg5YVZkWTVITm4zZFJiUkly?=
 =?utf-8?B?UzBRQ0k1cVN4Y2F2SnJQNUxXcGNmZ2hlOHo3czBkc3dlS01BWTlzTGV5K2pM?=
 =?utf-8?B?eVVWdXVzQ3NlbHROMWtGNUY4YTNBeFByS0NIdmR5RGdNVngxK3gwSmI3S2RW?=
 =?utf-8?B?K2tqYzZ3M3hzRVc4bW9lZm45YmxPaUlEQUgyMXdTWnlHcm5EUG5Eang3SzlL?=
 =?utf-8?B?MzFrSStBaTVKMytKRE5hRUtKMlpMdVFhWWRrRXIzamhtL1lLaXZyeUNYVjM2?=
 =?utf-8?B?UCs1UEdSK0J1Yi9iRlhMOEtCQnUxclpRSHN2aXU1aW1sVGRjQ3pIR2VLVGpZ?=
 =?utf-8?B?REIzK0R5SkFpK3lpMUp2WUtEbXZCNHZWUlVHQXlnZE81ZjFpdHlYa05BUzJS?=
 =?utf-8?B?emswaVFGdy8zZG9kaEZ0RmZoZ1RQK2RoZEFHWTVHa3lVeDBXNVB6djJQRCto?=
 =?utf-8?B?bmNsNWE1T21NaGljTkxlK1JWc3E0STJmVWY5T0x0dVhySi9vZEZCQisyWnJm?=
 =?utf-8?B?REJnbmFqS3lpRUloZ1UxWEgyTVV5YUJzbU53eTk1a2RIYUxXQTVZTzladmw1?=
 =?utf-8?B?STJPM25peVBzSmxLUXZNM1dOQjNkcnpHaDBxYzZqYi9JRDlhSXZNOFlrMGJP?=
 =?utf-8?Q?humJWkDFZwgzbgeADRtV42Z3TKV5yx1xnTeUlR/QsxNk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VndXR2ZqelhTV3p1bSszK200S0xyV1FBRzE1M3pNUjdnbW83NjlSTFZ2SXFm?=
 =?utf-8?B?cnpvbWdhTGF5QkQ0MUttNmRMZXdxZzUwTWtxalpoeDRZeitDbnY1VzZROENm?=
 =?utf-8?B?VFcvRFYyT0tVY1pyems5dTAvNXVaTGliNWtuTnR4ZVF4YXdoaTlXeEhYMGl2?=
 =?utf-8?B?ajhMYVc5T2J5TU1JaS9PMTM1d2U4TWFHWExxM0ZSZUJ5U2FyWGN0REd6Q0hz?=
 =?utf-8?B?OWtsdkswbnN6RXJCQkFGODdubkNxT1h6dWJ4OFdWdGRKZ2s3RDlXNzlSdjc5?=
 =?utf-8?B?K0pYbzYyTkdaZitBc2lRcE0yenE2N0t0VWFBeTRnS2Q4TU1nMTM5bWZKa2Zp?=
 =?utf-8?B?dGdQNjluaGVaQTk4K1pJc1BMSFlCZEh6M1h3cCtMVG1KTS9DcmVGUU8zSlZV?=
 =?utf-8?B?aEtLME96aFQ0UUlPeTcxeHFOYjIrN3Z3bHdVbG9ObnZ0d0lRdFpnUGxUVEdy?=
 =?utf-8?B?aXJzVWRQbURXV3p2WUF1aXVZYXMyTjg2bVdtZnhVajhGS1RWd0ROcFdpR2ly?=
 =?utf-8?B?c1laYktTa29XSVRhQkVzSktDcXN1WnpEZzdBaXN0RnZmWUZHNUgyYUJETkl6?=
 =?utf-8?B?ZnQ3OVkvMFdGd3hMMU04TUV3NGx6QnNrZDhvSjhQaW1JN096N0xZQS84bWtp?=
 =?utf-8?B?YWNuQ3oxZ2dIWE9JYmkxQzRJTHY4dC9vN0xEVllsUjJmYWxnOVFuUW9QUlJT?=
 =?utf-8?B?UzQ1RzZzSlBWbVloTFNuRGJaYjZrM3g5UDQ5MGF4Z0tJMlZuSm50ckEwNjNt?=
 =?utf-8?B?NTZZTlRPNVNnbXg4bVN3WmhmT3ZaSEtaYWVYTVV1QUFnUGxYaWxxdC9iNlZm?=
 =?utf-8?B?OFUzZ09EYjNzMEd0MXhzNi82S0EzSUxxc1pQRHFXeTNjVHBYZUR3RXFHWWU5?=
 =?utf-8?B?b3hwRVBRemFIZ01NUVBxVGpxUlRSZUl4bk85dUFLRmhEMkVUcE9wY0Y5dU4z?=
 =?utf-8?B?aDg2MTgrQWoyRENOQWFuY2k2azl4clBlK2dMSStFTjU0aXUreFlQbnpOL3Fo?=
 =?utf-8?B?TnFwWWEwY2QrVmR4bllZTC96Uk0yUmk1OHQ3bThYd2tNbTI2Vkt5U1pMWkVv?=
 =?utf-8?B?TWJSa0NmVDFSRGZIZVBOYWMvaEY3WDVPZ1psU25Cbnlmdjk3djVSdDM0MTBH?=
 =?utf-8?B?Q3pKaHpqRmxPWldMVUh5OXVwTXk3RVhKMVJMcXpYVm5xRUk0R3MyZUhwNXho?=
 =?utf-8?B?VE1CQjhyZDJZWlMrQjFVU3hEeGFVRDlyWDhlYUdrZGVjWXF1Unp6ZC9YN2tz?=
 =?utf-8?B?YVdvWGhuZGR5bnFjQUNoR282Q2gwL2ROZndUUFQrcGFDKzdLeTdxcDlpN0wr?=
 =?utf-8?B?NjhBVzl6SjUrS2Y2c2hOMElpMmNIcENDRytrREFhaTZReDd2QXFadFpDemY0?=
 =?utf-8?B?QU1CM0NqRkpqYUJtVk4yUURITkpZQkdDcUtWQ2FFaWd1NkhweGNIVWFTdFZK?=
 =?utf-8?B?cGlSQmEwRzM1SjFUUWxEVXNMRS96MUNsdlowSGxTbmRDRTJkWC9ReG1RRmQ5?=
 =?utf-8?B?QmtSMHVvV3NLWTFKZEplaFg1VGFLM0hLTDhzYTZQNyt2WHloaEU2RlNuSEJN?=
 =?utf-8?B?ZTc0QngyaDhDcFlyM3RZQ01qVm9velBmRmQraHhnWFUwRDZGM0pBMTYxUVU4?=
 =?utf-8?B?cFRKMktMeWVDZmpwclNFV1p1YjY1T3dtS2YvRkpoUEo2U29kSFErZE54MEFQ?=
 =?utf-8?B?emlLd25rd0ZTNmU3VTFmeFJpLzJSSnhvRDFPcTRzVEczRXFncmorTkpXWGlV?=
 =?utf-8?B?eWZxTFNGdm5tdXdld0lFTlVHMkVpMDVveXo5VjNieTNMR2UyLzZoYWFSQXc2?=
 =?utf-8?B?bVJaa05EZ0R4dXRpeDBvcVFUcHB4TmM4Qko0V3ZrNVVjOXlHZVlLMFdRZ1c1?=
 =?utf-8?B?MkMrTVBKU2FMU0xSbWI2cnVDWW5hQWVEeDEzd0F4SEVrN2RSd1hFbzd2TU41?=
 =?utf-8?B?dHQ5Z2NRczVwSE9qNXk0NktpRG1YMExINjN6VkgwR3kybDFsZGptYzFwRThn?=
 =?utf-8?B?bDQyRnN3UnNBRG4zdUVpcG9DY2lPOWxHWGtyZVd2NHREQS9ObmQ4b3VBQjlG?=
 =?utf-8?B?a2N0c3NGbXZvZGhodUdVcE1KMkNQcmJlcnU0dEtFeEhmVDIwS3NYbndKb3dV?=
 =?utf-8?Q?QZV5kz3BxzOOUxNZ8nHSuNwgK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e188a7-18e6-4daf-6600-08dc63e348f0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 22:18:21.5105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDIrs5H1S35Ags0JoqWFlph6f27RhHRNa9k3IQnpicBmfyxeuxBiInkb84D6okMMqtY94ruFCDMQ3ec+426pRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5080
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

Introduce a very simple 'wedged' state where any attempt
to access the GPU is entirely blocked.

On some critical cases, like on gt_reset failure, we need to
block any other attempt to use the GPU. Otherwise we are at
a risk of reaching cases that would force us to reboot the machine.

So, when this cases are identified we corner and block any GPU
access. No IOCTL and not even another GT reset should be attempted.

The 'wedged' state in Xe is an end state with no way back.
Only a device "re-probe" (unbind + bind) can restore the GPU access.

v2: - s/wedged/busted (Lucas)
    - use unbind+bind instead of module reload (Lucas)
    - added more info on unbind operations and instruction on bug report
    - only print the message once.

v3: - s/busted/wedged (Ashutosh, Tvrtko, Thomas)
    - don't assume user has sudo and tee available (Lucas)

v4: - remove unnecessary cases around ct communication or migration.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com> #v2
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
 drivers/gpu/drm/xe/xe_device.h       | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_gt.c           |  5 ++++-
 drivers/gpu/drm/xe/xe_guc_pc.c       |  3 +++
 5 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 55bbc8b8df15..76a7b37a4a53 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -137,6 +137,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
+	if (xe_device_wedged(xe))
+		return -ECANCELED;
+
 	ret = xe_pm_runtime_get_ioctl(xe);
 	if (ret >= 0)
 		ret = drm_ioctl(file, cmd, arg);
@@ -152,6 +155,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
+	if (xe_device_wedged(xe))
+		return -ECANCELED;
+
 	ret = xe_pm_runtime_get_ioctl(xe);
 	if (ret >= 0)
 		ret = drm_compat_ioctl(file, cmd, arg);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 36d4434ebccc..d2e4249d37ce 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -167,4 +167,24 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
 u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
+static inline bool xe_device_wedged(struct xe_device *xe)
+{
+	return atomic_read(&xe->wedged);
+}
+
+static inline void xe_device_declare_wedged(struct xe_device *xe)
+{
+	if (!atomic_xchg(&xe->wedged, 1)) {
+		xe->needs_flr_on_fini = true;
+		drm_err(&xe->drm,
+			"CRITICAL: Xe has declared device %s as wedged.\n"
+			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
+			"echo '%s' > /sys/bus/pci/drivers/xe/unbind\n"
+			"echo '%s' > /sys/bus/pci/drivers/xe/bind\n"
+			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
+			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
+			dev_name(xe->drm.dev));
+	}
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2e62450d86e1..9b0f3ddc6d50 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -459,6 +459,9 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+	/** @wedged: Xe device faced a critical error and is now blocked. */
+	atomic_t wedged;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 491d0413de15..e922e77f5010 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
 {
 	int err;
 
+	if (xe_device_wedged(gt_to_xe(gt)))
+		return -ECANCELED;
+
 	/* We only support GT resets with GuC submission */
 	if (!xe_device_uc_enabled(gt_to_xe(gt)))
 		return -ENODEV;
@@ -685,7 +688,7 @@ static int gt_reset(struct xe_gt *gt)
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
-	gt_to_xe(gt)->needs_flr_on_fini = true;
+	xe_device_declare_wedged(gt_to_xe(gt));
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 509649d0e65e..8fc757900ed1 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -902,6 +902,9 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
 		return;
 	}
 
+	if (xe_device_wedged(xe))
+		return;
+
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
-- 
2.44.0

