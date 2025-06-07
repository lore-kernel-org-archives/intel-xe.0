Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A44EC61CE7
	for <intel-xe@archiver.kernel.org>; Sat,  7 Jun 2025 00:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B001910E053;
	Sat,  7 Jun 2025 00:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2AIMm0r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705D610E2F8
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Jun 2025 00:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749254850; x=1780790850;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wyEnscCShXKiwmaRBgmUJH00idWCbxcPtKZRkAFsTTc=;
 b=G2AIMm0r5FlJLV1Zs57raiha3PFyCtSFrHzPielMtfH5/eqBTI3gPxrB
 g/yj1aWlHOwN40UY3SnrvY9cbIlP6ZBo9b/fPBHfMvz1yTp26jqV8HjHY
 vc+Y72qJmtabGw70KUDPJf8Kg7T2rOgnZUJPud9IH+xdC5a5qTawjqEv0
 5YIxiPISe6eWpEkcS6vZisRqjuBtnigCxuUlWlooQoAGwYF2rmFXS6U+b
 vRsQH54hYq5rRD1mKRkgtMFkLz3ZRdh0YseCGtmVdWoE3cxgCyBaEDkjQ
 JWTdi5Wy97t8FQKMtzD5/159Y5WyUKpFdjVAliUtQfbh9tRd+RQxIiPtQ g==;
X-CSE-ConnectionGUID: 73Hohzn9SQmpNli8BFIA4w==
X-CSE-MsgGUID: lJZJs8MqQRiFasZCh4y8kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51495550"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="51495550"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 17:07:29 -0700
X-CSE-ConnectionGUID: QcYyw2aeSiqcN8BQ91TdYA==
X-CSE-MsgGUID: JndY7mIZTSmEnl6RVywkgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="146548925"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 17:07:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 17:07:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 17:07:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.60)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 17:07:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miMY5hZ34cEyTDZrNvp3fL5eTwXMYERymmq+tL70kacVbLr0juD4B0KS8BG17P3PGItSjUg1Y5LICZ22Mg6+caHN19wl1OL5iC2T8GcFa7z/ExGucJ8UMx++ILsKEBfYOzMVBdTRKGQ5D79L+9GXWld7vvuVlIbVyxY1nESou8eXlWKNevRbCLHgGYlNOuMhxI4N1ZbQmwceIztCVaOLUwPlzutFPPJ4MIS4URxKtftxX2KLJOBcC/Aww0ToOZR8Z0JXzKetX/gcUAW6LDBYGCr0kdxfn1jAiVqTkb5zN2ihLm3IOFSj28eV/PYXT1wEmDruWzByI5bQCK0XGfFt0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0avEyxaL3u9979Etz81ALYRoP60pdRDYK/Bwc5HLKQ=;
 b=j30KQjPYgy0kckp+/YXxbP8Tzkz1o/8bXpFRg2WDMcc27bW6wYKiWOyRLW6W01xzaknfP0EtfCq4MGNOYsJaUqjX56yU3YgMt/wubCce3cFnJ8yAlUNiEKWFeiqmJjgh0Z8OE5YLQoFIQ79AFJJN+y65KvQIatyzuyhn52ovdzk+089H/+l5CL/6r8jGKyTdIwj+D+eIwamQdnOyL5A/X6VYvZ3XUXTEWD9ZWEPuLOjCvSRqpFy2MhfYGv9dkWpobj23iX9J/fugX03hxrJm9Qz7yJT+QYKgAFrzDP58TvYUbXHCgv17JSWjumPcmGmfWNK42QV0DP2hhwPOhnQf0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS4PPF2B323C540.namprd11.prod.outlook.com (2603:10b6:f:fc02::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Sat, 7 Jun
 2025 00:06:59 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 00:06:58 +0000
Message-ID: <1e939cd3-1db4-432e-89c7-add155d67606@intel.com>
Date: Fri, 6 Jun 2025 17:06:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
To: Jani Nikula <jani.nikula@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20250524144613.11970-1-satyanarayana.k.v.p@intel.com>
 <a0c92aa2-ed7d-41f0-8d7c-b66b36be3fa7@intel.com>
 <ff47692cc6c70d10b3e58cf68e6d70ef79ebd997@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ff47692cc6c70d10b3e58cf68e6d70ef79ebd997@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0207.namprd03.prod.outlook.com
 (2603:10b6:303:b8::32) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS4PPF2B323C540:EE_
X-MS-Office365-Filtering-Correlation-Id: 1421a0d1-f152-440d-1b6d-08dda5573884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjdpR3RDWE95aUU0RmRtdUVjaTVYMDd1b1RkakhPZ0ZMWjNObk9lZGxxWnBL?=
 =?utf-8?B?TGNIeGZGdUZhSTMyd1VDRW1DdGRodFZ6RjZheHJwemZ4a3htSC9ZbVpkT3p0?=
 =?utf-8?B?VndQbExGa3hoNE5XWWgrTG85ak9McUVPL2hjdzVIcTB5WkttbXF6T0JwL2R5?=
 =?utf-8?B?c2loM2w0NWFTeVhSQ0lQYTl4YUNKVmxmMXlYV1BYdW9vR3M0VlZwSmFKcDlR?=
 =?utf-8?B?OXZFQ1pzcTR6VzcyaEVlTGM3d0JnY2gvVGUwWW9EZnVaYWNocTF1clkzSHJE?=
 =?utf-8?B?VGFwSmxKSENJOTBhanZTbytrMWRCNWY5ODJuT1EwWUVoWmpFbVVWMk5oQWhj?=
 =?utf-8?B?ZmxjdzhkRGNPVzlpYjQ1cXpQdTNRUlFOYW1YNWUwMU5WRUZTQVQwTmdqUmpW?=
 =?utf-8?B?L01tN2grZGdTYk9panRJT3dPaDVOdVVpbjAwcW9HbElvUGNZRnNCcUlFZ0ZD?=
 =?utf-8?B?Tk9ISUZBQXNlcXRMK0dVSVV1RlNhd0EweTMwdmxrd3RQMUtSVTR4RTVsdnpB?=
 =?utf-8?B?VDIxRisvWENUUjNxaE02T3dqZjhGUkNjVFdoSEhDV2ljSXJaUFM3TW43MFNU?=
 =?utf-8?B?Q2xiNTFlWm0rcXgwYldPRmo3elhFYjVOT1JzcmFnRXBhSmt5Zk1QU1VWTXhs?=
 =?utf-8?B?UzBHeS9MSGRQRGEydngrV1FBM24rNTFHWGt1alVTS0FPTWJqQ1NPRFN0OWpr?=
 =?utf-8?B?MXRyK1I1QkpIeWI2SHo4VGhyN1cyY0lMUE9lSFVlSTZQYjV2Z0tUL3dzNXBY?=
 =?utf-8?B?aEZOQXFXV3hEZ3dkck9IWDVEbUlobjFrRjFxNmM1T09yTklZRzVhR01RNnpj?=
 =?utf-8?B?Q3hWM3NtNlVhNTVMTzY5TXVGOHVZTkFOTnJWOUhBaTNTU29kSTNzdXNROTVo?=
 =?utf-8?B?d2NpcUcxTXVVMWNrK01EM0wzaUlmMW9UUSt0TCtOczdUWDhyNk9kZTNzR09M?=
 =?utf-8?B?eUFvTkMxWkZjMitoMitlMjhxVUJyZHZBaFNVUUxIY3hieUx6M2gxWHg0S0tq?=
 =?utf-8?B?bWkzckFTMS9aa2dqaU8yRDlCYVI2dkJpK1Y5UlR3YlVRTDFzd2pUd3kxNnJ0?=
 =?utf-8?B?dFlEa2hTdEVoQjhzM2lCRXpWcG1YVDl2MFBWQitlTzNPUllXNUlVVUFZZ2VM?=
 =?utf-8?B?emhQTExxVE1xSWZZenJzRmZBTmRHSEtYOXMzOGo2ZmowbFVEZUwzWVZ4MEVC?=
 =?utf-8?B?WW11VWFWa1hSOFArVFRGaWtqMTZES2U2WVZ0VFJhL2oxTVpGOGcxWlpLT1VQ?=
 =?utf-8?B?YTVOdUJPaXUwU3RvRWtUUGNVL2xYVU5TR0FQNk5vdmpuaHJDMDdxSUUzRlhT?=
 =?utf-8?B?WlhIeFQ2bnA3c3FQZ3lpcmhxbDZZRlpVRE01KzNybjJFWlBsV29rN2xadlBW?=
 =?utf-8?B?Mlh0ZWdmQWNHOHN4RGZaQ0hxTHVZTmlqQ0ZsZS9pb2twVElOU2x0ZmVvZHhP?=
 =?utf-8?B?Yms5V3pLWUpaUDQwOTVFcXlPblJ1MUYxV3daR0xRcUQwVTMzTmVQVG1DWHFO?=
 =?utf-8?B?UWN6ZjZoV01YKzhZOWt2aG9SU0NHeHdPdDBjdjc4dTQ5ajFnV0R2aUx3elFt?=
 =?utf-8?B?RVhJNGxkbXh6MFRaa08vU0pYMThESlJjQmQ2Q2Y4anJ4bEhPZVdpUTY0R1FF?=
 =?utf-8?B?MjNkMzlNSm0rWG11ekVRYXF4S05oWWQ0WU0vMTZYTnpESGd4R1JLYktHb3dG?=
 =?utf-8?B?OWUzZmJNZU1iK0cwK0k5dGpEYkFlVk9QT3pxL1Z2RVFMTm9uNEkrcW42bEVa?=
 =?utf-8?B?QmtmQW9zRllSOEg3QVlOMHB1ckoxU0tHK1gwbmRVbmd0YnI4Mm1XNEhNOEN4?=
 =?utf-8?B?Z24vUGxkT3NtMkkxVjViOHl2N1pDM1hvK3BRcW5HTjhqUlk0YmhBNC81SS9r?=
 =?utf-8?B?OTIrdXNoWEE3RCswOTZPTWN2ZHkzYnpjOGltZTA2aS9lZXJGQmI2ZXhBMGxB?=
 =?utf-8?Q?TxVDgwRThFY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEdZNVJvdXRGQW13OU5IbFpyTkZrbU13MDlGYXZUNDE0UGlObXlQVm9EVUJo?=
 =?utf-8?B?dlFVeXZpNDMyTVhUZ1pKa3hMT0RFdmR4cU5LaEhzTDFyc3BHNlRIazVPcDRY?=
 =?utf-8?B?WnhLem9VeHpRQVp5dTRyNWxFcWp6SjV4a1ZuVWQ4NFZYSElEakdFWnpRMElD?=
 =?utf-8?B?aHFDSHNHWEtORFByK25WOGE3UVZzSUh0ZWNhQVJ5aHdKOGhXREU4SXJWNUVC?=
 =?utf-8?B?Q1NTYWxSYmM4bGpwRkpPdG13STFFc3VjYVFzNXl3aURLT2V1RGR0VzBveHlS?=
 =?utf-8?B?U01PRWNyUEtyV28wUmh1MUh5U1FGSEVMWEdWSExJd2JwS1pvdjh3TjVodFNE?=
 =?utf-8?B?c2NEakpLMTF3MXFuejYvSW90NFZQa3FSTExWQmVHUDdVaWpNYjhockdKbnNP?=
 =?utf-8?B?WFZWMzF5RjdrODJSWWZqTUUyYUF6N1poZmdtRVE3Q2dwZEhxbFliYko3YlZB?=
 =?utf-8?B?RHJVQ3p5YmhxQmRFY25jSGYzekpOMk5IZkxLS0Z0SEpoN3RneCtTaXFLelpk?=
 =?utf-8?B?VDlYR2huNFkvTVltcVZJV2ZvNUE2cHlWQlNTeTdmSDRQYkdBeDBSUlNFckFs?=
 =?utf-8?B?ZTNaMFJ4ei8rNVNZem1VNDNJQ0JFcEE5RUpIMVYwdW9vU1orRDBjQW12bzg4?=
 =?utf-8?B?UkEwTFhWZzdJb1FuY01nUFhicDQydS9qd0JlSzVHWjdPT0J5Zzd3RU8zR1BM?=
 =?utf-8?B?STI1NlRhTE9YZVlKOE56UnRyY1BDNkVBYVlBZ1BHQ2tVQ1JQNHk0dnNweTBh?=
 =?utf-8?B?YnVxV2ovc0hGQzhhU1JtQnh1NWNyZHcwOXcyODNob25oSjhGZStwOHEwR0V1?=
 =?utf-8?B?RkJocXdnRTlOMTV0MWx3aWlXRDJ4bzR2NzRTWjY5M2Qwc0U2V2NMc2poNUlx?=
 =?utf-8?B?d29DVXVSWllkSzRzRWlFVlJOek1mdjVOd0tlaFQ3TjdERS8zdlVqNHFwQ0tq?=
 =?utf-8?B?ank1eW5qdlBQeSthQUFQekF6ZWNGVWppQkJlbDhHNG1ZbzZBemgxK3kvQjVK?=
 =?utf-8?B?TDNEdTJKY21JNjY0QkdpQ2xhN0NJc1g2bFVrTUtlUlBmWlROZldsSEUwNkla?=
 =?utf-8?B?Ym52NERVZkdBdVNLNWZHYkdpdzRqbG5nUlBUZjgvck5XUmx1MENkSm1PNGR4?=
 =?utf-8?B?bVFFWlBWNWRSRnZ0Ui9LV3BaNUZCMFZCWWRBNUJlMUdwTnBSTmtENFBwUzY3?=
 =?utf-8?B?T1l4UEFjQjA5ZC9sQTNzcWFLL3YxQ21Lek9xMGdiK25XVXBGTS9rSk0vU2lD?=
 =?utf-8?B?UktLZ3VBQnlVSUMranplampwTEdlU3RQdEFKaS9PVVRJbGhtVmRhbG9hZ2Yw?=
 =?utf-8?B?WHRhQ2tqRHN0ZmM5MlRRSGY5bkVHdW1XbkNWcHNMcWl3c05VZjRrUU1JSEN6?=
 =?utf-8?B?RU1ldnJjVXRxTEs3a3V6ZnVhWnRDRW0wb2Q2UWtJMjcrM3Zudkl1akVqNFRS?=
 =?utf-8?B?NXRNRDlJQVVESTdsaUQ2Q2FiVnI1VlJTMW4vai9vMXIwVm5yZHcrSXd6Qlph?=
 =?utf-8?B?MksraUxKUXBpMHdzK3R6ckJNdENwQSsraHN0bzRzOWNTdjVvZ1ZjN1JZL2pE?=
 =?utf-8?B?Q0YrRjlIdXZuMFNid09qV0FUb0JQL3FMZWgzZ0hRbEJCeTdlMWUvaS90eVhL?=
 =?utf-8?B?MnRBMHd1ZU91alJYS0ZUK1BobnB2RHU2VXZ6NGdJKzBsc0x4N2hzaWdPMjJ1?=
 =?utf-8?B?c0NqdG5wRVp4SFFmWnZwNWlZTVJDVjY3cnAzTmh6RkJHUlNQdU1RYVIyMDdx?=
 =?utf-8?B?ZDVVZFJibnhKcjZiZUNMV083ZmZPSTdDdzV1ajNJQWVoRWtyN0dCYWhwZGI0?=
 =?utf-8?B?TUZvVzVaQjE3dGpQYmcrVUhBUitFVjB0YVA4anlYbjdneHRjZVNKR2YvNEJs?=
 =?utf-8?B?aFNSQTFmMk9UUGd3VTRDam00RWN1Vk5kM3FyT2U3amxVQ01ZbjhiYkh4Qkow?=
 =?utf-8?B?a2ljRWJWd3FTY2ovTlczOHVEdzFvaG53ZXFQeVJaRkExRkw4STNIU3RBM3pB?=
 =?utf-8?B?cnExZjNIMFkzaE9McGNpSkFtYVF5NllEMG9LQjQzcFU0eDNxQlhxNm1uRDRM?=
 =?utf-8?B?UFUzcmNicS9WNWxQK245d21EREFBVWZnSDR3bjdVMGttZ1FuSE51cGZOakJU?=
 =?utf-8?B?UVd1dzFUU2tPTUFveWIwa1RhSUNIUGQ2RzlsSWNROFN6Z1F6S01oT2RGVkZJ?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1421a0d1-f152-440d-1b6d-08dda5573884
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 00:06:58.8784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6puiybYkVLOe1S1XVqS05dtpjX0CpqZ8ft/7HTOLh/QCVIvlYS6BI+Lte6r5Xj3oy7FJjIOYB6s8U8Q0DfD17nwQ0K7uvWzpXG243HnqBCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2B323C540
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

On 6/6/2025 6:19 AM, Jani Nikula wrote:
> On Thu, 05 Jun 2025, John Harrison <john.c.harrison@intel.com> wrote:
>> On 5/24/2025 7:46 AM, Satyanarayana K V P wrote:
>>> When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
>>> functions, the CI test systems are going out of space and crashing. To
>>> avoid this issue, a new helper function is created and when fault is
>>> injected into this xe_inject_fault() helper function, ct dead capture
>>> is avoided which suppresses ct dumps in the log.
>>>
>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>>
>> This seems like the simplest and cleanest solution to me (for both the
>> KMD and the IGT sides). I don't know if Jani or Michal still have
>> objections to it.
> Simple it may be, but I still think it conflates two orthogonal things
> that should both be decided by userspace.
It is being decided by userspace. And they are not orthogonal but 
completely dependent.

> If userspace wants error injection, why should the kernel decide it
> means no error capture in dmesg? Especially when that decision is to
> tackle an arbitrary self-inflicted *userspace* issue i.e. disk space
> limitation during testing.
Ignoring the CI limitation, it is also unhelpful to have huge logs 
describing hardware state for a bug that is purely software injected.

The dump to dmesg only occurs when something has gone wrong that is not 
supposed to be possible. There should certainly not be any way that a 
user land test can cause such an event. It is there to debug the rare 
and hard to repro cases that cannot be debugged any other way.

Whereas, this specific test is about making sure the KMD does not die 
horribly when an unexpected fault occurs. It is not an attempt to debug 
such occurrences, merely a check that the universe survives them. Which 
means that any debug output related to the source of the error is 
fundamentally useless - the test itself is the source. So any debug 
output related to debugging the source is simply noise and not relevant 
to debugging why the driver died *after* such an error occurred.

As the fault injection test is the only way to inject such errors, by 
definition, it is sensible that the fault injection test is the only 
thing that needs to suppress such output.

In other words, the test and the output suppression are inherently 
connected and not orthogonal.

So having extra complication to make the suppression mechanism generic 
and unrelated to the injection test is wasted effort and unnecessary 
complication.

If you want a more general purpose way to control debug output for 
specific local testing, we already have that via config options and 
kernel/drm debug levels. This is specifically and solely about improving 
the usability of the error injection test (for which config options are 
not viable because those are fixed across CI runs, likewise debug levels 
are not useful because we do need to see the normal driver debug output 
to debug any test failures).

John.

>
> Mechanism, not policy.
>
> There, I've said it, but this is not a hill I'm going to die on.
>
>
> BR,
> Jani.
>
>

