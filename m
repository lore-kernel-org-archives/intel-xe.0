Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AD2C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 03:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7538910E01F;
	Mon,  3 Jun 2024 03:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtLAY0EX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A3110E01F
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 03:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717387008; x=1748923008;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R1wEmTTn+HzIhTTiOZjMzsBx6yFnx+KcJEnhXkCcsgM=;
 b=AtLAY0EXRbwX4RKwSm6qblkDFjLaQ0PMYXR4gQgsZYSx2cRrzhcf6FEF
 TNdAuc3UMMpCUy2kI0iPyshE8+iB26hK87Bt5wCQDMvVShTSdKb2zHufM
 3WeSwkD5KmyGcauFlsag6Ht3otg2G1fY+RuAa6ZRELWuab9AQy46RUnlW
 z3PDOSGENloAFJK5Maxilc0rtkfpEIzBbkiC2BoONmW8ZgzTnRLNPccz7
 q64dw5mG+5KkvQFdwBt2he2PJQxH+y99xfLcX3kTZ6pJ2o9YVvL19dlKu
 kDUabnWpcxkEWiz3MaqUwOYl3qEdiuMP4Jvjg9C1IMYNd/DAT5SSXZDX4 g==;
X-CSE-ConnectionGUID: SjQlaxErSo2NDPYcSPpRpQ==
X-CSE-MsgGUID: 8z5M0EOaQ5q+d2oNKUpGJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13733974"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="13733974"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 20:56:46 -0700
X-CSE-ConnectionGUID: Om1i1qmxS8uKkPGSarX4gw==
X-CSE-MsgGUID: W7Xgr+AeQiaqT78PnokdPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="36655835"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jun 2024 20:56:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 2 Jun 2024 20:56:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 2 Jun 2024 20:56:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 2 Jun 2024 20:56:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 2 Jun 2024 20:56:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IweLmEhWDiEVrFiscchiittNZWUSuXca6KPgGP3KMjyCdfd2Esh+Li8+bu5qrL5duJFigjuOfdA92TGGjBXwt06zl1mbwJtrvr5H9Rp5IN+a9R0bxdT2tff3lrundK+FyT+GILRmjTP7vWg8omSZHe0ZTi5QCJgTG8BiSpGRqRtz0W5ihkx+TWflcdOKN+raTMvxh143FJBgZka/LdLwV0wt5jniTAUyMtmniaJT3OfxHh29fQ7vt1XZ8tmjIDcjc1QmBP6UNbDpgH32xzgOlu7vtsIWTMn/gKKuQPQ2cDW7PYN/b3IJNayxheArOSE8eutv1aIn5RfDXTHxxeQXKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDoBh0EBm7acBoLCHInPE/1Tj36N8E+24BeAXOZIgvI=;
 b=JuIvOUWrRBLsDxDXuKLTXsnJRq5Bh+Ub8J3vngXIeverdqRA+o7Tg2xrL6bZuxg+NuBYatbdGUilaP4gAOZ5sYjNXmpRcqommEYmwpNQUWhwy4mAxC2B+33ZRjamg0jyClWlvUPCZzF7UgjD4cgQxsT1iCJDcZg9M4R6i84As7sPcynjJpyR45VHqxZSnuu3J1g1eQUWdk771xCcSAUQiilZh/ioYmDVpT2pud4/3C+nSSdjWDCfzZsxJQplhgL28GTYjj/aYgW8cHUxR0Va7xAX31tbCbbJcupuxLUhieVY0uYlsl8ZP+ve0mbmlEHYx9MLCLuzWHQ4ZdSgIRGhJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB7889.namprd11.prod.outlook.com (2603:10b6:208:3fe::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.35; Mon, 3 Jun
 2024 03:56:42 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.7611.030; Mon, 3 Jun 2024
 03:56:42 +0000
Message-ID: <c4dca89d-7b9f-4d87-b4cd-d596b0d20ff1@intel.com>
Date: Mon, 3 Jun 2024 09:26:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Add member supported_domains to xe_force_wake
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
References: <20240531064845.930740-1-himal.prasad.ghimiray@intel.com>
 <ZlnsbdJz0-FIX6HS@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ZlnsbdJz0-FIX6HS@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::18) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA1PR11MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 741e67d9-f72f-49d9-fcbc-08dc83812df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amFVeDdhRlZhVVpqTjR3d1pCWGpNOTQydi9wN2NMVm5oRThnRDJGVWYrakxz?=
 =?utf-8?B?V0xFS1Q1ZDI3Q2Uramh2bzRhbjAwUUg2R1NCbHhCckdIeUNqZUdKTVR6SHJ5?=
 =?utf-8?B?UThxdlVLUm5ZNWZ1TUFIcDhGWDhHRkVHakFheXFiUnZiNXI0MmVqUjRxakxT?=
 =?utf-8?B?VTU4WEcwM01DVVMydUxrQTkvbnlwWkJTSXRrdnFGSXUyL0s4dmJTc0tSbUVw?=
 =?utf-8?B?dGlMRGNsNGZmWE85eVpCTXRXOHBwUzBXWURQYXpRVjc4WWRHQlY4eUFwcXdF?=
 =?utf-8?B?Mm8vV1Bqa3hnNmpVUlBmTEZLVFJCVHN4V2hXTDVYRkk5c2dQVjMrZkFXbGVv?=
 =?utf-8?B?Vk91ajJUM2dCbnVXMis5V05pZ1VDWDh5Rm9mdHVZTUdmQ0ZzWEFCOUZlS0Iv?=
 =?utf-8?B?Ynp3aWtITGk4eElqT01xTmxTVnVRRVY4OEhtQlUweUxMNFlOK0lzdUp1NFMr?=
 =?utf-8?B?RjhPRGE2MENibVVLT3ZGZDVDZDJFQ1lVSHA2QU81eHhINFNqdXpOcnhNTG1J?=
 =?utf-8?B?c1g5Um4wR1c4S1pJQklwK0dLVlRIYjA3QUtxbWFVeE9PYUNBYlRrWDljSnlU?=
 =?utf-8?B?cWY5RHI3VTA5SXBsZExvTGIyWVhPdXVpbVltR0NBOTNTWHRicEo2R0FUUnIr?=
 =?utf-8?B?aWpJZDBxNG5CT01sWUVSTS9RYkhLUm1HUCttbVR5dTEzbFNudU9MZWNrZlBt?=
 =?utf-8?B?eWpwNE03eVhkdENWTHZaTVBDMG1DMWJFd2xBR2JpZ0VsWnZkNXJsNmZlK3lB?=
 =?utf-8?B?Y1NUajl1ejhDZkcyMWJPK29kS28wZHVXTGNLTXFmeENMMjZ5YytwWVk4Mjk5?=
 =?utf-8?B?d1NWQ083dTJUNjhZWEFqb2lYN3lHb040WThmRUt3Y0lTZE00QjBtTlBRd1Bz?=
 =?utf-8?B?eHFkNGhUODY2blU1UnVpMUNCNW0yVXlCWnVpK1ladmJTM1dOYXc0Q2JaRzVp?=
 =?utf-8?B?VjdZbTVzTDczdFhwcHhvZ2tSNHhjYXRUN05DVFc1RjZ5dHNGelY5ZlVQTThQ?=
 =?utf-8?B?d05qN3k1TWNQeHNlQ1JZWFZWSkdrUGp4SVlBQkt2Rzl3Vjl4aXhYZkJocnBG?=
 =?utf-8?B?YzZmS3A0L2xJQXdMTFlRUTkwcnRNcWs0WDhTdFVZNU1ldHR6YVZsbm5xR0d4?=
 =?utf-8?B?WFg5LytZS1RDRTVFd3kzVGdoNSs5M3NIUHdEN2N6K1NKUHRJdjdxSjV3ZVBa?=
 =?utf-8?B?SkZZQnZieGtvVXNSV1JoNGV0QjFJa2xKUGNURkpNcGUyV29qUGtUR0xSeURk?=
 =?utf-8?B?K3N1OG40cTREVFNFVGt3U3BIdm9qWm45K0hHN3dFTGdNQkN1QWpPK0syMEY0?=
 =?utf-8?B?OU55M3Z2RGhzM0ExYTlDK3lZV2JuNllSVFZ2bHhwRGc2Yk1lSGNCb1NXRDZa?=
 =?utf-8?B?T2x3Z0g2bGtnc2V0SkEwempzMmp1MG85NWJpWDJrdll0c2tieit1aXd1VWVw?=
 =?utf-8?B?R0pnR0QxMFgwWnlCdnR5Q3Zwai9PR0d4Yk1uRUlDdUlFZHNFWmpVMjJWMThW?=
 =?utf-8?B?SVJUVlNkWTJ1N0EvbUsvREowQzFaWmpra1B4YlpOdXViWTZpNWErU0JPTVM5?=
 =?utf-8?B?OGxOU1BNMUJ1aEZlWXI4eis0a3c0VjJTNWpEMmJKQVZWRUwvWDFoK3BXY015?=
 =?utf-8?B?ME9VSzBlWllNdmYvUk1SVGNkSVNsdS9KeEdsYzkyUnc3dHZGaVlpUHptTE9x?=
 =?utf-8?B?U3ZMcm0vNEhvWG5QdWxkb3dqYllvMFl1Mmx2V2MrUkt3K2pWdHZhMU1nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDVuV29SRisrWkR2K2VoeE1OQzVNT3B2TW54RHFQNGRiM0hxeS82S0RWd2dS?=
 =?utf-8?B?U3RqM3orclpyeE0vMVowdDdkTmQ3QVhESENnRXZBWFhOVll0R1JTKzEvTEVi?=
 =?utf-8?B?aTNFN1ljeTNUYlpSZWRCUnBOenErTmNIQVVJZS9YbHVWanVFbUJ3S2pzUjcz?=
 =?utf-8?B?QUZreWJiTlVBSDNyNGQ0R2VzS0VudVhLYXFQRHBvNU1UUjdCUDEzWUJBQkJV?=
 =?utf-8?B?c0gyVWszSk5ZUVdaRVFjaFFTT2paQm8yaXQwUk9KWUkzY05IR3g2UDNiSVdV?=
 =?utf-8?B?UTROMndLOERNaGhDQzBUS0Y5blBCZ0U1MjIzOGxSNTFyV0x5eGtTT0VkSmNV?=
 =?utf-8?B?OWIyaGlLMXltMkxSVHlUY0tIZ0FLbCtkRVNJM1Z2NG85N09BR3N3ZjB0TlBj?=
 =?utf-8?B?elhIVGZkdVU1d3hKN3J0aEdsNHZpNmxEWWFPenBmdG11blE4SXZRVEU4WUxJ?=
 =?utf-8?B?cjZrKytSditpRHJIRzRRR0Y3MUFRSnVNcnFNZVZkeXlHNmVCOVJ3dkJ2bHNq?=
 =?utf-8?B?aHkwY1NnYzBhOFJFVHpjNExrMUZXSUo1djNWNlNOYmtQcjhmM0xiVEhtcTdh?=
 =?utf-8?B?VjF2NVhiS3N4RG1KSmZ1VTBsbWRoNkNuSHpkZThtdHppNmhTaFRWRGViVnR4?=
 =?utf-8?B?SlZzeVZJdGw0SGV1M0psR2poWVVEbUJwRmw4MitMNHpmL05BQ29FR2tsbXZP?=
 =?utf-8?B?TWdVMVVnY3dWdDNxZXpIS0drdldWSVBWUlBmSmNhY25adzB5SHJHeE11bzg3?=
 =?utf-8?B?dU8rTm1MMS9DRk55dE9IRis5VmxsdjVPZk5WRTVZTkVOejRVc1l4czltbkVW?=
 =?utf-8?B?SWUvOHhQMlZyN0Q2akxSNFJjTkxCMXdzRFN0eU1CejBqbUh1amFYT1RvQjY1?=
 =?utf-8?B?UVdKUWVkNE9mT05vMFN5UFJDei8xTTg1ZjJ1VUxUUkkyMlJCRlBwY1dSdFF0?=
 =?utf-8?B?UGRDLzBLUkdDelN6QUp5cC8zWHhQMkpuemV6SGIxRGQrT250QmdaSzhlcHZH?=
 =?utf-8?B?OFVESU1mbzNYR29iME15V0ptSWd6dXF5a2ltYkJ2NFlSZnNuKzdnaWREaVNw?=
 =?utf-8?B?QVpjSDZyQzlOR2hzQzkvTE45MTlWVmRVZThQVGIwZFJpMjZjZkRWekNKdTVq?=
 =?utf-8?B?Y0FxOFNTcytzUSthVCtFUVpzc2VEWkw1YWF6c3dvYVhidHNLMDBEbXJNMGt5?=
 =?utf-8?B?aW9Ma2RtblhQaDdqUFJWYU9mdGlCVG51QXEvc1Qzb2tuWmQ0R3RibGVGQ3Bq?=
 =?utf-8?B?MHA2dUZrYm9VaFVrR2VYT1NabVBSTG5oQUVHR1Z2dnY2TUltWHd3WTIrR3RS?=
 =?utf-8?B?U3V6MEVLQlhYekw4ajlUYnl6d1AwV1gwb1FVdVZVeFZYOWFnYWlLbEVkai8z?=
 =?utf-8?B?RTRudHZwdHgzTnh3YnNzbFZGMXBGSk5DWTNQNldPSDRabWtsQVMybzdRZHEv?=
 =?utf-8?B?ckZSaThrL3BKK0pGOEZybFQ5VkhuS1RkRHl6ZWppb2xEZFVmT01iQXdnaHBP?=
 =?utf-8?B?SldkVmVaWXY1NUl0T0hwdTVNVzRKUXE2RXUzV2VBOVI3Wm9RYkgxeVNUNDFD?=
 =?utf-8?B?Mm1PSE9PVmRnWTUzNUJaYnM2bmttWWRLVkJKUzlTSnpiMnNBdnRzdlZjaklC?=
 =?utf-8?B?NkdhbFgxVjZlMndDM2FISmFWaHJhSlB5cDR3Qm9jWE43RUZOd1k0QVlWTlk5?=
 =?utf-8?B?MzJVNktPWnUxK1lzS0g3TVcyVEFTditDNjBrVzEwUUhndXoyUGwweDRpVGFj?=
 =?utf-8?B?N0Z3RWw5RXVDcUhidVhKNzBYVktsNFlsQVl1cDJ0ZzBpSHYvMjJ5Vmp1MmIz?=
 =?utf-8?B?Q2JaVlQ5TEZ2UnBwSmdNUHJOdmZMR2pGWjV2ZjZiaEx4OEoxRlcrSTZxWjB1?=
 =?utf-8?B?U1NYaTY1N2NhbnFMUE1lZkM5dHNIWlQ5cWFBOFhnZW5OYVZnRkQ1RmNBQXpy?=
 =?utf-8?B?NkdDTzFCYnNpSEN1aFNYbEZkYnkwSkFFcE0xS1VnV1luRjlVTFh6Ym5HT0xt?=
 =?utf-8?B?Y1JwdXBjdndtcUlLWHQ0MW1kSnFGNzAyWHVGclgwd2hPUFIyL3VEd3JjKzBp?=
 =?utf-8?B?a21xRHhZOGdZNFUwQWhCN2t5QkZEdzlmdzdzYnhReDZMd0gxWVozbFFYTXlk?=
 =?utf-8?B?enNSV2MraS9CMTU0SG41a091MCs2WEZhKzZQM21RMTN2TGZwc3IvWVBqbzNL?=
 =?utf-8?Q?c7IhDzLhOqKD5uKs1R1PpjE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 741e67d9-f72f-49d9-fcbc-08dc83812df1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 03:56:42.7546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnwF88KVpbfz98yUAfrYO40XGzREJopasHd5XNOzth4fWSHG9PFIiQnQmaBQZ45MmaIYMMLkZXQzKIk/A6n0PXF3LGGxSQKf2FW2MEGDs60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7889
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


On 31-05-2024 20:57, Rodrigo Vivi wrote:
> On Fri, May 31, 2024 at 12:18:44PM +0530, Himal Prasad Ghimiray wrote:
>> This field serves as a bitmask representing all supported forcewake
>> domains on the GT.
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.c       | 48 ++++++++++++------------
>>   drivers/gpu/drm/xe/xe_force_wake_types.h |  2 +
>>   2 files changed, 25 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index 9bbe8a5040da..a2947f0046d4 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -26,15 +26,25 @@ fw_to_xe(struct xe_force_wake *fw)
>>   	return gt_to_xe(fw_to_gt(fw));
>>   }
>>   
>> -static void domain_init(struct xe_force_wake_domain *domain,
>> +static inline void mark_domain_supported(struct xe_force_wake *fw,
>> +					 enum xe_force_wake_domain_id id)
>> +{
>> +	fw->supported_domains |= BIT(id);
>> +}
>> +
>> +static void domain_init(struct xe_force_wake *fw,
>>   			enum xe_force_wake_domain_id id,
>>   			struct xe_reg reg, struct xe_reg ack, u32 val, u32 mask)
>>   {
>> +	struct xe_force_wake_domain *domain = &fw->domains[id];
>> +
>>   	domain->id = id;
>>   	domain->reg_ctl = reg;
>>   	domain->reg_ack = ack;
>>   	domain->val = val;
>>   	domain->mask = mask;
>> +
>> +	mark_domain_supported(fw, id);
>>   }
>>   
>>   void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>> @@ -48,17 +58,11 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>>   	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
>>   
>>   	if (xe->info.graphics_verx100 >= 1270) {
>> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
>> -			    XE_FW_DOMAIN_ID_GT,
>> -			    FORCEWAKE_GT,
>> -			    FORCEWAKE_ACK_GT_MTL,
>> -			    BIT(0), BIT(16));
>> +		domain_init(fw, XE_FW_DOMAIN_ID_GT, FORCEWAKE_GT,
>> +			    FORCEWAKE_ACK_GT_MTL, BIT(0), BIT(16));
>>   	} else {
>> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
>> -			    XE_FW_DOMAIN_ID_GT,
>> -			    FORCEWAKE_GT,
>> -			    FORCEWAKE_ACK_GT,
>> -			    BIT(0), BIT(16));
>> +		domain_init(fw, XE_FW_DOMAIN_ID_GT, FORCEWAKE_GT,
>> +			    FORCEWAKE_ACK_GT, BIT(0), BIT(16));
>>   	}
>>   }
>>   
>> @@ -70,18 +74,14 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>>   	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
>>   
>>   	if (!xe_gt_is_media_type(gt))
>> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_RENDER],
>> -			    XE_FW_DOMAIN_ID_RENDER,
>> -			    FORCEWAKE_RENDER,
>> -			    FORCEWAKE_ACK_RENDER,
>> -			    BIT(0), BIT(16));
>> +		domain_init(fw, XE_FW_DOMAIN_ID_RENDER, FORCEWAKE_RENDER,
>> +			    FORCEWAKE_ACK_RENDER, BIT(0), BIT(16));
> Since you are here, could you please add some meaning to these undefined bits?


sure.


>
>>   
>>   	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
>>   		if (!(gt->info.engine_mask & BIT(i)))
>>   			continue;
>>   
>> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j],
>> -			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
>> +		domain_init(fw, XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
>>   			    FORCEWAKE_MEDIA_VDBOX(j),
>>   			    FORCEWAKE_ACK_MEDIA_VDBOX(j),
>>   			    BIT(0), BIT(16));
>> @@ -91,19 +91,17 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>>   		if (!(gt->info.engine_mask & BIT(i)))
>>   			continue;
>>   
>> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j],
>> -			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
>> +		domain_init(fw, XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
>>   			    FORCEWAKE_MEDIA_VEBOX(j),
>>   			    FORCEWAKE_ACK_MEDIA_VEBOX(j),
>>   			    BIT(0), BIT(16));
>> +
>>   	}
>>   
>>   	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
>> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GSC],
>> -			    XE_FW_DOMAIN_ID_GSC,
>> -			    FORCEWAKE_GSC,
>> -			    FORCEWAKE_ACK_GSC,
>> -			    BIT(0), BIT(16));
>> +		domain_init(fw, XE_FW_DOMAIN_ID_GSC, FORCEWAKE_GSC,
>> +			    FORCEWAKE_ACK_GSC, BIT(0), BIT(16));
>> +
>>   }
>>   
>>   static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
>> index ed0edc2cdf9f..4179fc51291e 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
>> @@ -79,6 +79,8 @@ struct xe_force_wake {
>>   	spinlock_t lock;
>>   	/** @awake_domains: mask of all domains awake */
>>   	enum xe_force_wake_domains awake_domains;
>> +	/** @supported_domains: mask of all supported domains */
>> +	enum xe_force_wake_domains supported_domains;
>>   	/** @domains: force wake domains */
>>   	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
>>   };
>> -- 
>> 2.25.1
>>
