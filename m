Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C8CD6CFAD
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 05:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29F710E11D;
	Fri, 23 Jan 2026 05:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFlFhoga";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5E410E11D
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 05:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769146921; x=1800682921;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=n8GOnfmB42YikWs899E4EPjB/wBsJNg5hy81CfOdwtk=;
 b=nFlFhogaWz/I2JLgLkMOoev0jXtS1Uo4FrvRgP1zO8iX2qKS79lAS7Fr
 uPau8MMrEbSt3H7tFSUjyygZB7CRkdcomI5oQJJAZ+dQSlHMZESDM8qrx
 Y9qmEf+dipzevFd+ahtUYXefR3MWG/oNchk25an47E3SIZ/vPsH0XHTTY
 XrfU7Bt1F+uVW+Z9smBoSaG5MDVfSpLz+TrU1eZdOYxZtLJvXQiUsDpxZ
 s115QHRGDvIQlYyqNALOJKZ3eNe+2U+ZHxcA6s2z6gjc8PRRClDnCnbpP
 erVSeNKmFCOI4NZP+9/fqN/MMwlBpYGbX6eNuSYciGoG0tfmx58ntMj+0 g==;
X-CSE-ConnectionGUID: szs09vakRPeKhtb5hXC8gg==
X-CSE-MsgGUID: fhZMqTP2TF2kitwrKjEnqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70449682"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208,217";a="70449682"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 21:42:00 -0800
X-CSE-ConnectionGUID: RQ2X7nrDRRislBNhYsburw==
X-CSE-MsgGUID: qvKKqH/OSdaKJdmfQ6WRgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
 d="scan'208,217";a="207198195"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 21:42:00 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 21:41:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 21:41:59 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 21:41:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IoRJ3G9Qe+hUqoYO8+xKI3/B04tNyJyupmGm73YPGGNefg2xNu8ckNr5R7z7n8xPHHRWztv/I4yTSxYBJRmhQiVdO8T6XudAwf5UWrDa1cX5pWgq0qjzxYlX5bKM0htMvP4W2w1zQloPtrQf4MVuwnfHamWtfBJS50x5a9sU9sMUXyAHHw2PdOuuXbyeUOw40Ia+ja6dUAzlpu0rmh0wk/pImMmLaxnN/+u0zV3D/Mquw56An56u7v0OGZzVG3WSNGJn/HZ1uZQSf5s4AtR9c3VKNxvmflefFZQiLtvy7NgWNHwkumHdY6Otu2bBmP6NkKURZ2q5/MUvZjcHSZsM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFvHD8376mcZwcd5wXJ6Yk09mJHsLY8Io2ljlljmBBs=;
 b=VFR9mLlOTbLpyG5MWgCncvoE4ljRNMjmtBy1JpvQ/xmK+4waC3EcVMIQLbOAzAuKivlMltLWqKUgQBOg3kgYvpw3AsaOFbusUUiuvVBJ9VJMlp5rHNEcJYBDrYiD2PGq7bvLuZ3SYrMVNTB+Vmuc00odUDVLrYmDCKytdcyvOtTT1UsxRN9IhvVSar8oqLPzlxwj1Qv0mV4J27YP3fOOHYljo3ufmoJrMiY5V9Q9C6Wt9+bzw3Npncv6fJLxusFEHTRyYRuGuWbXlXmDYtXN2Z+xUtvpJXVT5osZV06z0UcySIZceqTk9+8ci8dKqVLDNshyUkGgJDGzfxGlajTqIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3041.namprd11.prod.outlook.com (2603:10b6:208:32::17)
 by DM4PR11MB5245.namprd11.prod.outlook.com (2603:10b6:5:388::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 05:41:57 +0000
Received: from BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3]) by BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 05:41:57 +0000
Content-Type: multipart/alternative;
 boundary="------------3RFA422uJa8prar0M6SCm1zh"
Message-ID: <7614efa2-b126-4fa6-8213-a8cd764e4419@intel.com>
Date: Fri, 23 Jan 2026 11:11:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] drm/xe/vm: Prevent binding of purged buffer objects
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-6-arvind.yadav@intel.com>
 <aW+6+dvH8trVV8eD@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aW+6+dvH8trVV8eD@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MA0P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::6) To BL0PR11MB3041.namprd11.prod.outlook.com
 (2603:10b6:208:32::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3041:EE_|DM4PR11MB5245:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bffc80d-3ddd-4c63-b91a-08de5a421f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWZDREsxUXF2MjJFTjVRME1PeTE1bHhTYUQ1U0F0dzJudjVHOTFPem5sdEp1?=
 =?utf-8?B?Z0E0VWordjN5VldzL3pkUHBSTkcrNUp0bWpUeHl1MlQxL0RQaHF2N1RhbjZE?=
 =?utf-8?B?cGd1YXVWZGg5emEyMUZvUUhLM1pUYlZUNzdmLzlHL0hSQlR0M3ZsaThPaXNs?=
 =?utf-8?B?WEFteTRmcGlUSGxUb0dqM0wzaERRLy9RZWJieWhtWHNyclljNHp4MWNJd1NN?=
 =?utf-8?B?KzlCRGdMN2gyNTQwWkRQS1pyeW5ESWlJejRTMHFlVlNMOVhPeGNIVGFITk9S?=
 =?utf-8?B?b1l3MStYQXljM2pxUzlzeUYyL0wzM0poUzBnMFFUeTVVUlNXNDVKNlliMzR1?=
 =?utf-8?B?czdheU9IRzRwTVJzeWYxQTBSMkFvN1ZCbkpVWDdWYXVFc0tBTnpWSllmUDRD?=
 =?utf-8?B?YlpQckc1cms0N0hEOS9va3dIanBvVFNNNkwwWi92dTJYbVRuUlRPRDJQN3hH?=
 =?utf-8?B?UTh0N2IwWG5BRy9DbUpnN0srQlR6c01Ua09taERKaWFpdzRjQlhsMSsyLzFN?=
 =?utf-8?B?bysrUjhJZ0hwTS91TEI5Y0RwdmtMM1dBdTF3SHpyLzRhUDJKTmtYd3orcXVE?=
 =?utf-8?B?K3NBR1VyeXdrU0I4QTlVZ3BCR2V5VWdiS1VycHlXMi85VEF0Z2U1TGFVVTdF?=
 =?utf-8?B?REgrR09hSzRWb1lVbFErSzFwUUhFUW9jZ25FTjdlSjQ0NXFMS0RuUFNqRWNp?=
 =?utf-8?B?Mkhpc3huZEJKSEhmTE84c242eFh2dzV6enlyUEZuUHBIQlBuTmtUcVJPWmFY?=
 =?utf-8?B?Z3p6bXFJMnQybHMzNGgwYjZybWdSeW01UWJkMTA5a1FtNGtMSVoyV01xb1Bi?=
 =?utf-8?B?TXptUjQyOHZpb0J1Tnk1dmFwWGxHejFMckRWekc0aC9pQlVkUVMwSWpDS2lm?=
 =?utf-8?B?UEtjREpXVmxqNHo3NWgva2ppUlFkM2tEUGVVZytOM1I3Q1k1Z1czVGdSMGJO?=
 =?utf-8?B?MlFGd2xHaHpscldhN0tnU0Z3YmQ4YWNmZ1htbk1nTUcrdVg1Qk9EYzlYUGFt?=
 =?utf-8?B?bU5xWWVPK1lzYnhuMzJiTWR3dmtHdHFUM2YwcjZhUHNHYVVBZE1SSlY5ZGN2?=
 =?utf-8?B?a1BVSFhTYTgvZzBVbm1JdndsYmpEaW9mY050c0RCZWtTc0pmeGN1MERMQ0lr?=
 =?utf-8?B?QlRzVmFyN1UzRHE1Q2xXdEVXVGNHcG0wcEdNN01ac2dPTGt6bm51S1N5TmNX?=
 =?utf-8?B?TDRwYmI0SGZ2L0NaTWp0YUVjYm9IQjF0UGN2dndaSVM1WGo5S3hTbVRmVjFV?=
 =?utf-8?B?NnpjWVBtRTFUT21KdVVheGdXcDVMUmlmdFRjNDRpVkY0elFuanNLMmwyWEpC?=
 =?utf-8?B?UTNOTWwyR0xDTTYxSHUrMWI1NFYxTlFDaER2NEtrbGhTdVRMa1dCcEt5a2ho?=
 =?utf-8?B?eTl3aGNtZXBCUWR0cStINkN4eXJqUk95ZzIzRTFubysyWGJOZEQ1MTNlVDVv?=
 =?utf-8?B?VXBJR0Mza0hYTEJFcDkvWUh6cHcvVmRkMjRFekFDdFlaaFJOb2laaHAva2Rv?=
 =?utf-8?B?ankvdk9qaTFkL2FWVkRqYVg5QTRUQzBQZGpxNDdzWmhEcE12VHRuWExjTTNP?=
 =?utf-8?B?Y0N3b2NsaWdGR0ZvRnRGUVRZNml4dWRoUmJlc1dCS2JJSVAvUEpHeTRFRkkv?=
 =?utf-8?B?cjFoVXMyMEM5VzIxcTdJNEZzK2NkRkJJU0RITEluRDAyOHFVb2ZkZ0RuM2th?=
 =?utf-8?B?SGRGUDV6R050djNDV0EzQVlTSWxYL2NkRzZBeVBNMEM4SmI1Y3VkbDZEQVNp?=
 =?utf-8?B?TU5aSERsdWhrc1kwSTJkeHNYSi80dDllU3BSL25HVmdtclZIenBLOU83dnF6?=
 =?utf-8?B?ZzRzNUhNNmtFdHVBa0s4WnpvM2x1S25LL0xSRXRLVnVrcGorVTFocThneVBl?=
 =?utf-8?B?Tll6Q2RlZGhmVUgyS0g2NWJ1N0IvOENSTHFjKzB1VmRhZG95L0pXN3lWNnpp?=
 =?utf-8?B?Z0tqSG4vQTVKTkZYZk1IUE84R1c4R1E4dFdrWDIvZW9zbExGbVRjV0ZrbGtu?=
 =?utf-8?B?UUVtUDVacHNienYwVktSNytqeE16aWdYQmJjbDZPNzFLNW81dDZnbmQwVEVY?=
 =?utf-8?B?TERSdVVTdkhtOXB6V09IdUZncXJ1WVpXamlDOEJSQzl6bldJdFlOTTJBRWx3?=
 =?utf-8?Q?glz8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3041.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFg3Zk11VDZyY0t5dlNXbENFSmN1SzVWN295emRwRjhzdE11Wm90ZUkzOEdy?=
 =?utf-8?B?SVZmdzlibjBMV1Z0QUl1L3dZZ2FwQnFUajMxMGVMS1cyaXJ5dVJQOUxQdnI4?=
 =?utf-8?B?akd0VXVNdGgzMmUvY05CbnYxL1FMelZ0YmYxSEJpVUNFZUlPNHV1akE0dmhk?=
 =?utf-8?B?TTdBbzdMQW5hS0dPSVYxMGI4KzY2QWZ0ZzdUTGJsM2l3bUVBbis1WDRZM1FF?=
 =?utf-8?B?WWhZQWxudkp5WHJzcERJa21LSnFDeXJoZ3dTR0IvV0d5V1A5TERqR2lhOWRE?=
 =?utf-8?B?aWVPcWlRWkVCbXA0VDZnMkVpeGx0L1h2OGRYOWVvZ09IQlQ0SWVvUkVoZUNT?=
 =?utf-8?B?OHlGbE5SbFdRVUNlNjJScmFDZVM2clcrUTNzdVhsK3hhQ0pNUkkxajlYUE82?=
 =?utf-8?B?U0U5SVB4SWFKNThWdnl0RXBYTjFZOXByVE5wR1B5VFp3Zy9wQ2F4V1N4a1R0?=
 =?utf-8?B?dUdNV2ZMZERqL2ZGRmJ2c0o5alA1SWhmeEkwdTFWdnpaendmcGpmbkpaSGtQ?=
 =?utf-8?B?aXQrRENEb3haeTc1S1pmajJlTU9Db21yZm0vOGc0MHVyclVmM0IvREpjdVZw?=
 =?utf-8?B?d0VXT05OSjRkUUQxYklKemZaenFZdHFzMUVncSsyVXpxUlduYUxXWFFyQit5?=
 =?utf-8?B?UFlFbEhaaHlicnk3SGJnZGRZaWpvVjZxdWptaU5tbmR2VVJ0SFhWV1NINFRa?=
 =?utf-8?B?ZGVValZWbFZFRG5uOHpCMkJuWlBOVkNsemo1eFhzMG5oemZqSCs3V1EwUHc4?=
 =?utf-8?B?dE5aU1BMUGFnRkZHVXN6Z1RjZE9RRzdOOCtSeFA4eDQvSEl4TTRXc0JiUnFD?=
 =?utf-8?B?YzJ2SUxNTE9wTzlKVURFWmI0SEIzTUc3WE8yRnpTd2NBQ1Y2UjlLTG8zRVNG?=
 =?utf-8?B?UnRsV21FOWFiNDJaN1g1bzh4bXgxbzFuWG4rUUpoTE1qejhNQzUzSTUrQVZE?=
 =?utf-8?B?YWVRZHdnTkxCeUFmb0dFNWZuTHR1ZHNJZm9rWUN4WkVIZWRtRnluTVc4ZEVh?=
 =?utf-8?B?Q2VOK2EyZlo1dWZ4Qm5IWDlyQ2VGY0NvVDRJSlVyWm1iNWpvRXZsNFRYNDFO?=
 =?utf-8?B?eEF3ZEFGOTd3YVNhV1ZRZWFLelFaQllTZnFiSmhlcGNVYUYrQTljZU8yS1Yv?=
 =?utf-8?B?UC8zRk9GYUlWb3F1Y3JFMmRnZnFJcWMrT0twakdJNEFHRC90WFRoK2pFSkxS?=
 =?utf-8?B?UlZZMnpFY2gxc2pGazBRWnlndkxwcW5JQ2d4a3ZOMGQ2WVFXcjdYTlIyaXBX?=
 =?utf-8?B?eEVKZHFuWjRIM1FPck50cjdsNmdyOXdxTXBpSG81ZzNFSUNpVmZwdkJEakdx?=
 =?utf-8?B?RFRReTl4VEJYUWYydXNvN3ZwVCs4dTJyMjdjbW1SdVJJandrcjFkVnlRaWhu?=
 =?utf-8?B?Q1JZNUxyQUZ3NnVydjdwWWlJUXd1S05USEluMWhXNkF6RDBaeTJCMmFRVHVl?=
 =?utf-8?B?ZUpJT1ZMS3RkWkhQNkxjK3BlbVpXcDJwcG5BYnVzbE5zYW1IL0hjRVllMEJI?=
 =?utf-8?B?elRVZ3gwcmozc0hUemhLM1lZMkV3YlB3Q1dnbTd4M0pXYXZSMVlYK1hnWnF3?=
 =?utf-8?B?VzRQamJGNVFIdllVRjB4WFgxNFRSNmhCSTRRV290VEtzVDhQSThlMXVXM3Uw?=
 =?utf-8?B?L3VvWThaTlEzdGdsWkU0VzVDTVNCUHcxdndpUkl5aEEycWVoU21ZcVJwOXB2?=
 =?utf-8?B?SWRQZVFUd0RFTUd6MFk1eU9ORHRVMGxZSC9Nb1VHRjNwT3lyb1dZWWEzTVlR?=
 =?utf-8?B?SHcwc1ZYckFOMUdRcXVtdlNBTFdoY1JwMFI2cXRIT0NQbG8vdk9qYkh4SnpT?=
 =?utf-8?B?TE54MnlWZmFYK0l0QXI0bzRLTzJzOVQvTXplN3l5RjVRNUJtQTJhYlN1WTUr?=
 =?utf-8?B?NysySVVnY1lGUWdFUWdrMmZqT1dEejNUTkFiVStRcGFNWDJxZ05zYVkySzZL?=
 =?utf-8?B?bXRCTmc1L0pKbW9qZWwvTHlYMU41L0czSVR3UzlDdWJ4QVdBbkl1VFk4cjNJ?=
 =?utf-8?B?RUpIRG9MWGdCdFNHMEF3NHpmbHN2S1J3LzhxcGgwdGhPblJhSmJrQnJOcm4z?=
 =?utf-8?B?RURmS0xaNWhsb0lFUkxqWjN5WE40VFRhcTIyekRHYk9HMlAvVmQ1a2VSSklK?=
 =?utf-8?B?S3QrZXBCcE9YdUVZZi9TVWRMdjJ1Vk9Zb2hZVmkyT056cWd0czc5YUx0a1NV?=
 =?utf-8?B?MVM5N0ZaSU56ZVE2NHg1ZkdSTmpMZjhTWS91c0Rsdmdwazg5S3FGbmd5emhO?=
 =?utf-8?B?Yk1KNTZBVHJrZk12aHkvMS9pR0pidlFsY095Qm9hS0ZTN0w4NGlsS2lOSnZs?=
 =?utf-8?B?WWVCMzdPNWxKQU9jajZ5QThjcE5wemJVa2RnRzdMZ1RWT1VjVTRHdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bffc80d-3ddd-4c63-b91a-08de5a421f21
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3041.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 05:41:57.3893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vd57Un6Qck4S3fFiBRzFHaaUOxC0HHzjzbK+h6DD2RE07VbYEhrRfqqzav4MsC9EGfnvyIfkciEoqW9VP+0zXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5245
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

--------------3RFA422uJa8prar0M6SCm1zh
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 20-01-2026 22:57, Matthew Brost wrote:
> On Tue, Jan 20, 2026 at 11:38:51AM +0530, Arvind Yadav wrote:
>> Add check_purged parameter to vma_lock_and_validate() to block
>> new mapping operations on purged BOs while allowing cleanup
>> operations to proceed.
>>
>> Purged BOs have their backing pages freed by the kernel. New
>> mapping operations (MAP, PREFETCH, REMAP) must be rejected with
>> -EINVAL to prevent GPU access to invalid memory. Cleanup
>> operations (UNMAP) must be allowed so applications can release
>> resources after detecting purge via the retained field.
>>
>> REMAP operations require mixed handling - reject new prev/next
>> VMAs if the BO is purged, but allow the unmap portion to proceed
>> for cleanup.
>>
>> The check_purged parameter distinguishes between these cases:
>> true for new mappings (must reject), false for cleanup (allow).
>>
>> v2:
>>    - Clarify that purged BOs are permanently invalid (i915 semantics)
>>    - Remove incorrect claim about madvise(WILLNEED) restoring purged BOs
>>
>> v3:
>>    - Move xe_bo_is_purged check under vma_lock_and_validate (Matthew Brost)
>>    - Add check_purged parameter to distinguish new mappings from cleanup
>>    - Allow UNMAP operations to prevent resource leaks
>>    - Handle REMAP operation's dual nature (cleanup + new mappings)
>>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav<arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 20 +++++++++++++-------
>>   1 file changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index c3a5fe76ff96..f250daae3012 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2883,7 +2883,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
>>   }
>>
>>   static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
>> -				 bool res_evict, bool validate)
>> +				 bool res_evict, bool validate, bool check_purged)
> It probably time to add something like this to avoid transposing arguments.
>
> struct lock_and_validate_flags {
> 	bool res_evict;
> 	bool validate;
> 	bool check_purged;
> };
>
> Logic in the patch looks correct though.


Noted, I will add "struct xe_lock_and_validate_flags" Thanks, Arvind

>
> Matt
>
>>   {
>>   	struct xe_bo *bo = xe_vma_bo(vma);
>>   	struct xe_vm *vm = xe_vma_vm(vma);
>> @@ -2892,6 +2892,11 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
>>   	if (bo) {
>>   		if (!bo->vm)
>>   			err = drm_exec_lock_obj(exec, &bo->ttm.base);
>> +
>> +		/* Reject new mappings to purged BOs; allow cleanup operations */
>> +		if (!err && check_purged && xe_bo_is_purged(bo))
>> +			err = -EINVAL;
>> +
>>   		if (!err && validate)
>>   			err = xe_bo_validate(bo, vm,
>>   					     !xe_vm_in_preempt_fence_mode(vm) &&
>> @@ -2990,7 +2995,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   			err = vma_lock_and_validate(exec, op->map.vma,
>>   						    res_evict,
>>   						    !xe_vm_in_fault_mode(vm) ||
>> -						    op->map.immediate);
>> +						    op->map.immediate,
>> +						    true);
>>   		break;
>>   	case DRM_GPUVA_OP_REMAP:
>>   		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
>> @@ -2999,13 +3005,13 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   
>>   		err = vma_lock_and_validate(exec,
>>   					    gpuva_to_vma(op->base.remap.unmap->va),
>> -					    res_evict, false);
>> +					    res_evict, false, false);
>>   		if (!err && op->remap.prev)
>>   			err = vma_lock_and_validate(exec, op->remap.prev,
>> -						    res_evict, true);
>> +						    res_evict, true, true);
>>   		if (!err && op->remap.next)
>>   			err = vma_lock_and_validate(exec, op->remap.next,
>> -						    res_evict, true);
>> +						    res_evict, true, true);
>>   		break;
>>   	case DRM_GPUVA_OP_UNMAP:
>>   		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
>> @@ -3014,7 +3020,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   
>>   		err = vma_lock_and_validate(exec,
>>   					    gpuva_to_vma(op->base.unmap.va),
>> -					    res_evict, false);
>> +					    res_evict, false, false);
>>   		break;
>>   	case DRM_GPUVA_OP_PREFETCH:
>>   	{
>> @@ -3029,7 +3035,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   
>>   		err = vma_lock_and_validate(exec,
>>   					    gpuva_to_vma(op->base.prefetch.va),
>> -					    res_evict, false);
>> +					    res_evict, false, true);
>>   		if (!err && !xe_vma_has_no_bo(vma))
>>   			err = xe_bo_migrate(xe_vma_bo(vma),
>>   					    region_to_mem_type[region],
>> -- 
>> 2.43.0
>>
--------------3RFA422uJa8prar0M6SCm1zh
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 20-01-2026 22:57, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aW+6+dvH8trVV8eD@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">On Tue, Jan 20, 2026 at 11:38:51AM +0530, Arvind Yadav wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add check_purged parameter to vma_lock_and_validate() to block
new mapping operations on purged BOs while allowing cleanup
operations to proceed.

Purged BOs have their backing pages freed by the kernel. New
mapping operations (MAP, PREFETCH, REMAP) must be rejected with
-EINVAL to prevent GPU access to invalid memory. Cleanup
operations (UNMAP) must be allowed so applications can release
resources after detecting purge via the retained field.

REMAP operations require mixed handling - reject new prev/next
VMAs if the BO is purged, but allow the unmap portion to proceed
for cleanup.

The check_purged parameter distinguishes between these cases:
true for new mappings (must reject), false for cleanup (allow).

v2:
  - Clarify that purged BOs are permanently invalid (i915 semantics)
  - Remove incorrect claim about madvise(WILLNEED) restoring purged BOs

v3:
  - Move xe_bo_is_purged check under vma_lock_and_validate (Matthew Brost)
  - Add check_purged parameter to distinguish new mappings from cleanup
  - Allow UNMAP operations to prevent resource leaks
  - Handle REMAP operation's dual nature (cleanup + new mappings)

Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Cc: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
Signed-off-by: Arvind Yadav <a class="moz-txt-link-rfc2396E" href="mailto:arvind.yadav@intel.com">&lt;arvind.yadav@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_vm.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c3a5fe76ff96..f250daae3012 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2883,7 +2883,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 }

 static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
-				 bool res_evict, bool validate)
+				 bool res_evict, bool validate, bool check_purged)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It probably time to add something like this to avoid transposing arguments.

struct lock_and_validate_flags {
	bool res_evict;
	bool validate;
	bool check_purged;
};

Logic in the patch looks correct though.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Noted, I will add &quot;struct xe_<span style="white-space: pre-wrap">lock_and_validate_flags&quot;  

Thanks,
Arvind</span></p>
    <blockquote type="cite" cite="mid:aW+6+dvH8trVV8eD@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">

Matt

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -2892,6 +2892,11 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 	if (bo) {
 		if (!bo-&gt;vm)
 			err = drm_exec_lock_obj(exec, &amp;bo-&gt;ttm.base);
+
+		/* Reject new mappings to purged BOs; allow cleanup operations */
+		if (!err &amp;&amp; check_purged &amp;&amp; xe_bo_is_purged(bo))
+			err = -EINVAL;
+
 		if (!err &amp;&amp; validate)
 			err = xe_bo_validate(bo, vm,
 					     !xe_vm_in_preempt_fence_mode(vm) &amp;&amp;
@@ -2990,7 +2995,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 			err = vma_lock_and_validate(exec, op-&gt;map.vma,
 						    res_evict,
 						    !xe_vm_in_fault_mode(vm) ||
-						    op-&gt;map.immediate);
+						    op-&gt;map.immediate,
+						    true);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		err = check_ufence(gpuva_to_vma(op-&gt;base.remap.unmap-&gt;va));
@@ -2999,13 +3005,13 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op-&gt;base.remap.unmap-&gt;va),
-					    res_evict, false);
+					    res_evict, false, false);
 		if (!err &amp;&amp; op-&gt;remap.prev)
 			err = vma_lock_and_validate(exec, op-&gt;remap.prev,
-						    res_evict, true);
+						    res_evict, true, true);
 		if (!err &amp;&amp; op-&gt;remap.next)
 			err = vma_lock_and_validate(exec, op-&gt;remap.next,
-						    res_evict, true);
+						    res_evict, true, true);
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		err = check_ufence(gpuva_to_vma(op-&gt;base.unmap.va));
@@ -3014,7 +3020,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op-&gt;base.unmap.va),
-					    res_evict, false);
+					    res_evict, false, false);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
 	{
@@ -3029,7 +3035,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op-&gt;base.prefetch.va),
-					    res_evict, false);
+					    res_evict, false, true);
 		if (!err &amp;&amp; !xe_vma_has_no_bo(vma))
 			err = xe_bo_migrate(xe_vma_bo(vma),
 					    region_to_mem_type[region],
-- 
2.43.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------3RFA422uJa8prar0M6SCm1zh--
