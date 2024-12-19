Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD3CE7718A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 03:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076B210E278;
	Thu, 19 Dec 2024 03:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdjR4G6K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2587010E278
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 03:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734578722; x=1766114722;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vYGAv0Sc8iOF/ZyrVw4FvWcqJfAq2U4PD4YLi5/X2vk=;
 b=hdjR4G6KZ+cuOw7qZzLsLSU/NH6+f/eRMeGNPuJJlxJRGZ0byQkv8SMp
 Z3FgrFrDqu+I2THAbTqgFjdwN80R+Ql/Drq5yaLc1hnUmdHD7pKDo5XV9
 ynb+/qKbJMOUVEic2VEg+IrHPq7UCzGEGuB4vJvGMPNGMvSgyF+l+0CLw
 0eHgFM8qtilJDfSZ+Hf6l5b64fjqJBjF/JGMPrY+w/R+ghD6G1hUxY0Y7
 a2QAc++k7vGE/xzuHtVzSaxHqc722nK9fT6nlufSKOjYgm8f8BbRkLlJj
 fLWNkxy7KJL0Qsp3z12CHoO4MuoSIMGcwqRNPQiODMvh7/1426fiKIhQK g==;
X-CSE-ConnectionGUID: HwQl267GTNOpp0c8hEKe3Q==
X-CSE-MsgGUID: JIhGHlpTQ0CkPGmts3bpPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35204887"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="35204887"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 19:25:21 -0800
X-CSE-ConnectionGUID: EjgjJ/GeSFak1GhfT6Wxxw==
X-CSE-MsgGUID: xykvjRDcS1CJE5d6wCy/6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="129041159"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 19:25:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 19:25:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 19:25:19 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 19:25:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixYe1nokpSWPJEkGY8UB5k7a7OZ+BSnH183PnyT6ctxCpBo8xeV0KSkAy3cr73YQARlFMT1SXaiLC1aXeOaSYhsmafe7MUysD95Mp+6bJxh/VtBB9Ac4JGTeqe977zMz1su5qjIMuZAixUwjaHrKjCDIR4dXqYSjRYmMQvrp7EEc18yzb6P8zdzesTExYl8Y5erGKfSCLa2wIgE0KtXRbfC2ZDnQragu7701dnTHKnEq5bs1S/gRyi931MAn86wTdUJNEpu23onmVgRcs2f/AN+5A2VC5O86osAfLWjdbORdiG8KdZOBbn1lW0qV4prZjC2mWZQagYRabBBZjGeYaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdU8ETHaLj2ScMfPW9tmrwFmkwDiUSkwLJ1knlriyDI=;
 b=IlSVe9tN0+ZEjmDlxmobIX/077ldcu/vcTrdGr9BUQ2lNIwBgA+qOBiQqyowMipgJAvh8lYIMBDeSsTBYXOuEcxKBfgO8LVrHfBn0tJixlmzOqxXGY/VK1z0glmWFUYU/b9MAKtRDAhpVT3jiQ5wZjsU4pb5tK0GW9atBw5H4P5J44JfnhjDq25G3ScUtaB+MHYK5Txb0zm9L4weaqRUxYMYg16IouKwaTbs5/4+NJj8JPVS5jAI50817na0WcFnzwqlJZKfEGzPAjKQlkNsm0PQwz+qEuzE1X63738MUldu3jS9Sa4WmhN0r50uLOiAoeO1GZC3QIUs9IPoXlJI9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW3PR11MB4588.namprd11.prod.outlook.com (2603:10b6:303:54::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 03:24:49 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 03:24:49 +0000
Message-ID: <2e682477-0d3c-4d39-a307-c5e90e0e1b71@intel.com>
Date: Thu, 19 Dec 2024 08:54:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Use correct function to check LMEM provisioning
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20241216223253.819-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241216223253.819-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0251.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MW3PR11MB4588:EE_
X-MS-Office365-Filtering-Correlation-Id: 197b1cc0-4ce1-4f8e-1483-08dd1fdcb1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3pzT0NDcGQvUGhLNlhFRkNybGN2WlZyMXBmcHVZMkkxZTREbU9LTzhkYUU3?=
 =?utf-8?B?eWJwMFZCQVFhUExZajhQdlh4UHhYTjd5dGh6RjN4K0xXcEdOaXFCWGQzdlor?=
 =?utf-8?B?YkczOGNSN09ObXJoTk5NQm1yQ0tydUVTdDFUVDN5bUhseTVVcEpYUUlSa0pU?=
 =?utf-8?B?Ym4rdDlWNGo4cCt5U1BxejJ0MjdLNi9SUWRLT1d1aGt0N1IyckNxUUZKdTJs?=
 =?utf-8?B?ams1VHhSa1JVQ2pJMm1nSHo2bnlPTFlFTWtHVGlwNkUyR0hUbTBoQnNIaFBE?=
 =?utf-8?B?cjRWNlBSS0NKMkkrT044OFZuL3IyeVc4L3JySlJmWENybHArM0l2WmQ2cm5K?=
 =?utf-8?B?ZW1sSE81Qk05SnhLVmc1NTA5YUxMb2phN05lVWF4WnlHaE91NUEzNWlBT0Zp?=
 =?utf-8?B?b3htclU3ZEQxeVdCTjg2bXRRdDNYQkw0SzBGQTBKblBkMEYybE5nMUJ0UHN3?=
 =?utf-8?B?SHVpVTY4R1ArenVGZlptS0huazk4aUJKcW1NQTNiOFZqWUNqWGQyQmtpbGJ6?=
 =?utf-8?B?NGdqOGhiTnpTNmFWcitYY0tYb1pURXNlNWgvTXRnbnNQa3kzeDlnMjBwZC9l?=
 =?utf-8?B?aWN2eEM1L3N2UW9iWEtaTVU0cXJRTGJNYWovTHZ5eW54RmZJM2VtdVkxekVp?=
 =?utf-8?B?NzJGdVpJNlZXRU9xbmRjSVptODFNb2FvQjJaNXpqTi95aVlnaXNWMFFDam5i?=
 =?utf-8?B?dDRydURFb1hIOVB6YXQ2S2tsa3lNUmpORlN6Q1BSK0VDRHUrVjc5bHl2bmRZ?=
 =?utf-8?B?Q2ZGaDJNbkFqZjZvQ28ydzFML045UzNFR0ZtczhMMVpOYThWaWhtT1VWQmFR?=
 =?utf-8?B?M3BGeHcvRXRJK2FXTG83anpCOEJmUkQvbG0yc1Bnd1M3L0ZMYnFlZDhrclcv?=
 =?utf-8?B?QzlBNnBzZm1QaHVqSGRzNlZ5Z2U0dHVSajEvb2M5MGp1VlhhQ1lpYjF2WFJU?=
 =?utf-8?B?QlVaUEd5YnVIcFoxWjJoWnhkUUxKOTh4WUpCNVU1WmdnOVpkNTFSb3FsZVBS?=
 =?utf-8?B?RzVEdmphL1k2bHVncVd1RWx3TjRvYkVoem9LSnUvTUdJVEl5RkVZdWlLTHVB?=
 =?utf-8?B?aXJ3eXU3eHc3elIrVnIxSEFENDRKSjBBckRzYWFaeHgxeHR3WlFOQVdSZ0I3?=
 =?utf-8?B?ekl2ZllROGdDbnY4OFovWU1Ib2pUa2ZHeW04ekZuVUtNVm1HVEV3T0gzdUZK?=
 =?utf-8?B?RWFHb0RYOHZkUHBtZkhGUVBCMEVnR3ZkZzQ5MDEyNjdTQjRqcjRxbUpVNzZ2?=
 =?utf-8?B?VThhWmlCS0hoZGY4UHZLZXVNQ085RU80ZDcyWXIraGhjbHdNQStHQzAvRjZv?=
 =?utf-8?B?c1dZUFNHTmJyUE1vU2RaZlMvejU2Qld2TkNTMFZFN3RDTUdmTHJGWmxiUXpq?=
 =?utf-8?B?OFpwRVpRV0x3MFpqanF3VTNveWdGVnIwY1doTTY3RkpnR3htODJmRUF4VHBw?=
 =?utf-8?B?M0cvRkRPeXNGRjNnT3JKaWRLcTlNN1ZTeWQ1UmlxNlFycmx4aHJGcy83cmdE?=
 =?utf-8?B?UjlQbGlOU2pzWDNnczV0djVlRUxSd3p0aFBOQklrQUtHSG1FSUFQYmVyb0Iw?=
 =?utf-8?B?bHQwSkd6WHFRV1RjeVUxTktMaG4vNXZJa2tYeDZDUFJ5Nk01MGw2eC90T29F?=
 =?utf-8?B?QVI0SGU0QWdVanQveTlqTlUwaTh6MTlQcGtPL3Ewd0xUQWdwUTFIS3ZLdXZx?=
 =?utf-8?B?aGZLdUs4VXJuT29WajBxZDExa1hOOVc5MFFyZTg1Mm9zaUVDU2lDcXZzdzVw?=
 =?utf-8?B?N0FzYlZmaTBIbWd1SmRZSHM4bE1MMmdqR044Ynk1UFFPcjNhTjZ0SDd6aEVm?=
 =?utf-8?B?SFhYRmpmcm5taE9wd3FTa0xMTk9TS2JwNlYydGp2dmJ6enlHZmJyd3Nqa1dR?=
 =?utf-8?Q?eXoDV7BhSoJRP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlZRdGtUNURacEJWUk55UklCb1NDSlN3Y29adGNFdm1mVisveDZjd3JTeFE3?=
 =?utf-8?B?dXdnK1ZQRmRtR2pOTkM0anplSnR0T2MwcDMvb2k3dHd2aXRzN2JnZTY3TFZv?=
 =?utf-8?B?YmVDY05aRVpHcHFrTjJFS1pjenM3djB6U3ljOHFOdnJlWnpHYnZRdUtRblQ1?=
 =?utf-8?B?NTA4RmFtd0dvWTBucUx6QmljUDloWklEeGF6dmxPL1VZUU1OWlFtajFWNzR1?=
 =?utf-8?B?dzB2NjQrOStVbDZPb3BXRE9hSi9sVWJ2OCtkd0FZbUR3eW0vLzU5KzdCUktS?=
 =?utf-8?B?TytSZUw1UFVTV2ZQc0RxMUNKQmNablpnc1ZoWGJBZllKem1VSTJzZGRJam9w?=
 =?utf-8?B?Zlh1VCtCYmV1OHJBTGttM3A0SlgzVkxkR1BHODFqcmhBWVFrNkZ0M0FWQThj?=
 =?utf-8?B?WW9hb3RKc1liZHhSekNRQVAyNDl2Sk9RbG5zOE85c1BtOTZUZEJyNmJjcG1w?=
 =?utf-8?B?aU5CcklONXFFV1NuZU16NjJTV0doa0psSWlic1hoYyttOUg2cktaaUh1WUVZ?=
 =?utf-8?B?Mk9vNXdkREYxOTFobExSRkVXeWZLMWtlVjhiVkNuY2duaE9CSWt0dzRUWE0w?=
 =?utf-8?B?VjZuUFhRUDNXUE1TWEY5OWkzR0F6L3pkMGN0czNxYXZoN3lVVkVwYWRvTE1n?=
 =?utf-8?B?d0dzR2RmM0dOWnIwSlgrYm5mbVlhWnJMbS9XV3ovY0lJSU9kVHAyZE1VTHVv?=
 =?utf-8?B?cUhTNStFd21zaUhaa042VjV1YXpvUlJqLzlQVnlDSHVQZE1OZ1gvT21zdlY1?=
 =?utf-8?B?RERnaWdnVHgweHJndWEwZDBRazdIYlRleGpJN0NxMjViSkI2YlJpN3ZJQytm?=
 =?utf-8?B?bko5eHRDZjJKS2JDT1lQTGlqUkdyTTdqZXhJRGlCaGVNMzRCeVlTQlp1SVBJ?=
 =?utf-8?B?b0ZrS09wSTI1L1ByWFY4UmZ0dWtxOENJSGNvSmQwM0RjL2pOdkFrZHF0QVUx?=
 =?utf-8?B?ZXo2aWpUU0Z4MkdJMmptTzEvMVJkK3N1NGVsSWNJOTlWNTZIWElNRmxjNEFH?=
 =?utf-8?B?a284VzJwV2xlekNSVUVPZlpjTVRKRWFOUjBmS0t6V2R5SXRMOThZVzV2c3pB?=
 =?utf-8?B?dk5kczBncFNiVHhGeVdnSEdLZW1abm13MzJUZy9iZFFDL0R4YXdZa0hxS1Ny?=
 =?utf-8?B?RWlOaHhKRWlpSmtBVjJuYlhkT2U0dXRGcWg3NVF4ckd6MWpXakdSZWt2c09r?=
 =?utf-8?B?TU02QklJRU5ncFRTK2J5a2hHTjREUEt6ZENjU1dla3JOM2NYVUk1c0pjbXBI?=
 =?utf-8?B?TWNmYzAxSUozM2tMWGVmekJFRlRONTdjWkpLcGRqTWNENTM0NWZqcG55RFlS?=
 =?utf-8?B?YWJMSG1RcFloSjZ0ZDdmZ1grWjNyY2p2QVYwOC80akpFaDZqSGpDSW5PUjh5?=
 =?utf-8?B?NW5tWDFoeDY5QUdJSGYvZk1UcWlpQklXa3loNU52UTlmUlpyKzYxUit6cW03?=
 =?utf-8?B?aGQ3YWlXRWEwQkkyOWNXMXZKVEJXVVlKZ0JHNzM0VFdiMXZKWlFlbDNHVklB?=
 =?utf-8?B?cmNWUE9SM3h3UGNBZGpnVmdkQ0ZJQjROMnFOYXN3NXY5K1E2WlJua2R0M3Yx?=
 =?utf-8?B?dFRmeWdLSFBsbTJVaC9GTzc0bEY0Qm1OZm1ZNkhoM3JTdjJGbVpvT0hZQ2RW?=
 =?utf-8?B?aXdjemhmb3VQSmlDMDdaYkZqbmZKUzBDNG02cEhJVDBvbDV4aVd4VUZUWGpu?=
 =?utf-8?B?YWx6bTBhblJYMEcxWHFjWGxrdktPZHdaMUN0RnpBUGJBQXFseGZEVm42TDJS?=
 =?utf-8?B?eW5RK2dWamQyN25iQklueGF6VkN3dmpmUVllVGwwWGxtK1JMZUxsenVNWElx?=
 =?utf-8?B?c01KYzh5bE5yZ3c1WTU3bTRSRFVQb2x5UXF1b2VhRU1kL3M0WkhxQjRSY1Jh?=
 =?utf-8?B?RVZrUStER1ZnSjBJQ1NiOXl5S2daVVcvaENmMktxNzQreUZjT2FPWlFMS2xj?=
 =?utf-8?B?bkRoOUF4VUVxZlNNTSs0SGM1Tm1hMXVUWm5sU1NqejltandXdGI3aFdFZTM2?=
 =?utf-8?B?OEY1NFFSQ1laakRkT2Y3ekx1c1JKZzFDSllLak5oYmNqTkNrbHdGUkVidTVU?=
 =?utf-8?B?T0hMNzN1U3BxdTE2ZnFXR0cvekpmWGVUZEs4aVk2ZHIvTy9lbXQvMHA5TGtU?=
 =?utf-8?B?RllyWS9FYjVFenhzcEdsS0Y0T3JSQlduTU1tYUFVaUQ1cUordmZzUnc5OE9k?=
 =?utf-8?Q?2wcwKA6e7FN4QApv18u0XXU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 197b1cc0-4ce1-4f8e-1483-08dd1fdcb1c7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 03:24:49.6426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zTSCyDhXAJUEou6hv804KztA6/RKbV4FvZMFwU5xXY3ERmU7m6xoQ0kpvz9RTzztJHslIizCPjbRlpi8YLGpj4Ukiti7SDR7olBSDnvJfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4588
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



On 17-12-2024 04:02, Michal Wajdeczko wrote:
> There is a typo in function call and instead of VF LMEM we were
> looking at VF GGTT provisioning. Fix that.
> 
> Fixes: 234670cea9a2 ("drm/xe/pf: Skip fair VFs provisioning if already provisioned")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 65082f12f1a8..bd621df3ab91 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2120,7 +2120,7 @@ static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
>   	valid_any = valid_any || (valid_ggtt && is_primary);
>   
>   	if (IS_DGFX(xe)) {
> -		bool valid_lmem = pf_get_vf_config_ggtt(primary_gt, vfid);
> +		bool valid_lmem = pf_get_vf_config_lmem(primary_gt, vfid);

Looks Good.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   		valid_any = valid_any || (valid_lmem && is_primary);
>   		valid_all = valid_all && valid_lmem;

