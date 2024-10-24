Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBC1D1038E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 23:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6B810E3D0;
	Thu, 24 Oct 2024 23:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MiFPEupm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C58E10E3D0
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 23:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729810853; x=1761346853;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aSXquWuMz72FeS1UeRCQ8jucRuGhP6QdhNQeRjf5X68=;
 b=MiFPEupm1AWix9Orbw1CvvFS6w5IznIuDz/Hd5J56Rwy/h4DwwLueUNr
 94drlx5BadYGoXUbYwUzNmJGOHmpOVRRGQ2oGsAGr1LYeuRqHXyOSac5H
 jA0zXThfAdOC6HZ3GRpN7BPQxFN83NWlQyM+EcJl1CROtjEcoeTQGnzgf
 9xuGu7/2nnNnF1lvoryf9uFfw++e+Kh+Cys4LC2pFZcIsY4M1oqq+hvtD
 PqAsoXtnzKbYMBY8VrGPR2YBHCPCfBY2WxXFrhM2GhdyOEVLSevwN1k98
 raaayJcYd243L3JanuN6OGIW6YzljOc8BjYgO88bIfcrAer7e/FwTXbNk A==;
X-CSE-ConnectionGUID: ewWZYKX0QdWiFOdNkfnetw==
X-CSE-MsgGUID: GN0OpyO/SfaTFYzJAdIkHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40005227"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40005227"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 16:00:53 -0700
X-CSE-ConnectionGUID: yBIdzDlxRDySM7JPYqs7Jw==
X-CSE-MsgGUID: 0/VM2KaBTvGrancIAZOV4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="85326886"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 16:00:52 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 16:00:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 16:00:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 16:00:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQvVUMKJd1JpFboRGIVDW5Z0NNweuGj54e3f0iYmszmfFSrv9iN8mcTYW0sUmEWxkAu+uvqDbytcrXxSgJuFkuNfJBVGrX+7Jq42IxiEQ2EQ5tpsKMV08fcV8x/mNKMzyy/4GJwsLIqjSsqpscsc1oD9WUSW5Yst9878ePG6nRoc1JXrZgx8MOm/T0lD/RbutbXEy1CbiLamti7wb/DkW9j0+dWdu/vfh9+/foOkDT98Xcr36VeN3az9Ncr7k/xJlcDohMGd74QR+xDu67ajQeKVhktaE9vGWgfzTwlRCHohP5Ck4SpRmOKEWqHMG7TOVZRXa8RewC4pphqjpPAETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bIfMsRVRJPYuJcpNzNL2/sIVumG5G6hR2fRtrddsic=;
 b=YnE84UliXsG5bh54sh8a0wIVGvc+45mKHnyGpf1TZ+GjiUGPRaqUGY+HVysOcZ0TurZ3H9KAhANZkwb/TRlndKvZUbkmhHck0eimiXK1XcJM4Ueih7ZrywGhOdIDOeMJxBQTDZt+fKPc+UUPsOtiKoYk4SEQ5JrOeRaa0oUQg6JGQm91RM26dh/H0Y2XI0zKCXThXnbgGXR7dGNQYjKTIIFts3+wvNkj+K5LSENpZrAwU1oIDjbkL2AzX5IHkzTzDz4hJvzAyBeV1p/JyqoT7JMz3HgSRO/cHCjyI9j/F96u3tfPEkl4w6Jiv8fhoZliymApukXgkmbzFwMZBXmleg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 23:00:49 +0000
Received: from IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041]) by IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041%7]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 23:00:49 +0000
Message-ID: <f934d836-113e-49a6-b8d1-a8b282f57b62@intel.com>
Date: Thu, 24 Oct 2024 16:00:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/pmu: Add GT C6 events
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240927002344.2565250-1-vinay.belgaumkar@intel.com>
 <20240927002344.2565250-3-vinay.belgaumkar@intel.com>
 <Zvb5GcYYKzD4H1mj@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Zvb5GcYYKzD4H1mj@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::18) To IA1PR11MB7755.namprd11.prod.outlook.com
 (2603:10b6:208:420::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7755:EE_|CH3PR11MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 51055efc-dee2-46aa-ceea-08dcf47fb38f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUpaQUVWTHRUSGZqekl2NVNwK3Q1ZkpXMkpnVnc0Vk1wTW90VG1HNXhiN09u?=
 =?utf-8?B?UEtIV3dhRGVRS2Y3NlJIVUwyeVBoelBqWG01V1hseW0vekY5WFE2N1V3Vk9H?=
 =?utf-8?B?WVdxSEw5UmJhajRUdjdNeWE2d1RRbnRrNFc4Rllxa0JIUkNpYVNRM01nT2VI?=
 =?utf-8?B?dWJVbzltL1NwTDg5NGI1N3lCcXFVMmJYckVLSllxNmRVM0hOS2YrZWtTY1dM?=
 =?utf-8?B?S2Y0a0lmcHlnamJiaTB2blBlSWtoYXJ2ZkJWSkFhb2gvS0tPY21pNWNBdG5S?=
 =?utf-8?B?MVRwOGhsZUJzU2hkaEFHRlJRUFNWRllnck9hTzFpMW1nV0w3K3RNQ1pTS3g1?=
 =?utf-8?B?YmpCOVFMTFlJMlJyb2k0UlFHUXpZVHBuMWQwUjRmNUgzcVM4ck80YWlCVC9r?=
 =?utf-8?B?N0hLeUxoeVIxTGE5OVFnNVc3KytCL2xqeVNVdFc3Rzd0UVhnays3dEpUVkFq?=
 =?utf-8?B?d1dLUUNnOHFyZjJDMXA3VkVZQTZxOFhwUUxBamp5QW1VYzJValozalpzU1NH?=
 =?utf-8?B?YUxJTW40TzI4aEtiTTA5VlNKVWZQNkIvNjU5dWVuMlZwR1c0YzZGWFU4QXNI?=
 =?utf-8?B?eEFjS0xXUU5xeWpod1dkV0RQSnNpQnkrUEI5WGhSRXVoMXFYWGthUy9mSEg5?=
 =?utf-8?B?UjhRVE9jc1hHOTVEYm5EWFpnaERqTmJSeVo4VDYyVVN3b21sR1ZEcVJxTUpN?=
 =?utf-8?B?SnBhT3pId0pFaCtSTjAxckdLbVBmcVZuWVJkbnp1SlF6K1lIVzVGSDIwbHgx?=
 =?utf-8?B?RXo2UXM3R1UvQ2dkcmlTQVVINnVEUmc3WW9GajRnSnRXb3gwS0xsSEUwSTZ0?=
 =?utf-8?B?blZJdC9JVXp6Z3lRQUVaSnU2NGt2V1VMSzJmWE9mSGtGNDg1SUhvajQzWW9B?=
 =?utf-8?B?ZFFFV3B0dXpyMSs1THZmUEw3TmU2RWlsTWE2VDdhK3FZK0xaOURwU1RRZTlG?=
 =?utf-8?B?SVBSeG5vMlAyc1liNHJ4T05Dc0lxQ0UybUFtSDhQb2d3VEdqSEYzTnNrS0FU?=
 =?utf-8?B?cmZaaWd3T0NsTmdxQllPWU9GSGVOMUxiWER6alBqTlcxcDZnVStEeFR6NmNi?=
 =?utf-8?B?eERaWUhXdXJBdjh6dWtGUXBHS2k4VHcrbTRXOHFBUmRlMWErbmVXNllLbzhG?=
 =?utf-8?B?aVNxbmNpZzhlUXRIS3JxV2hoM0FPemUxUlhLSHVabTEwREFrQnM2Q1VYcTdD?=
 =?utf-8?B?cWdoMzNobTI2RXpTNDhNWGxWS3pqUmlwTFBOanFoSFR6M0V6Q2lGeWhWa0JE?=
 =?utf-8?B?ZEVzSSt1ZjE4dUFFcmJtN2ZiMEI0L0dRK3phd1lzT3BzT2pyMTFLVUhKcHlU?=
 =?utf-8?B?UW9LcG9xZmhvdjdtLytrZWhDTWJ4RHEyMmYrMUlKem9SZ2xpZ2ZHTTY0b3B1?=
 =?utf-8?B?UTBiSmtYamlpU3hiVzV2MDYzb0ZHbUZmSWZTV2pEMXhEYTNBb3dMN2FpbWNa?=
 =?utf-8?B?SlhLU01WRG1ST29kTW5ZdnhWOWx0bXM4bC9lY3BmekFEbGJEblF3WXVtM2x6?=
 =?utf-8?B?Q2FGeDZRa0ExdmkzV3E4Z0FFYkl5RDZzVXhoYTJlMUk0VmpXTW5WQldvWjQr?=
 =?utf-8?B?UHBkOFZpeWl0R2gxV0hrbEZoRzZWWGZqRzFNZjcwMFg3WjNnVTJtT1NWbXJx?=
 =?utf-8?B?VVZUUHVvS1V5dnJpVmVHWHRmQnREbERNRmhRZWJWdXFvUFpxNjUrMFBuT1l4?=
 =?utf-8?B?VDdnWUo2MlpCb3dVdTlTUkdIQnM4YjhWUEh6V3VRcmEvRWtQTU1RMHZZV3FT?=
 =?utf-8?Q?rN+EFt1a3FvATylM9UvkKaGr6RK1twqafC8wQoC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7755.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yzd4U1FKeSt0UUl2TDVnMWg2UXdxRW9qclF4VmdQOVVzMkFJaUpjNnQvTDdt?=
 =?utf-8?B?c1JyQUNsbkNOMzFpOEVlekFsSU96MitrdElyMVNvTHZPdnNzM2c1SER2RVdF?=
 =?utf-8?B?ek4zK0Y0UURpMVJXWCtPbVVSL3BNbjVLeGxoWnptbVlobkJYMnJISlkzNkxI?=
 =?utf-8?B?SDFDdWFtcFRBMGlkRkJncHV0eGExaEp2NGZQdlV2NzlFZ1NyZmVMWlRCUXVl?=
 =?utf-8?B?SW5OM2ZpQ05kUjMvdVhRVjNWYmIwT0I4V0krTmlub1NJZjZtQmJtRWdXTEl1?=
 =?utf-8?B?cUo0WFBIMncwbFl5NE9UL3NGcnh3Y2xEeWpzTG00c3VrdXprR0I2a1ZrUHVj?=
 =?utf-8?B?dXNHK3NLbytPejNSWkE0Ty9jV3VaV0g0ZGxzZDIrWDhYZGJjbEUwTGVHWE4v?=
 =?utf-8?B?Z3Y0cGZ0OVVubHdmMWFlclRtZTd4Z2x5MnlGcDl0NVMyckIrVXQvUTdXZ1hT?=
 =?utf-8?B?UnRSOENzZWpFUGZ6QmcwUVR3Qzc2dGFES3RTSlJCWGtIa1ZiZHVuc0NDQjRO?=
 =?utf-8?B?T3RtNDBNUkMvR01jS2Q5MXgvTU8xRVBBajcyT1hsQnRpMENKL0lCVnBMWmVR?=
 =?utf-8?B?YlVqRHdxNlB1QnRCZENBSkJvQnBEdGFsN2h3R3A2WURwZ3pCbjR2WTNHemtt?=
 =?utf-8?B?OTFENGQ1Z1M2VGl6U01aWWFnTitWVGZaRk9rNUdEVitnck5JbGljQmQ5UkJG?=
 =?utf-8?B?SERCMUR5bzU1anErd0FVa1J6Y0NyeENBMFpGUVNTRnhwWXU5SjZobjF0UVND?=
 =?utf-8?B?dWl3aENGMVFOSloweUZwNTYvbnZmWHNIbHdKV0M3QXdvc25mYW1qRi9abUp2?=
 =?utf-8?B?R1BucDlqZ1ZSVGxWSVZhNlY1RE4vS1N0ckg1V21Da0x5VFZGcVdOVUQyZzZt?=
 =?utf-8?B?NGd5K2JSanlmTzE2NGJZM3U0eUpFK29VQytkdDZmNVFpVzNvMmhUNlBjY0lL?=
 =?utf-8?B?b2VSdlN3TVA3eUh3TVVqaWgyRE53SHRzWURTR285bjhUNm92S1huVmpkQ3h6?=
 =?utf-8?B?cmROSGt3ZWZtUmF2T3FqK201ZXlnMU9uZlNMYUp4T3JPSGJjMmNkNmtROVFs?=
 =?utf-8?B?YUxUL2RCVkQwZjBxeE9WRmxlVGJXMUhWS0tYa0ZKbjhTbzJIT1M2bDluemJ6?=
 =?utf-8?B?bnJpc1RwVFU0MXZKcmtQYjRBZURCZHpwSEJtMm1GZS9YRmxRVUsxRk9hcTRs?=
 =?utf-8?B?Y1BsU2liNUhNcllNL25KQXMzNGxiSTVzQzV3dWRlR1ZrQXdCNHl2NnJ5RjV4?=
 =?utf-8?B?alM2Nkp4UnA0ajZLWWhiWi95TXBEd2NGTWpxajR6Q2VzckpnSGd6VmpuMXlt?=
 =?utf-8?B?ampiL1M0SFRBdU5uTkpkQTZGQXd2a2lhQWpwalJZbFVNWEpkUkhKQm5EdHc1?=
 =?utf-8?B?UTZiN0NZMHZ4ck4wRHUwREFlcURHbzcraHhRRFFQc2RzdklVZlhUR3ZiZjJv?=
 =?utf-8?B?VzNNREExT2tibzRKKytTaWNIRUVCWWRFVUdVTUtlNklNTDRJRG1zVVlERXZj?=
 =?utf-8?B?ajJWcmF5bUdQM1ovbDNFYy9tRzlvRndPMnFFOWpLMkVMNDJuRDdjYkpKU01F?=
 =?utf-8?B?RGdISzJ6WVBYMTlkN1VoUktXZnZTcVQwRkZqaEc1b0ZXWndIenMxYlZNOUFK?=
 =?utf-8?B?ZkJTaFBBLzJ4NGxaMERNa2JyaW4wSUlFd3h2K0ZBSDhHUE1kbkp4dE5FellY?=
 =?utf-8?B?V0RhZmZkRXRSRHA1a2J1MFpsd3RHNVdteGp6Y1B6bEg0dHczd21BT05ZR3R5?=
 =?utf-8?B?Vk5TQlJOOGNoZmI1TmxjdU1CZUFlL3EreW0vL0x4ZHdRWmZkVlR4T25tSG92?=
 =?utf-8?B?UDMyRXVZS0tjVXBrWUZxWk1jQlFZNkxqd2xsYWZNcVJscWFwcTN1ZkNnaXNw?=
 =?utf-8?B?eHZLOGNNOGlSV2JBTzVTUWozK0JPSjRiU3d5TXl0dVllRUo5VWxJR0VtOTNx?=
 =?utf-8?B?eCtrcmpjOEovSFJabnZ4NzVROHNZOUdWZ1JBUTRaT1RwamljSDdYRkRHOFh2?=
 =?utf-8?B?Z3h3amxTVWRVVEFIejkvVVJ0UmQ5cElwTHpLRk5nK3hDUVRHY1JSOERvUDZs?=
 =?utf-8?B?QURrSjlqeEk2TWlHc0R5NHF0dStxckNNaHNMSWc4Z1o1ZDZJYW4vYUJqUUhi?=
 =?utf-8?B?MFVBOXZtbDZCYnJJcVRMU1pQNXpVZFlTRC9nTFNRRnV5MjE2K1RhaU90TU0r?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51055efc-dee2-46aa-ceea-08dcf47fb38f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7755.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 23:00:49.2485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fJH/Hbcn24LUGXiOhJaICssfBDEAsoRCbbZrvKTWgP0+cbFh1aYj6/8QiMhFXtdEYBoZQDrMezsqGUrrnu2CbgYckN+7AkNj5yPR7qZ3lQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
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


On 9/27/2024 11:27 AM, Rodrigo Vivi wrote:
> On Thu, Sep 26, 2024 at 05:23:43PM -0700, Vinay Belgaumkar wrote:
>> Provide a PMU interface for GT C6 residency counters. The implementation
>> is ported over from the i915 PMU code. Residency is provided in units of
>> ms(similar to sysfs entry - /sys/class/drm/card0/device/tile0/gt0/gtidle).
>>
>> Following PMU events are being added-
>>
>>>> perf list | grep rc6
>>    xe_0000_00_02.0/rc6-residency-gt0/                 [Kernel PMU event]
>>    xe_0000_00_02.0/rc6-residency-gt1/                 [Kernel PMU event]
>>
>> v2: Checkpatch fix, move timer code to next patch
>> v3: Fix kunit issue
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c        |   2 +
>>   drivers/gpu/drm/xe/xe_gt_idle.c   |  20 ++--
>>   drivers/gpu/drm/xe/xe_gt_idle.h   |   1 +
>>   drivers/gpu/drm/xe/xe_pmu.c       | 172 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pmu.h       |   2 +
>>   drivers/gpu/drm/xe/xe_pmu_types.h |  58 ++++++++++
>>   include/uapi/drm/xe_drm.h         |   4 +
>>   7 files changed, 253 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 9b0218109647..7a190c49c573 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -872,6 +872,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   
>>   	xe_gt_idle_disable_pg(gt);
>>   
>> +	xe_pmu_suspend(gt);
>> +
>>   	xe_gt_disable_host_l2_vram(gt);
>>   
>>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index 531924b6c0a1..e0a12ac7387c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -277,18 +277,26 @@ static ssize_t idle_status_show(struct device *dev,
>>   }
>>   static DEVICE_ATTR_RO(idle_status);
>>   
>> -static ssize_t idle_residency_ms_show(struct device *dev,
>> -				      struct device_attribute *attr, char *buff)
>> +u64 xe_gt_idle_residency(struct xe_gt *gt)
>>   {
>> -	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_gt_idle *gtidle = &gt->gtidle;
>>   	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>>   	u64 residency;
>>   
>> -	xe_pm_runtime_get(pc_to_xe(pc));
>> +	xe_pm_runtime_get(xe);
>>   	residency = gtidle->idle_residency(pc);
>> -	xe_pm_runtime_put(pc_to_xe(pc));
>> +	xe_pm_runtime_put(xe);
>> +
>> +	return get_residency_ms(gtidle, residency);
>> +}
>> +
>> +static ssize_t idle_residency_ms_show(struct device *dev,
>> +				      struct device_attribute *attr, char *buff)
>> +{
>> +	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>>   
>> -	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
>> +	return sysfs_emit(buff, "%llu\n", xe_gt_idle_residency(gtidle_to_gt(gtidle)));
>>   }
>>   static DEVICE_ATTR_RO(idle_residency_ms);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
>> index 4455a6501cb0..887791f653ac 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>> @@ -17,5 +17,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt);
>>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
>>   int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>> +u64 xe_gt_idle_residency(struct xe_gt *gt);
>>   
>>   #endif /* _XE_GT_IDLE_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index bdaea9ca1065..b1b38d245e00 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -11,10 +11,15 @@
>>   #include "xe_device.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_gt_clock.h"
>> +#include "xe_gt_idle.h"
>> +#include "xe_guc_pc.h"
>>   #include "xe_mmio.h"
>>   #include "xe_macros.h"
>> +#include "xe_module.h"
>>   #include "xe_pm.h"
>>   
>> +#define FREQUENCY 200
>> +
>>   static cpumask_t xe_pmu_cpumask;
>>   static unsigned int xe_pmu_target_cpu = -1;
>>   
>> @@ -35,6 +40,11 @@ static unsigned int xe_pmu_target_cpu = -1;
>>    *
>>    */
>>   
>> +static struct xe_pmu *event_to_pmu(struct perf_event *event)
>> +{
>> +	return container_of(event->pmu, struct xe_pmu, base);
>> +}
>> +
>>   static unsigned int config_gt_id(const u64 config)
>>   {
>>   	return config >> __XE_PMU_GT_SHIFT;
>> @@ -45,6 +55,35 @@ static u64 config_counter(const u64 config)
>>   	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>>   }
>>   
>> +static unsigned int other_bit(const u64 config)
>> +{
>> +	unsigned int val;
>> +
>> +	switch (config_counter(config)) {
>> +	case XE_PMU_RC6_RESIDENCY:
>> +		val = __XE_PMU_RC6_RESIDENCY_ENABLED;
>> +		break;
>> +	default:
>> +		/*
>> +		 * Events that do not require sampling, or tracking state
>> +		 * transitions between enabled and disabled can be ignored.
>> +		 */
>> +		return -1;
>> +	}
>> +
>> +	return config_gt_id(config) * __XE_PMU_TRACKED_EVENT_COUNT + val;
>> +}
>> +
>> +static unsigned int config_bit(const u64 config)
>> +{
>> +	return other_bit(config);
>> +}
>> +
>> +static unsigned int event_bit(struct perf_event *event)
>> +{
>> +	return config_bit(event->attr.config);
>> +}
>> +
>>   static void xe_pmu_event_destroy(struct perf_event *event)
>>   {
>>   	struct xe_device *xe =
>> @@ -64,6 +103,10 @@ config_status(struct xe_device *xe, u64 config)
>>   		return -ENOENT;
>>   
>>   	switch (config_counter(config)) {
>> +	case XE_PMU_RC6_RESIDENCY:
>> +		if (xe->info.skip_guc_pc)
>> +			return -ENODEV;
>> +		break;
>>   	default:
>>   		return -ENOENT;
>>   	}
>> @@ -110,6 +153,63 @@ static int xe_pmu_event_init(struct perf_event *event)
>>   	return 0;
>>   }
>>   
>> +static inline s64 ktime_since_raw(const ktime_t kt)
>> +{
>> +	return ktime_to_ns(ktime_sub(ktime_get_raw(), kt));
>> +}
>> +
>> +static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample)
>> +{
>> +	return pmu->event_sample[gt_id][sample].cur;
>> +}
>> +
>> +static void
>> +store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
>> +{
>> +	pmu->event_sample[gt_id][sample].cur = val;
>> +}
>> +
>> +static u64 get_rc6(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	const unsigned int gt_id = gt->info.id;
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	bool device_awake;
>> +	unsigned long flags;
>> +	u64 val;
>> +
>> +	device_awake = xe_pm_runtime_get_if_active(xe);
>> +	if (device_awake) {
>> +		val = xe_gt_idle_residency(gt);
>> +		xe_pm_runtime_put(xe);
>> +	}
>> +
>> +	spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +	if (device_awake) {
>> +		store_sample(pmu, gt_id, __XE_SAMPLE_RC6, val);
>> +	} else {
>> +		/*
>> +		 * We think we are runtime suspended.
>> +		 *
>> +		 * Report the delta from when the device was suspended to now,
>> +		 * on top of the last known real value, as the approximated RC6
>> +		 * counter value.
>> +		 */
>> +		val = ktime_since_raw(pmu->sleep_last[gt_id]);
>> +		val += read_sample(pmu, gt_id, __XE_SAMPLE_RC6);
>> +	}
>> +
>> +	if (val < read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED))
>> +		val = read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED);
>> +	else
>> +		store_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED, val);
>> +
>> +	spin_unlock_irqrestore(&pmu->lock, flags);
>> +
>> +	return val;
>> +}
>> +
>>   static u64 __xe_pmu_event_read(struct perf_event *event)
>>   {
>>   	struct xe_device *xe =
>> @@ -120,6 +220,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>>   	u64 val = 0;
>>   
>>   	switch (config_counter(config)) {
>> +	case XE_PMU_RC6_RESIDENCY:
>> +		val = get_rc6(gt);
>> +		break;
>>   	default:
>>   		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>   	}
>> @@ -151,6 +254,28 @@ static void xe_pmu_event_read(struct perf_event *event)
>>   
>>   static void xe_pmu_enable(struct perf_event *event)
>>   {
>> +	struct xe_pmu *pmu = event_to_pmu(event);
>> +	const unsigned int bit = event_bit(event);
>> +	unsigned long flags;
>> +
>> +	if (bit == -1)
>> +		goto update;
>> +
>> +	spin_lock_irqsave(&pmu->lock, flags);
> lockdep didn't like it:
>
> [ 8969.701191] =============================
> [ 8969.705238] [ BUG: Invalid wait context ]
> [ 8969.709277] 6.11.0+ #44 Tainted: G     U     OE
> [ 8969.714289] -----------------------------
> [ 8969.718326] perf/10438 is trying to lock:
> [ 8969.722371] ffff88827ead2d50 (&pmu->lock){....}-{3:3}, at: xe_pmu_enable+0xdb/0x340 [xe]
> [ 8969.731153] other info that might help us debug this:
> [ 8969.736254] context-{5:5}
> [ 8969.738912] 3 locks held by perf/10438:
> [ 8969.742785]  #0: ffff888f73a11f98 (&cpuctx_mutex){+.+.}-{4:4}, at: perf_event_ctx_lock_nested+0x18b/0x340
> [ 8969.752448]  #1: ffff888100fb6d98 (&event->child_mutex){+.+.}-{4:4}, at: perf_event_for_each_child+0x7d/0x140
> [ 8969.762456]  #2: ffff888f73a11ef8 (&cpuctx_lock){....}-{2:2}, at: event_function+0x10f/0x460
> [ 8969.770975] stack backtrace:
> [ 8969.773882] CPU: 0 UID: 0 PID: 10438 Comm: perf Tainted: G     U     OE      6.11.0+ #44
> [ 8969.782037] Tainted: [U]=USER, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
> [ 8969.788260] Hardware name: iBUYPOWER INTEL/B660 DS3H AC DDR4-Y1, BIOS F5 12/17/2021
> [ 8969.795976] Call Trace:
> [ 8969.798453]  <TASK>
> [ 8969.800581]  dump_stack_lvl+0x8f/0xe0
> [ 8969.804290]  __lock_acquire+0x159a/0x6270
> [ 8969.808357]  ? __pfx___lock_acquire+0x10/0x10
> [ 8969.812763]  lock_acquire+0x19e/0x500
> [ 8969.816469]  ? xe_pmu_enable+0xdb/0x340 [xe]

Fixed it. There was a double wakeref_get() in the path.

Thanks,

Vinay.

>
>
>> +
>> +	/*
>> +	 * Update the bitmask of enabled events and increment
>> +	 * the event reference counter.
>> +	 */
>> +	BUILD_BUG_ON(ARRAY_SIZE(pmu->enable_count) != XE_PMU_MASK_BITS);
>> +	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
>> +	XE_WARN_ON(pmu->enable_count[bit] == ~0);
>> +
>> +	pmu->enable |= BIT(bit);
>> +	pmu->enable_count[bit]++;
>> +
>> +	spin_unlock_irqrestore(&pmu->lock, flags);
>> +update:
>>   	/*
>>   	 * Store the current counter value so we can report the correct delta
>>   	 * for all listeners. Even when the event was already enabled and has
>> @@ -277,6 +402,7 @@ create_event_attributes(struct xe_pmu *pmu)
>>   		const char *name;
>>   		const char *unit;
>>   	} events[] = {
>> +		__event(0, "rc6-residency", "ms"),
>>   	};
>>   
>>   	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> @@ -465,6 +591,32 @@ static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>>   	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
>>   }
>>   
>> +static void store_rc6_residency(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	store_sample(pmu, gt->info.id, __XE_SAMPLE_RC6,
>> +		     xe_gt_idle_residency(gt));
>> +	pmu->sleep_last[gt->info.id] = ktime_get_raw();
>> +}
>> +
>> +/**
>> + * xe_pmu_suspend() - Save residency count before suspend
>> + */
>> +void xe_pmu_suspend(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (!pmu->base.event_init)
>> +		return;
>> +
>> +	spin_lock_irq(&pmu->lock);
>> +	store_rc6_residency(gt);
>> +	spin_unlock_irq(&pmu->lock);
>> +}
>> +
>>   /**
>>    * xe_pmu_unregister() - Remove/cleanup PMU registration
>>    */
>> @@ -492,6 +644,24 @@ void xe_pmu_unregister(void *arg)
>>   	free_event_attributes(pmu);
>>   }
>>   
>> +static void init_rc6(struct xe_pmu *pmu)
>> +{
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	struct xe_gt *gt;
>> +	unsigned int j;
>> +
>> +	for_each_gt(gt, xe, j) {
>> +		xe_pm_runtime_get(xe);
>> +		u64 val = xe_gt_idle_residency(gt);
>> +
>> +		store_sample(pmu, j, __XE_SAMPLE_RC6, val);
>> +		store_sample(pmu, j, __XE_SAMPLE_RC6_LAST_REPORTED,
>> +			     val);
>> +		pmu->sleep_last[j] = ktime_get_raw();
>> +		xe_pm_runtime_put(xe);
>> +	}
>> +}
>> +
>>   /**
>>    * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
>>    *
>> @@ -525,6 +695,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
>>   	if (!pmu->events_attr_group.attrs)
>>   		goto err_name;
>>   
>> +	init_rc6(pmu);
>> +
>>   	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>>   					GFP_KERNEL);
>>   	if (!pmu->base.attr_groups)
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> index d07e5dfdfec0..17f5a8d7d45c 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>> @@ -15,11 +15,13 @@ int xe_pmu_init(void);
>>   void xe_pmu_exit(void);
>>   void xe_pmu_register(struct xe_pmu *pmu);
>>   void xe_pmu_unregister(void *arg);
>> +void xe_pmu_suspend(struct xe_gt *gt);
>>   #else
>>   static inline int xe_pmu_init(void) { return 0; }
>>   static inline void xe_pmu_exit(void) {}
>>   static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>>   static inline void xe_pmu_unregister(void *arg) {}
>> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>>   #endif
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>> index ca0e7cbe2081..1213d2a73492 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -11,11 +11,34 @@
>>   #include <uapi/drm/xe_drm.h>
>>   
>>   enum {
>> +	__XE_SAMPLE_RC6,
>> +	__XE_SAMPLE_RC6_LAST_REPORTED,
>>   	__XE_NUM_PMU_SAMPLERS
>>   };
>>   
>>   #define XE_PMU_MAX_GT 2
>>   
>> +/*
>> + * Non-engine events that we need to track enabled-disabled transition and
>> + * current state.
>> + */
>> +enum xe_pmu_tracked_events {
>> +	__XE_PMU_RC6_RESIDENCY_ENABLED,
>> +	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
>> +};
>> +
>> +/*
>> + * How many different events we track in the global PMU mask.
>> + *
>> + * It is also used to know to needed number of event reference counters.
>> + */
>> +#define XE_PMU_MASK_BITS \
>> +	(XE_PMU_MAX_GT * __XE_PMU_TRACKED_EVENT_COUNT)
>> +
>> +struct xe_pmu_sample {
>> +	u64 cur;
>> +};
>> +
>>   struct xe_pmu {
>>   	/**
>>   	 * @cpuhp: Struct used for CPU hotplug handling.
>> @@ -58,6 +81,41 @@ struct xe_pmu {
>>   	 * @pmu_attr: Memory block holding device attributes.
>>   	 */
>>   	void *pmu_attr;
>> +
>> +	/**
>> +	 * @enable: Bitmask of specific enabled events.
>> +	 *
>> +	 * For some events we need to track their state and do some internal
>> +	 * house keeping.
>> +	 *
>> +	 * Each engine event sampler type and event listed in enum
>> +	 * i915_pmu_tracked_events gets a bit in this field.
>> +	 *
>> +	 * Low bits are engine samplers and other events continue from there.
>> +	 */
>> +	u32 enable;
>> +
>> +	/**
>> +	 * @enable_count: Reference counts for the enabled events.
>> +	 *
>> +	 * Array indices are mapped in the same way as bits in the @enable field
>> +	 * and they are used to control sampling on/off when multiple clients
>> +	 * are using the PMU API.
>> +	 */
>> +	unsigned int enable_count[XE_PMU_MASK_BITS];
>> +	/**
>> +	 * @sample: Current and previous (raw) counters for sampling events.
>> +	 *
>> +	 * These counters are updated from the i915 PMU sampling timer.
>> +	 *
>> +	 * Only global counters are held here, while the per-engine ones are in
>> +	 * struct intel_engine_cs.
>> +	 */
>> +	struct xe_pmu_sample event_sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>> +	/**
>> +	 * @sleep_last: Last time GT parked for RC6 estimation.
>> +	 */
>> +	ktime_t sleep_last[XE_PMU_MAX_GT];
>>   };
>>   
>>   #endif
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 2c5f258eee3a..3ef3926551dd 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1396,6 +1396,10 @@ struct drm_xe_wait_user_fence {
>>   
>>   #define ___XE_PMU_OTHER(gt, x) \
>>   	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>> +#define __XE_PMU_OTHER(x) ___XE_PMU_OTHER(0, x)
>> +
>> +#define XE_PMU_RC6_RESIDENCY                    __XE_PMU_OTHER(0)
>> +#define __XE_PMU_RC6_RESIDENCY(gt)              ___XE_PMU_OTHER(gt, 0)
>>   
>>   /**
>>    * enum drm_xe_observation_type - Observation stream types
>> -- 
>> 2.38.1
>>
