Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799E8CCF9E8
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 16:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477E110E102;
	Wed, 25 Sep 2024 16:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KLzjq518";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68ABA10E102
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 16:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727282183; x=1758818183;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I2yq4A0YJL3uWes6+0HlNJhd3kEPnZSrN5T7ytcwEgA=;
 b=KLzjq518Lr+SUT/QHbvVsJl4VV/wdPY24TPT1a/HApX5dlIJly2RJ8j9
 fUMdrpYjWIDBPVxaJW/38aNAntviw0/x/yw9azZFGdnTLjcQnRNsVm+Mu
 C8/9PeSlGpvv/UHzAyCU0TYUN0rbquhyBwdh5s6uKiSMGR8LbF4hYLnxE
 Lvtn9xltJR8BDvJgoTybEnKLb3pn5EOoNw6yhRh+i9wP7i5vQX7MVx3kh
 Xvx+zpG/1zQzrUDcxXfTo1aDiOZd7298/HDTDI/IfslyBC+i1brzQqKsz
 yWSEQPNzw8cKGVBIkYIoMNKHB/ErBszSbUgocdJSO0E6pSxWXwQylSu0a A==;
X-CSE-ConnectionGUID: ReqncsKuStyz3QiIi8elwA==
X-CSE-MsgGUID: eUQQGV1+QhGjHV1E/Oragw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26216685"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="26216685"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 09:36:22 -0700
X-CSE-ConnectionGUID: 5EdiN82ZQt+oefA3BpcHKw==
X-CSE-MsgGUID: zsxY0heVSDK/zRf7jAPvFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="72140110"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 09:36:22 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 09:36:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 09:36:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 09:36:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 09:36:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXoMczOKz7LXUrX56H9CqnzK2jIG74zth7cMLjYoRURmkXATLgwZAWbDdcjfhRTqyBF6Hb8fLGsTojIRrNE65PJ54VQMUu5+nE85pGZRu2bznkQ3oEHawHxTFl/nJl5Vvoe/ccKa9G3Ad3v/yxo2UC96JGXhOvx8Gh9HLUfZQYz3/xP2ty9aMmGCM0MqzZZQzjRLrrPRT6Up1KVys03hcP3ymQBLnOxPUi8MoeiOOfo9wZY0j09hUI2Mryi1/cz3RpJdItwWjCkBiIiEdsGRufIBEFaJYCyeuBcbdgLqwPgRR1+lwTMr3H7Di+yULycYKmDHkKSVmhGhzI2RWyiyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7e6SHUQ2aSZKkeu5ahT5907ZqImqrhMbfKXNQEB+8g=;
 b=JhxI6qVBnr50UTJ3Tt+7OADJyIo/azPMBY87/U+1ZggmC93RTWuwmeWZI2O6+dgyo0RQkng/0zMU+xe3wX2gUV2VIy0IGbJfhnvylKCuNB9/msgJrSTDTFkhU8BfYOzHNWmpbvUKv6VOA1Yu/+vwj1XpicvfXhztjyAEQOrlW0Z2wsH+PeAdqvnYuAGwS9TSl7VQQDvTtvDT5xvsyfT1czadFgHj/YyY4eDUMroxnGyLSh1HQJf5y6JsIqJK+NY5hyHGuk5izsip8vLykeXrVRKgfpbEf2Z9/mD53i7YdRE0F1w+QoPTcQ04pDAF9FM4aBi3RjBlBv/3fiBm2VusRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN2PR11MB4566.namprd11.prod.outlook.com (2603:10b6:208:24e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 16:36:18 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 16:36:18 +0000
Message-ID: <337515e5-83f8-4969-bc79-f1d380a31330@intel.com>
Date: Wed, 25 Sep 2024 22:06:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/23] drm/xe: Error handling in xe_force_wake_get()
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
 <20240924121641.1045763-2-himal.prasad.ghimiray@intel.com>
 <f10c3f76-aac8-441f-80c1-c7e2632136f6@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <f10c3f76-aac8-441f-80c1-c7e2632136f6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::32) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MN2PR11MB4566:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4e1ae8-c35c-4356-5249-08dcdd802e15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUxRbi9jcmo2OXJlTXdzRThpMW9mZUVmRWNTM01GOE1DSDRrSlZlSFNudWhy?=
 =?utf-8?B?OGcvZENQdDkxNEU0UkMzR3ZEZTN5VkRUUkhReitPOEFDazNEMk10elJIb0pW?=
 =?utf-8?B?dGpKSGxienVPTDVNL1Z4a011VkJCK0R1THRoelE3ZmRZN0FOVCszTk5qMnRs?=
 =?utf-8?B?SUt3aWxpYU1BYVFBVDVjdkY2YlBVK3lEM3pYazQ0K2ptcHJ0K1pFOWpoRVA2?=
 =?utf-8?B?NURkbTcza2VGYnFMNmpRSDF5b2ZuODVvbEhrMUREa3ludnc1MXgvK3RVb1BE?=
 =?utf-8?B?My9ZYWZva051TUZ2dmxvTHJRV3ZaWTN6bzIyZ1NhaVJQRjgyMEdoSGZrUk9H?=
 =?utf-8?B?eFBHSkNlQ1ViZ0poZ3o3KysraHJtWFU3eTJaQ3lBaGRCNUJDbm1VN0dkSTFG?=
 =?utf-8?B?WE5oUit5LzR5cFQ4UHlWRUxYZmRDQXdkUUxaVzdQK3VKQzduTWxMNDhLbGw2?=
 =?utf-8?B?TmJGN3dWdGVkOExJRnh0NUQxSzRnZng4TXNQOFNPTU9peFZLWXAxbDgwSXlr?=
 =?utf-8?B?UG1zTWxpVVZnNlRRVndJenFiZSt4R3kremF1bW5LOG4wMytoblY1RGtBODR4?=
 =?utf-8?B?ZldpOGJHUlduZzRnR1JuUUxVN3BONXl4ZEluTzhXLzl5eGhyMmNZYkQvN3RI?=
 =?utf-8?B?Vm55NE5DRk1UZXJFYlkvckcydFJ0T1Y3SmQ1L0FERW5MNkNocFZ3YWs4Uy9P?=
 =?utf-8?B?S1VnRWZKNmRra3lDcDJIRU56SDN1MVJ1RS9MbXRNcndzZTNxaHgxaFN6Vnlo?=
 =?utf-8?B?aDBSYkNzb2RmTm9jeVVJakZWMm5ocFIyNFl0Q2JheGs2d0Y4a0FFZjgwVWRs?=
 =?utf-8?B?OWZPdC90VnA4TUlwMEs0TEdlZzJ1dXJUL2laNFJjREVrV2R4cTk1Skp0ZDN2?=
 =?utf-8?B?L0FkMnFqdU42SkYrWVNiNmVsdGRPL1BMOE9qM3pPek5HTFFxdlM2ODVDWW85?=
 =?utf-8?B?eVF2ZCtqSlMvNndTa2FCeVNMOWRydzJkYXovMXhRTk8yb0xDdXJBTFRiMHpO?=
 =?utf-8?B?akZoY0xFYytVcjQ4ZnUyMkdRMHlqa0lOVWRVb0xzdHhwT2s1Vjk2RDBRdjhn?=
 =?utf-8?B?V3hYYnZUQW85VDVzdy8rSkRnL1FwNHlXa3RNSThjNFJMQlA2RktYODZmR05r?=
 =?utf-8?B?aWduZm1qSWhYM1hPSUQrRXloMHZTWWpCYkJWZFhxZ3ZUKzBOeFZSTGIrMS9L?=
 =?utf-8?B?eTd5bU5JMk5GalFCeVc1TEtmNHYwSUJsQUp0YUZPL1RmRGYvZVYrMjdpSmVs?=
 =?utf-8?B?RkZ4eXNIUTFPdU1EaE00Rk9lSHd2dllTVGIyejdIcFdxYmVKVnZFZ28rWlhU?=
 =?utf-8?B?b3VnNEZoVCs3UTRJUUs5aWNWOUtLTDdZSlRzMkhURENoVkdsZWtLRys5RkFU?=
 =?utf-8?B?L3ZQYTBNTG80bFpUQjhBTzVkaGduYWZjRDduSGc5Rmh5NDgxempNem1RTGJM?=
 =?utf-8?B?VVlLUlJBQ2lFd2UyTXhYUmppN2V6eVlERXNCaU1ONCtscnNHMG1ybG5pWWYx?=
 =?utf-8?B?MGJrc1FMQnY4TWxOcUZZR1dSVXp5cVNXR2I5OW1zeUV3REhUTWRwZjBod1lH?=
 =?utf-8?B?ZXFYMHJ5SkZTNEttYjA1UU5zTGFsYUxSZ2ZhdHRwVmJYdzhEZnlqdzRxNUZm?=
 =?utf-8?B?NWpHMGVXTGNVd05GZUVCZ0lwQkhtbDdLZHRsd1RxalJnUjRGNnUxVnZ4VGpF?=
 =?utf-8?B?VkdJRExNWC9uRFpEK0wwYmg5SlN3MWlWbWI0MmRrMTI2cUwvTU55eHlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2dLMkV6VnpyQW10MmpNck01QXA0eEFMR0pHcFRTcjgwUW1Ec2ZsYjZ6cSt1?=
 =?utf-8?B?MEVZQUFhT3orS3hZUEJQaDU4d3pxY2Q5cHVNVDQyUTZOQnhwYzZCNjRoWUZi?=
 =?utf-8?B?RFZKRmRib0tqQnhzMU5ONWp1M2M2Q3R2Uzl3WXZad1R3QzRqeFU5NWVOVmJR?=
 =?utf-8?B?QjQwc1BjcjhwdXFxTUIvRHptcW42Qmc4QVVWNkhlTDZDMmpLQzY3TS9XVU9a?=
 =?utf-8?B?MTJwRXZ3Wm92SWkzVlA1VkhEWVVoOE40KzdRc2dIZVVWb1N1MzA4czNVM3RM?=
 =?utf-8?B?Z0JNMnNDZTBOaDdFQ2hyc0Y2ekJibENFU0UrTlg4WnI4MENzTmtjQjdnVDlm?=
 =?utf-8?B?KzZUVTBSTVFYeGZrWHQxZFBvYmlMR2lsU0JIaTBpVURId3FJcFlBeTZaMjR6?=
 =?utf-8?B?VXRTWFVCUlkvczFBNDFYOTVUbXYrU3JMdGtKUWdRbGNqc1p5OXpZN1VZMEhh?=
 =?utf-8?B?WTdIcFo0VWtoamRJOHFRbXdvVHFHNmFDdDRBSzA5WklYbUVYeGdqVFRLQVRM?=
 =?utf-8?B?SmgzVUdyRDdKZlF3ZFU3aU5YRlV4b3Q1akJTU3V3ZklIN21uSVY5NXdoNitl?=
 =?utf-8?B?VDMzN0Z1a0oxR1JhS05GbTJLQ1pDbytmWFRydHp1dGtMVGRVRVczRW5NdlBS?=
 =?utf-8?B?Wnd1MExVU1ovSDBsSmdwaGhBK3VhNFFXN3dpMFlrOEYrT29LQklPSzBGc04w?=
 =?utf-8?B?T2NuWUR2QjhFclBWbXRJSFlPdTNsdlZhdlFWUldWVTJ4NmtNaTBMK01QNG10?=
 =?utf-8?B?bENjaVZxR3VWT1pnL2VvWFpmVDNlWXBEanMxYklNZ2ZrdUhsdVFzUHZ5RzRD?=
 =?utf-8?B?NmJ1UkE4amRwK0txbUltOXJBdkppeXd5ZytZcGN2RGQ4cG5OK0JuUWoxNVpk?=
 =?utf-8?B?WkplMnIwZG4vWDJqRVdiN0JrMFFyNDZOTE9lUmhjVnhKYjVGbTBQeStjNXZ6?=
 =?utf-8?B?bUExTnpNUEhJZVRHWm5EbFlRQjRaNXArYnc5SDJxcFhWb3JJQ3FyTGRZY2Y3?=
 =?utf-8?B?c0xsRDlMNGcxOTMvYmJ5TmYrTmg0NWU3anFLS3V6WGRIK2UxNDkvdUFOcDg0?=
 =?utf-8?B?dm1LbEtJTHdVb2F0eEUxc1lua2NqSjI3Z01jd3hnMkNwd2QzV3RXQms5MTd2?=
 =?utf-8?B?ZHNnMUFIenBreFJmNm5PTk1adXlyNEIrZ2tSNVRZM1NPbml1TXJqTEVOcVVu?=
 =?utf-8?B?ZWVIeEF0dVZJSG5HWEdZdDBLVlA2Y2Z3Wk04WmVzR1I0dk0wV0ZWaVkzRWNY?=
 =?utf-8?B?N3FjaWRpMngxODdheXUxbWhjR09hVHFlN29XU21RYkZ5VldoQU9xcnZ5Mkwr?=
 =?utf-8?B?SlpZTnZuSklLUXY5eUlLSTVPMlRXa0VEWEFzRVZBTFdBRUVUL1hBbG1oSy9O?=
 =?utf-8?B?dU55cmRVY2hRR3hPZTh4RVZOSW1uUFI1cTRwR3VEVlpycXcrUjVEbTFjRlBa?=
 =?utf-8?B?TDRlZ2xNSi9hRmYxWllkbVJrblhZODIvYWhmSHBJN0VjSzB6c21YNkZaZUxN?=
 =?utf-8?B?ck54c2pFdWdlMHVNSVZHRTQ5SnV2MFBaOTJ4SkUrdlI4THRvZVNwdFpFMWtT?=
 =?utf-8?B?M2loYTBGK2ZKbEhOcG9pbWwrbzFUc0ppSWNzTmdMSmM4MUxxQU8vSEd6YVdq?=
 =?utf-8?B?QWVZRG9vMlhmMHJoSVZzTnhMdE5wbzNucTZLUktPOThOR0lqUjdKRDQvcU4r?=
 =?utf-8?B?OVlhWDFxaDlCVE1QSVpRZlpYQnNTMC9FclRSYlBzcUwySmFrZklVbzJMcTRu?=
 =?utf-8?B?SS9ER1B1bEVuRGNzbTV4MlVacUVRMkEyUnVZZjhxU0JSWTRNT0lSbFIrSW9p?=
 =?utf-8?B?WFlkMGtqZ0dpeThOM2FHWG1GSGNwNDNycTVMcDFOaWZYaSs0b1Vha0t6MEdu?=
 =?utf-8?B?MmdZSkx5Nzl6Uy9xK0tsQlh0UEFmUkttVXhuR2p2Z2NNN1UyMVRUZ0VFRlRr?=
 =?utf-8?B?S28vNWc2eDhTL04zRmFFd01WeW0xVjQwcU8yS1FJWXdoU3k0cE1MTFFlUGVH?=
 =?utf-8?B?NC94YUwrd1djRWE3RFB2ZlZqbEpwVTU2b25zcC9NS2hVRmpGZTB5c2p5NTFB?=
 =?utf-8?B?Wm95SGhiN040azdLSkZUN0J5WEZkL0dLMGM5dndweExDOFd3eUJqVU8rN0NN?=
 =?utf-8?B?OCtmam9FOHZPUG1jTU9BZzdvMmxicm9YQmlUdDdZZHlJSi9KZjN1RFkyZFM2?=
 =?utf-8?Q?0IUlAV6qTY/J4VM1HmhG5/s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4e1ae8-c35c-4356-5249-08dcdd802e15
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 16:36:18.1546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T36R2e8T0ooBDnGcFxv2iNSnxHCCjqqNipq2KQO+udxLPziwrWRGIk8Y19ygsyWe53bEWtNijb6ig2vccIocpfOS1oxsBpEtM7SRduqmjhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4566
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



On 25-09-2024 17:31, Michal Wajdeczko wrote:
> 
> 
> On 24.09.2024 14:16, Himal Prasad Ghimiray wrote:
>> If an acknowledgment timeout occurs for a domain awake request, do not
>> increment the reference count for the domain. This ensures that
>> subsequent _get calls do not incorrectly assume the domain is awake. The
>> return value is a mask of domains whose reference counts were
>> incremented, and these domains need to be released using
>> xe_force_wake_put.
>>
>> The caller needs to compare the return value with the input domains to
>> determine the success or failure of the operation and decide whether to
>> continue or return accordingly.
>>
>> While at it, add simple kernel-doc for xe_force_wake_get()
>>
>> v3
>> - Use explicit type for mask (Michal/Badal)
>> - Improve kernel-doc (Michal)
>> - Use unsigned int instead of abusing enum (Michal)
>>
>> v5
>> - Use unsigned int for return (MattB/Badal/Rodrigo)
>> - use xe_gt_WARN for domain awake ack failure (Badal/Rodrigo)
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.c | 37 +++++++++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>>   2 files changed, 31 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index a64c14757c84..d190aa93be90 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -150,28 +150,49 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>   					 (ffs(tmp__) - 1))) && \
>>   					 domain__->reg_ctl.addr)
>>   
>> -int xe_force_wake_get(struct xe_force_wake *fw,
>> -		      enum xe_force_wake_domains domains)
>> +/**
>> + * xe_force_wake_get() : Increase the domain refcount
>> + * @fw: struct xe_force_wake
>> + * @domains: forcewake domains to get refcount on
>> + *
>> + * This function takes references for the input @domains and wakes them if
>> + * they are asleep.
> 
> nit: likely we should also add the note that one shall call the
> xe_force_wake_put() function to decrease refcounts

Sure.

> 
>> + *
>> + * Return: mask of refcount increased domains.
> 
> do we really need to expose implementation detail to the caller?
> 
> can't we just treat the returned value as opaque data that just needs to
> be passed to the matching xe_force_wake_put(fw, ref) call ?
> 
>> If the return value is
>> + * equal to the input parameter @domains, the operation is considered
>> + * successful.
> 
> sorry, but I'm still little uncomfortable with such approach, due to a
> mismatch between input parameter type that is enum xe_force_wake_domains
> and return type which is unsigned int, as IMO forcing the user to
> compare two different types seems wrong

Sure, I understand the thought process behind it. Will a helper to do it 
is OK. Justifying below for the helper.

> 
> can't we just say that if returned value is zero then no domains were
> waken (which would provide definite answer if single domain was requested) ?

I am concerned  about the scenario, where user ends up considering non 
zero return of FORCEWAKE_ALL as success.

Having multiple success or failure condition for same API, based on 
input parameter looks bad design to me.

ref = xe_force_wake_get(fw, GT)
if (ref) -> means success condn

whereas

ref = xe_force_wake_put(fw, ALL)
if (ref) -> doesn't necessarily means successfully awakened all domain.

User can very easily interpret it wrongly:
ref = xe_force_wake_get(fw, ALL)
if(!ref)
	error_handling;

/* Irrespective of failure or success of xe_force_wake_get code reaches 
here */
do_multiple_operations(); /* Needed all fw domains supported on GT to be 
awake */

xe_force_wake_put(fw, ref);

We have use-cases throughout the driver where user relies on 
success/failure for FORCEWAKE_ALL domains.

> 
> and for the xe_force_wake_get(fw, ALL_DOMAINS) case, we can provide
> helper function that will check if specified domain is really awake:
> 
> 	ref = xe_force_wake_put(fw, ALL_DOMAIN)
> 
> 	if (ref) {
> 		xe_force_wake_is_awake(fw, SINGLE_DOMAIN)


I assume this API is to check whether ref has domain in it or not. Will 
be good helper to have for such scenarios, Which are currently not there 
in driver.


> 
> 		xe_force_wake_put(fw, ref)
> 	}
> 

I believe a helper to determine success or failure of force_wake_get, 
instead of caller doing it will streamline all the domains and usecases.

int xe_force_wake_get_status(enum domain, unsigned int fw_ref)
{
   return  (fw_ref == domain) ? 0 : -ETIMEDOUT;
}

Usecases:

A) No error check, just continue in case of failure too.

ref =  xe_force_wake_get(fw, domain /* can be ALL_DOMAIN */);
do_operations();
xe_force_wake_put(fw, ref);

B) error check, abort in case of failure.

ref =  xe_force_wake_get(fw, domain /* can be ALL_DOMAIN */);
int err = xe_force_wake_get_status(domain, ref);
if(err) {
	 xe_force_wake_put(fw, ref);
          return err;
         }
do_operations();
xe_force_wake_put(fw, ref);

c) get all domain, but check specific domain:

ref =  xe_force_wake_get(fw, ALL_domain);
    if (xe_force_wake_get_status(domain, ref))
         dmesg_warn( "unable to awake all requested domain \n");

     if (xe_fwref_has_domain(fw, SINGLE_DOMAIN))
         do_operations()

    xe_force_wake_put(fw, ref);

>> Otherwise, the operation is considered a failure, and
>> + * the caller should handle the failure case, potentially returning
>> + * -ETIMEDOUT.
>> + */
>> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>> +			       enum xe_force_wake_domains domains)
>>   {
>>   	struct xe_gt *gt = fw->gt;
>>   	struct xe_force_wake_domain *domain;
>> -	enum xe_force_wake_domains tmp, woken = 0;
>> +	unsigned int tmp, ret, awake_rqst = 0, awake_failed = 0;
>>   	unsigned long flags;
>> -	int ret = 0;
>>   
>>   	spin_lock_irqsave(&fw->lock, flags);
>>   	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>   		if (!domain->ref++) {
>> -			woken |= BIT(domain->id);
>> +			awake_rqst |= BIT(domain->id);
>>   			domain_wake(gt, domain);
>>   		}
>>   	}
>> -	for_each_fw_domain_masked(domain, woken, fw, tmp) {
>> -		ret |= domain_wake_wait(gt, domain);
>> +	for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>> +		if (domain_wake_wait(gt, domain) == 0) {
>> +			fw->awake_domains |= BIT(domain->id);
>> +		} else {
>> +			awake_failed |= BIT(domain->id);
>> +			--domain->ref;
>> +		}
>>   	}
>> -	fw->awake_domains |= woken;
>> +	ret = (domains & ~awake_failed);
>>   	spin_unlock_irqrestore(&fw->lock, flags);
>>   
>> +	xe_gt_WARN(gt, awake_failed, "domain%s %#x failed to acknowledgment awake\n",
>> +		   str_plural(hweight_long(awake_failed)), awake_failed);
>> +
>>   	return ret;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>> index a2577672f4e3..6c1ade39139b 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
>>   			   struct xe_force_wake *fw);
>>   void xe_force_wake_init_engines(struct xe_gt *gt,
>>   				struct xe_force_wake *fw);
>> -int xe_force_wake_get(struct xe_force_wake *fw,
>> -		      enum xe_force_wake_domains domains);
>> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>> +			       enum xe_force_wake_domains domains);
>>   int xe_force_wake_put(struct xe_force_wake *fw,
>>   		      enum xe_force_wake_domains domains);
>>   
> 

