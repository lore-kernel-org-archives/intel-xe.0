Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87E9D0EE13
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 19:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788C510E074;
	Tue, 25 Nov 2025 19:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knZ7gjdC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6742810E074
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 19:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764098088; x=1795634088;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KzxxX6xtnlTwjBLMBhrS/ghTe6DbRUg5TErtMKruVVg=;
 b=knZ7gjdChd9jwjR6FyFlT6RlLFzvfCuwbq5v6aoRYdn2xOaxIQY3iesv
 s9C4S5SCpwqxPc9FbQk30MfRvvYgxz60NrvWoyoXzPn8Krr4y4++x+i3u
 VIgIOcih2wmVnwQ00JripP66EKaAXm2NNfM9G+jqX8gNx9e5ZzG1XiSoM
 ZVfUL2JXdYmNrelHdFXaXT+OUKdKzSVgVVGTMvfD8PbWe16meTe/47Poe
 mrW8KTtcxE87V3WgOUw4FuvIbQAIsoEIVjPV17qChmkeM/Ug2gXMyyJ8k
 kHYnMPLnTmFL4GrtUp3zT51SFpt+5WE/kYCzJLIDfPu58DR21fKAZNOXJ A==;
X-CSE-ConnectionGUID: /rueqGX+SiaoiV1iJQSZjQ==
X-CSE-MsgGUID: K3LzdtMQSOSKRIj9GzF4qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77237962"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="77237962"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 11:14:48 -0800
X-CSE-ConnectionGUID: nKmEEp0HS16rHOL5biZOew==
X-CSE-MsgGUID: VqtgH1dsSVeBljKdIhWgcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="193159453"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 11:14:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 11:14:46 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 11:14:46 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 11:14:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRNMlGqeBWYzM1LPw0XpUcWyIdlMDUPVAjnJazGDcQrJI3XjVmwA9JR9jyO5sKXjccy9lLAY23DeItoaxqvt3+XvtGKSEk2LbKeqBjCbiyajEx+0HFgg4RIfDzrJ/H5DDgi7px3F0N5H2NmdqvuJLb8torOwIULplVWkDZiuBjz/PMKHkn3Jb4fIALPEPXWMY4T11d/0cwwAZwo9sLu5Qvwzqqml6Hk0HAAt337dfpEu/CDthaIetMAoYFgFE5nVx/mC5xUfUcU44B176W5A6iSoEJoz7hw5eBgu+jTPsWfbMDXw2ccpokuxgvFHrky8AHDjgVIoCf1HfMUAgxWL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1pWr4yxObAY4H/cGT48uIg2RGl4Lk1ErB75pop6YKE=;
 b=wl3WSEb+G0CFh0xOSaFFXCViqECHlWcqB0wqL6JjzMQu94OBqq/ls8FUZ3G5YGFZ8fAJyNJlJY88D86HMH/VH7UESjBWLOs/rI1+JFcolm9C3oci7QaQo8vikrImVpO/c79rdWxLncELl/PRJnez1pR+PYW8p89MX1XhFz8lxMoTnD4LHulXUTzlL93up6niD+XacnWSjzN8rgr2TEgRssKEt7jmtORSgC7t4ohJbZJXmLl+jfEmJICklhzF99SR7na3O0twR5BKBPC3vOyd9N8TEo7CBe/l21dK7+bJsly58hel7gfTQJWLZcVbyD+3OCmCGjJglql+Es7/M78vAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH3PPF10E309DEE.namprd11.prod.outlook.com (2603:10b6:518:1::d08)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Tue, 25 Nov
 2025 19:14:43 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 19:14:43 +0000
Message-ID: <26c5d4da-8528-4c52-8871-f4aa76300e40@intel.com>
Date: Wed, 26 Nov 2025 00:44:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/xe/soc_remapper: Initialize SoC remapper
 during Xe probe
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>
References: <20251117205315.1458477-6-umesh.nerlige.ramappa@intel.com>
 <20251117205315.1458477-7-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251117205315.1458477-7-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::7) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH3PPF10E309DEE:EE_
X-MS-Office365-Filtering-Correlation-Id: d303e49f-ab1c-43fc-a505-08de2c56e3a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTVKSjVNekUvQUp6aWFUbkxLVVBzSVFVcllldzZkQnVHT2c5d0FnYUFDWkta?=
 =?utf-8?B?K1I3Z1E1MmhNeVp3U3dKNVI1UmoreExoMGxRTnhyQ2tqN1BxOFcxUTYzTHNa?=
 =?utf-8?B?a0dTdGtnbGJIaUZWTmpuSTVVWFdHNGU3QTQ1SVR2ejA4cVJucGxBcnZ1ekMv?=
 =?utf-8?B?NWtxRGJjOEpiZjhyUGJ2N3hYSWFsYjZDMEVkdTdFN0Q5N2R5WGk1YkpRV1gy?=
 =?utf-8?B?N3Roemo5SUhqc2JZYkRUU0p4cS8vOVBZMlZDYTFkWitVUGdIVW16VWZGQTlJ?=
 =?utf-8?B?UFRTVkpDRTlhbEVUMFA3cSsrTG0xaW5ZZ1VvMFVzQ1p5M1k3TWppVks5bzVq?=
 =?utf-8?B?QzMyMGpzSGFJZ3lSNGJUdjR6UTZGRWxvT2hJK1VDMU5GNzVoekFscnJsa0l3?=
 =?utf-8?B?TlZlTE5JMHZqRHI3bThyOWNXWVpnK3k1Nk9VVUc3c0lzcVA2Q3JMNzRzaVJN?=
 =?utf-8?B?dmRqclNTVlNXNjdqODB5SWpISGgzY2hqS0hvdzREenhQL1JWcnJWTURhdTVO?=
 =?utf-8?B?TWM1Nk9Sa25yQ1RBamJiR2UvWVlBQzFoWE90L1h2aVE2ZjF3K0JCQkUzTmlD?=
 =?utf-8?B?eEZOTC9QdFFWeEt4TTkweTNqVVJLY2I5aWJYRVM5RTd0Z3ZNT21SZ1hIQ09l?=
 =?utf-8?B?WitVNUhKYnBxM0xMV25LeEhOaWgwVFo1ZlhQZ2R5WEYxMHpnQnhhUURCbG9k?=
 =?utf-8?B?L3hxWEVHd0JCVjNhcHVVdHNOMzhaa0FwRnpDNXlvQVRDa29rV1ZJRWdoUUhD?=
 =?utf-8?B?K1k4K1hEdEFxMHV3YkVyZmlxc2taRjVFRWFORnNuUThvbmEwbjUzZ1NiSmtN?=
 =?utf-8?B?eTMwUUpFKzFkSmtoUkRQNDI5d2dHS0U5LzBXbTEwQ1pWR2xHdzhEWmpjRWRx?=
 =?utf-8?B?UG55WDhyME50elpOd2xjeFBvRHhsUUV4L3U0ZjA1ZThwQ29XcDRUUDQrdlQz?=
 =?utf-8?B?dU1LZWd5MHUxbUQ1dDZZc1o0TC9hbU1ySWdWYWRFZG1UZXk0ZW94R3I2MmVj?=
 =?utf-8?B?MEpLc2xMdE05dXJGU2pvZm5BQzRaa3NOWTBEYVpWQVR2WjhrV3NGN0pLUWV1?=
 =?utf-8?B?LzVmcFlpY3ozRWFqZDFPQVNWNVVOaHNwNXFBbzJzRGQzU25EME9qVWpsMm8r?=
 =?utf-8?B?NDAzbWdjRXF2aWptOVpDQ1RWaGJlRUYwV2dremdUMU4xTnVDeXQ3cnI3KzRI?=
 =?utf-8?B?NzdZY1FsTkhFbU11TE9qaXpiM1BBZWwzTUMwV2lMeVlaS05yTTNBU3A5bUlR?=
 =?utf-8?B?TE05MkwxdFVqWFFmMmtQNGFqL1dwZnhXYW1NdTU2RHdhVTR2NXB6eHR0Q2tp?=
 =?utf-8?B?QmlYU3N1dmdOSTBFUm8rdWRBcnlxV0pxUGhVNlBYUytjd1NGQzZKMjBVeFRF?=
 =?utf-8?B?bTJJOE9GTXU2MTdMK3lBTG1YRUlMd3hlUkppSStrQzJtK1RFMVRoVDdwYVdC?=
 =?utf-8?B?QmppM3pNdFByejkxM1VkbXllUWJoaWhPOXVFVlhBYjQ3UUVVdmxUYUtlNWta?=
 =?utf-8?B?NjBQMUdJa1lSUEVlU08vekQ1Zjh5Q1k1RlBsdkNZYVlldnJDVTl1WDM4RDBw?=
 =?utf-8?B?S0IyRkZmU1RHdGZ5dmZkdjVYd3VkaWpmZHFoWUNwb1llU1hsRmE3alVEdy9q?=
 =?utf-8?B?ZVczRmZmNjZrUm1oTElzVnphWEIzbUdhUGdSM2o2TzZRZ3N5a08zY2x5TDll?=
 =?utf-8?B?TklvY1hxQ3Fxdmo0eGxrNUQ0aVkzZXZrR2greE5GZjVVMVlFQ0JOTHQ2WDd6?=
 =?utf-8?B?LzNMMHhKaHZFUzRRbm5kckZQZWlvbGVqSDZ5MzZPV3NQTzF0RHhWQ1oxUVdk?=
 =?utf-8?B?aDNaamZrbUxhSWFmQlBoZDJSQTY0NHJIbVlQMVBxNUFDV3B5RzJvSHhIZ05E?=
 =?utf-8?B?NDFEd3RZMXZkcFR1OVhZaXc5TGoxSWs5d0hGUkpRZ0xpMU1nVk5jd2JvRFZ6?=
 =?utf-8?Q?7wFWe4RpWBZ3091xqjbn+leTnAk6Ds93?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1U1Nnh6L2VNcHgrNU1RUmI0ZFE2SmRscUQrbHE5M3F2dzg4blduMy9kclpD?=
 =?utf-8?B?QjlBdTRjMHdSdHBxN3R2NktIV3o5L29GUHZnMlc5bzNQVGJGeG85cXRHWFQ1?=
 =?utf-8?B?TGZpYnFqY21XNEhBY3IxU2w5dHVRd0cyeS9uWERPYjZpS0VFNFFhMEpUekc1?=
 =?utf-8?B?ZERDck9mbnZVOG1sbS93QXBtcVRkd1UxeWVpb2dGMENpcVFsa1NqaitsQXlP?=
 =?utf-8?B?RXN5TkpQMkJZZHRGUUo5NDJQS2JMVDJWaC9UVG4rdGt4amtQN0lDMS84VVNV?=
 =?utf-8?B?TnV4SkJpSGE5b0NNek5wNVlZSkUwTXpSbjNpd1NvMkZMeVd4RGVkT2hqOXpB?=
 =?utf-8?B?c2lJa1RlZ0s3MHZJUEJ3WUVkRCtYNWw1cFJNOXl6N1lWMWpLOTI4SWtwdGtr?=
 =?utf-8?B?R2tLMkhtNnd3T2VDQVR4d3dWcmZqSTBRdG1TSFhheGtwQUMwKzlETU9sSGtW?=
 =?utf-8?B?TVNadkQ2UVZIOUNva21yRjdxQ3JEcFhaZnpWQ3h0WEMyZVY0Q0hkYTJyNWh3?=
 =?utf-8?B?Wk14R2xWUzhmOUVEN05ZVGRIcmFjb2RvQVRSNnh1Z3JZblN5NUhTaEw3RTll?=
 =?utf-8?B?d3VINTlwMW9vTko5ZXdOQU9NaU1WMXBwYWVVOHlkeEduRDBtb2NiMU5HWUpk?=
 =?utf-8?B?MExGWGYreFVvVkdNZzB3bjhhTHdTckNoMUtoQlRWZFZFa04xUjAvbVZtS3RG?=
 =?utf-8?B?UE4rRXhHZ3dNMUQ2aGtpZ0xtbWVzQmVvajZJZlpSalVsTFVTOUtjNm9OR2E1?=
 =?utf-8?B?ekRZNHlqaEhmeTUyYkpCejVrN0lTUktOa2hQS3BXVU1HbEdQbi92R01ybUxo?=
 =?utf-8?B?NUlna1dYSG10azE3a3RJVklQZEQ0RFVsTXBEaEo0Vis0b3RsNGRDcnFoUmp1?=
 =?utf-8?B?WUxkRmVaZ3RuNnBaNC9OSEJVUzArUFVYL2RDSUxSckhzamo1WGZRTnlqMGI1?=
 =?utf-8?B?eGxGS2ROTFJ1eVY4VG5wSThHelNodU9rZzFTRUthbVFtcjhES25HRXQzTkNp?=
 =?utf-8?B?eXUvWnhqbUM0YlFrRVJYbHdQNi96aldTRmM5VkxDZHU1aC96RlZsYXJpb0hJ?=
 =?utf-8?B?OWpXTzAxVnRqVk4xa2JRQWE4V05JL1pOenFLZGxoVlhjbU9iZjhSQzV0c0ZI?=
 =?utf-8?B?Q2xxR2NVNDZlZ09ZOUFSblpRVFRtRE9lRmZJRU9EYlVkRjBnc3FQK3BLeXNi?=
 =?utf-8?B?aEQ2L0J3WTJOVmhYcHhvTThHQTRJcTJTUmJiMEk0QVA3dTNTSldkM2U5NGM2?=
 =?utf-8?B?VzZxazFLdzFkeUJPUGZFTld3MTMxMWxRRDN2dUhKdTdmVkRNNm56UmszdXlo?=
 =?utf-8?B?UkVrQUhuQ2J3cmRsbU45am1DUDdGNnFnUGx0SG9HNGNSekc4Y3NSYkN1aVIw?=
 =?utf-8?B?dmxnZEl4ZlhNcGlOa042TndzUDA1Qmg2b0o0UFJ1azZaS3F3VlhLNHBrT3Bz?=
 =?utf-8?B?TVNXVGhBSm5MUWJMeGVJOWFuWFJ0cTFZcFpNK1ZUaHVnc28vTnpoWjZMTG84?=
 =?utf-8?B?UEdTNWFhOEJRUEg1NXluYzRIcG5QUFZGSDBiVGMxM3Y4TUtWZDIrcEtoMlB3?=
 =?utf-8?B?YXh3QnVFbk9qMjg3OW1SNG1sdTd4NlRkSDMydGxobDlGZXUzTlFSQ3NGRXRU?=
 =?utf-8?B?QVNTYmFjUm1SNnZYeEViMU5GNTc1YUMxS2lGUldqVTlsd1RlTEc5dFYvZzVl?=
 =?utf-8?B?eE4reGdHT2xtZEtyWUNPR056KzR4UjhwVElhZkNVdjRjayt0bjFVU0MyTmFI?=
 =?utf-8?B?NURkNmw0WWF1Z1VwL1QvcFZEcmxVc0VxOTFZSkZWcW9ZSkdjazFaZzBFanVm?=
 =?utf-8?B?N0VvelN5MzI0dWtFK0R0bVJORDFlT3Uyd1JnTjZWRFdVNlhNQWZmSkZ5QnZj?=
 =?utf-8?B?dk1DalZ5VktzcHNkSDhuandYMzhGR004OTA3NXJ1S2ZrSHFxbFM3S3FDQTFM?=
 =?utf-8?B?MXhLRzRYblFkZXJhQzI4WkRkMjNlUmJnbU0vSG1JbG45NHZzcGhwWnRGbk1B?=
 =?utf-8?B?cnNMZmNvcGlCUzRmUW10YzFjeHYvWHUzZENhb1lvL0w5bnNDdHNPaDMxNUo5?=
 =?utf-8?B?aUtsSWc1cmVIbXBpVnFqNEppOVZ5d09wWXdKd2pYRjRHc2pXTXprTUpvR3d0?=
 =?utf-8?B?K01vcEdJUHhCM0kzdlBTZGsxMjIzQTgxaWpwZCt6V1YwS1RhYmpJNjdSTXVq?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d303e49f-ab1c-43fc-a505-08de2c56e3a5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 19:14:43.4569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dphn51JNWHKoizGyzEQHJCEzfsSNioVmTG1m9bu4qf5lSTyIJU5qajEkU3pQEUW9PzL4zClyMaJ3hnEqOUvOFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF10E309DEE
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


On 18-11-2025 02:23, Umesh Nerlige Ramappa wrote:
> SoC remapper is used to map different HW functions in the SoC to their
> respective drivers. Initialize SoC remapper during driver load.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
> v2: (Ashutosh/Lucas)
> - s/remapper/soc_remapper/
> - return status from init during probe
> - reorder patches 1 and 2 from earlier series
> - fix copyright year
> ---
>   drivers/gpu/drm/xe/Makefile          |  1 +
>   drivers/gpu/drm/xe/xe_device.c       |  5 +++++
>   drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
>   drivers/gpu/drm/xe/xe_soc_remapper.c | 15 +++++++++++++++
>   drivers/gpu/drm/xe/xe_soc_remapper.h | 15 +++++++++++++++
>   5 files changed, 42 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.c
>   create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8aa85c93b3d6..977b75336016 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -110,6 +110,7 @@ xe-y += xe_bb.o \
>   	xe_range_fence.o \
>   	xe_reg_sr.o \
>   	xe_reg_whitelist.o \
> +	xe_soc_remapper.o \
Maintain alphabetical order.
>   	xe_ring_ops.o \
>   	xe_rtp.o \
>   	xe_sa.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 9f2f19dc1fd3..0d51502af30e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -60,6 +60,7 @@
>   #include "xe_psmi.h"
>   #include "xe_pxp.h"
>   #include "xe_query.h"
> +#include "xe_soc_remapper.h"
Maintain alphabetical order.
>   #include "xe_shrinker.h"
>   #include "xe_survivability_mode.h"
>   #include "xe_sriov.h"
> @@ -911,6 +912,10 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_nvm_init(xe);
>   
> +	err = xe_soc_remapper_init(xe);
> +	if (err)
> +		return err;
> +
>   	err = xe_heci_gsc_init(xe);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index a03cc83aa26f..de23fff3262c 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -547,6 +547,12 @@ struct xe_device {
>   		struct mutex lock;
>   	} pmt;
>   
> +	/* @soc_remapper: SoC remapper object */
> +	struct {
> +		/* Serialize access to SoC Remapper's index registers */
> +		spinlock_t lock;
> +	} soc_remapper;
> +
>   	/**
>   	 * @pm_callback_task: Track the active task that is running in either
>   	 * the runtime_suspend or runtime_resume callbacks.
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
> new file mode 100644
> index 000000000000..f5a02abd6ab1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/spinlock.h>
> +
> +#include "xe_soc_remapper.h"
> +
Please add doc here
> +int xe_soc_remapper_init(struct xe_device *xe)
> +{
> +	

SoC remapper is DGPU specific entity, should there be DGPU check here, 
may be add has_soc_remapper flag?

Thanks,
Badal

> spin_lock_init(&xe->soc_remapper.lock);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.h b/drivers/gpu/drm/xe/xe_soc_remapper.h
> new file mode 100644
> index 000000000000..3cfd44f1fd74
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SOC_REMAPPER_H_
> +#define _XE_SOC_REMAPPER_H_
> +
> +#include <linux/types.h>
> +
> +#include "xe_device_types.h"
> +
> +int xe_soc_remapper_init(struct xe_device *xe);
> +
> +#endif
