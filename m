Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D808CCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 18:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353EF10E21C;
	Wed, 29 Oct 2025 18:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JA1K+tjI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604B110E21C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 18:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761762949; x=1793298949;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YcKiou6mm8qoY3dmUfqv0w6u1cN2u/EmEKPIv60Ip0g=;
 b=JA1K+tjI3zYCqmJMJu8FuEtBlut/ih3+rw7GQ+qj3RpDDQZqNtLwbykC
 gT+1RTsWmdCjad6ytnwnHlwiyC0IQ/U1GDhnRFiCibMfkfx87m7P2ZU3r
 lBsZreb7oSKBmLYcvk4IowwLmRf8XAU8HQn42EDB62ty+2YXC+nELA4wC
 bmXO1+kA94l/+FQpfk47SpPXHyYwALhc+zJg+g5Ka9h46S7DP8p+baZGZ
 EHfpUqztLYvnFbEbU7f0XYmKdeeEWz18m4b9HGD0ngrFyRzQ/T8MnK6GC
 V7TbtwYoeYUlYgLQWGGlEtfjBPrMaa4PoAF8IQiW8rV7IjrqfGFdUT7kn w==;
X-CSE-ConnectionGUID: 8Bb9+QcjSi6gRVzDLsHc5Q==
X-CSE-MsgGUID: m6D7a9lFTrS0OQTLYogkig==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63825688"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63825688"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 11:35:48 -0700
X-CSE-ConnectionGUID: 9ryTBF0pS42iqErrhF15fw==
X-CSE-MsgGUID: +OplwijuTPO732l5f/TiCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="190874809"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 11:35:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 11:35:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 11:35:47 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 11:35:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4kL++LU81Hud0xZ6Aef4sGd8TGUF4M2Y0YfuN22IepThJwdlYa1XhnuBRbkC6Ed/puRxhh6uhy4gJ7Yd5YAa40Jt88gXyU6LWJeLtuJgnaOeljyXpEkgik3cm+PMPnVOA7BeCusX1h0RDF5cJwto3rPj4w5F0oPBzoO5GwS9qo17/Yf3hlYlsrMGh+2fWt0xyG4Q+kk9/1gy4hsKFDRvpB7QlSQ2sHiCmiBmFue/H3QTHFe5Oh7JoiAcny0q03u4sdmUQdIAYED+0Q9O4+pz2wimnJstQPa4tTc8omD/wu/2XKRx43/EX4vsDhhQ6Eb3J5yZ+7S7UkLnd7e5QlckA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLH8Tpeq+Zxeh1qc2OuQgfRl5jBPExOclvljwxWD3qM=;
 b=hbYGy7f5Sortyz3J0RU5B8VKIIlY7JUWiaQ3sVB3N9xqRcbjggJPbcSctMTziUr/PI9qV3suwX3EqtVnyTUBGP1wmA0/83b89N6IfZmxrXVogxBRWtcCWGVOwngTFM9PokuOu5JIX3xzR8zzJiFMwK0+XsMxtasptfcCLFDUnLS1Bat6UslMyoyDoEoH9OK8ABq0kFtn6dty+a7AV5Sv9KqEIes6Az/3lhnchDnuv+t6IR29qE43a+hxpC25+8y/ReL1NOnvOc3CWuURoqEkY+K3zVghFsajSlRUKzV+GpxUxpa3LYaKcVyjxCdrdZQGIYCmHBcu7zSMnRvEqbg69Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by IA1PR11MB8149.namprd11.prod.outlook.com (2603:10b6:208:447::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 18:35:42 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 18:35:42 +0000
Message-ID: <ba940a51-9d20-47d4-8b33-6f8241f8edd7@intel.com>
Date: Thu, 30 Oct 2025 00:05:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/xe/guc: Eliminate RPe caching for SLPC
 parameter handling
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20251029112014.3747915-4-sk.anirban@intel.com>
 <20251029112014.3747915-5-sk.anirban@intel.com> <aQJXIw7zBBy38Dhi@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <aQJXIw7zBBy38Dhi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0216.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::12) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|IA1PR11MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a041367-80c4-49bc-8165-08de1719f721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHd6SEVvSkUvRGxaZ0l5d0lKMHEzeDUwY05uTzlNNDZERFdmRGEvR1Z0bEtS?=
 =?utf-8?B?OW83Yng0K2NLZXV4VENlK29heWw2UmFCSzJKMDJUNU15L2pXcmZZVk1zOFhG?=
 =?utf-8?B?NHc2dVRRZkJuR1dYM210eGJHRC91STd4cEI1Vm9oZmdvUDFFcGZhcytrNzR1?=
 =?utf-8?B?Q3lrd3I5VTlqL3Nhb3I1L2NvL1Y3VmtWRkF0UXpCQzVrRldDOGFqRDZvMUFW?=
 =?utf-8?B?dERmc1JGNXltallXanMwbjRZN05meFozSVh4VXpMQ1N3ZWl1ZVgxQ3ZZQVZK?=
 =?utf-8?B?K3B1dW9zNytNeVhBcUlOcnhnc2JwOGhTNDN5UWp6Y09XTkd1NGx1cEs3aXlY?=
 =?utf-8?B?WFJsYzhZYUZBWFgzcHNiWjI1amY1dzZhQ0VRNmZ2cmhqeDdUbXRtU0hZS2Jq?=
 =?utf-8?B?SXBra0VOS1Y1VzhpL2VkbGpOd3dUR2hZZmovVENtUzREbUd0Q3hiL0MxZFlh?=
 =?utf-8?B?M0hURkZmVVJDeDl3c1JhNlA1TlhXWlU1eEhjTmtUdnhZeU9yNnN6dDRHYnpS?=
 =?utf-8?B?Q3ZEZWxGZTdxVFVMZ3kwN2xXdzhyWmJ6d2l3UkFHV2lQaWh4aGRzbndMei9i?=
 =?utf-8?B?bUtDL0EzWXlnWHpUekVhSHRUTEpNYWhBbE5tUU5sVitYd2QxYTNaTFRTUnRi?=
 =?utf-8?B?eXZNK2xtQ2lEQ1AvejNrcGhPUHJkcjRkSXMvamFDVk13dFBYS2FIQTlZQS9l?=
 =?utf-8?B?amdqM0g1OEhYeDA1ektVcUczRmJkYWpGNWcrMEhBMDdmc2hmUVh4YWlxdTgy?=
 =?utf-8?B?TGs1MkJHUnIzNzhvcDZsMVcvVEw0Wk9idHhpdjdpRDh3K0hmZUhONzBlelhG?=
 =?utf-8?B?ZXlwVUxDY1hWVnBIeFNERUtOL2kwZnVIRis3OFNPajFkQzNhRGVvSkZvYlox?=
 =?utf-8?B?QTFxTWNSTE1YcmYxR2Q5cjlySWNkaElYeXB3b0JKRkp0d2d6dnIvRmg2NEFV?=
 =?utf-8?B?bGU0R21RUkVsemozaVhvTU5ROXBwR3crTytpZDZadnltZ09FYlVNbU9Ja1pw?=
 =?utf-8?B?QXgzRnFKYU56OEkyVzF3dWtsejZNWk9FT0RWa085WFZyQjhpMkdtMWc3VDJG?=
 =?utf-8?B?cEo0Y3RoOGNlT1dFaWtsNktKSWg4VGx1V1hVRG9aalVXYW9JRWllSlZCZUd4?=
 =?utf-8?B?dTVwSnJqc2Q2TkQrSHJ6U0IzeHJ6SERzU0J4VXArTVY0WTAvVnpqd0NzOFV0?=
 =?utf-8?B?UGlhMFNlU2JKdDRQQW9NYUozRVZZaUgxMmFVbnV3dGw3Ym85akppS0diWjlu?=
 =?utf-8?B?cmNzaklwTDhPNENqY1k3TjZiR3k3VTNXeEJTUWpiZ2s0R2p6Q2IxWUlPd2Nu?=
 =?utf-8?B?VWxtaFFKa0xtbFlTckcvY0xlVkVpWUVRUzdWM1doSXBWYjJWU1RGSTVGMkw4?=
 =?utf-8?B?b1RiNDQvUkJBbDE1clJTdXhSVnJwK1NkVFBzKzhlR0NWV21yRzJXbVdBQW5D?=
 =?utf-8?B?TDdiL1A4ME1TMzdkOVFpclNvdzcvdHZndnlJcjQyemZBQ0hkQjZNT3Uzc0c5?=
 =?utf-8?B?ZGdpYWZLSTYxbXRkTm8vWXRqTjhWMlRCeHg1TmJFM3pWUy9SS2FkMjhITnda?=
 =?utf-8?B?bE5JKzV1MGJnV2ZWWDZHMXdkemY5LzAxV2pPd3hRNkZweEVpUThLaVlLeWhx?=
 =?utf-8?B?bWJwbThxdWU1YW1oOUF5enZKbTNsWVcxc1pjYkp6Q3lKTUZ1OXlZZ1IycE81?=
 =?utf-8?B?K1I1ZExCOXBTRnYwTXBGR0lqMzBrTHJ5ZE54RWFRQkswUGdQdlJkOTdDdW1I?=
 =?utf-8?B?OXF1R0EvVXB6eHdjY1F1YUFycys0RzdjalczTERCdFhGeitnZENibGRzYkV4?=
 =?utf-8?B?RmVsTmxKWlU2ZFdYMmJ0L3ZodUN3VXBWTnMwdGxiRXNJV3ZHblAreU9qWmlp?=
 =?utf-8?B?N0NUSXJwTG1IWFpJeElhSkZoaG9QVW13L2s4VXBGbjA2YWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnBZUEFNYm10bjkzMTNlK0tSQVZBMnBsd3Jubi8vUWZhRHBoVGtkcHh6R2JT?=
 =?utf-8?B?eWdwclJBZG9UQ0l3ckFYYy9MWDNRMTNlcjhqVTVrSlpmQklVTzN4dW51Q2lT?=
 =?utf-8?B?bDFaa1lTeHJ1SVJTSjJoVWJzazVjUis4THlpeGpxdi9DTitCUVZKN2dqTE1z?=
 =?utf-8?B?cjVvU01IcWUybUFkamRuaVByR1o4M05QTWtTNDlHa0o3OU55U2hWRmdJRWdx?=
 =?utf-8?B?VlVZKzVUYWtqMmo0ZmJaWjVlUEVQOFF5VTBEWXdscGdwb1g4VHpicXNmLzBX?=
 =?utf-8?B?Y01LdHVPQXlDMG5nejRnc2llUmZreDQ3Tk0zaUIyMDFGVGl3NkRqRzJySUoz?=
 =?utf-8?B?RjREaDQ0TTY4MCs3bUsyYnFIYkdxSTBsSytKdDBTTjdieGxqUk4wdkczVTJz?=
 =?utf-8?B?N1ZXTXJ5RnMzS3poOUc3Vkt4VEMvT0tsSnhyN3U2VUc2dHFPc1lQSFVZSGlp?=
 =?utf-8?B?R3NpYnlGOHNjQWtrZnhsWC9lRnNsVXpLZTBsdmp4d2hvaFlWMUhQRnFhZ256?=
 =?utf-8?B?ZHQvY1FKdDI2WFR2NnJEemhHK1RJdGVQem5YUktXQ3ZBZ1pYU01sVmJjbEFE?=
 =?utf-8?B?alIzQ0tMemNsdnJnbWlubThTOUx2OStXeFA4K0w5d05iQXkxTEZIdFF0amRX?=
 =?utf-8?B?dlhSaWU1ZDlMcUtidU9zZDJUNmNiS2s2RUp1VEtvWFRud1VyZDBINkVhZEto?=
 =?utf-8?B?SFdTRlpIMUpPWVlVSmdpbENCRVlLODlPTGs3LzdqUDZONVkwVCtvcjVaWEFo?=
 =?utf-8?B?QXFWSHhJS0Q0dnNpZUJYQzlLSWIwTGdGT25xVFFiOGhjTHMxQU5oTnk1S2p5?=
 =?utf-8?B?bGllZnVwN0J5MWNlWDkwZklHTnpBT3pXdmhuSjdnK3hGVWt3Z3Y1bXBsYXd3?=
 =?utf-8?B?R0xiWS8rUEFXZWZQTzNraXdBdE5SQ3hkaTF5NE9EcXFIU3hHQjR3N0RrMWlV?=
 =?utf-8?B?ZFl3VEtRL1hsbWlucSszUERodnRWTnVVQXhybTBTemVpSStNaXBBK2FPQmJy?=
 =?utf-8?B?OWFOa3VHMTBxQnIxZ01CUmxVUjlHVmZGNXVXa2xzY0xOcklrcGVQNkJqczdq?=
 =?utf-8?B?RE9mR3hWL1p2VFo2VkhTZHZRSTlPT2FzaTFLdEJIOWpHaFRkeFljTExpcDly?=
 =?utf-8?B?MzFoa1MxckJ0SEMvOHpMemhwdG1GMnV6L214MTB3WWJ1c3d4U0FCSlBvZ3lp?=
 =?utf-8?B?K09Db0ovRGhlcFVaa2IxcEZoeG9XSUNWRWFXcnZuVVhIWVBWWVJWV1I3Z1Nr?=
 =?utf-8?B?WDZVRDFQczhncEQ1WkVpK05tcXpWOVJuRVIzWW9iNmgzaDRzbGFhalk5Znlh?=
 =?utf-8?B?bmFlSkZZeGpaZm5jdmQ3dXZZZHJUVGV2Y0ZWajFIdkFLZjY4cEpVaUloWXd0?=
 =?utf-8?B?MWl1bCtwZG5xTUxUN0xTOVB1Z0Z5d2E0bS9BcWxWWk9OdW9QdmZLTXZWTDRM?=
 =?utf-8?B?ZmVlSzZKQVBqM0xyckZCWFYrS0IzUGdUTDJWV2xRL1FtN2hRRXZjZU9ZQU5z?=
 =?utf-8?B?S2ZpOFV1RjdDUkZ4MVU4blAzMHhjVTlYU2xWV0F2Q0x0ZU1USVV5Zzl4cEFu?=
 =?utf-8?B?S2ZUYmFISGtYZ3R5am4xZHJsbTdzSkZZeWZ1UXVEMEY4L1ZOMmVuYWlqZWlF?=
 =?utf-8?B?NDBPNjNXUGw3WDBCQThWL3lBU3VJNW1RU3B4RVl0UldjRjNlYVZsRUFXSHVn?=
 =?utf-8?B?dWZOUmNVejdaR3FPbE5tQndVc3VESmY1T0VUeU9xRWRmc1hHYTh5OXZRaGQ3?=
 =?utf-8?B?cDBFOXVwWjRvdXorQXg4R2NwcTRQSjdjS1dsVExHcmFYVG4xZlFMKzVjUGNW?=
 =?utf-8?B?MFRjbC9RNlorSWxGVHZtbU1ibnpOaUZDOVc4TDh5VUtWelhZTDcxc0JOTW1m?=
 =?utf-8?B?UEJPbW93cS9vV2dZdmtyNDczMFk4dG9wWktqSElKYU9mT0V6Sk9CR1drMnNX?=
 =?utf-8?B?b2NWMGRqNlR4Q3l4Z2VQbXR6SFVIczRsYzF3TzNINXp6eUEvV1ZQNHN4QWFQ?=
 =?utf-8?B?NFZQUzduVmJJT3VPbTRzS3RGdVI3bm8rcW9WRjNna1VWdkRkUHI2MmNneDhR?=
 =?utf-8?B?ZUY2b2dEMlUrbitoUnZQNEQzampLZitpbktiMVdncmNqUnpyV0NvejFabWEx?=
 =?utf-8?Q?/udqgtFDTwqBD1A9NaIJstlQa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a041367-80c4-49bc-8165-08de1719f721
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 18:35:42.6267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqYnNQ9JUribyq+R41aLM8evSgc3xJr6Y9TS5mrSnnB8hBIlgR10qo+TXc8rG3zrGzGV21N8zYQp/5w85wIpvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8149
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

Hi,

On 29-10-2025 23:34, Rodrigo Vivi wrote:
> On Wed, Oct 29, 2025 at 04:50:16PM +0530, Sk Anirban wrote:
>> RPe is runtime-determined by PCODE and caching it caused stale values,
>> leading to incorrect GuC SLPC parameter settings.
>> Drop the cached rpe_freq field and query fresh values from hardware
>> on each use to ensure GuC SLPC parameters reflect current RPe.
>>
>> v2: Remove cached RPe frequency field (Rodrigo)
>> v3: Remove extra variable (Vinay)
>>      Modify function name (Vinay)
>> v4: Maintain a separate function for PVC (Rodrigo)
>> v5: Update RPn while fetching RPe frequency
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 75 ++++++++++++++++------------
>>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 -
>>   2 files changed, 42 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 3c0feb50a1e2..08deaa64aa85 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>>   	 * Our goal is to have the admin choices respected.
>>   	 */
>>   	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> -			    freq < pc->rpe_freq);
>> +			    freq < xe_guc_pc_get_rpe_freq(pc));
>>   
>>   	return pc_action_set_param(pc,
>>   				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> @@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
>>   	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>>   }
>>   
>> -static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>> +static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
>>   {
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	u32 reg;
>> @@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>>   	else
>>   		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPE_FREQUENCY);
>>   
>> -	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>> +	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>>   }
>>   
>>   static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>> @@ -408,24 +408,22 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>>   	}
>>   }
>>   
>> -static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>> +static u32 pvc_get_rpe_freq(struct xe_guc_pc *pc)
>>   {
>>   	struct xe_gt *gt = pc_to_gt(pc);
>> -	struct xe_device *xe = gt_to_xe(gt);
>>   	u32 reg;
>>   
>> -	/*
>> -	 * For PVC we still need to use fused RP1 as the approximation for RPe
>> -	 * For other platforms than PVC we get the resolved RPe directly from
>> -	 * PCODE at a different register
>> -	 */
>> -	if (xe->info.platform == XE_PVC) {
>> -		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>> -		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>> -	} else {
>> -		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>> -		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>> -	}
>> +	reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>> +	return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>> +}
>> +
>> +static u32 tgl_get_rpe_freq(struct xe_guc_pc *pc)
>> +{
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	u32 reg;
>> +
>> +	reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>> +	return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>>   }
>>   
>>   static void pc_update_rp_values(struct xe_guc_pc *pc)
>> @@ -433,20 +431,10 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   
>> -	if (GRAPHICS_VERx100(xe) >= 1270) {
>> +	if (GRAPHICS_VERx100(xe) >= 1270)
>>   		mtl_update_rpa_value(pc);
>> -		mtl_update_rpe_value(pc);
>> -	} else {
>> +	else
>>   		tgl_update_rpa_value(pc);
>> -		tgl_update_rpe_value(pc);
>> -	}
>> -
>> -	/*
>> -	 * RPe is decided at runtime by PCODE. In the rare case where that's
>> -	 * smaller than the fused min, we will trust the PCODE and use that
>> -	 * as our minimum one.
>> -	 */
>> -	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>>   }
>>   
>>   /**
>> @@ -560,9 +548,30 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
>>    */
>>   u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>>   {
>> -	pc_update_rp_values(pc);
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	u32 freq;
>>   
>> -	return pc->rpe_freq;
>> +	/*
>> +	 * For PVC we still need to use fused RP1 as the approximation for RPe
>> +	 * For other platforms than PVC we get the resolved RPe directly from
>> +	 * PCODE at a different register
>> +	 */
>> +	if (xe->info.platform == XE_PVC)
> I believe it would be better to convert this to the graphics version here
> instead of the platform name. But no block since it was already a platform check
> above.
sure, I will look into this.
>> +		freq = pvc_get_rpe_freq(pc);
>> +	else if (GRAPHICS_VERx100(xe) >= 1270)
>> +		freq = mtl_get_rpe_freq(pc);
>> +	else
>> +		freq = tgl_get_rpe_freq(pc);
>> +
>> +	/*
>> +	 * RPe is decided at runtime by PCODE. In the rare case where that's
>> +	 * smaller than the fused min, we will trust the PCODE and use that
>> +	 * as our minimum one.
>> +	 */
>> +	pc->rpn_freq = min(pc->rpn_freq, freq);
> setting rpn_freq inside this get_rpe function makes no sense.
>
> I'm sorry I forgot about this when I told you to kill the other function.
> It should stay there, but be called update_rpn instead...
Since RPn updates depend on RPe, my intention was to update RPn whenever 
RPe is fetched.
Alternatively, I can maintain a separate update_rpn() function, but in 
either case, it will be invoked during initialization and while 
retrieving RPe frequencies.
Another option could be to simply rename the function to 
xe_guc_pc_get_rpe_rpn_freq() to reflect its dual purpose.
What are your thoughts on this approach?

Thanks,
Anirban
>> +
>> +	return freq;
>>   }
>>   
>>   /**
>> @@ -1021,7 +1030,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>>   	/*
>>   	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>>   	 */
>> -	ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
>> +	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
>>   	if (!ret)
>>   		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>>   
>> @@ -1339,7 +1348,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>>   
>>   	/* Bind requested freq to mert_freq_cap before unload */
>> -	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
>> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
>>   
>>   	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index 5e4ea53fbee6..f27c05d81706 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -21,8 +21,6 @@ struct xe_guc_pc {
>>   	u32 rp0_freq;
>>   	/** @rpa_freq: HW RPa frequency - The Achievable one */
>>   	u32 rpa_freq;
>> -	/** @rpe_freq: HW RPe frequency - The Efficient one */
>> -	u32 rpe_freq;
>>   	/** @rpn_freq: HW RPN frequency - The Minimum one */
>>   	u32 rpn_freq;
>>   	/** @user_requested_min: Stash the minimum requested freq by user */
>> -- 
>> 2.43.0
>>

