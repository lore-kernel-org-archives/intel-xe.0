Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58EDC25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 06:41:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670DD10E6A0;
	Wed,  5 Jun 2024 06:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cZ7s21Gw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5557610E6A0
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 06:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717569683; x=1749105683;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5XVNsEPG5nX8DpwV/Y9xdeBNMl7NFo59toXWE+bFqrc=;
 b=cZ7s21Gwq1PB61ALjAC43nju1DC1QVZQimusVmYgBeaE8sAhfbLgDlRd
 gea7s8xg3NSg0HWIW/9MzrgIftqHT0nZvCmxWARW9Q5NuJ7Z43Lj5fmDw
 VAeuUjeyJ9hyrDhxitJPVAAS8jbfRE6mLpaAsbCLMQp5Kx1gRYoqyRtC0
 W5FrPuEs+tgR247iPQtpI/MeWlZfm/zt9+BIuM904X3Q3LajpzWowiqbO
 ilx/AipK3vHJKCuyYQ+/ixZT3Azy9T5PAgP3ZiKKmHqW3+h7aGjJE8aG7
 7c/sub+3wldg/CC/Hhhss6CBkXJsYMWZCJ7yEY0ruPDluokT4ZLNgowAn w==;
X-CSE-ConnectionGUID: ANyMXm2URKaEmxxN0V0Jhw==
X-CSE-MsgGUID: as87sn8TRwGj0U63KCWFjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="11915026"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="11915026"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 23:41:23 -0700
X-CSE-ConnectionGUID: hxrjLvkaTnCRF7KVPBUXFw==
X-CSE-MsgGUID: dzGGeiKSQq6W+cIcC+0tVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="68305175"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 23:41:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 23:41:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 23:41:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 23:41:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 23:41:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwKq4ISh78sL51axwLJXJkZvxsgOc/oVgH9N1bihqog4szLRbyKvfEny8ncntJEUrySoYf9yOgODoDlH91N7vrnb20WHiDYrGyDArkFmwe9wb5Uf1QgfcUwrgd8vM60DL1qgeCqfRqZRmfNLfTExEBv1M+kM18PvqIVLLnJ+p2RdDJyF/PbHrNkX2KlO+BbaZSKhBJUJ4Z5HjmQRRoC8/Opov+OuQJN+fjQueBB+rw2/grgRIcaV848zB82Q908IuT6ALXAjF73w1u4zutyeH8/mS/ZR1pZzuOhRFWeMD4enOtsAaedcdYAEfMyflutJ5hdX10vWljq69sJ0gcAQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9F4MHFz+4cx33H8ZwN0MmAgaWYop2BzZS7eLDj7Vun8=;
 b=HObJOy8GJg4mvd2esmK770sbEbQFSz5biOwjf2dyVcbQMFktLpaCzKnL1aE8e0T5qo2JgpEgD3badk82aNuzU0iSR+tad634fr7UO82r06+Xk1xJLy34047NyOyDG3glvZIj/xwDRFytoMpI1+wLDfMR6rYg2lhI1RZl4agidvFySfEfdx1wneL1ZwIw07052xFkJ1xlZjhKdYjqwKQzlYHGa31OGWk7Vd4R4nX3wN+hFBCR5/Khcq+KxPZS/Tdn4gsqGI8eHpAuuIjuGbPiDuqNMv20vZMx7uq6B7/9Ma9X5CTU/Tdel/ilU6pmDmpLkv5/Kl115IW0JMntIq3tSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB5038.namprd11.prod.outlook.com (2603:10b6:a03:2d8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Wed, 5 Jun
 2024 06:41:15 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7611.030; Wed, 5 Jun 2024
 06:41:15 +0000
Message-ID: <f900e005-1ea4-4896-a51f-72f069612eb6@intel.com>
Date: Wed, 5 Jun 2024 12:11:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: validate client of BO inside lock
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240603142823.720213-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240603142823.720213-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::21) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ0PR11MB5038:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b615e1-7242-44ef-9a5f-08dc852a7f33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0FCU01wQzZGVHJwMk0vcTZ0eGFQZkVHZW1nZ3NPdS9JaWVrVVdCd0I3MTlJ?=
 =?utf-8?B?NnVrNDNxdXNQakdyR3pWNGZtOW5mL3BXY0FDYmoxR3lCYld4Q1I5VSt6WUJM?=
 =?utf-8?B?ekFBSTdZNWVTNVJzZ1UrWEdoYTFVWEp6T2dwYXMydGcyU2YwRkFtaEVaR28x?=
 =?utf-8?B?Rk5OdzZZVFRnbEdGc1dQTjBJNm91SDdWMStRT1IzSXNIVWhURTNFOWtJRlB6?=
 =?utf-8?B?YlN1dnoyUWFkNGpIVkp3Zk5SNzl0dkxzeDdCS21yQzl2TGkwRGgyVDh2SVFk?=
 =?utf-8?B?bGdDM0tXeXROcVBnNHZjaWdXVWFLcDBNbW5EUjdrU2NrU0xkM0piMEJwTmNB?=
 =?utf-8?B?czR1WmwyMGFZUWxGWklHbkJJRTRhUnZxMmRaYm9Ud1pHeUp2Wm02VTVPRTFR?=
 =?utf-8?B?dFRlSGY5U29VVWFxbElGbVVLZ0FnUFp4ckt6Y2hUbDR3MkRQek42M0hTeXk0?=
 =?utf-8?B?ZzhvRHY2UGhFY0taN2VRdjdScC84Y1gvREJvZlQzTCtoYzQ2d05ObWhTdEFn?=
 =?utf-8?B?QStFSStNcmRYK3Y5UUlSUmpqNkszQWRnd1BQaGtreXAxak9PTmY4NjhQRFAw?=
 =?utf-8?B?eVBiUTAzQTJhQy9UNkt3S1VmSXdUcWZ0UXdrT3pLWG5CS0w0VlVONm56bjRl?=
 =?utf-8?B?L01YTDcrVGI3Zk1aWkF1Ti9UajV4WU1zU0ZtWkFNT1EzdnBsNDVBcC9lMEJl?=
 =?utf-8?B?N2hMSzFmZTNhSlZLVTFiVHJvTkQ1SXFCQUlKclRPb2FjY1gyUS82eTZPUXBP?=
 =?utf-8?B?dDhObHdYZS8zRFhZS1ZkSjVoL2lXSlFiTDJRSjVMMVF4OFZpbEltY0Z6c0JQ?=
 =?utf-8?B?QkxJY0g2a0hRampKV3BnMzBEK1ZGM1Y1SGZ5TjFJZTZXc1pSRktHMHVHVjl2?=
 =?utf-8?B?SExIODZrS2tzV2dtRXY0ajJGODNEN0kyYnY2NlFqZU93MFl0akpwVXBQVHho?=
 =?utf-8?B?NWxPeG9tazU0Q1I0aXFCSW5PMVh2YmlkdU5HbFJRVTdxQTNzdkJxNGx5WW42?=
 =?utf-8?B?VG1zSmRDdFRtMWsyemQ5K3ZOM255eDVCelIrdTRPbDAwWUE0ZUdBYW84WlVY?=
 =?utf-8?B?TzI5c013Ync1TmtsZnNrR0lic0k4WjNxVW5FZVZENkZPVTVzaFp6M2xSTzFo?=
 =?utf-8?B?d3N5Ulk1dU1BNTZBMzBDdjJ5VjIveXVZZ2M5b2ZKcERwcm0xMk05QmhuUjg2?=
 =?utf-8?B?VzVlSU0rcitpUHNiKyt4bVFrdS9RbTQwWnRBeGtOclo4N3l0NTRpVG5Edkow?=
 =?utf-8?B?ZlpsamRrSVZSM0toSjRIR3E1UkovZWxITmd2cWtHUmE4cExxa3hPOS90TjMw?=
 =?utf-8?B?ZHJLMnZocWIyYjkwb3FqYWVWeDRrVi83ckJGdG1McEFCcnIwbUhjTEFBRkNK?=
 =?utf-8?B?MEQwZWVPRysrQWk2cUFOdUFkT0pULy9nT2JJU3dOY3RmZkl6NGM4aTlLME4z?=
 =?utf-8?B?SDNZY3ZlODFhb0s0dGVUdjZUZzdiMlVHYWpKS1pDMGhDMzJDb3BGRG56NHMw?=
 =?utf-8?B?d3U3SlFMdmFnSTBVU0lsNUw3eG1ud0JDVksyNHpvVklGY21tTmNrVmgxandO?=
 =?utf-8?B?RFlXNDgzTEdoejRWR21wVlIvRXJFZkZwZE5PVVc3aCtqU2VjMC9JMG43NGdW?=
 =?utf-8?B?WFNsQUpTcThVM0V1alpTU2JtanhyTHZhUVM2YloxZjRrQ1pMQzIxeEZOL1ZN?=
 =?utf-8?B?alRCdVVWQXVmQkdtWWtQM01hbG52Q0kvaEduU0xVQStPMG9adVkvV29nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGVWVGExUFRJbE0rNTdIbVVSOUo0L2U0N2JyM2dkYUl6VDNKaDRodUxCUzN4?=
 =?utf-8?B?RzZOdnNnQ2F4UXpxYXJ6S2syLzhyNTNoSWZhN25kM3VWZ2xpNG9uYk4yS05h?=
 =?utf-8?B?UXM2NWxwUnFQa1VVTitjeWs5bjFvYTBMQy9kMDZqbXd4N0Q5KzNmVXZDWFp5?=
 =?utf-8?B?VkdXVUREd2tWSlJ4STFEWjZYRzBFeHRBcXBOZnVTbW9TbnhCanB4SWNubUFQ?=
 =?utf-8?B?STh0NVA0RXlDSjNuWHp1a0k1WHpXYUVkc3VBVk5jREZRUDZiUmhRT3RZTEYr?=
 =?utf-8?B?ZSt6d29LeXdlQkZNNnVTclY3emR2aGZBelBIUUsrUmtkcUxtQlk5Qy91blJl?=
 =?utf-8?B?VFY1NHJZSGZjSHpTelJSeVM2bDlGQisva0JBay9VVk1zbTEvR3JxVENQTXhm?=
 =?utf-8?B?V05semlZV082K2xRa1pmblo0Q0MzdGZCamV2SUdhRUw4UzlZd293Y2dyODVB?=
 =?utf-8?B?a1U3WG93Z29IVzJLdXhpUnZtL2pxaEJHaXRNeGt5UDJQb3RMT3pnRVN0WGNy?=
 =?utf-8?B?OGthd3NtNURkMERqZEFTc0p2b2dXaDd6RWJnUW5VMmQyYVFwWjN5RWh6T0k0?=
 =?utf-8?B?TmxhdHAzVTAvT3dCUmJMWS84RFVHL3RDM0NneloxaDN1Y2doamY2SXpzOXR4?=
 =?utf-8?B?aW04NVFMdjdTWkZmdjFvUmsxc2VKeGdQaWJqenZBTUc0Yko0SWZoMmdNZFR0?=
 =?utf-8?B?dEQxbFZxanpDMERJY2hOd2EzaTdFZWpZOERMU3VUNnlVYVhEeS9QdlFrMEFo?=
 =?utf-8?B?L2dvSFpRRGxpN1VmeXBCK2JCWkRyNE5DYjA0WjI5Y3FvdHJlNi81U0NaN095?=
 =?utf-8?B?UGg2OHVKeFIweDFBako1RUg2aEVJemJWakxtMlhCY3BTeitFNm1kdTF3K1dm?=
 =?utf-8?B?NU9OL0I5ZXhuVXFCWmZDT3E2S2Y2c1JCQUJORFM3ZXZvb2dRVUkySGlEQm1z?=
 =?utf-8?B?dGxReStmdWMxMmlPM0VPWVpydG1oZ0VJK1N2ZW1oRUlSSmYwV3l3ZEtWeWxm?=
 =?utf-8?B?cTlKNFZ2UXFwc3MrM20ycTczWncxZTBvZEQ2L1MvME96Q2VUYXJGZUJCaFJ5?=
 =?utf-8?B?am8zS0hxejlaUTUybGF5Z25oN09lSnFIN2xnd0Z2V29yY2hDUk1BemtCOXFO?=
 =?utf-8?B?ck9GNlFIVXNnS2ZFM0hMTUNac3ZtNzJWU2Rjdkd0Z3pzcGl5QWY5RmNRd05U?=
 =?utf-8?B?aEhoZll1c0lES0RJWDhjTkxEaWNhVWpxdmtxUk8yaG9VY2Z1UEZBbDdEQmsy?=
 =?utf-8?B?RjVOYkRPck5zYzllMTcyRDJaRlV4VlhQTDVZZjd0SUFDbVJrOEhqRUpHamFK?=
 =?utf-8?B?US9Rb1RmOElkTGFkQjJ3MUVPSDRoK1UwaVJ2UlAydEl0dXZVbXFTVytObzlq?=
 =?utf-8?B?d0xQMWRiUFdyeHQrWUNMbnJFejhENitXWWpHMDdTVENVcDNkcDU3Situb0Jy?=
 =?utf-8?B?allTQnNLUWVvZDRSNk8vVUlyTDZpbzFBKzVvUEt0S0pWVmZ1bVdRODA4azFF?=
 =?utf-8?B?NE1ScDJsVkVxK1g4SkZHUU94NThJMnVMZ0JkMGw2TWNGdnM5MG5zUGlOck45?=
 =?utf-8?B?TS84Q1pIbFYvMm5lR0VueUp5RmkweGJuRU5meWFYRXA1Z3JFcUdFYUpqMXpV?=
 =?utf-8?B?K3M4aHkwZjVlRWlpSmxTSHRZbWxjVWNsN2VZaWdZaFRpamtvSHdCZnNLdVRY?=
 =?utf-8?B?R3FucmVmcldmYitLak5xalgwUWJuNTdFclJYbE8wSDJpVFFWczFzbDY4SUpt?=
 =?utf-8?B?czMvVy9nUzRaZkpmNFh1bDB4WUU2d0s3bXN5RW9nQUJSd25NK1BLZkthbWlu?=
 =?utf-8?B?b1c3Uk1hRGdieGRNemZ3YjNaSUN2WTFBbWk1bnVHYVI4OE1CMmtWVTlPWDVI?=
 =?utf-8?B?NVpnNkRQa1YvcEFKVWNNSVRXVjB2RXJVUFVtVzAvWDdMQis3cUd5OWJGbUNP?=
 =?utf-8?B?TTVvSER5UzhwUVFBMHNnN1JmamxxZ3B2bGp5cHhqdnVzZDJMRS94SGpPb3ln?=
 =?utf-8?B?MWF3OGZRengwTDJWQk9rUUNBdGgxeUtEcW5zTUNGeWwwTnA3cDdOb3F1bnNt?=
 =?utf-8?B?ZCtOWUJXUStNTjJjRHBKMElyU3ZZdTk0Q2FoY3JIQXY0SUlpSUFPVTFOU1JU?=
 =?utf-8?B?Z0NOUTNhWmdPaFA5ZlBpZDdiYVVuZ0o4SnR0MWx3SFdtcG9NWURZK2o2ZjZs?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b615e1-7242-44ef-9a5f-08dc852a7f33
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 06:41:15.1797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UC8tDF4VRo5dLtRtkjg1UGsz50wdoDPmrDR6FD66wIliVgZX6e9cjJ03XEXw1xXBIH1sVcGaFpWERtithov84BiAkr3BYoYdLvEzq05OoCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5038
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



On 03-06-2024 19:58, Tejas Upadhyay wrote:
> As client of BO getting referenced inside lock of BOs
> list, its good practice to move these WARN_ONs also
> under same lock to validate existance of bo->client.

Nit: Use Imperative language.
%s/existance/existence

With these addressed:
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_drm_client.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 4a19b771e3a0..7881b02fa117 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -131,10 +131,9 @@ void __xe_drm_client_free(struct kref *kref)
>   void xe_drm_client_add_bo(struct xe_drm_client *client,
>   			  struct xe_bo *bo)
>   {
> +	spin_lock(&client->bos_lock);
>   	XE_WARN_ON(bo->client);
>   	XE_WARN_ON(!list_empty(&bo->client_link));
> -
> -	spin_lock(&client->bos_lock);
>   	bo->client = xe_drm_client_get(client);
>   	list_add_tail(&bo->client_link, &client->bos_list);
>   	spin_unlock(&client->bos_lock);
