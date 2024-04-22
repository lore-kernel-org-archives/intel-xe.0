Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6E4C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 10:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA4510F592;
	Mon, 22 Apr 2024 10:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Us7hdbbn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D51010F592
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 10:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713782906; x=1745318906;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nOthJM2dy25IcxW/lbSp7FY42h7VO1khvT0ZoWkGcuk=;
 b=Us7hdbbnCe5SPjOzJcQtYN/JDeoRVDi1PNri9HM62p3bB/R5rIVLv+2X
 1cB+i3q3LtjSd6uorv5Vd2oHjoZaYEgJ/6tk9MT2PqPhpRd+lLedNcgoG
 X+RmWUIifF0WyhY2NlnTogoDBNRhdwTdA/dcT1KQBFVk/VuBuzYrR7/MR
 uH8uTYZnZqOomqfcCswQKhACyFLMl1qu1wXJJ+RKX+oWopSWBgSYD3T53
 00JW2+airafcHC6SlfJyofvs/2nX9xKk0rFr4k6QI98dnX2/wpC6Licwo
 ZOfHh42pwA0aTOhJ9FPxpZiw4UiFaXBdKfNoQE2mPi4BlS8WcRhStkvO3 A==;
X-CSE-ConnectionGUID: 2P7XE8CTTC+QUt6vkPl2+w==
X-CSE-MsgGUID: mdqNYJaWRHSVTm4a5y3XYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="13149224"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="13149224"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 03:48:25 -0700
X-CSE-ConnectionGUID: vMa4Ma5lQmCl3BC8O9g4Qw==
X-CSE-MsgGUID: Z3MK8heoSyKwV93YpOXpzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="24580946"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 03:48:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 03:48:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 03:48:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 03:48:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fx7YxwxvvmX3MphNZJUXKkGY2zDIMJ1xlfdCtok2gkpV8dTqeqCGBjm/FrCDEdktFq0zW/V/Id0kyPCZyZbVF/EjvGuYXIL4GvaRp5EeOkIVnPemErxOqCxSA+I5ENkyD+vtkjt/XaPhI69mirJ+jABrUWQAly7hixqS8W9tMdCnRU3NoyvDXLnYp3qnjwwbQlBdhhxpPtAjB/DePFvSyq0SuvV/waxw0Xsy53JzLV5qerB1/4Bd1UbHNZGPo4MYTRQRrsJ/Z9yaWFiMvlfTQ6y7csBAEko+5NnwWLmNZZF1YU4LxDENY4DsUBR72rnN5hV0t2g8rl8ZRNgH4o7GVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBBm/VRDSlWUPA2XsG5w6j+k6w4rHSX8EbKw+v7DOzw=;
 b=kVmvAIeTgbE2P5/vBR4UlZBo5vdEOnGZpUvK8UpT83gfI1m0vsnLQbM+8yK7wp0ia4j/PYm5bQ8C1MDi2ATmyAsbmrm0/1u50G80FTFeMQZQf6lVXtzyAqR3qcjzbrsF+cmdzFKAeZ9dkIq/taW5npIISRrt2Unlg17X+6THTYIrCESN0H2rrETduSKnWm5k3rmbfJthLueZSQdERv6DUP94WApK5fcmoLqWtC8j907xhud6moglAWpDkk6Vg7jSaPUKHpCkeyAP3mRVip0awpSn44RbmKtG1ZWQUmGBWtSUOom0T2z+ik2ej3KlC/TjPebKQN0Wo7d+79UtYlGvqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB7197.namprd11.prod.outlook.com (2603:10b6:208:41a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.19; Mon, 22 Apr
 2024 10:48:22 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 10:48:22 +0000
Date: Mon, 22 Apr 2024 12:48:19 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/xe/pf: Add SR-IOV GuC Relay PF services
Message-ID: <20240422104819.jtupt7a5yc5thhlm@intel.com>
References: <20240418152802.182-1-michal.wajdeczko@intel.com>
 <20240418152802.182-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418152802.182-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI1P293CA0016.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::8)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: c2174dfc-f2a2-40d7-458b-08dc62b9ba8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWR0cjIvMS9OZmEwTk10NnA2Sk9LTWdIcnlLdDh4U3lBMHNDNXhtM2p1TC9D?=
 =?utf-8?B?akxCc29Ydm0vZ0h6M280VWlQK3hQNWFNazVTNTdwTUs4K2M4QzgyUktEeUdp?=
 =?utf-8?B?Y3o5STJHNUhVNmhMekdKd2dxQ1pRQzFQemZFd0R1Ni81VExZYUw2SmxZcWJM?=
 =?utf-8?B?bk4xL1JHL0MxZlNDY3RBZ1ljMFhRbmlHaGJ3SEVDcG1seURFelVWVXpCU0xB?=
 =?utf-8?B?SGhhcEFzeXBOZkFhM01XWStNSDdtT2wxa2NiLy9YdmRHVmYzK245SlNHcjJI?=
 =?utf-8?B?MktiZ2VPQmx6T1dMNDZDaGdxMGRESkkzcUtZaTYvYkVmMkxZOGFtdlNZN1pD?=
 =?utf-8?B?emtMQUlQbERNZ0wrcWw4ZFZhZlZXd1N3U0N5ZlVWajZZaW80b3lGbWovanVj?=
 =?utf-8?B?WW1wb1djcnAzT055aUpKQzJOek5xNGxqKzFQbnNiWTVBSjBwUXA3N29qckhU?=
 =?utf-8?B?RjFIUkNyVkQ4NVdDSkVKam1EbVNmdjQ3QjN4OXJyT2VZUDFiMHJNV2M1ZFRz?=
 =?utf-8?B?cDhwN2RmU2hBWlRMTFlRWFYzUzVDNmEvUFZ3bThXMTVaK1FkNHROM3Z4bXJh?=
 =?utf-8?B?QzdNbWt3OU9zNzVQRW4yaWMwZ1NJeTZvVE1nVC9qQ3hwMUVpc1ZwMlVZUjBJ?=
 =?utf-8?B?RENia3NnQzBpaVpSZmlpSVZDWlcvYU5YcEJ3UVRRbC9JU3FoMVhZTy9Xc29t?=
 =?utf-8?B?RmthVEFTWkk1TGxLeDhwdTRpOXpRcWgvYldua2laOW02c29Ba3pQR0dCQ0FY?=
 =?utf-8?B?UitrejFCejlmazdodjlIVDUvcHAzZkp4NTQ1eGxhWXBoeHJVVlB6RUdjVFZI?=
 =?utf-8?B?VzYreVZaYlNzVktBaUVTeTU1aUxpSGJod0JQdnBHL2NpZy9TQXBVSmE4Yk1E?=
 =?utf-8?B?NGpFaTAreGM0WE9Bd1lmb0h4blNMMkJyQXRFQy8vWHd3QU9ueVpvdys4VGc3?=
 =?utf-8?B?eGdEUnVBcmRYbldJN1FMN2NRdGdmWE5jdHFRekZoSHR0YTM4Y3dRWjVpQlZS?=
 =?utf-8?B?L0g1dEZ1UVVWdG4yWXB6dUpERWhjUEU2bldWUFdIWnRhcTRDN2ZHeFNtNzlZ?=
 =?utf-8?B?VS8vWHRKQ0dQc0U1My9KRUV4cVdUSXRJb2wySUtLRVh0b0tsQi8wQlBrZGdx?=
 =?utf-8?B?SGpWb3FHcWEvZ2t2Y1FRZ29UbzZnRVpsQkJ2R3Y0TDBQR2J2Smt1dHc5aGN4?=
 =?utf-8?B?RjlQU3ZMTmxkL3F0ekljTGxlTUVKdkRPL1NTRjF6RWpPZGxKekZiVUV4UWVT?=
 =?utf-8?B?OHd4SzlkM1lZbXYzRWVWRGpkSmMwcnp3MFZJVmhnbjFZSTF3bWdWUVdZN2sy?=
 =?utf-8?B?VEg2STI5Y1BxL0F4TU1GbmlBd1N4ZVl0SEZOVFRQVmlmYS9HbUR1T2pvdUh1?=
 =?utf-8?B?ZGtuSW1GMm9XWmN2VU01d0t4cUtSbU5uR1IwTGtxS3pOUlRJMC81ZTdUL1Rq?=
 =?utf-8?B?N1VKY0FrbDFnMnh2NXhKc0RpS2wzR1o4dDBuSFc4b0lEUFl0Q3Z4aWx6RVpU?=
 =?utf-8?B?eldqSm11OHhaais1Q2Iya2tMWVJ4MGwyQ1pSdXY2aG1ic2wrRlA0bWVnNFkr?=
 =?utf-8?B?RFNiK1ZjMURuRWc3N2NLVUtUVzBUUU9VZDdONUR0bVZOSFIvY0Y4eFUyakRS?=
 =?utf-8?B?eU1aT2xvVEZvdzk5U2RXMEtqSWRLajhIemFTSldiUHBrdlhQY1hLRWQ4R3lI?=
 =?utf-8?B?bGVIY3pxeFZYOWNkL2xPNU1FM1YvOHo2NlJRbXhTSktPY0FPQzlveW1RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHM1SjJKektGTTNoVG5xNmwwTVZIbWZQOUtVSmVwekRoQ1pXTjJEaitCemY1?=
 =?utf-8?B?RXQ5M1k1b0xHcWIyWE1CS24zRXBUcGlKZi9pZ2RYWnVVRUVnWXVaQkRzeDdB?=
 =?utf-8?B?d1VTM2FmMVM0eUczd3E1eldRS3hmNTdYbDVuTzMyY084SmFMRlBHNlhPYldX?=
 =?utf-8?B?bTZrcFRIQWVhaXlzSTNZSXhYaUVUbEFJZWdHYlkvdjNlT1ZwdndXZ1Ewa0cy?=
 =?utf-8?B?SmVITmltT0JsK0xPMTZQYW5vYjJrcVpXeS9odXpPUm95WXdkWjQ3Q1BsRTAw?=
 =?utf-8?B?YXhOcFI1QzBkV1hpMUU2emN5T3lFMDc0eE83eDd5U081RDlEVVluclpSOGl0?=
 =?utf-8?B?N0o2ZEJpZFV3TnJFMzFaRmJqdmZONXdESUJxN1lodVZnVGVhc0tNNzVXU3pl?=
 =?utf-8?B?SFBtdVZBSWlYWGZ3QXJBejFIUzVlL0xMc1A0aVNsNWNuRlJ4SkhKUm5hMjc0?=
 =?utf-8?B?dmE0ckI2b3M2RWo0UkNkNXNaR2hIalppRlUvK0FBUEJJbHNXWnU1c1ljT2tD?=
 =?utf-8?B?VWxNMFNiMGJLMkRnUy9MaUQ0NjVGWUloRUQweW92R1hYTHowM2t2OWNvbm92?=
 =?utf-8?B?R1FLZ3Zybnh0K3lranhvSXk2a20rdUhOUU5TTEJNWS9kSWd3SkxxZzhSNmV6?=
 =?utf-8?B?cm4rQkpCeStrblBXcVZKWmdVTUhBMkdia0gzK1QxdmMzUkZTb2ltdkt0YjU0?=
 =?utf-8?B?NksyY1dtdWsya0xmdEk1em5hUXVkbU9BbXVUMi9OMjJpbEpycnp2akFreGdh?=
 =?utf-8?B?OXhMSE1INmpEek96dk4yZlBQbzVNV2YwbW04WkwzUzhkVUorTU9Cc3l0WVp1?=
 =?utf-8?B?YVFrOFZOdXY1M1d0SkRYN2NZdVlHdklLMmM5b1N3TUIrT1FtQ0RNWUVwN1Q2?=
 =?utf-8?B?Tm11YzJwcUowbzhCZm1Zd21KbG5OcURqSGhkUUJFQkt1ZFFTTVMvaE5MdTRJ?=
 =?utf-8?B?QVBmeEhJaEs2RHVnRkc2enR4N1VOa0xtWlphVms0bXA1UHVLcjhBVmVBWFBm?=
 =?utf-8?B?T245K2hieTRPTDRRYlVIRnNvd2NuWWxqZk9uM1FDeHNnMlo2VkZUZmFVV3ln?=
 =?utf-8?B?TldTNDFmOGVkTkMxRVFrVHJmNEJqaVVTdURtajFVOS9iZ0UyaXNMZW1NNEJy?=
 =?utf-8?B?UTVFeXIzdlBnenFibUtFWitJNnl1WTBDNE9BWExWK3VZZ2tiL0Z2UXo5OHVG?=
 =?utf-8?B?VjZMWWRzVmhrcDY1eGU4Z0w0MnpRZXBRNHdjN2licDFxbnVOWXFsU3VIV3VZ?=
 =?utf-8?B?bjk5M1lwSE51bnFyQ3hnNk9YK1p6YzZSQm82eTdQWVJpRGd2LzVMRmlTT0ov?=
 =?utf-8?B?aDY2RjN6eU9HQ1B5alkxU1ZiSG1jbGhxeXhUbU55VGMrSnF3cGJMcFNWYUQ0?=
 =?utf-8?B?WDVqRFNQZGczakJhczEzSDZSMlVDYk9YMlFWcWp1aDFyY25uTm9pZlg0VTU4?=
 =?utf-8?B?Q3VCam1vVDdUSWtuZTNWUVVuRTRQMllsL1I0QmpSNjhhNlZIVDF6dGIxci8y?=
 =?utf-8?B?OEZYNld0ZEkyQ0RSNkhNZmVlYWxmdzFnN1k0Qk8vOHc5MW1vUzcxMU1nbTlo?=
 =?utf-8?B?RG9rWExoVUZPRktsTUFtYURieCtGK2l1ZDkxYXpuZTRiTlVES3NBY29uaGcy?=
 =?utf-8?B?WVNiQ2c2SDV4ZndZaVN3aDZITitKM2RXRFlCQ0dNbU9ZREt5Y3BQYVJmdnlx?=
 =?utf-8?B?ckVTRzZDV2hNNW9Fa2h0M1pVZ2pjaXNJZkNjb0cvVk91ZnZLUEVMaTREeW91?=
 =?utf-8?B?VmNIeTBGK2hRZE82cU9DdHB1WXVCWEZkOUxGc2hOU2JmL3N5U0h6VERGcVVT?=
 =?utf-8?B?MC85VnZBb1lSdURKc2h3ZE5icGVzTkZONDJocHZFdEdvR0FaTW1HOEtnUW5x?=
 =?utf-8?B?bkE4elhGWHYxYkU5anl3aytiWkZXTzFiVVlmdURCcUVmei9pdUZXTUxGRFIx?=
 =?utf-8?B?cUptRnprWFlSSlNPbnp3WVM0QlEzZ0RiVXlpam1SaHhoR3RvZFZrRW9sVXBF?=
 =?utf-8?B?Y3l6eit2WE9Oa0NzaDhRanJFV1Zmd3ZnalM1VGRuRmJwUWprYnZQMi8yNE9H?=
 =?utf-8?B?bXlhZHB2dlU4VkVkSDVWSC9wK2FMMWtab0s3SDJ3ZzBLUEprUEVNclIrTkFI?=
 =?utf-8?B?WHhMVFdPZkhVQ1NTOFRqcXhkN24yOW5RQnlpeTZkU2VhRHg3SjNkNHc4bUYw?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2174dfc-f2a2-40d7-458b-08dc62b9ba8c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 10:48:22.0154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OQjjbLUCxniXBD5ZaHwUQ734Pk3LoCk8c8kW/97dGAxvl08RCp5DF1I33RszRA5eVhMy7C3SQQEd/CAybawqgi+ljABw1KKuoJJqjP9fIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7197
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-kwi-18 17:28:01 +0200]:
> We already have mechanism that allows a VF driver to communicate
> with the PF driver, now add PF side handlers for VF2PF requests
> defined in version 1.0 of VF/PF GuC Relay ABI specification.
> 
> The VF2PF_HANDSHAKE request must be used by the VF driver to
> negotiate the ABI version prior to sending any other request.
> We will reset any negotiated version later during FLR.
> 
> The outcome of the VF2PF_QUERY_RUNTIME requests depends on actual
> platform, for legacy platforms used as SDV is provided as-is, for
> latest platforms it is preliminary, and might be changed.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   | 549 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h   |  36 ++
>  .../gpu/drm/xe/xe_gt_sriov_pf_service_types.h |  52 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   5 +
>  drivers/gpu/drm/xe/xe_guc_relay.c             |   8 +-
>  6 files changed, 649 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_service_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8321ec4f9b46..5ca09cb03363 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -164,6 +164,7 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_gt_sriov_pf_config.o \
>  	xe_gt_sriov_pf_control.o \
>  	xe_gt_sriov_pf_policy.o \
> +	xe_gt_sriov_pf_service.o \
>  	xe_lmtt.o \
>  	xe_lmtt_2l.o \
>  	xe_lmtt_ml.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> new file mode 100644
> index 000000000000..4b9850cc3615
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> @@ -0,0 +1,549 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include "abi/guc_actions_sriov_abi.h"
> +#include "abi/guc_relay_actions_abi.h"
> +
> +#include "regs/xe_gt_regs.h"
> +#include "regs/xe_guc_regs.h"
> +#include "regs/xe_regs.h"
> +
> +#include "xe_mmio.h"
> +#include "xe_gt_sriov_printk.h"
> +#include "xe_gt_sriov_pf_helpers.h"
> +#include "xe_gt_sriov_pf_service.h"
> +#include "xe_gt_sriov_pf_service_types.h"
> +#include "xe_guc_ct.h"
> +#include "xe_guc_hxg_helpers.h"
> +
> +static void pf_init_versions(struct xe_gt *gt)
> +{
> +	BUILD_BUG_ON(!GUC_RELAY_VERSION_BASE_MAJOR && !GUC_RELAY_VERSION_BASE_MINOR);
> +	BUILD_BUG_ON(GUC_RELAY_VERSION_BASE_MAJOR > GUC_RELAY_VERSION_LATEST_MAJOR);
> +
> +	/* base versions may differ between platforms */
> +	gt->sriov.pf.service.version.base.major = GUC_RELAY_VERSION_BASE_MAJOR;
> +	gt->sriov.pf.service.version.base.minor = GUC_RELAY_VERSION_BASE_MINOR;
> +
> +	/* latest version is same for all platforms */
> +	gt->sriov.pf.service.version.latest.major = GUC_RELAY_VERSION_LATEST_MAJOR;
> +	gt->sriov.pf.service.version.latest.minor = GUC_RELAY_VERSION_LATEST_MINOR;
> +}
> +
> +/* Return: 0 on success or a negative error code on failure. */
> +static int pf_negotiate_version(struct xe_gt *gt,
> +				u32 wanted_major, u32 wanted_minor,
> +				u32 *major, u32 *minor)
> +{
> +	struct xe_gt_sriov_pf_service_version base = gt->sriov.pf.service.version.base;
> +	struct xe_gt_sriov_pf_service_version latest = gt->sriov.pf.service.version.latest;
> +
> +	xe_gt_assert(gt, base.major);
> +	xe_gt_assert(gt, base.major <= latest.major);
> +	xe_gt_assert(gt, (base.major < latest.major) || (base.minor <= latest.minor));
> +
> +	/* VF doesn't care - return our latest  */
> +	if (wanted_major == VF2PF_HANDSHAKE_MAJOR_ANY &&
> +	    wanted_minor == VF2PF_HANDSHAKE_MINOR_ANY) {
> +		*major = latest.major;
> +		*minor = latest.minor;
> +		return 0;
> +	}
> +
> +	/* VF wants newer than our - return our latest  */
> +	if (wanted_major > latest.major) {
> +		*major = latest.major;
> +		*minor = latest.minor;
> +		return 0;
> +	}
> +
> +	/* VF wants older than min required - reject */
> +	if (wanted_major < base.major ||
> +	    (wanted_major == base.major && wanted_minor < base.minor)) {
> +		return -EPERM;
> +	}
> +
> +	/* previous major - return wanted, as we should still support it */
> +	if (wanted_major < latest.major) {
> +		/* XXX: we are not prepared for multi-versions yet */
> +		xe_gt_assert(gt, base.major == latest.major);
> +		return -ENOPKG;
> +	}
> +
> +	/* same major - return common minor */
> +	*major = wanted_major;
> +	*minor = min_t(u32, latest.minor, wanted_minor);
> +	return 0;
> +}
> +
> +static void pf_connect(struct xe_gt *gt, u32 vfid, u32 major, u32 minor)
> +{
> +	xe_gt_sriov_pf_assert_vfid(gt, vfid);
> +	xe_gt_assert(gt, major || minor);
> +
> +	gt->sriov.pf.vfs[vfid].version.major = major;
> +	gt->sriov.pf.vfs[vfid].version.minor = minor;
> +}
> +
> +static void pf_disconnect(struct xe_gt *gt, u32 vfid)
> +{
> +	xe_gt_sriov_pf_assert_vfid(gt, vfid);
> +
> +	gt->sriov.pf.vfs[vfid].version.major = 0;
> +	gt->sriov.pf.vfs[vfid].version.minor = 0;
> +}
> +
> +static bool pf_is_negotiated(struct xe_gt *gt, u32 vfid, u32 major, u32 minor)
> +{
> +	xe_gt_sriov_pf_assert_vfid(gt, vfid);
> +
> +	return major == gt->sriov.pf.vfs[vfid].version.major &&
> +	       minor <= gt->sriov.pf.vfs[vfid].version.minor;
> +}
> +
> +static const struct xe_reg tgl_runtime_regs[] = {
> +	RPM_CONFIG0,			/* _MMIO(0x0d00) */
> +	MIRROR_FUSE3,			/* _MMIO(0x9118) */
> +	XELP_EU_ENABLE,			/* _MMIO(0x9134) */
> +	XELP_GT_SLICE_ENABLE,		/* _MMIO(0x9138) */
> +	XELP_GT_GEOMETRY_DSS_ENABLE,	/* _MMIO(0x913c) */
> +	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
> +	CTC_MODE,			/* _MMIO(0xa26c) */
> +	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
> +	TIMESTAMP_OVERRIDE,		/* _MMIO(0x44074) */
> +};
> +
> +static const struct xe_reg ats_m_runtime_regs[] = {
> +	RPM_CONFIG0,			/* _MMIO(0x0d00) */
> +	MIRROR_FUSE3,			/* _MMIO(0x9118) */
> +	MIRROR_FUSE1,			/* _MMIO(0x911c) */
> +	XELP_EU_ENABLE,			/* _MMIO(0x9134) */
> +	XELP_GT_GEOMETRY_DSS_ENABLE,	/* _MMIO(0x913c) */
> +	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
> +	XEHP_GT_COMPUTE_DSS_ENABLE,	/* _MMIO(0x9144) */
> +	CTC_MODE,			/* _MMIO(0xa26c) */
> +	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
> +	TIMESTAMP_OVERRIDE,		/* _MMIO(0x44074) */
> +};
> +
> +static const struct xe_reg pvc_runtime_regs[] = {
> +	RPM_CONFIG0,			/* _MMIO(0x0d00) */
> +	MIRROR_FUSE3,			/* _MMIO(0x9118) */
> +	XELP_EU_ENABLE,			/* _MMIO(0x9134) */
> +	XELP_GT_GEOMETRY_DSS_ENABLE,	/* _MMIO(0x913c) */
> +	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
> +	XEHP_GT_COMPUTE_DSS_ENABLE,	/* _MMIO(0x9144) */
> +	XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,/* _MMIO(0x9148) */
> +	CTC_MODE,			/* _MMIO(0xA26C) */
> +	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
> +	TIMESTAMP_OVERRIDE,		/* _MMIO(0x44074) */
> +};
> +
> +static const struct xe_reg ver_1270_runtime_regs[] = {
> +	RPM_CONFIG0,			/* _MMIO(0x0d00) */
> +	XEHP_FUSE4,			/* _MMIO(0x9114) */
> +	MIRROR_FUSE3,			/* _MMIO(0x9118) */
> +	MIRROR_FUSE1,			/* _MMIO(0x911c) */
> +	XELP_EU_ENABLE,			/* _MMIO(0x9134) */
> +	XELP_GT_GEOMETRY_DSS_ENABLE,	/* _MMIO(0x913c) */
> +	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
> +	XEHP_GT_COMPUTE_DSS_ENABLE,	/* _MMIO(0x9144) */
> +	XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,/* _MMIO(0x9148) */
> +	CTC_MODE,			/* _MMIO(0xa26c) */
> +	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
> +	TIMESTAMP_OVERRIDE,		/* _MMIO(0x44074) */
> +};
> +
> +static const struct xe_reg ver_2000_runtime_regs[] = {
> +	RPM_CONFIG0,			/* _MMIO(0x0d00) */
> +	XEHP_FUSE4,			/* _MMIO(0x9114) */
> +	MIRROR_FUSE3,			/* _MMIO(0x9118) */
> +	MIRROR_FUSE1,			/* _MMIO(0x911c) */
> +	XELP_EU_ENABLE,			/* _MMIO(0x9134) */
> +	XELP_GT_GEOMETRY_DSS_ENABLE,	/* _MMIO(0x913c) */
> +	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
> +	XEHP_GT_COMPUTE_DSS_ENABLE,	/* _MMIO(0x9144) */
> +	XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,/* _MMIO(0x9148) */
> +	XE2_GT_COMPUTE_DSS_2,		/* _MMIO(0x914c) */
> +	XE2_GT_GEOMETRY_DSS_1,		/* _MMIO(0x9150) */
> +	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
> +	CTC_MODE,			/* _MMIO(0xa26c) */
> +	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
> +	TIMESTAMP_OVERRIDE,		/* _MMIO(0x44074) */
> +};
> +
> +static const struct xe_reg *pick_runtime_regs(struct xe_device *xe, unsigned int *count)
> +{
> +	const struct xe_reg *regs;
> +
> +	if (GRAPHICS_VERx100(xe) >= 2000) {
> +		*count = ARRAY_SIZE(ver_2000_runtime_regs);
> +		regs = ver_2000_runtime_regs;
> +	} else if (GRAPHICS_VERx100(xe) >= 1270) {
> +		*count = ARRAY_SIZE(ver_1270_runtime_regs);
> +		regs = ver_1270_runtime_regs;
> +	} else if (GRAPHICS_VERx100(xe) == 1260) {
> +		*count = ARRAY_SIZE(pvc_runtime_regs);
> +		regs = pvc_runtime_regs;
> +	} else if (GRAPHICS_VERx100(xe) == 1255) {
> +		*count = ARRAY_SIZE(ats_m_runtime_regs);
> +		regs = ats_m_runtime_regs;
> +	} else if (GRAPHICS_VERx100(xe) == 1200) {
> +		*count = ARRAY_SIZE(tgl_runtime_regs);
> +		regs = tgl_runtime_regs;
> +	} else {
> +		regs = ERR_PTR(-ENOPKG);
> +		*count = 0;
> +	}
> +
> +	return regs;
> +}
> +
> +static int pf_alloc_runtime_info(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	const struct xe_reg *regs;
> +	unsigned int size;
> +	u32 *values;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> +	xe_gt_assert(gt, !gt->sriov.pf.service.runtime.size);
> +	xe_gt_assert(gt, !gt->sriov.pf.service.runtime.regs);
> +	xe_gt_assert(gt, !gt->sriov.pf.service.runtime.values);
> +
> +	regs = pick_runtime_regs(xe, &size);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	if (unlikely(!size))
> +		return 0;
> +
> +	values = drmm_kcalloc(&xe->drm, size, sizeof(u32), GFP_KERNEL);
> +	if (!values)
> +		return -ENOMEM;
> +
> +	gt->sriov.pf.service.runtime.size = size;
> +	gt->sriov.pf.service.runtime.regs = regs;
> +	gt->sriov.pf.service.runtime.values = values;
> +
> +	return 0;
> +}
> +
> +static void read_many(struct xe_gt *gt, unsigned int count,
> +		      const struct xe_reg *regs, u32 *values)
> +{
> +	while (count--)
> +		*values++ = xe_mmio_read32(gt, *regs++);
> +}
> +
> +static void pf_prepare_runtime_info(struct xe_gt *gt)
> +{
> +	const struct xe_reg *regs;
> +	unsigned int size;
> +	u32 *values;
> +
> +	if (!gt->sriov.pf.service.runtime.size)
> +		return;
> +
> +	size = gt->sriov.pf.service.runtime.size;
> +	regs = gt->sriov.pf.service.runtime.regs;
> +	values = gt->sriov.pf.service.runtime.values;
> +
> +	read_many(gt, size, regs, values);
> +
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
> +		struct drm_printer p = xe_gt_info_printer(gt);
> +
> +		xe_gt_sriov_pf_service_print_runtime(gt, &p);
> +	}
> +}
> +
> +/**
> + * xe_gt_sriov_pf_service_init - Early initialization of the GT SR-IOV PF services.
> + * @gt: the &xe_gt to initialize
> + *
> + * Performs early initialization of the GT SR-IOV PF services, including preparation
> + * of the runtime info that will be shared with VFs.
> + *
> + * This function can only be called on PF.
> + */
> +int xe_gt_sriov_pf_service_init(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	pf_init_versions(gt);
> +
> +	err = pf_alloc_runtime_info(gt);
> +	if (unlikely(err))
> +		goto failed;
> +
> +	return 0;
> +failed:
> +	xe_gt_sriov_err(gt, "Failed to initialize service (%pe)\n", ERR_PTR(err));
> +	return err;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_service_update - Update PF SR-IOV services.
> + * @gt: the &xe_gt to update
> + *
> + * Updates runtime data shared with VFs.
> + *
> + * This function can be called more than once.
> + * This function can only be called on PF.
> + */
> +void xe_gt_sriov_pf_service_update(struct xe_gt *gt)
> +{
> +	pf_prepare_runtime_info(gt);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_service_reset - Reset a connection with the VF.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * Reset a VF driver negotiated VF/PF ABI version.
> + * After that point, the VF driver will have to perform new version handshake
> + * to continue use of the PF services again.
> + *
> + * This function can only be called on PF.
> + */
> +void xe_gt_sriov_pf_service_reset(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_disconnect(gt, vfid);
> +}
> +
> +/* Return: 0 on success or a negative error code on failure. */
> +static int pf_process_handshake(struct xe_gt *gt, u32 vfid,
> +				u32 wanted_major, u32 wanted_minor,
> +				u32 *major, u32 *minor)
> +{
> +	int err;
> +
> +	xe_gt_sriov_dbg_verbose(gt, "VF%u wants ABI version %u.%u\n",
> +				vfid, wanted_major, wanted_minor);
> +
> +	err = pf_negotiate_version(gt, wanted_major, wanted_minor, major, minor);
> +
> +	if (err < 0) {
> +		xe_gt_sriov_notice(gt, "VF%u failed to negotiate ABI %u.%u (%pe)\n",
> +				   vfid, wanted_major, wanted_minor, ERR_PTR(err));
> +		pf_disconnect(gt, vfid);
> +	} else {
> +		xe_gt_sriov_dbg(gt, "VF%u negotiated ABI version %u.%u\n",
> +				vfid, *major, *minor);
> +		pf_connect(gt, vfid, *major, *minor);
> +	}
> +
> +	return 0;
> +}
> +
> +/* Return: length of the response message or a negative error code on failure. */
> +static int pf_process_handshake_msg(struct xe_gt *gt, u32 origin,
> +				    const u32 *request, u32 len, u32 *response, u32 size)
> +{
> +	u32 wanted_major, wanted_minor;
> +	u32 major, minor;
> +	u32 mbz;
> +	int err;
> +
> +	if (unlikely(len != VF2PF_HANDSHAKE_REQUEST_MSG_LEN))
> +		return -EMSGSIZE;
> +
> +	mbz = FIELD_GET(VF2PF_HANDSHAKE_REQUEST_MSG_0_MBZ, request[0]);
> +	if (unlikely(mbz))
> +		return -EPFNOSUPPORT;
> +
> +	wanted_major = FIELD_GET(VF2PF_HANDSHAKE_REQUEST_MSG_1_MAJOR, request[1]);
> +	wanted_minor = FIELD_GET(VF2PF_HANDSHAKE_REQUEST_MSG_1_MINOR, request[1]);
> +
> +	err = pf_process_handshake(gt, origin, wanted_major, wanted_minor, &major, &minor);
> +	if (err < 0)
> +		return err;
> +
> +	xe_gt_assert(gt, major || minor);
> +	xe_gt_assert(gt, size >= VF2PF_HANDSHAKE_RESPONSE_MSG_LEN);
> +
> +	response[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		      FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_SUCCESS) |
> +		      FIELD_PREP(GUC_HXG_RESPONSE_MSG_0_DATA0, 0);
> +	response[1] = FIELD_PREP(VF2PF_HANDSHAKE_RESPONSE_MSG_1_MAJOR, major) |
> +		      FIELD_PREP(VF2PF_HANDSHAKE_RESPONSE_MSG_1_MINOR, minor);
> +
> +	return VF2PF_HANDSHAKE_RESPONSE_MSG_LEN;
> +}
> +
> +struct reg_data {
> +	u32 offset;
> +	u32 value;
> +} __packed;
> +static_assert(hxg_sizeof(struct reg_data) == 2);
> +
> +/* Return: number of entries copied or negative error code on failure. */
> +static int pf_service_runtime_query(struct xe_gt *gt,
> +				    u32 start,
> +				    u32 limit,
> +				    struct reg_data *data,
> +				    u32 *remaining)

Did you have any reason to format these function parameters so strangely ?

> +{
> +	struct xe_gt_sriov_pf_service_runtime_regs *runtime;
> +	unsigned int count, i;
> +	u32 addr;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	runtime = &gt->sriov.pf.service.runtime;
> +
> +	if (start > runtime->size)
> +		return -ERANGE;
> +
> +	count = min_t(u32, runtime->size - start, limit);
> +
> +	for (i = 0; i < count; ++i, ++data) {
> +		addr = runtime->regs[start + i].addr;
> +		data->offset = xe_mmio_adjusted_addr(gt, addr);
> +		data->value = runtime->values[start + i];
> +	}
> +
> +	*remaining = runtime->size - start - count;
> +	return count;
> +}
> +
> +/* Return: length of the response message or a negative error code on failure. */
> +static int pf_process_runtime_query_msg(struct xe_gt *gt, u32 origin,
> +					const u32 *msg, u32 msg_len, u32 *response, u32 resp_size)
> +{
> +	const u32 chunk_size = hxg_sizeof(struct reg_data);
> +	struct reg_data *reg_data_buf;
> +	u32 limit, start, max_chunks;
> +	u32 remaining = 0;
> +	int ret;
> +
> +	if (!pf_is_negotiated(gt, origin, 1, 0))
> +		return -EACCES;
> +	if (unlikely(msg_len > VF2PF_QUERY_RUNTIME_REQUEST_MSG_LEN))
> +		return -EMSGSIZE;
> +	if (unlikely(msg_len < VF2PF_QUERY_RUNTIME_REQUEST_MSG_LEN))
> +		return -EPROTO;
> +	if (unlikely(resp_size < VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN))
> +		return -EINVAL;
> +
> +	limit = FIELD_GET(VF2PF_QUERY_RUNTIME_REQUEST_MSG_0_LIMIT, msg[0]);
> +	start = FIELD_GET(VF2PF_QUERY_RUNTIME_REQUEST_MSG_1_START, msg[1]);
> +
> +	resp_size = min_t(u32, resp_size, VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MAX_LEN);
> +	max_chunks = (resp_size - VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN) / chunk_size;
> +	limit = limit ? min_t(u32, max_chunks, limit) : max_chunks;
> +	reg_data_buf = (void *)(response + VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN);
> +
> +	ret = pf_service_runtime_query(gt, start, limit, reg_data_buf, &remaining);
> +	if (ret < 0)
> +		return ret;
> +
> +	response[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		      FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_SUCCESS) |
> +		      FIELD_PREP(VF2PF_QUERY_RUNTIME_RESPONSE_MSG_0_COUNT, ret);
> +	response[1] = FIELD_PREP(VF2PF_QUERY_RUNTIME_RESPONSE_MSG_1_REMAINING, remaining);
> +
> +	return VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN + ret * hxg_sizeof(struct reg_data);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_service_process_request - Service GT level SR-IOV request message from the VF.
> + * @gt: the &xe_gt that provides the service
> + * @origin: VF number that is requesting the service
> + * @msg: request message
> + * @msg_len: length of the request message (in dwords)
> + * @response: placeholder for the response message
> + * @resp_size: length of the response message buffer (in dwords)
> + *
> + * This function processes `Relay Message`_ request from the VF.
> + *
> + * Return: length of the response message or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_service_process_request(struct xe_gt *gt, u32 origin,
> +					   const u32 *msg, u32 msg_len,
> +					   u32 *response, u32 resp_size)
> +{
> +	u32 action, data __maybe_unused;
> +	int ret;
> +
> +	xe_gt_assert(gt, msg_len >= GUC_HXG_MSG_MIN_LEN);
> +	xe_gt_assert(gt, FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0]) == GUC_HXG_TYPE_REQUEST);
> +
> +	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
> +	data = FIELD_GET(GUC_HXG_REQUEST_MSG_0_DATA0, msg[0]);
> +	xe_gt_sriov_dbg_verbose(gt, "service action %#x:%u from VF%u\n",
> +				action, data, origin);
> +
> +	switch (action) {
> +	case GUC_RELAY_ACTION_VF2PF_HANDSHAKE:
> +		ret = pf_process_handshake_msg(gt, origin, msg, msg_len, response, resp_size);
> +		break;
> +	case GUC_RELAY_ACTION_VF2PF_QUERY_RUNTIME:
> +		ret = pf_process_runtime_query_msg(gt, origin, msg, msg_len, response, resp_size);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_service_print_runtime - Print PF runtime data shared with VFs.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * This function is for PF use only.
> + */
> +int xe_gt_sriov_pf_service_print_runtime(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	const struct xe_reg *regs;
> +	unsigned int size;
> +	u32 *values;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	size = gt->sriov.pf.service.runtime.size;
> +	regs = gt->sriov.pf.service.runtime.regs;
> +	values = gt->sriov.pf.service.runtime.values;
> +
> +	for (; size--; regs++, values++) {
> +		drm_printf(p, "reg[%#x] = %#x\n",
> +			   xe_mmio_adjusted_addr(gt, regs->addr), *values);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_service_print_version - Print ABI versions negotiated with VFs.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * This function is for PF use only.
> + */
> +int xe_gt_sriov_pf_service_print_version(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(xe);
> +	struct xe_gt_sriov_pf_service_version *version;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> +
> +	for (n = 1; n <= total_vfs; n++) {
> +		version = &gt->sriov.pf.vfs[n].version;
> +		if (!version->major && !version->minor)
> +			continue;
> +
> +		drm_printf(p, "VF%u:\t%u.%u\n", n, version->major, version->minor);
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h
> new file mode 100644
> index 000000000000..56aaadf0360d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_PF_SERVICE_H_
> +#define _XE_GT_SRIOV_PF_SERVICE_H_
> +
> +#include <linux/errno.h>
> +#include <linux/types.h>
> +
> +struct drm_printer;
> +struct xe_gt;
> +
> +int xe_gt_sriov_pf_service_init(struct xe_gt *gt);
> +void xe_gt_sriov_pf_service_update(struct xe_gt *gt);
> +void xe_gt_sriov_pf_service_reset(struct xe_gt *gt, unsigned int vfid);
> +
> +int xe_gt_sriov_pf_service_print_version(struct xe_gt *gt, struct drm_printer *p);
> +int xe_gt_sriov_pf_service_print_runtime(struct xe_gt *gt, struct drm_printer *p);
> +
> +#ifdef CONFIG_PCI_IOV
> +int xe_gt_sriov_pf_service_process_request(struct xe_gt *gt, u32 origin,
> +					   const u32 *msg, u32 msg_len,
> +					   u32 *response, u32 resp_size);
> +#else
> +static inline int
> +xe_gt_sriov_pf_service_process_request(struct xe_gt *gt, u32 origin,
> +				       const u32 *msg, u32 msg_len,
> +				       u32 *response, u32 resp_size)
> +{
> +	return -EPROTO;
> +}
> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service_types.h
> new file mode 100644
> index 000000000000..428a3ebf7811
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service_types.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_PF_SERVICE_TYPES_H_
> +#define _XE_GT_SRIOV_PF_SERVICE_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_reg;
> +
> +/**
> + * struct xe_gt_sriov_pf_service_version - VF/PF ABI Version.
> + * @major: the major version of the VF/PF ABI
> + * @minor: the minor version of the VF/PF ABI
> + *
> + * See `GuC Relay Communication`_.
> + */
> +struct xe_gt_sriov_pf_service_version {
> +	u16 major;
> +	u16 minor;
> +};
> +
> +/**
> + * struct xe_gt_sriov_pf_service_runtime_regs - Runtime data shared with VFs.
> + * @regs: pointer to static array with register offsets.
> + * @values: pointer to array with captured register values.
> + * @size: size of the regs and value arrays.
> + */
> +struct xe_gt_sriov_pf_service_runtime_regs {
> +	const struct xe_reg *regs;
> +	u32 *values;
> +	u32 size;
> +};
> +
> +/**
> + * struct xe_gt_sriov_service - Placeholder for the PF service data shared with VFs.
> + * @version: information about VF/PF ABI versions for current platform.
> + * @version.base: lowest VF/PF ABI version that could be negotiated with VF.
> + * @version.latest: latest VF/PF ABI version supported by the PF driver.
> + * @runtime: runtime data shared with VFs.
> + */
You should propably rephrase this description differently and remove the placeholder phrase

> +struct xe_gt_sriov_pf_service {
> +	struct {
> +		struct xe_gt_sriov_pf_service_version base;
> +		struct xe_gt_sriov_pf_service_version latest;
> +	} version;
> +	struct xe_gt_sriov_pf_service_runtime_regs runtime;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> index faf9ee8266ce..880754f3e215 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> @@ -10,6 +10,7 @@
>  
>  #include "xe_gt_sriov_pf_config_types.h"
>  #include "xe_gt_sriov_pf_policy_types.h"
> +#include "xe_gt_sriov_pf_service_types.h"
>  
>  /**
>   * struct xe_gt_sriov_metadata - GT level per-VF metadata.
> @@ -17,15 +18,19 @@
>  struct xe_gt_sriov_metadata {
>  	/** @config: per-VF provisioning data. */
>  	struct xe_gt_sriov_config config;
> +	/** @version: negotiated VF/PF ABI version */
> +	struct xe_gt_sriov_pf_service_version version;
>  };
>  
>  /**
>   * struct xe_gt_sriov_pf - GT level PF virtualization data.
> + * @service: service data.
>   * @policy: policy data.
>   * @spare: PF-only provisioning configuration.
>   * @vfs: metadata for all VFs.
>   */
>  struct xe_gt_sriov_pf {
> +	struct xe_gt_sriov_pf_service service;
>  	struct xe_gt_sriov_pf_policy policy;
>  	struct xe_gt_sriov_spare_config spare;
>  	struct xe_gt_sriov_metadata *vfs;
> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> index c0a2d8d5d3b3..c3bbaf474f9a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> @@ -19,6 +19,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_sriov_printk.h"
> +#include "xe_gt_sriov_pf_service.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_hxg_helpers.h"
> @@ -664,6 +665,7 @@ static int relay_testloop_action_handler(struct xe_guc_relay *relay, u32 origin,
>  static int relay_action_handler(struct xe_guc_relay *relay, u32 origin,
>  				const u32 *msg, u32 len, u32 *response, u32 size)
>  {
> +	struct xe_gt *gt = relay_to_gt(relay);
>  	u32 type;
>  	int ret;
>  
> @@ -674,8 +676,10 @@ static int relay_action_handler(struct xe_guc_relay *relay, u32 origin,
>  
>  	type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0]);
>  
> -	/* XXX: PF services will be added later */
> -	ret = -EOPNOTSUPP;
> +	if (IS_SRIOV_PF(relay_to_xe(relay)))
> +		ret = xe_gt_sriov_pf_service_process_request(gt, origin, msg, len, response, size);
> +	else
> +		ret = -EOPNOTSUPP;
>  
>  	if (type == GUC_HXG_TYPE_EVENT)
>  		relay_assert(relay, ret <= 0);

The code seems fine to me. Two minor comments.
But still: Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
