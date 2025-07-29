Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020D6C87FCA
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 18:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84EF10E06E;
	Tue, 29 Jul 2025 18:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cabeYg5C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3168710E688
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 18:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753815441; x=1785351441;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7MVJpG5sMR6s7bOdVL/FA2FZFom0sRt0KZT0p6SG1vA=;
 b=cabeYg5CuYMQUuONdMkMtI1nTpfxTO09leEfqJUCUBrRilUlxBgAmjbe
 5W2Vgnyn4EhKO/uQQLeoai0wirBpNtHP77w+1nYc8LQKRSbPyl4NTjdqn
 /fXtzYTyMAKzxywREvSApv3JKnrteSGFTyv6PlNUYEhRLz6zJDlrkYAZL
 ZhTCJlmValb/QJBTrW941g4+3eQ7zHLpurxVvKWYBkELT4dyR1+C90iwu
 CYEILmCak4vrWrwGaG0iUcfUgPaC50d7rWmZ41MYLdtWNPxQElrsIXCs9
 zhKBFV7/sKOcRcK9IRKp2Ek4zPcGjd5HXv6Jexxpw2qURMzLhWbr95Ged w==;
X-CSE-ConnectionGUID: Yb53BljATYaeBTnhrhUEXA==
X-CSE-MsgGUID: n7Srp8uVRXmHSztuTCz29g==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="78655018"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="78655018"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 11:57:18 -0700
X-CSE-ConnectionGUID: op5+uqx0R6KfNw/jss69oA==
X-CSE-MsgGUID: IcnZNk+1TyOvwLhB3J3+0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162668771"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 11:57:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 11:57:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 11:57:17 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 11:57:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2LkIsov6eQn0k+ID6WSk6z4PGUfXkbIISYtk/J1qEVBCejjF4vJchvbJnTloUZGpQIBB2F+QCDcwGh3+5Kz/N/Vzb7iJ74OOrhtEArAlx7Kdj95BNyWw/RHfr+0qxW83b2GKROPlRMaCAic8GXi7nZ1p7sI+Z/u0bgC7JEKJF6PiKh1yqCIMHgScTfXNuVyUvRtCBAsP7zUU72lDhAqxYar0YmL/ERL8ctGTPRPOrw5gezBoipbsBuUVkNMYvCxKq3KheBzKPU+mmFMkuMJGG81458HJt4j6ZYuNeVw+2qgdvA7IxpRs3ma9asDHbSUXnj38pXipF5QgPFoAUATLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lk472R5T4GnfBU45mNDy8JfURlr8DpYYgyc4nvPSmIc=;
 b=CaBqsHr4+VZneoszp1Pa3HGmI4amc/3zFcKl9OuzCgV4YLLhPiJORTgZcav6FvrIgIfuNlnVAESmPO+QCL9RcNAYj5N17HWMkwYggKkMbc4JV4QqBtdwA6103qPexwny3rAKhaEsLQ0UaAol/4Z5yF6t+OmR7BYUDlOEMe4GoUpOaNcPrmC8UDPIRfwLmOugzy7kDQTOFX+29968wtEKwpnSgvCfk+kUd/0WiGxs8stFepRLzRU9uD4xLsleK2VYp4og5K3jC6FIHUoQOLrca/Kb3iFPiTDIn7CkLZWtyQyWto1ZKgEjxkzjCRKpZwI1jdyrKeArwa8aIGNuLdQCig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS4PPF11A2D5672.namprd11.prod.outlook.com (2603:10b6:f:fc02::b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 29 Jul
 2025 18:56:38 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8964.024; Tue, 29 Jul 2025
 18:56:37 +0000
Date: Tue, 29 Jul 2025 11:56:26 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe_oa: Fix unsigned to signed cast in
 xe_oa_get_oa_config
Message-ID: <aIkZWhaYm8Nk2a8g@unerlige-desk.amr.corp.intel.com>
References: <20250729182113.894152-2-umesh.nerlige.ramappa@intel.com>
 <BL1PR11MB54456E1F6968B0C75AD049AEE525A@BL1PR11MB5445.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <BL1PR11MB54456E1F6968B0C75AD049AEE525A@BL1PR11MB5445.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0141.namprd04.prod.outlook.com
 (2603:10b6:303:84::26) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS4PPF11A2D5672:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bbe1292-3432-4353-698d-08ddced1a574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emdXTDJZUG9GRFR4Nm50eEMvQXJrOWVJbjdFckhCWWZhdERIeU91UTE2WXh5?=
 =?utf-8?B?aC9SZFlibkZaR2xKdzRXamxjc1dkRUVoaE1RdHUxRUJqNktjTFE3NXpHZFNL?=
 =?utf-8?B?bHluZlpEckJ4dUNWbERqSWZ6dlA3ZGI1Vk1OT2M5bWFIT3pRQ1hScjEzYjZN?=
 =?utf-8?B?ZU11QTZEakkwenVSdklhbmtFSlpjUkZwNVVDZFFTakl6akxSSXIvWVlLSkVq?=
 =?utf-8?B?MndFaFhSRC8xa1VieEZEOXo3YURkanMybHZ4ZkdmdWhMOERiWjhwa1ZiRTEx?=
 =?utf-8?B?ZkZMeVRCQitOc2NTeVNsWkF4QXdjbENzczlkMERYVHZKWUpBR1NSaHRCTTZZ?=
 =?utf-8?B?dG5rTXlHckxZQ0xBZ3YwTU1PcGlzWElBRGo4bnNJUUdjUzFqbE41V252V2I4?=
 =?utf-8?B?S1VaSlRoQ1J2Tmw3SU0vUXM4cmFWcGFZSWRrTGRFaUQ0ZlQwVlRTRnIzZW4y?=
 =?utf-8?B?cUZpOWVjYzhybyt4Nk5CSVlTV01qVWVhbDNxNWJheGFUVFpVMWR6Qm5ocE9j?=
 =?utf-8?B?OWdjVHhKN1dwei9NY1ZVdEhFTHM5elA1cng0bWI5ZEh1QVA5ZHZjaFBHMVV0?=
 =?utf-8?B?L0ZWOG1xWCt4THUyaFp4ZFlRK1NaUTl1Z09UZjlWQmxUeFRpRFA0NExUWTEz?=
 =?utf-8?B?VjNtZllaNWVyd0JWSVN3T0dyU2lkZUY5S21Ia2xKcUJ4Q3lqUWdlOVhQblhL?=
 =?utf-8?B?S0U2eGo5ejlwTGMzOEF4eXR2Y2FISFA1aklrYzBwNzd3M1JyY0txWHIrUER2?=
 =?utf-8?B?MkFEMlAvQXd4RThQKzBZdTZMM3BFa3plajViamhEbVEzbXFqb0dlWkM1S1Vr?=
 =?utf-8?B?blpmN3p6UHBSS0tCOFRBOEhjT1YxTHVnK2IwYXRodVdSYTFHWWlYUWo0NC9V?=
 =?utf-8?B?MkpCM3h5ek5qTHdGZGhWckFMQ3lpWnNsbU1BNXpsSW02VjBxNTk2YUpYM3VL?=
 =?utf-8?B?QlNEcFlFMWQ2a1Y3cG5DelFnblQxd0NpdTJMUDVKNHlJQXpmMjgzYjZVWGJZ?=
 =?utf-8?B?ekdmM2l6WG5KYnl6M0lUa1VBMkJWVU5GNlFuMUR4NGlvY0xUVzNldmdpOWxx?=
 =?utf-8?B?NkJWL3ZyMlZXaGNOSTRKTXp1STZTSWxIMWxjQTNmWnB5K2tLbGNBakJQUkVG?=
 =?utf-8?B?Y3BycUZab3AycmpydHZKU3FGM084STNvdnoyVHlZRVZVYis0Ny9FOEo4NEU5?=
 =?utf-8?B?WTIxaWNUcGFDQTFzd3dRTU0zOWJKcWl3UHNHalhHZGNmSEZMQkFKN2xuUXdU?=
 =?utf-8?B?cTkwQ0VBbERWRThoV0Y1TmM3dWxsbUQvbE5BNG1scXZaclk0dHFpN1ZsVHpn?=
 =?utf-8?B?QmpORCtndFRPU2Y5YnQraDl1bGRUbzIrbkUrNHhpVElCODR3dFc3U0oxOHFL?=
 =?utf-8?B?d0RsaTRSNkpJOG5JWGhWWjkwc3B3cE0wZi9obHdlU21GYmhmdGVrOGRsdUpi?=
 =?utf-8?B?SXUweGFYOEV4b05NaUdGNHR1VWdsNUVTMTVqYTdFS3NFVFlVVVUrL3h0NGdq?=
 =?utf-8?B?R1gvT0lvRGFiMko3MU9ZOG0zdnpTSGVZczNXZzc0YXdPcDZiaUtDSkRBcHJI?=
 =?utf-8?B?WVVNN0d5a2FjcTE0dWxIbjB3Y3RabUJ2eEQxODNKWEpLOTVCNFlkcStGQ21i?=
 =?utf-8?B?S0oxSUVZK05saHgrNmxtZXdJMXRyLzNpdUFIc2pGVHA0d0dIaGVoMS9kbXp6?=
 =?utf-8?B?a0U3Y0NhbmRqRS9la2sxRzVTV0E2SzVpWXhRbWplUzc3SzBLZjF4Y3Z1VWFs?=
 =?utf-8?B?L3E4ZFRIRVJ0MncxV2hCQzVERThvRlVSY2xrQStSQ25NQ2JNbnhlV0NoWXV1?=
 =?utf-8?B?R2VIRDAreFRXR21jcU1FOXFqODlvRmZTbU9XU0NpMjNvMGFlSm80OFNYS2Fn?=
 =?utf-8?B?Z0UyNXJTSGlYUFVVcHluRU56WEtpMXVZRUxwZHI4czI2WU1HMWQxbDdjbE40?=
 =?utf-8?Q?Kl22iT0jJbw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFpjVGg4c296YzdlK0tvQkp4aUkzblc3OVk5Y2tHZVZNbzJkNVhMQzJLL3Np?=
 =?utf-8?B?a1FrNWd3VVg5dlVvakN5cXR0SjhoWDNRZnY4eWx4bWlWVllRR0xEdGxjQy8r?=
 =?utf-8?B?dzQ4L1p3M3drNk9UY0UyYjJJOTFmdnZrbjEzbktCWldjQTJDN001eTdidUVm?=
 =?utf-8?B?ZHVWc1dNaElUeW1jRWhSckV6dUt3NDlQWms5SmUvTlJuSXB4M284ay9Nbnhn?=
 =?utf-8?B?aTk2MzM3bjdSM09WcmlqTEJOYThjaGhMS09RUUl6R2tDSmhoTmRIcTRseEpG?=
 =?utf-8?B?VVN2NnJKQnhHRkVGQUswcDNqS1U5NVcwRXAyNXQ5NXR1R1pkUjNoeFVvMnlI?=
 =?utf-8?B?K05oQzlXdXJRcFM5NkpTRjZhdkhzYUR3VkJPVHZoSTNNZDJ0R3lOU3BHRjBJ?=
 =?utf-8?B?aXpoaTlvYmE2NXB1UXRVQWZjVUdBTmlGcG5OUjJ5dFBpNlJnaVVGZ0dtVUhp?=
 =?utf-8?B?V1lCSVVhVm9WWWx2cWRDc25HL1ZsaGdQcyt6amNBWnZweFRCbDFhR1hIREFO?=
 =?utf-8?B?NEYxeXR6NEJ6SlY4bXNaWldJZm5HeEEyY3JJdFhOUVl6cWJpUW4rRUlwQnA3?=
 =?utf-8?B?M2xnZDBWeU9KSFUvZjZYdGdvVXZUbEhvY1J4czl6N1VvOXhvM2pQVEk5c0lw?=
 =?utf-8?B?Q2NSc0xXM0V1ZkJOZ1RHeTBuNlJNeDJuY0RsWHA3Vm5qQnd0QmRuKzlMSy9l?=
 =?utf-8?B?UVFJYWM0WEJ1R1BCV25VRlN1WWx0TGMwTStPQld1bGZtamJ5aDBLeWJEUkpN?=
 =?utf-8?B?TDZHbFFuTXZPTzNnMjhyN2xPR0RNemtxaEgrQSthYmM5MWNSelVDODlTdXFV?=
 =?utf-8?B?SmVIOHRuek1lc1RVYTMrNisrT0xzRklRUm90elI4Ukd0NU1EQk1oQlAwN1hP?=
 =?utf-8?B?aGFzMUJ1bVdLbkJtNEFOdnZaaHFSRHlVODNBMXRkVFFwbkdVZEtoOG9FdTg1?=
 =?utf-8?B?YlhtMSswT1FHcllBWU1PTDF0cEw3S2JEdmNsQSsvMURNanFoU1lQZmdhNHZD?=
 =?utf-8?B?ZXRjbXI5RytQOXF5Z01SSFBqenJIZkwzVUt1MWxqWHF6VEQrYzlLc3ZIbmI2?=
 =?utf-8?B?TFV6UTBOV2lXbmJqTFgvbFJQQ3pvSVRuK2NrNkRqWjZYU0pabHN4cTBtY1RS?=
 =?utf-8?B?amV1QzRuODZ5b25yU3FiMFcvRVVmRHBueCswamxpbFQxRkZVMUZhSUJDQlgw?=
 =?utf-8?B?T2NIT0xkcHVGY0NoMnkxQjkxdVFtTE4rU0h6dHdFU055RTVkbnBjekJybE9m?=
 =?utf-8?B?SXFYTGRpa084SzNpQWRQRDVoZk5JS1pTZkFpQzNQZDVTVXNMT1lha1pwMXJW?=
 =?utf-8?B?QXBpVmc3S3hrV3R2MDMrREEyamNEdEhjN1BQLzBCeDRzeGkxeVVzRmFteEMr?=
 =?utf-8?B?OHhFdFJUMVBGd09wWkp6TC9yRGxMQXFWQktYVUhSRFNuQXg3VFphSGdJK1dR?=
 =?utf-8?B?eS90dk5FYkk1WldJajlrbG9FMzdWd0xWSGJmS25DalJjN2gvSW4yeEs1dnN0?=
 =?utf-8?B?VGlSZm0yYlpLdzVQYnRwMXFwVFpqZ1h0RGs1TGhYb1JRbkV4SlA1ZW9PY2Jz?=
 =?utf-8?B?RWJzcG5pQWR6ek5rbnBYTTc5TVNaRHR0Ujc3SnViS3BHZzE2SnA0V3p0NW1G?=
 =?utf-8?B?RStOd0pna2NYcFRiTTREVG5aZk5QTDdUVzhCWGhYaEZjYjYzVmc2VjFleGR3?=
 =?utf-8?B?YjRrQTJORUlWVFlFOGxWenYwM1Vaay9nbW9yV2ZvbEZucVVVUjFicTZCN3Fq?=
 =?utf-8?B?bStrZUpUQXJxZFFQM2c0bzlsc2s1SlMwSXdrenlVNCs4bHJDUUhEOG51aWsr?=
 =?utf-8?B?V2JXWXQ5eUh0eTI3V1FHNm9PL0xuUzdhNUI5YzhhQjllUDFyUGRSSHlLQWgr?=
 =?utf-8?B?MEtNWHZvQjU3Smg1ZHkwdUZ1MXFDM1VUQ20vUWxwT081OVA5UkJxZ2d4QVNL?=
 =?utf-8?B?eXNQUnAwZWlIWTNuLzZ3NldFUUsva0h5YjlMOEp5MmZjdE8yOU5CSUNwdzJp?=
 =?utf-8?B?V0ZOY2ZGVXk2M3QxQU9iMlpuM0trdXhVbEtTNUszYXZDT3YxUlJuR0I0Qm5N?=
 =?utf-8?B?T3VWY0NYamMvR0N4Vkx1RTdpMWVNZ0dUWlFuYU9DMTBReW82UUY0WElLd0ww?=
 =?utf-8?B?dFN5eWVhY1cwVytNbndHTHJkOFhIcE5oQmZtUTlYMkNUNzR3RCs1NEZkaTRR?=
 =?utf-8?Q?N2zTNz3o2s7o3Tc64G1GjkA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bbe1292-3432-4353-698d-08ddced1a574
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 18:56:37.7885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWyTb0ACTKpVgzoQ+zfSckEhqYTu2VCHssXvBeR+YlAQZOTWJi1S2JLllnZvNMqU55/8t97aMpfs1sEErQRSsPwjw8yXvznl61bA1c3TPmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF11A2D5672
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

On Tue, Jul 29, 2025 at 11:40:31AM -0700, Cavitt, Jonathan wrote:
>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Umesh Nerlige Ramappa
>Sent: Tuesday, July 29, 2025 11:21 AM
>To: intel-xe@lists.freedesktop.org
>Subject: [PATCH] drm/xe/xe_oa: Fix unsigned to signed cast in xe_oa_get_oa_config
>>
>> Static analysis flagged an issue with casting unsigned value to signed.
>> Fix it by using an unsigned parameter in function definition.
>>
>> Fixes: 1db9a9dc90ae ("drm/xe/oa: OA stream initialization (OAG)")
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_oa.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index 5729e7d3e335..e166547f43e7 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>> @@ -178,7 +178,7 @@ static struct xe_oa_config *xe_oa_config_get(struct xe_oa_config *oa_config)
>>  	return kref_get_unless_zero(&oa_config->ref) ? oa_config : NULL;
>>  }
>>
>> -static struct xe_oa_config *xe_oa_get_oa_config(struct xe_oa *oa, int metrics_set)
>> +static struct xe_oa_config *xe_oa_get_oa_config(struct xe_oa *oa, u32 metrics_set)
>
>I mean, the alternative is that we change the metric_set parameter in xe_oa_open_param
>to be an integer instead of a u32, but that might cause the same static analysis problem with
>xe_oa_set_prop_metric_set, so this is definitely the better solution of the two.

Also, the metric id is expected to be >= 0 always, so unsigned is good 
enough to handle all such references.

>
>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Thanks,
Umesh

>-Jonathan Cavitt
>
>>  {
>>  	struct xe_oa_config *oa_config;
>>
>> --
>> 2.43.0
>>
>>
