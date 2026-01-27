Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4AFD2FED9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 20:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44DC10E5BE;
	Tue, 27 Jan 2026 20:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAaHtJas";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF1B10E5BE
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 20:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769544890; x=1801080890;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wSMUz2Fqz/z4S/k1vkJr7hj4h+g4KAJNpZVpStqc3wI=;
 b=XAaHtJasaUwldBnjIL9klkPUS/AmnXlnMIO7so7ElYLCh9ZrdSJHRT6n
 SGd2lvwbc+EYnnbKnB344domwMOfLxBmj+H8tU57G800vIvdv4HrzeLiA
 Sp1B3kuC63LDh32H3NVbOvJ/cWxpz5CA2EgkZPSrxJS9185WJkFCDgKnS
 pswINKsoA9ySpcFSgUJr0Y6iUuxVPehybjjVdYYmCxExk3t85G7+uZnhO
 lMTNN9aPC3CZk/K2xak/QmgS2foL8XwuyKCYKsfR3uuNBvekUXB82fgLJ
 ZhfyS8hjQ1lCYd0hmbUTodwjLAh6GS+tR4MwjXi3xUnLWvNaKOg7rNpAK Q==;
X-CSE-ConnectionGUID: A/+NGC8xSFucFb+++xRfzQ==
X-CSE-MsgGUID: 0wyQNSu4Tkq+tTYatpNT9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74376145"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="74376145"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 12:14:30 -0800
X-CSE-ConnectionGUID: i+TTNoq0RO2Bfo+fWR4JRw==
X-CSE-MsgGUID: TRTR0h94RvuAS7TXtVH57g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208514007"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 12:14:30 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 12:14:29 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 12:14:29 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 12:14:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKDkFzJhFDnSZyhvCVjkaA2SkxPP70GzE8Tyfwy7uLAxyy+E2CSMyahBmLyrb1zkXWDstQp3qUngEiAoooqc0ZDy/NEu1EWXwJJVF2wPm/J823GdrWLB2EXKDzzTqM+DYnFP6/vbWGPHbYAzIeUSv0OTfnKfiapRSM938WOn7y7vmaOAI7r6KPglBg7+NgfwwMI0EQ3k0K0jqpJZGTKmZlYC1cV12GhuVvwQhcmEj8Bn7t/FHGo6VoNqiIHmUZddYM1xa97rkPU1/SJ8MzN0AJyV0i4yVxERwGNu+Hfci0+v4wfHpEi/iyRA79YEQ0WzXPTHhIT++ag0HXP1dppxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdApKHimI8A6WozW4JTzTH6c/VtlkrXLvDpYVvMMuMo=;
 b=fvTx89+JlnzB0TlRe7c8RMmTq88jQKx52jrmH8BrGhuXD3jJ6avOHOt5cPbvIbq7ZCmAN61JKRRBWGtPPngi1yjn8uFBUsF9iK7zQk42ZavtkW2DWVGNkCaebGc7A8Z3mHq9ulwxVRAx6H7fywFReYt73xKn2Z4Kov58DphCOO0kPn89nPK97PkTy7NHB+NIGyUOAdP58z4BtzXMBvdvDXk1oJCGRaHqZfGUGME4leD8Q1SEHRQ4VU5a/TKaDNYkIpR2wFt7xc2N2Bt+JmNJESsLcB+DJqNf6463hFc4D5AQBZ7jlPoqJOdQAV0wUr7Q8HvH3JvxceJnpcXAnKSmQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 20:14:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 20:14:26 +0000
Date: Tue, 27 Jan 2026 12:14:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <intel-xe@lists.freedesktop.org>, Carlos Santa <carlos.santa@intel.com>
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Message-ID: <aXkcoEKV+8Yb4Rmf@lstrano-desk.jf.intel.com>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
 <aWqn/eXaw2t9j4fY@lstrano-desk.jf.intel.com>
 <5nddlxy5z2naxxoz7jnyhpwpv3pofv57fuhflcjjwhxell5ozg@xmrhis4b7hhf>
 <e8cf019c-409b-4e17-ae80-8b95e51e366a@intel.com>
 <ykflaf7q4tizmft5gcyfnqg5asicwbz45nmp4cu7p452bfu3if@xignneucsxfg>
 <8f5c5068-0078-4f7a-8cf5-c561f73e9fea@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f5c5068-0078-4f7a-8cf5-c561f73e9fea@intel.com>
X-ClientProxiedBy: MW4PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:303:dc::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: cc8df6d6-381e-4c57-7d7d-08de5de0ab81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUFmMm5oTzI3UGNBM0hCZElra0NpZE5JbWVTdVVVQlFJUzl3QVBrSEdOQm9j?=
 =?utf-8?B?OVFNendBdTh0WUtxVFJXNjBDZ1pxWFAzNWkvRWIvRzkxRkJKZ2VjbUhqZjEw?=
 =?utf-8?B?NWxhNERjaWNha1VmQ0k0bVh0V2lOc0NXbXduTTNMRk1pQUJlYzRtV2ZFWDFK?=
 =?utf-8?B?T0hZN0JvTVdLcG1DaUlyUnF4ZXZldmg3bWd5OFhYM0ZHeG5vSytIRlhDRm9J?=
 =?utf-8?B?OWpHSXNIZndzL25zaU8zUi9QOGEzWTVDQnowdDdPL3dmTEd6a2FCUlR0Z2Q3?=
 =?utf-8?B?RXNoeElYWjN3WVY0bGpDUlRHclM2eGorTE5CU2kxUWJDQWRpWUNHS3p1ekMz?=
 =?utf-8?B?TlE1S0tIN3VWUysrdlJwVE9mTW5QTTIyZllCZHZRYzRXZm9DV3p5Uk9ZclRZ?=
 =?utf-8?B?QTdlYTA1ZDJNV01ZcmdKcHprQWFmZWxISENuZXA2ZHZMeGhGNWdTaWJaZHNy?=
 =?utf-8?B?NlYrcUNDNjFLM0tEN1pWVDhrZnQvZ25XOWFwSXZ4Z1gvQmtOeEFUVkR4WW5p?=
 =?utf-8?B?Q1pITjRlaDhTQU9oNllhUnJ2Uzl4a3VjTUtOdFBVRzg1WS8xc2VBaHhOcHNi?=
 =?utf-8?B?SnFlV2F2Y1NudE5OWkdFVkFwUTJodCtoUEYyN2UzVktIYlJvZWtJd21YV3Rw?=
 =?utf-8?B?VURhRkxEZnNEUjllenlLZ2hGNDA2c0VGZmM2RlJUanA4eGM1Rm1UWHB6eHNq?=
 =?utf-8?B?NFcwNkFHMmkxSytlMjAwUkV2VWVzZDR5aWN4N2RXQnRtVW1uUnUzYXFCZWZQ?=
 =?utf-8?B?YW9uQnZmK3VaempraVlGRnhRa2lkbFpqckR3N1FBaXBudC91K1RTQk51NUxr?=
 =?utf-8?B?SkJRSE9zWnNnbXhHMlNDNENMRE9zaE1hNEw2UzVaOWxZRG5WdWhoelU4eVBP?=
 =?utf-8?B?bHN3ZWFmSkpJeC9zbGl6eVdFRmlvd1p0VWJYd2grMThWSnREWHdyZDhjazJH?=
 =?utf-8?B?clhsbjFCcnc5S1Y2OHQrNnBuZWlobDcveTAyb3FHQTc0TlF2dUZlb0VIUDFK?=
 =?utf-8?B?bHdWU1lVTkVFUGZIZThjSlhjcnRIaFAzNjdtcTROR2xWMHFmVHdNVTdHWW5q?=
 =?utf-8?B?Vkd0TUsvRno2R3FIODVkenF5R2dUYjBaR0FXVEJyZTdoTVVzdHEwUjhOYTZa?=
 =?utf-8?B?KzNLeE5qOWw1Sm9iM2dkUlhJdVkxQ2NrU1hHWURJZzkvM1hwbmNNYndJVkJM?=
 =?utf-8?B?Q0xaSjNlMWE0amVOYnFyUUErNFU3V1BYckVwdW1HU0t3a0p4REQzL3JqOCtq?=
 =?utf-8?B?UW91SmlLS1pBMmZSeWtqZUZGY0R3a2MwTVRuR0YzT3QrR1B4QTZOZ2JiM0Fz?=
 =?utf-8?B?U2FlNm5IMlh3d3VSNlhPLzg2TVpqLzUvODFHTWI0eVVSQ0FJdkF1QzFJMUNI?=
 =?utf-8?B?SHZzbDV4aWhZa2VHcEEwT1BFMjZwaDhOakM4bzkzMHo2dlVnUlJuU0dMSVVL?=
 =?utf-8?B?UHZaYTVLenVqNWxWa2xrc1ZnZWdDNzNwcWRSeDU2M3ZvclFOZnNGMkJEUTVC?=
 =?utf-8?B?eHRxeTVaNWwzc0IyZnBJOUVPMGUzM3VGR2tCbk9qQWlNVTM4MFUxYjhLSXAr?=
 =?utf-8?B?VzgwRTkxTUtHU2xDZ2FFYU5EeWpKNWNabXArVlR6TFNUd2RveFBwQUpMN21F?=
 =?utf-8?B?MzlvMURJbFkrTm5jY1JlVFI0emo3VUpoM2phekozd2Fla0hEdW93Y0xqbnN5?=
 =?utf-8?B?SGJxT2xyYUVPWDNMbDVlLzM2aUgrSStTSEtKQWk0RDFJbm5DT05aK1lneFdT?=
 =?utf-8?B?L0wzUTN1ODJHWHc5aCtPY2krNThFT1dXSitBM3FoL081TytMQU5rMElyYldK?=
 =?utf-8?B?WWRXM3dZWVkyT3VVVTJUREZ1UFNNUlErMTNlaDBEN0RvU3JrR0J4bFBZZDNJ?=
 =?utf-8?B?cHBmd0IySkNKakpwVmJxYW9VTk5CVzMrMG10Vkk0QisxemZRcmR5WFBzMll6?=
 =?utf-8?B?cGxTNU9UbHpnRk91NXVMSDJuWVZ3bUsraDdNSmRmY0YxM0d5K1ppWnhaZDZG?=
 =?utf-8?B?Q2xwSDRWRjdLSzFsaDN3Tm8xNlpBV3RtTWR5eGFJWEZDSTRvMFgzelRQVFgz?=
 =?utf-8?B?djI2WWdqNjhBL0paQStNTU5JVndFSzVQdEYyS1RpMTlzYWZiTzFxVklQZGtk?=
 =?utf-8?Q?DBWc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1ZqY3djY1daWDY0d2pZRlEzSkgxTTczUTRlNWZNc1lWb204VXdZZGRHaVZH?=
 =?utf-8?B?M284Vk00ZERqVndUK3lHREVMN3VBcmVkeXc0MG56Vk92UjJnUjN0dzV4M0R5?=
 =?utf-8?B?N2pOUmFoazlaN2F3NDdxVlU0Uzg4aW1yUFNSdkZtbXpxcE4yS2ZhNUtHK0Ns?=
 =?utf-8?B?Q1VsK1lvMXVHT2FHc2k3MEpBeklPdVRyeUhCVTdlMDhLMFk5eGpMNUZFUXlP?=
 =?utf-8?B?Zk1rRXRqYmRUTlZPVncxSDIvcEN4V2dWdzVwT0Q3V1ZZTnBkRTM0ZGc2VEJl?=
 =?utf-8?B?bmZvOVE5RWptRG9ZakV3ZXdic003RlZvYzlQZGdVWjNRUXJjRG0za2d1L2c2?=
 =?utf-8?B?UnZxaFdYZzliZFJvcDZ5UmRvV0VkS3g1cUNXNGNSUFA0ZldFcTM0Z1RQcWVY?=
 =?utf-8?B?UmlabHNiOTZoNC8wZERQUnA0Q1kzd0FWMmQrWGJESHF3b3BIYlNWVFlRMW5r?=
 =?utf-8?B?UWY1REFhN0VsS0hvK00vU1drUTQvYTY2SW1oQnZVTWJ6bERHd1V4SFV5bmtv?=
 =?utf-8?B?S3BwdzZLZ3JiUVVtQWJPMktyajV2Z2JZbExHWW1wQlJDYWdYZEhGYklBQWl2?=
 =?utf-8?B?TGU0dC9TcGdxTWNwYnlFUkxwVWZLT01aVWNNM3E4TFRZQk9lVVRubnQ1OWF4?=
 =?utf-8?B?V3Q2YmFnTHdJQk9oVFBVeHA1M2wwaGpqaEVydzNoaSs0MUVPaTd4YUZXUmxI?=
 =?utf-8?B?QUsvL3V4N3pNa0hLcTJ3Y2Q0RjJWN3BMN1FlN1pXMFpyQngyUjlURmNBejJI?=
 =?utf-8?B?dkFmMmpPZFUzQU5BYWUzR1JDeGs4UEtQT3ZWMVlZbWprUEFRK2F6WGYvdkV1?=
 =?utf-8?B?b0NpYkNKS243SFZMTEs3cUtDSTR1dFd6NkNSMmM3c1AwUEpCK21vdzlSa29S?=
 =?utf-8?B?NDBWTjU3R2drbXE0UU9Pem1GbHVxNVdJS1YwU2hzMVVwNE1Ic0lGVXBEeW1J?=
 =?utf-8?B?bFV0N21hRzRSendGQVlDeWxpMDlaLy9LK3RTcTJCaW9NMlpheGVadDEvdmpI?=
 =?utf-8?B?eUF3bkFONzg0UlJ6dkozYWx6M1pZNVZTK2NxNGk0YzhYbWFJK1JMcG1HQXJN?=
 =?utf-8?B?bVMrenhVU1RHbVlLQlR4OGZrMjJHNi9nUWJ4eTJxTWJtMk50MGcxbXRRUW5E?=
 =?utf-8?B?UjdEc1VEbWxIM2I4ZS9TcFZiQitUWXpYMDduRWpKT0kwUjBOWFFCdXg0RldK?=
 =?utf-8?B?L056REVSTE9YNWFCRURuQjJUbm5MaitseXJtYTJ5N1RCQlNjNmd6WlZ0dnNO?=
 =?utf-8?B?SEt0T2xtYVV6VnNMLzhFWjA2akgrbVFnYlhhK09uYmlkMEVnaG9nZklPWkhw?=
 =?utf-8?B?V2oyQzBkUUJ5ZW1zSkxwVGR1SHR6WFM2Q3VmRTY4VWF1UHNYM0ZIRk85eisx?=
 =?utf-8?B?NU1kZUVsaEZXN0l2eFhBRGdDby9oR0ZtZEtLUGh4ZXhmSVRyaG1rTWw0ZVlS?=
 =?utf-8?B?ZFVZZWdGeXVpdzZ5TFNDcU5DYmJLWndRa3grL1hzc2xVNlgzUGYwTFgwZ3BW?=
 =?utf-8?B?S3VuckhUNGpJU242QTU2czFiWEIzc0RwOHFqV0V6SlJybnFPM25yZk1GRG5P?=
 =?utf-8?B?UE5MQnZUOFNhK2xvMkVZTzZ6ZnFvdGlRYVljL09sczErUS9rTmlhU2xxQmcy?=
 =?utf-8?B?eXZjWEpYNDhXYzllVnVQb1FJOVJYRjZmYVJhTlUyNnprd2pVcGVTeUI2bHI1?=
 =?utf-8?B?QUlLditwTTMrd0VSTTB0TGxscWJ6WHhQS2tqL3ZzNnZQcjlIY1Q2VGdUVldP?=
 =?utf-8?B?VXFvb1BEV3ZROUJsNm5EaWpXbzZMdE9UR1dTSDFzN1hFRHZDQ1RhamtCeWVY?=
 =?utf-8?B?S2I3S0VickttWEwyem5WQjN4d01scDdHc1hTU29SMDRJNis2MDVXRC9XZkVQ?=
 =?utf-8?B?OE9jZ0VFWHNhZUNIcG96Tm9ibXBxVXlxVnRNdDJQR1Voa0w4WWluUUVLaWNy?=
 =?utf-8?B?VzV6WXFPUlJycW9Fc01ZdlFkbFpLY2NoclVVU2dRanZxVmQyRkdnMDF3ZHIr?=
 =?utf-8?B?ZlRjYzRFaHZ0SkYveVBtV3N2RThPdXNGaEFNdmFJeFV3RUNSemZ0c1R5Skhv?=
 =?utf-8?B?dTJHblFYZ0xBWitkS21vTVI0K3pOYkhWQzVLZ2hTTk1OZGpvaWZDaVJWTHdl?=
 =?utf-8?B?WEoxYklpck0rSHN3SzhDd2ZuWHpsdzhqbW5mcC91aVJqR2xCelpOeHNOZHEy?=
 =?utf-8?B?dVZlZXhMeXNwNHZFS1lIY3JNamFGb0hZR3d0NmlQazE0SEE0OFd6aHNUMEFm?=
 =?utf-8?B?QzI3S1BYckFIZHpRcjlHMXpIbVNEYUQ1UDRGMkoxV1Z2eldmcnJFTnJjZFRq?=
 =?utf-8?B?cllVQ3I5VndOcERtRkRoazZudU1jenljdy9vanJJdGU3RTZFOWYxUUp4OWVL?=
 =?utf-8?Q?XUN3a6ZHyZnn8dic=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8df6d6-381e-4c57-7d7d-08de5de0ab81
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 20:14:26.6517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJoC8Bnr6D+bL9MEMwBmnvkZjbTjW9AtLkbSp+BSD6N8oUkDffM8K29MQIhLuUYE7Ag/VKuSikSBH8dKA+hfug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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

On Thu, Jan 22, 2026 at 09:47:37AM -0800, Daniele Ceraolo Spurio wrote:
> 
> 
> On 1/22/2026 1:22 AM, Zbigniew Kempczyński wrote:
> > On Tue, Jan 20, 2026 at 01:10:20PM -0800, Daniele Ceraolo Spurio wrote:
> > > 
> > > On 1/19/2026 4:01 AM, Zbigniew Kempczyński wrote:
> > > > On Fri, Jan 16, 2026 at 01:05:01PM -0800, Matthew Brost wrote:
> > > > > On Fri, Jan 16, 2026 at 10:45:39AM +0100, Zbigniew Kempczyński wrote:
> > > > > > On Wed, Jan 14, 2026 at 04:45:46PM -0800, Matthew Brost wrote:
> > > > > > > If a batch buffer is complete, it makes little sense to preempt the
> > > > > > > fence signaling instructions in the ring, as the largest portion of the
> > > > > > > work (the batch buffer) is already done and fence signaling consists of
> > > > > > > only a few instructions. If these instructions are preempted, the GuC
> > > > > > > would need to perform a context switch just to signal the fence, which
> > > > > > > is costly and delays fence signaling. Avoid this scenario by disabling
> > > > > > > preemption immediately after the BB start instruction and re-enabling it
> > > > > > > after executing the fence signaling instructions.
> > > > > > > 
> > > > > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > > > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > > > > > Cc: Carlos Santa <carlos.santa@intel.com>
> > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > ---
> > > > > > >    drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
> > > > > > >    1 file changed, 9 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > index a1fd99f2d539..cd645ee400b9 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > @@ -282,6 +282,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
> > > > > > >    	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > > > +	/* Don't preempt fence signaling */
> > > > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > > +
> > > > > > >    	if (job->user_fence.used) {
> > > > > > >    		i = emit_flush_dw(dw, i);
> > > > > > >    		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > > > > > > @@ -347,6 +350,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> > > > > > >    	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > > > +	/* Don't preempt fence signaling */
> > > > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > > +
> > > > > > >    	if (job->user_fence.used) {
> > > > > > >    		i = emit_flush_dw(dw, i);
> > > > > > >    		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > > > > > > @@ -399,6 +405,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> > > > > > >    	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > > > +	/* Don't preempt fence signaling */
> > > > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > > +
> > > > > > IGT tests which calls compute-walker, then bbe are asynchronous (don't
> > > > > > wait for completion, pipe-control is necessary to wait on
> > > > > > compute-walker).
> > > > > > 
> > > > > This asynchronous behavior may explain things. Is this a common use
> > > > > case?
> > > > Compute runtime if I'm not wrong uses pipe-control explicitely. IGT are
> > > > not doing this relying on kmd.
> > > > 
> > > > > Also do you know if render engines have similar asynchronous behaviors
> > > > > or is this specific to compute engines?
> > > > I don't know, I think Mesa folks may know the answer.
> > > > 
> > > > > Lastly, the i915 disables preemption on both render / compute engines
> > > > > immediately after the BB before emitting the pipe control. Is this async
> > > > > behavior a new few feature in Xe2 parts which only the Xe driver
> > > > > supports? This might explain why the i915 works and Xe does not.
> > > > Test exercises WMTP and this is supported starting at Xe2+. Probably
> > > > what test is doing has a meaning in this case. First compute-walker
> > > > submits kernel which loops until it will observe some memory write.
> > > > Second job executes compute-walker with kernel which does some quick job.
> > > > But first occupies all EU's so second job can be preempted only when
> > > > preemption occurs and SIP will be executed. So if we disable preemption
> > > > immediately we submit compute-walker I think we have no change to enter
> > > > SIP and switch. Even if I add pipe-control to batch level according
> > > > to Daniele comment job it is still preemptable and we move pipe-control
> > > > location from kmd -> batch level..
> > > So basically the test requires a preemption but does not put any preemption
> > > points within the batch? I'd argue that the fact that the test works at all
> > > is by chance, because the kernel just happens to add a preemption point
> > > after the BB and the batch doesn't wait for the results before completing.
> > > IMO it should be ok to go ahead with this patch and rework the test, but we
> > > probably need an ack from a maintainer because something that worked before
> > > (even if just by chance) is not going to work anymore.
> > Why user would need to explicitely add preemption points within batch?
> > It's imo driver responsibility to enable/disable preemption and additional
> > preemption points in the batch may change preemption distribution,
> > not the ability to preempt.
> 
> If the batch logic requires a preemption (like in this case where the batch
> needs a different batch on the same engine to signal it), then IMO the user
> should make sure that there is a preemption point in the batch. The driver
> does keep preemption enabled while the batch is executing, but I don't think
> we want to guarantee that preemption will be enabled or that there will be a
> preemption point after the batch has completed. The fact that there is a
> preemption point after the batch is kind of by chance, just because the
> instruction we use to do a memory flush happens to be preemptable.
> 
> > Compute-walkers we already had in IGT tests (gpgpu-fill) were called
> > in fire-and-forget mode leaving pipe-control to kmd. Code written
> > before I joined the team were written with this assumption and I haven't
> > seen any objection to this approach. So I assumed kmd will take care
> > of job completion when batch returns to ring. If this won't apply
> > anymore we just need to change IGT tests to add pipe-control in the
> > batch. And ensure nothing else is broken (compute / mesa).
> 
> Agreed we need to make sure that no one apart from IGT is already relying on
> this, otherwise as Matt said we'll need to make this an opt-in behavior.
> 

+1. Zbigniew has an IGT fix for this. Next steps are to confirm with
Mesa / Compute nothing breaks with this series. Not exactly sure how to
drive this part - I'd say just blindly push and see if anything breaks
but since this a fixes patch stable could pick this up when we unsure if
it actually ready.

Matt

> Daniele
> 
> > 
> > I'm going to send pipe-control patch to IGTs, imo it will fix the
> > WMTP case. Sync wait at the batch level should keep execution with
> > preemption enabled allowing to call SIP and switch the context.
> > 
> > --
> > Zbigniew
> > 
> > > Daniele
> > > 
> > > > --
> > > > Zbigniew
> > > > 
> > > > > Matt
> > > > > 
> > > > > > May you try to put arb disable after emit_render_cache_flush?
> > > > > > 
> > > > > > --
> > > > > > Zbigniew
> > > > > > 
> > > > > > >    	i = emit_render_cache_flush(job, dw, i);
> > > > > > >    	if (job->user_fence.used)
> > > > > > > -- 
> > > > > > > 2.34.1
> > > > > > > 
> 
