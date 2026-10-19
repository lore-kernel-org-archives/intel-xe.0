Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550E9606A335
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 16:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ak/rixIy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCCE10EF7D;
	Mon, 19 Oct 2026 16:15:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE4E10EF7D
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792426521; x=1823962521;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kfFxScV1xkNPcqUDhtglf0NgCCvM60jopbUaoKo9J34=;
 b=Ak/rixIyOlfgbYbl4SOHnFUCNBTJgB90pi4IwtwRVhfOii04YWpdzB0v
 7R98te/S9kSkZN7ucfOb2CqL9s4Nvjhqk56kXJ3nTCQgSpgoMdqjIhWE3
 /vfCv/8/4NzXBw0U5HrXGG8+TRLuB4gx13Q/laDfE3R62znV0nV07uZ8J
 QGOUwXjL8FY05SthsQO6PCk99pihPPvYER32TarK1m8QBKzZR/kNdBuBr
 bPbEZcaVxB50KN1MA6+bJbXLmqe/pgCvqtbtmF2fBTyTeOkgKX2fl79b0
 v9NY7kP2AAAjEdALp0kbSfhcHTJawJUWuVkmoprH0HysuaiJnAm0ZroRe A==;
X-CSE-ConnectionGUID: KJb6FQ9LTSK9FACcomhPmw==
X-CSE-MsgGUID: W3X9Q9dwR52oKXv4fYbkjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1126763"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1126763"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 09:14:47 -0700
X-CSE-ConnectionGUID: oFlcEPYkQUml8PwDkl17kA==
X-CSE-MsgGUID: ROSjcVT3TsSQIZxPH0DbxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4404029"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 09:14:47 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 09:14:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 19 Oct 2026 09:14:47 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 09:14:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D22ggMhJ+8/LiqVG3JUbEQeWTyAUVLTr9s17Nu2bauTVkiTa1ChtbCAftYLoQViYrSiChMp07zgfkJvptGlr6eSPyc1/mYWtXHJo5WLTA7Xk/MnMmtN15F4GkggPFyrPr55/Od9vGaPxBX+EFro5uos3geb1UMPEsn5Y2AbUscUL3xszEQKEjidI4u4BD4fb6lXoqNVD3LeAWZeoYkPY78dskJQ6uUkzUU0HSGRQRYsgvNL+Tr4hIMQ1Ns+dL4u1v49t4nlAZVvNyMio8Nh5ivbEVR9qoRDcuBJgSdrs4+aLF9E0zTWm1sQVmjuIbHR2GsHHHSpT1YN9+RRi2q881g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4E9VIANDaTKlBenPVM+iyZXXkaQy63szS87Mmw/GS0=;
 b=SjSS8tv9m2ZAl4MDNK7QvgyOBBjVB5YW5lWzEmUNKVndEgXzWVPKs5STuTzfQzVK/H2J65hrH5m7AcVgeFNKPpqxKQ83sRs9ytkzRuIEoBozuDwQEsp93cZr6yLlFya5s0psepb0UEPFJ0Fwa1+xfIS5oo/WSbtbY2lR4pWagA8mT0pSjQYJWQ/OCTlzYVnZb4ZEYMXKpW47A+MxTTlxV2UYPhTXPgrIkCig4tYKX1SuJ7B5Jab/vjWxENW7MP6r9rUqm6HUGQjvFpxdo06z+S4SQVoTOSY9wEEAT6IoZuKaou5ZMfPe5l3+3oFGSarnIp2UYGIq6g5y4DpFhqvdtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DM3PPF2B3CC4BE4.namprd11.prod.outlook.com (2603:10b6:f:fc00::f16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.33; Mon, 19 Oct
 2026 16:14:38 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%7]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 16:14:38 +0000
Message-ID: <dcda615d-7b40-4622-8bb8-32b15f3f8aff@intel.com>
Date: Mon, 19 Oct 2026 09:14:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [1/3] drm/xe: Toggle the D3Cold enable flag at runtime resume
To: Matthew Auld <matthew.auld@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20261015165451.154495-6-vinay.belgaumkar@intel.com>
 <553c4753-6c38-471b-8e3a-c6b8c4407e29@intel.com>
 <7f92dbae-5b66-4fe0-9dcc-6cd2e2d5a4f0@intel.com>
 <69d9e989-67a7-415b-9433-05df2bf8bad7@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <69d9e989-67a7-415b-9433-05df2bf8bad7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:a03:331::8) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DM3PPF2B3CC4BE4:EE_
X-MS-Office365-Filtering-Correlation-Id: 713ad9ea-58b9-4f8e-a533-08df2dfc128a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|22082099003|261009223027099003|18002099003|10067099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: ZowRIEARFM1UudqLSmNXQ3CduAa8EPc9dm/TLEZEuIKEx/1bV3URwz+dV5cbN3VvEDi1poNM3jBDPjm8u+PsuxsRai14o3Ip0jr8haw7+qjCQN5d93fjfz6AxXVosGdngocMzjk63m5pzG7PrUF/s/n2hrmDGLWp+gcQuoDX47b00atUoHcxlcfssYoPRnxRbif0AztcRvbydXg2Sh4QqKzCkefuYqLWIj1wm+fn0vbWJ/OEYTs2GuwsXGihfpBzO4Mc2mfWcvvyao2QN3J42TcMgvhMtktp1oTnZEhy0la3o6jMBFyVfVKyC69L3gb+gYzq2tO8B/kJ8r6vOrmAuFrK2BEwruhkGMLJ27Ec9hMZ3cQX4PQm5wzbkb7OlhchXM6hrLFwWVBX6KPM8mvOOYSmLdLSQdexAFBcJoeivQkd0NUSGo3WnRgz+PeBsaEw2vFm+I7jF68RY1D8GflqmLHzAiVB6tRwj4vxXWsBB3qTTq2knHSzkveKMn6H1MOSjxig968EURnsVMiIQfv7jUa01soX/oMrRr8WFp45SMjGeT7NK1eBstrhBQKnGZuBS7BwGvd9Qqlqit1g/GTY4LkQbr5Q2886kKXWV57oScURIG2v5cMh8zX/Tsniovu2g3DBkbO+dmzzyIh0dTYt/f6u5cNW5FE6YokKwW7EYXA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(261009223027099003)(18002099003)(10067099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0thbkNpUXJZNWhKT1g5TFFDTmhwZXA3R0Rwd0ZGUXE4YkJQRmNSdmMyVFhG?=
 =?utf-8?B?eWtTWnB2bmU1VFF2L1R2YzA4ZmRFVTlJSGdDM2kwMUFiQVZ0L1EwdWY2Uksz?=
 =?utf-8?B?djhrQVg1d2hVekQxN2dndFRJY2VtVGMvMkR5QXJBZCtuakFQMDlERk5oQ1hr?=
 =?utf-8?B?UlRvbytrOU1xSDRxU3gvdjd4Z1VqWW5rMFM1enBEMFREOXhyZk40Y2ZReGJm?=
 =?utf-8?B?eDF4ZGxIS1o0VmttL25kdEZiSyt4WXhYWHppTTJ6L014ZEF0MVRpM3ZrUHNx?=
 =?utf-8?B?RFluQmNqS0F5bXhwc1gwZHR6VUE2bGZIZWlMWGxWb05OTGdyTjdya2JhYWg3?=
 =?utf-8?B?TVF3anRwL1BmSExPQXRsMUJGakNUenU5WnNDOXFFSDNyZ3FqcE9SbXpwMmVp?=
 =?utf-8?B?MytKdUhWcWdlWTI1SGVuQXM1NDVSSnBCSlJFQVcvSlJTd1QxMWNCb2o2Z1Fl?=
 =?utf-8?B?dVFGM2tkQUpnQXVvcmRkbFB0RGpNRkZBRkN3MHdEVUY5ckxqaWpIbmdRRXBG?=
 =?utf-8?B?SXp0RTMzMC83b0hPY1ZZM1NUL3V2T0JYenZWSUltRDNJU0Nkd0lUV3dmbVhn?=
 =?utf-8?B?aStrNlRQYWJCVnNQZlhhUXB5cVY1bDdlU3FzV0NiRGVLMGt0Vjl0dEVLVndo?=
 =?utf-8?B?MFJEMVZqTDRINWt3Uks5bHlYd0o5bjZIQUpUWXlQamsxaGNwaThWNHFYL0Zn?=
 =?utf-8?B?bEthQTgrdVB1Q2VlQ1JnYXE2NHFiZUdNaGdSU2J6UXBCb1ByYlB2TGJCbTZH?=
 =?utf-8?B?R3hHYXd5b1VmVks0d0RIVG15VE1WSEhzT2hBYVFxYVdjOGNxUnFzWFNTcmxy?=
 =?utf-8?B?RGFvc3ljT0NxMDEzTHdPVU55ODVuQitxVjNjTE5wcTM2U2daWEpkalJMLzJj?=
 =?utf-8?B?R25Lb2EzZTFpZko0cFZmcHplSDJ3S2kzZ1ZSeUdQRWg2WVdpYlVmeWQ3T2J3?=
 =?utf-8?B?VDBRREZaY3plWDd1dVV1N014OVF5eDE5cHFSSFNzRmF6MkgxVi9rQm9pcm9s?=
 =?utf-8?B?a3NXQVRpS0xSSnNqVlNWR2xSVjc1b2Z1Wk84Q3VyNWhUMHlyOVFkODdwZExW?=
 =?utf-8?B?ZzJLdUlXWURjZXZyakhOOWpnQ2I4Q3BuMUhITmhhY3o2L0VWcWtSNE5ESm1y?=
 =?utf-8?B?UFRTcWdPOEdsMGxPRC9yV2ozbkluQkp6eEduOTJrb0d2STgrdHd0c0prQ2hK?=
 =?utf-8?B?bDZUQXJzVkthajVZNktZYks1MVM3SllYcmpoR1dIbjVNVWJFelVOYUp2em1Y?=
 =?utf-8?B?dTZHeS9GUGZHV3FCNVBhekhMdmFORGw2Q29IVlM1dExBZkRhZWNiNVp1TWEw?=
 =?utf-8?B?UkJGU1ErSitFQW5VcHBNQkNrSDl5VzZGOWdDZWl5ZG5qRzFoRjdsd294aDQy?=
 =?utf-8?B?NXkrRmtOQVhXRFl6M1RobGFncm11N2Q4YmhnVUxLVHB4ZDUyUEhreDZkSGNh?=
 =?utf-8?B?OC9RQm01RFV3R2NnUkFwYkZ1Um9CVUI1c1hUbkJlR0MrT1QvbmhwUG1wZlA5?=
 =?utf-8?B?bjlKeWJEMk1pbDJ2YVprWkdvdE5VY1IxOGhnTkJzdC9mTU1TNXQxelRURWgy?=
 =?utf-8?B?eUpWMzdlSnI4VzlrdzBSb2VHaE1PNWtNVCtVQTB5cVJGZXVPa1NxTUJuc3Y0?=
 =?utf-8?B?SGhWazJMZmNMQWY2cXI3ck51S2ZZVUhYR1FMS1QwcllWeCtqUW1SbjRKUTc0?=
 =?utf-8?B?eCswMFlOOWdkT3E5eHRMRXRmVzAydE9GbnNyYnhXNllZQTZtdlp3MjNxZk5o?=
 =?utf-8?B?cVJmV2ZGZUZtcDBkaVVpVjM1dHlVUGV0Q09PaEZHSzdzRmhtMU0yVTVqZ2h3?=
 =?utf-8?B?WWhwZXpXQU9NREpQN01mMUtVYWd0dTBiMTBvS3lRT3pYUThsZk4zRzZob3dv?=
 =?utf-8?B?ZTB0YjBwZFh3YWxlVURXMjRScTJHUDFvU3hDb3lMWWc0T2JOZFg1aEt5azVV?=
 =?utf-8?B?N2YyWDdlWDloL0hIRWpTcEx6ZFRsdjBYNm1RMUtRZGlsaHJ4dGFDNTZuN3hq?=
 =?utf-8?B?SFYvcEpVa3VPeWFZWlR0WW1nWkNGbXdNdVBkdnNVU3hHbXh3ZWFVVFFVWDM0?=
 =?utf-8?B?emwwMGg3clpSODF3WnlxbWw4NUFCeUhzQmZ2Q01JZFNzMEtxbFllOGIvc0VI?=
 =?utf-8?B?L3hBd24xcmZDVVRGSUJDeWVTaEJjYkdtRWdCbzltQWh4RWRhM3NBazNKRStM?=
 =?utf-8?B?dkxidjA0L3R2RTJqSTdablE0bWxoSnAyTU9WcDVhOCtSdG4vaXpqb3pRbFZC?=
 =?utf-8?B?SnlmS2hxY2JicjlhN1FqbFl3cjRSUHUwTHVOd0I2ak5RRUxlZU9ocE1LRFNO?=
 =?utf-8?B?VEVpM0t5UzJ2d2gyUFllbjhydnZHT2NHcDJ5RTFTZHNpcDhSMWM5MmszdEJY?=
 =?utf-8?Q?G7DwxrvKyc/z/LQM=3D?=
X-Exchange-RoutingPolicyChecked: cAuumVwbwYq3A1x64fKLIk26YvzPZuEmtg+bN3zBxZOhtdNJ9yBYse9jJBvBh0ziYJ/DY1ftFc0MA/ckzA6wJKUs7drlQ1UXqGNol2ac8zECJiCXchTqv0u8HpmIayCjjRd0HIwNoM44Ig1uPVBD3xbA3h79N19KgGCqjSKB+Ui3t62rNSH9zlM8N7ppGgLU1tJIbLT6enFnWNF1yXiRlGJeOF+ofhu27sa9CMHsn8eUw15h9R7EY9HmjlHQzJVDC89xo6QYAc8AqsTz+4JbZBfxhtpizrk0+ml0xvzpIogubp7Er0P86G2IJidyl6c1+S3YLT/iUtvl+I+Tfro1iQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 713ad9ea-58b9-4f8e-a533-08df2dfc128a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 16:14:37.8175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVa4COwvLm13UEx8T5ivtBIW/08CJXx8HSmqC+RGSa4VsjPHGRXnH/SAoHEdJf4AFShbS5oFGwzfOgaHXPj9tvjKI1OKXtHC1g/EpuEK9RM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2B3CC4BE4
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/19/2026 3:08 AM, Matthew Auld wrote:
> On 16/10/2026 19:35, Belgaumkar, Vinay wrote:
>>
>> On 10/16/2026 11:23 AM, Poosa, Karthik wrote:
>>>
>>> On 15-10-2026 22:24, Vinay Belgaumkar wrote:
>>>> We enable this flag during runtime suspend,
>>> i think there should be Fixes tag for this.
>>>
>>> Fixes: f026520367be ("drm/xe: Only set PCI d3cold_allowed when we 
>>> are really allowing.")
>> ok.
>>>
>>>> need to set it back to
>>>> false early during resume to prevent any race with pci driver.
>>> What is race that seen without this ?
>>
>> While D0 is being programmed in xe_pci_runtime_resume(), pci driver's 
>> internal auto suspend timer could expire and, since this d3cold flag 
>> is still true, pci driver could try to put vsp into D3. This is probably 
>
> I think needs more info here? We are in the RPM resume callback at 
> this stage (RESUMING), so surely we are holding the required 
> usage_count refs etc here, so how can it enter D3 here?

That is correct. I don't think the upper bridge/root port can go into D3 
as the pci driver will hold a ref until the endpoint is active. I think 
this mainly resolves more of a book-keeping issue. While the device is 
in d3, querying the d3cold_allowed status via sysfs can show "true" if 
we don't have this fix. So, more of a code consistency change. I will 
update the patch desc with this and remove the part about any possible 
race with the pci driver.

Thanks,

Vinay.

>
>
>> why we toggle this flag as the very first thing in the S3 resume 
>> function xe_pci_resume().
>>
>> Thanks,
>>
>> Vinay.
>>
>>>>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_pci.c | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>> index 57c6f778ca24..2269e51868c1 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>> @@ -1450,6 +1450,9 @@ static int xe_pci_runtime_resume(struct 
>>>> device *dev)
>>>>       struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>       int err;
>>>>   +    if (xe->d3cold.allowed)
>>>> +        d3cold_toggle(pdev, D3COLD_DISABLE);
>>>> +
>>>>       err = pci_set_power_state(pdev, PCI_D0);
>>>>       if (err)
>>>>           return err;
>
