Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C304C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 17:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3187610E29C;
	Tue, 11 Mar 2025 17:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtftH9jL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD7D10E29C
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 17:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741714060; x=1773250060;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I+4mQ26HBRqz4wf/UmPHqKHB6aP5S15T6K8PxoCxR3o=;
 b=AtftH9jLoiUnsonJ1AxFE3yfCwXRA8v00qWq6hZ4TPk7v0rndHwmHLcb
 SPL3g1LVWJykmqZ7se3nX0SszkIBY8xTr7XdierWZzerz5aU7yCEK8rI/
 KNBAWl8TulUTe+NqaK+zHB/Y0LGXqYy1Ry4PP2aOw+8e04M1Si9INB90d
 +eTyLAij+9hKKa/5LOncUzObltGuU1Q/1S0dqPV8EhbTcyoCd5R4LUtZA
 WtZ9SrjU+ILtyDIHNtcNhZufUCmdquiF6nx7aSJwnRt+qbpM5OJUWtbVU
 mnL3YYer1L86G2msuCahNfC+837Jk1VGn8GJhEGxIAJVapYQuja1c+Guz A==;
X-CSE-ConnectionGUID: 9RO737CoQ2uQIU83KQl4DA==
X-CSE-MsgGUID: tWjDcc+GSUan9NG0//VMww==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42022077"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="42022077"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 10:27:40 -0700
X-CSE-ConnectionGUID: BBCUsfHBRAm9H90h77lqrg==
X-CSE-MsgGUID: 6NFW1ObaRg20FZrCtzuRlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="125447100"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 10:27:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 10:27:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 10:27:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 10:27:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Um4w/k7CipKiyxx5yTkfw01cnvus1oaknwaPwQ0NEJuqUJ/uSJgNLmCgGUnFjclGbqbnxXWlpf+ypH0P0OljuOPir/OyFFRy96YufKwuETUGNbdDvnHDvJKV3s6zCSKtGm8HwbP3E390yuF57DbMjtXsTwZoayUsC5twe7Z3xqNjv9agpiV0YEkWA5P1bne54eSX1AE+gdvU+jpKS5Gs+jP7OZbEMMtoN8few2ZZGNwbFLFdTFmAh1CXKU2nSVij+RPfqOutu99ReDBZWGJa8T85sP+Mh81oq33VmGbBNGkuzdxqjcCtoJdipxsfxNhRKPoV9HamHEC9EWuO3siQZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LR/SQBG4ONQOAdO7ASwjlGSlifBSzkGfCy+WMvSt/jI=;
 b=FKJPOZ1+gQXuV5H92HDgCHnYSF12WfqF9qLihhkmHwMyHTRL+AXI/vws5wbhZM1r2GLNOiM4iXheH38w+azwYWHFZQzAdYwSHPcyX2eGNatDkihXvvD895cQNZ8g/JURPSqiq4ePQ64ygiDemJeKq207taxDr3P/La/k1nPlVTZf5GRUsIFUhk0+p5KUyd/TklfJVvU4vKEKQ8gcJ2S0vjwfA9MQH1/G4o7zE/OzMPoOL7ENudwdWQOrM0Ib3apTnm5DW4g/2K1IA9rZbMc7N7AItBZ7aXatYIWE70r+qBzfKKng7mQMD23GaJ1gbjrTODzUcOBWlrAzuIzFMXLMPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 17:27:36 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 17:27:36 +0000
Date: Tue, 11 Mar 2025 10:27:30 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>,
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Add support for per-function engine
 activity
Message-ID: <Z9ByggbFXzYwLKM6@soc-5CG1426VCC.clients.intel.com>
References: <20250311071759.2117211-1-riana.tauro@intel.com>
 <20250311071759.2117211-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250311071759.2117211-2-riana.tauro@intel.com>
X-ClientProxiedBy: MW4P223CA0025.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::30) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA2PR11MB4938:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c11a48d-9bd6-4911-61c7-08dd60c203e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RG4xamxvaGltc0h5alVkRG5oTkNyeVBHenJDSGNCRzFoUUZTUUNPM1k5ZG52?=
 =?utf-8?B?YTZHUHJxS0tDSFlGTnZJR1FISUJKOHBQdEF6UXlaRzRCOEp5a0tZdThYOWIy?=
 =?utf-8?B?Zkw3NEFuYUZTVVJTZWduS2JrL1BBSDVjTXVWTlRnL0w1UzZydUxTeTZpTHVR?=
 =?utf-8?B?bW9oM1pQQ0JtK2hNY21IbGdwYkg2R0dwUkhYWWFHamx4bDV1eVdzMjZHQlE4?=
 =?utf-8?B?d0doVk04Mzl5T3BiSG9yd2NFb2JHOUxFRzJNM1pBdjZhcCtuTlhIUktLT2xt?=
 =?utf-8?B?L3NQUTFqcWN6dkI3VnEwV2hHaTY4bXBuTWRaUE9YUTM2NEZHSFlxNnlCVUxx?=
 =?utf-8?B?bGlQbHpMWWR1cGlpUUQ4YXJKUFVwejJ2V05UWVM0aHRpR3c2NEl1RERGNDBq?=
 =?utf-8?B?QXdWYWdNK3FpcFR2M3pKN3hXaHphRWF2Q084dnNuaDdMN0t0YmpKOTUyb1ZV?=
 =?utf-8?B?bGVSQmNqWk92QWpoeEszeGcrb3NpRHVNeEc0ZTgvZ2dwSmxKUmFhb0xIamJz?=
 =?utf-8?B?TC8xRDJabmZrRjBOa0Z0UE8wcGxBelRTQ1JFbFcvcU1Nb1lDdUR0WTNEdndh?=
 =?utf-8?B?TlNMRExPMzBuZFIxRytTaVhsanNpRldiY3l3ekNKOTU3bE51VnF6WllXQWRD?=
 =?utf-8?B?cGEvSXp0MWNEYThLTEtOU3dLdHJiRCtmMFVPZjl1RDNrbUx2TWFmOVRNR3pL?=
 =?utf-8?B?MCtiaEFmNVloMG51S05zY1QwbU9uTkYyWEtkZ3h1eUVXOE12OUZKSEw3Vjdm?=
 =?utf-8?B?VHV4cFJmSlZma0VrRFNyK3psRXRScG04a3pGS0xQQ28rSEVMOTdEb0pHNGJy?=
 =?utf-8?B?RGdyQnRhTVdyNVgxWkdEbzU4L0ZMUnJ2QnJaUS9oUjdVR0R2UEtuZG12bmp5?=
 =?utf-8?B?dXZlaXJ5dkZOUkpMSEpZdHZtYStXYzc0ZXFGcmoxOGJQSVQwL0lwbHNLcW02?=
 =?utf-8?B?MWJTRTBPNlNsRjBYVThIWGYxbG01SEc1MS9Nam4vay8wOTJZeVpYcityeFlF?=
 =?utf-8?B?dEF4MVoxdTBxT3R4OGV3SkxYUHQwQjdXRklYTUM3RzdDcytBanJOcU11TU0x?=
 =?utf-8?B?b2JsNG9idzFzM2VwM24wN0lyWUFOYmkwem1TOHNnam91QlN1K0pNY0lrQ3Bw?=
 =?utf-8?B?K1hDYURUM3hjQ1EyV1g0bTZseWQrVXFBT0h1NDJzVHUwL1FNMEVqR3BLY09C?=
 =?utf-8?B?VkpRTHdpQ0xFRTlQRlBHNWxITVRiMzh1bVFJQitwaW9wekR3VjdhZkhDSFlO?=
 =?utf-8?B?RnloMlBZTlFGdDlaSVQ1VWJ0S1ZvSG4rV0R5amZ4aXJFOXQvWjNwT1lIdnd1?=
 =?utf-8?B?aGNrN2FHSGJJWGRYY1FvL0RoT09UcFJ3RzRKMCsrZUlqWmk2dVlWcFZVRGls?=
 =?utf-8?B?RU12VWY4a3FIc2pySlFHM1hLSHZIM0pNY0hqZEVsRjhLa053WDZhUS9kSkVM?=
 =?utf-8?B?MThSTms1RE5tMHR2c3M1RVlvbytxL29BWVZlTGl2a0hFbjRlWFMzMnZ6WEZu?=
 =?utf-8?B?RUcvL3BtN2RjdHVJTFhUdEVBaDZkWDhHWXZ1Snl4bjVJbG15OVpDTnluVjZi?=
 =?utf-8?B?Mmg0NDZENVIxY3dnczVUK2FydnpNN3VMODhqazNvczc3YWJaK2NheWVlK3Ni?=
 =?utf-8?B?YzU1SzFwNUxwazNFUXZZdjVhaWIyT3p6dXpjWVQxRStNL0lUUDEvbzErS3Bq?=
 =?utf-8?B?YlhoY25GbTdHQUcvMEdTOU5qdGpHY2RVbnpOUitxVzBYeUJlV3BoRDdLSUQ3?=
 =?utf-8?B?SldvcnFTNFBzaGhSQ1dUM2x2ZHVvemljT0dqUy92TnJ5R3k3dWZDMytQUm5Q?=
 =?utf-8?B?SlVFL2sybUVMLzQ2bnNlTGxkYkI2WjQzYkpwdFl0clZOZUh4ZXFrb05UcnN4?=
 =?utf-8?Q?fkYVMzAP6NO0v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUZJb2k5b0N0cjRhbmpEZkxvOTkxejFUTzd0SmEzbHZaR1JadnBua3NXeWU3?=
 =?utf-8?B?UTk5SGx5QTBIbEs5SXEyT0VGNW03U2RQcVVBaExseXRLRURqSllmNUZoekJ2?=
 =?utf-8?B?cjNENzFnTzBjUjFPdUFjTVhTNzR1OEt3aThpaU5IbS9sQkpnSFYxY25XUldZ?=
 =?utf-8?B?bkVVa3NabjBXdnZzeXpjeUQwUFNWd0tqRE5ITlhQdXFpWDMvNVBPZ1AwRjk4?=
 =?utf-8?B?WUpPblNwbjdiNzhKT0dFZ0RMcFdZcGhibEV3ZS82SnFwc0dadEdlOFlrOWRF?=
 =?utf-8?B?OElHUVB5bk5oWDQ4dGhOQ0E1Si8xaFpGcmhZNjkzWUJEWDB6R0gwa3NsWXBj?=
 =?utf-8?B?NGNhZkQ0VTVQMjcvbGlHL2NuMEZLM3VhYzhwMFJKZm1GU1ZXL2ZNMTNHQ0M3?=
 =?utf-8?B?Vm5rMnNMODZtTm1OQTF3SmtiejdQaDE3M0tpTFlEOVlSVzZmc3I0YmVySWpN?=
 =?utf-8?B?RnlVNUV6aXlZc1MrMkFWb214eXFuUDFwam5uejkwU1BudS94UnBzUUVyRFFM?=
 =?utf-8?B?ejZTRzR3VXJCWThwcVhFNHZ0UkU4ZjFGbmlhZDJxSTBnNkFHT2l3cEVqcDJa?=
 =?utf-8?B?eWhKT1Y0N3pCNE9mYnJsVU4vQm0zbmI5clFHbHYvU0p5bUF4ZmsxVTFtSlpM?=
 =?utf-8?B?MW9xcURNVGU3QVY1OW9DRzBmZ1NnUVkrTTd6SklPWFJJeUdsTWpJaE1FeUdI?=
 =?utf-8?B?T2YwVXh0TnhjMDZHUjliUzVEcUpMeXZsRXhycDZabXA0WCs0Unl2R0VDeFh5?=
 =?utf-8?B?VlhNRW5pRDgwSFVEby9DMjRpUDNKS0MvNXFJQ0V6N0V4N3B2ZEJoUFdmOXRl?=
 =?utf-8?B?WW4rYnhVYXZqRGEyVHRjRktsamVJTXFqcGI4SUdLaHNHWFpFbVJtODU1OXZv?=
 =?utf-8?B?aHBsT1IyT1UvOUtaZG1WTGJxTjYvS2Y4KzZqQ0EzaVZrMHpnSVNiME1hSDhj?=
 =?utf-8?B?S094Y2ZUV2k2TmdMTFBEWkg2aGZvSjdGeGk1ekUxM3YrMklyanNIZThjZXFS?=
 =?utf-8?B?VUJIbmhhWmFvRzkzeGFrOVJQdm5UVVoySXhUQWdxRmRMc205azFxL2ZaNXdB?=
 =?utf-8?B?RmRaZW9aRXFFVFRQd3JZRFpSYnJYc3RGd3ExTklCZzdWZndBRHVXb0t2ZnA5?=
 =?utf-8?B?QWU1OXV4OUVZemFYdlNxVWdkVGtoaGhkUEFGRndWWC8zWXkyT05yeDZxSllM?=
 =?utf-8?B?ZE41c0c3RUZiMkZyL3dmcWhYZWNKTnJibVVPN21PSm5PVzFZUUJZbmQrL1lW?=
 =?utf-8?B?RzBnYko4N0JTbmhqK1RWWDdBeVpEeGpaRDB5ZGl2VnRmRnpEcDErRUlrSFhH?=
 =?utf-8?B?Uno3SlI1VnJDWSt0MFhmZkZLSSsrR25TQ0lRanRWMjZmS0h2MjFMckgyU1NO?=
 =?utf-8?B?RW5DVFNWQXp6em91TjZrTlJtbUdRZUJCcWpHYWJVQ0NkbTIvanRtQWdlWDQ0?=
 =?utf-8?B?ekM4QWFWZjVvYTY5M0pQUEQ1TlhmVmYxeE1mdnYrd2Z4VXJ4TUxZejUxbDFC?=
 =?utf-8?B?YXBMa2hSWDZjSlk0SHFWVE9nZnpLaTJGQ2Yxa3VMVC9sS0FzNnp6WU5yVEIx?=
 =?utf-8?B?QjNLbTU4dUdKNTFod05lWGROdXpiZncxOEN3MVRLdW14enhZb0VvSlo2OWVB?=
 =?utf-8?B?WFRrVXpPc1pIUGExWkg1WWVhSk13WVJYUnZOejRHQVFiWklMRFd5RkhhZFV2?=
 =?utf-8?B?WmlEZGkxMWtuVEs3aTNsb0o3d2xCMXNyMmRKS1JBUWVFOWZwUUVpWVRUMy81?=
 =?utf-8?B?OG9lODMyU3lMZE9teG5HOW5SZXlrQURRdUc0VWZqeGVIWWdlV3JlK0pJQzhx?=
 =?utf-8?B?b3ZhTDZyK3BrNCtzK0FQSllFaGwwNFQwcU13M1FnN2ZDTTVBTy9DZHdOemFk?=
 =?utf-8?B?T1UrejlBcDAvVTBwZnZGV21yeWZxQjlnZjZCb1k5TmNuUzIydDRTYWFtTEdm?=
 =?utf-8?B?MENYZEhRZUx5QVdQUDdadEJVbVdTRCtjUmRPY2J3d1FIcm5KTjltR3dQRG05?=
 =?utf-8?B?Zy9kNXQ2MWFyMGFRaCtnRE52VmdOT01NQkl6WFNRUVhQTEg3QWtQM1pHYjNX?=
 =?utf-8?B?WUpCb0Vna0N0eU1aVXFUSG5JNENjcXhCVkF5SHU2d1k2TFdyMzM5ajlFVjVC?=
 =?utf-8?B?VHVodW1GOTMyK2VDSW9xZmMwbDNjMFZFZzlhK20wbm5xTEZwZ1ZGcVRpKzJZ?=
 =?utf-8?Q?bKPOnZuAVYT4JlxyddCXJA4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c11a48d-9bd6-4911-61c7-08dd60c203e2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 17:27:36.3758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKFxpUgRJ8fejSvl3Q1lIulOpbaF4Lryq8q8m5wWrjThbypeysH0lQqPj0e9xtNUsiZBwLLiBKP1mKGYb19cDXQ6fHSq4vHroVCReSnOAHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4938
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

On Tue, Mar 11, 2025 at 12:47:57PM +0530, Riana Tauro wrote:
>Add support for function level engine activity stats.
>Engine activity stats are enabled when VF's are enabled
>
>v2: remove unnecessary initialization
>    move offset to improve code readability (Umesh)
>    remove global for function engine activity (Lucas)
>
>v3: fix commit message (Michal)
>
>v4: remove enable function parameter
>    fix kernel-doc (Umesh)
>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
> drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 200 +++++++++++++++---
> drivers/gpu/drm/xe/xe_guc_engine_activity.h   |   7 +-
> .../gpu/drm/xe/xe_guc_engine_activity_types.h |  12 +-
> drivers/gpu/drm/xe/xe_pmu.c                   |   5 +-
> 5 files changed, 192 insertions(+), 33 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>index ec516e838ee8..448afb86e05c 100644
>--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>@@ -141,6 +141,7 @@ enum xe_guc_action {
> 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
> 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
> 	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>+	XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER = 0x550D,
> 	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
> 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
> 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>index 2a457dcf31d5..b96fea78df8b 100644
>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>@@ -17,36 +17,61 @@
> #include "xe_hw_engine.h"
> #include "xe_map.h"
> #include "xe_mmio.h"
>+#include "xe_sriov_pf_helpers.h"
> #include "xe_trace_guc.h"
>
> #define TOTAL_QUANTA 0x8000
>
>-static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe,
>+					    unsigned int index)
> {
> 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>-	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>+	struct engine_activity_buffer *buffer;
> 	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
> 	size_t offset;
>
>-	offset = offsetof(struct guc_engine_activity_data,
>+	if (engine_activity->num_functions) {
>+		buffer = &engine_activity->function_buffer;
>+		offset = sizeof(struct guc_engine_activity_data) * index;
>+	} else {
>+		buffer = &engine_activity->device_buffer;
>+		offset = 0;
>+	}
>+
>+	offset += offsetof(struct guc_engine_activity_data,
> 			  engine_activity[guc_class][hwe->logical_instance]);
>
> 	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
> }
>
>-static struct iosys_map engine_metadata_map(struct xe_guc *guc)
>+static struct iosys_map engine_metadata_map(struct xe_guc *guc,
>+					    unsigned int index)
> {
> 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>-	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>+	struct engine_activity_buffer *buffer;
>+	size_t offset;
>
>-	return buffer->metadata_bo->vmap;
>+	if (engine_activity->num_functions) {
>+		buffer = &engine_activity->function_buffer;
>+		offset = sizeof(struct guc_engine_activity_metadata) * index;
>+	} else {
>+		buffer = &engine_activity->device_buffer;
>+		offset = 0;
>+	}
>+
>+	return IOSYS_MAP_INIT_OFFSET(&buffer->metadata_bo->vmap, offset);
> }
>
> static int allocate_engine_activity_group(struct xe_guc *guc)
> {
> 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> 	struct xe_device *xe = guc_to_xe(guc);
>-	u32 num_activity_group = 1; /* Will be modified for VF */
>+	u32 num_activity_group;
>+
>+	/*
>+	 * An additional activity group is allocated for PF
>+	 */
>+	num_activity_group = IS_SRIOV_PF(xe) ? xe_sriov_pf_get_totalvfs(xe) + 1 : 1;
>
> 	engine_activity->eag  = drmm_kcalloc(&xe->drm, num_activity_group,
> 					     sizeof(struct engine_activity_group), GFP_KERNEL);
>@@ -60,10 +85,11 @@ static int allocate_engine_activity_group(struct xe_guc *guc)
> }
>
> static int allocate_engine_activity_buffers(struct xe_guc *guc,
>-					    struct engine_activity_buffer *buffer)
>+					    struct engine_activity_buffer *buffer,
>+					    int count)
> {
>-	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>-	u32 size = sizeof(struct guc_engine_activity_data);
>+	u32 metadata_size = sizeof(struct guc_engine_activity_metadata) * count;
>+	u32 size = sizeof(struct guc_engine_activity_data) * count;
> 	struct xe_gt *gt = guc_to_gt(guc);
> 	struct xe_tile *tile = gt_to_tile(gt);
> 	struct xe_bo *bo, *metadata_bo;
>@@ -118,10 +144,11 @@ static bool is_engine_activity_supported(struct xe_guc *guc)
> 	return true;
> }
>
>-static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>+static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe,
>+							    unsigned int index)
> {
> 	struct xe_guc *guc = &hwe->gt->uc.guc;
>-	struct engine_activity_group *eag = &guc->engine_activity.eag[0];
>+	struct engine_activity_group *eag = &guc->engine_activity.eag[index];
> 	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>
> 	return &eag->engine[guc_class][hwe->logical_instance];
>@@ -138,9 +165,10 @@ static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
> #define read_metadata_record(xe_, map_, field_) \
> 	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, field_)
>
>-static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
>+				   unsigned int index)
> {
>-	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe, index);
> 	struct guc_engine_activity *cached_activity = &ea->activity;
> 	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
> 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>@@ -151,8 +179,8 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> 	u64 active_ticks, gpm_ts;
> 	u16 change_num;
>
>-	activity_map = engine_activity_map(guc, hwe);
>-	metadata_map = engine_metadata_map(guc);
>+	activity_map = engine_activity_map(guc, hwe, index);
>+	metadata_map = engine_metadata_map(guc, index);
> 	global_change_num = read_metadata_record(xe, &metadata_map, global_change_num);
>
> 	/* GuC has not initialized activity data yet, return 0 */
>@@ -194,9 +222,9 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> 	return ea->total + ea->active;
> }
>
>-static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe, unsigned int index)
> {
>-	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe, index);
> 	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
> 	struct guc_engine_activity *cached_activity = &ea->activity;
> 	struct iosys_map activity_map, metadata_map;
>@@ -205,8 +233,8 @@ static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> 	u64 numerator;
> 	u16 quanta_ratio;
>
>-	activity_map = engine_activity_map(guc, hwe);
>-	metadata_map = engine_metadata_map(guc);
>+	activity_map = engine_activity_map(guc, hwe, index);
>+	metadata_map = engine_metadata_map(guc, index);
>
> 	if (!cached_metadata->guc_tsc_frequency_hz)
> 		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe, &metadata_map,
>@@ -245,10 +273,35 @@ static int enable_engine_activity_stats(struct xe_guc *guc)
> 	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> }
>
>-static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>+static int enable_function_engine_activity_stats(struct xe_guc *guc, bool enable)
> {
> 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>-	struct engine_activity_group *eag = &engine_activity->eag[0];
>+	u32 metadata_ggtt_addr = 0, ggtt_addr = 0, num_functions = 0;
>+	struct engine_activity_buffer *buffer = &engine_activity->function_buffer;
>+	u32 action[6];
>+	int len = 0;
>+
>+	if (enable) {
>+		metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
>+		ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
>+		num_functions = engine_activity->num_functions;
>+	}
>+
>+	action[len++] = XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER;
>+	action[len++] = num_functions;
>+	action[len++] = metadata_ggtt_addr;
>+	action[len++] = 0;
>+	action[len++] = ggtt_addr;
>+	action[len++] = 0;
>+
>+	/* Blocking here to ensure the buffers are ready before reading them */
>+	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>+}
>+
>+static void engine_activity_set_cpu_ts(struct xe_guc *guc, unsigned int index)
>+{
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+	struct engine_activity_group *eag = &engine_activity->eag[index];
> 	int i, j;
>
> 	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>@@ -265,34 +318,106 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
> 	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
> }
>
>+static bool is_function_valid(struct xe_guc *guc, unsigned int fn_id)
>+{
>+	struct xe_device *xe = guc_to_xe(guc);
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+
>+	if (!IS_SRIOV_PF(xe) && fn_id)
>+		return false;
>+
>+	if (engine_activity->num_functions && fn_id >= engine_activity->num_functions)
>+		return false;
>+
>+	return true;
>+}
>+
>+static int engine_activity_disable_function_stats(struct xe_guc *guc)
>+{
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+	struct engine_activity_buffer *buffer = &engine_activity->function_buffer;
>+	int ret;
>+
>+	if (!engine_activity->num_functions)
>+		return 0;
>+
>+	ret = enable_function_engine_activity_stats(guc, false);
>+	if (ret)
>+		return ret;
>+
>+	free_engine_activity_buffers(buffer);
>+	engine_activity->num_functions = 0;
>+
>+	return 0;
>+}
>+
>+static int engine_activity_enable_function_stats(struct xe_guc *guc, int num_vfs)
>+{
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+	struct engine_activity_buffer *buffer = &engine_activity->function_buffer;
>+	int ret, i;
>+
>+	if (!num_vfs)
>+		return 0;
>+
>+	/* This includes 1 PF and num_vfs */
>+	engine_activity->num_functions = num_vfs + 1;
>+
>+	ret = allocate_engine_activity_buffers(guc, buffer, engine_activity->num_functions);
>+	if (ret)
>+		return ret;
>+
>+	ret = enable_function_engine_activity_stats(guc, true);
>+	if (ret) {
>+		free_engine_activity_buffers(buffer);
>+		engine_activity->num_functions = 0;
>+		return ret;
>+	}
>+
>+	for (i = 0; i < engine_activity->num_functions; i++)
>+		engine_activity_set_cpu_ts(guc, i + 1);
>+
>+	return 0;
>+}
>+
> /**
>  * xe_guc_engine_activity_active_ticks - Get engine active ticks
>  * @guc: The GuC object
>  * @hwe: The hw_engine object
>+ * @fn_id: function id to report on
>  *
>  * Return: accumulated ticks @hwe was active since engine activity stats were enabled.
>  */
>-u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
>+					unsigned int fn_id)
> {
> 	if (!xe_guc_engine_activity_supported(guc))
> 		return 0;
>
>-	return get_engine_active_ticks(guc, hwe);
>+	if (!is_function_valid(guc, fn_id))
>+		return 0;
>+
>+	return get_engine_active_ticks(guc, hwe, fn_id);
> }
>
> /**
>  * xe_guc_engine_activity_total_ticks - Get engine total ticks
>  * @guc: The GuC object
>  * @hwe: The hw_engine object
>+ * @fn_id: function id to report on
>  *
>  * Return: accumulated quanta of ticks allocated for the engine
>  */
>-u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
>+				       unsigned int fn_id)
> {
> 	if (!xe_guc_engine_activity_supported(guc))
> 		return 0;
>
>-	return get_engine_total_ticks(guc, hwe);
>+	if (!is_function_valid(guc, fn_id))
>+		return 0;
>+
>+	return get_engine_total_ticks(guc, hwe, fn_id);
> }
>
> /**
>@@ -310,6 +435,25 @@ bool xe_guc_engine_activity_supported(struct xe_guc *guc)
> 	return engine_activity->supported;
> }
>
>+/**
>+ * xe_guc_engine_activity_function_stats - Enable/Disable per-function engine activity stats
>+ * @guc: The GuC object
>+ * @num_vfs: number of vfs
>+ * @enable: true to enable, false otherwise
>+ *
>+ * Return: 0 on success, negative error code otherwise
>+ */
>+int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int num_vfs, bool enable)
>+{
>+	if (!xe_guc_engine_activity_supported(guc))
>+		return 0;
>+
>+	if (enable)
>+		return engine_activity_enable_function_stats(guc, num_vfs);
>+
>+	return engine_activity_disable_function_stats(guc);
>+}
>+
> /**
>  * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>  * @guc: The GuC object
>@@ -327,7 +471,7 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
> 	if (ret)
> 		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
> 	else
>-		engine_activity_set_cpu_ts(guc);
>+		engine_activity_set_cpu_ts(guc, 0);
> }
>
> static void engine_activity_fini(void *arg)
>@@ -360,7 +504,7 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
> 		return ret;
> 	}
>
>-	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer);
>+	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer, 1);
> 	if (ret) {
> 		xe_gt_err(gt, "failed to allocate engine activity buffers (%pe)\n", ERR_PTR(ret));
> 		return ret;
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>index a042d4cb404c..b32926c2d208 100644
>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>@@ -14,6 +14,9 @@ struct xe_guc;
> int xe_guc_engine_activity_init(struct xe_guc *guc);
> bool xe_guc_engine_activity_supported(struct xe_guc *guc);
> void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>-u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
>-u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
>+int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int num_vfs, bool enable);
>+u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
>+					unsigned int fn_id);
>+u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
>+				       unsigned int fn_id);
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>index 5cdd034b6b70..48f69ddefa36 100644
>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>@@ -79,14 +79,24 @@ struct xe_guc_engine_activity {
> 	/** @num_activity_group: number of activity groups */
> 	u32 num_activity_group;
>
>+	/** @num_functions: number of functions */
>+	u32 num_functions;
>+
> 	/** @supported: indicates support for engine activity stats */
> 	bool supported;
>
>-	/** @eag: holds the device level engine activity data */
>+	/**
>+	 * @eag: holds the device level engine activity data in native mode.
>+	 * In SRIOV mode, points to an array with entries which holds the engine
>+	 * activity data for PF and VF's
>+	 */
> 	struct engine_activity_group *eag;
>
> 	/** @device_buffer: buffer object for global engine activity */
> 	struct engine_activity_buffer device_buffer;
>+
>+	/** @function_buffer: buffer object for per-function engine activity */
>+	struct engine_activity_buffer function_buffer;
> };
> #endif
>
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index 4f62a6e515d6..f8f6ebb7c9c6 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -245,10 +245,11 @@ static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
> 	u64 val = 0;
>
> 	hwe = event_to_hwe(event);
>+
> 	if (config_to_event_id(event->attr.config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>-		val = xe_guc_engine_activity_active_ticks(&gt->uc.guc, hwe);
>+		val = xe_guc_engine_activity_active_ticks(&gt->uc.guc, hwe, 0);
> 	else
>-		val = xe_guc_engine_activity_total_ticks(&gt->uc.guc, hwe);
>+		val = xe_guc_engine_activity_total_ticks(&gt->uc.guc, hwe, 0);
>
> 	return val;
> }
>-- 
>2.47.1
>
