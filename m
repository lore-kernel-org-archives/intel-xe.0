Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A8EC36005
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 20:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF1410E5F7;
	Tue, 25 Mar 2025 20:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVhLIYLh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F6410E5F7
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 20:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742934872; x=1774470872;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=obzD0UjR+r3sLuUR7Jl3ufc4ZUJPOD/3C8krMdypasg=;
 b=MVhLIYLhI69hAsA+Zw38BbSnXS+pbD8xJADfmow0aDSLxjCqI2BsOaJ2
 XKBwZpHzLy08ym0ogxLHOJMA4g58vvfMUYj1gLtPWVlg9YcEz7oXQIe9c
 J+360G2nac19qh9Jzw4n3dC9ZGaJYZYVwUdBf7+8ZXRt5NuYtteBeO52x
 EvzSjC2GINXt8km/cXwOxdcN/Tr7yEpacDnI2jRHw8Y20cpbGu37AfaBk
 s5HeDPNdzh6Ri+g72RM040JWkiVZX7lu//OIOjOlU0suJv4lC/nBhWvEk
 wqeGsxt5cWEuYtXwbbKfwObwFcAaKcyAEWPUxABHNo111/v6Ts40+uFHQ Q==;
X-CSE-ConnectionGUID: 7TDcv6ruTwiQWjTezt8ljw==
X-CSE-MsgGUID: avcvzVigSSiEGT6ZbjkH5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="47854564"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="47854564"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 13:34:32 -0700
X-CSE-ConnectionGUID: S/p/SL+vSuGkk7DiJOuyhg==
X-CSE-MsgGUID: 8w8A3TkTQISdB9yItNHygw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="128635254"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 13:34:31 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 25 Mar 2025 13:34:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Mar 2025 13:34:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 13:34:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCi4rjkU6ioHHxMdNnxroxfnSh6vJdglufVNweJN5PRfWXdZKi+qzOnhwNH3hi1QprIHtXk39M8R3balheVmbOAytgtaNrDfwRcL+Axm3WgwmxqBipF7aYuL5cAeHp8KD7RM6wwVuZTkeDc0S1GCUnXCw9AU2q+mfY6rnb3Yn8MQhhOQBa/cPmzmWHK8fJ1jxG3G4DCHy23aX+4qGMWRZctPMHkCBHN0M5CCvKOCxavPR/YUWMHlO48RlnhW3YnsLnp3DN/vYGrFupFs3FT22A3Xm6YjSbPMmtsyM96Ca7Uv67/KRRXVWYPhphVOzSamVeLDBXtQ0IHpoT/GVW11UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jxnw3X/E8eWKI5DKGGdp22ggljXYODDbi4fdFxuS5ls=;
 b=APB61huP30+AqYhx5hHEVQD5+wgiqG0NuTe7/zYc9fkp+abHrJxEGG9SX8ebJ3ldiem0PzdhJe4oJNddvnQIdD/qOrkzx9re2+kvvkWcsbef9oHfKVc2jjjf1z1d32BXOBv2uI2uecFZiSMj/Q1A2uvBikln/eYsuGiWSwAktucoVtsLCvfrQe5gQ5u3FtKIalB3AgSzK58zduLnAYu/FFQQhDi1oOALecI34eEMsKbOwHUya33idy0jDOTt6OOV64KsMGVNKLF9BChGNylj9rqlcdl9q1aLpnlPQQC+TX39eBA3i7N7X8KjmKXi+NMwQcLOtZoShk9JqFK7Whv6tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA4PR11MB9249.namprd11.prod.outlook.com (2603:10b6:208:55f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 20:33:46 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 20:33:46 +0000
Message-ID: <33ebfe1d-5ac5-4985-8c8d-c1996e5a6d14@intel.com>
Date: Tue, 25 Mar 2025 13:33:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/pmu: Add GT frequency events
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250324232402.46481-1-vinay.belgaumkar@intel.com>
 <87jz8e9d3h.wl-ashutosh.dixit@intel.com>
 <b46fbbd0-ee96-4f00-9f6f-a00115feb32d@intel.com>
 <87jz8dhw0r.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87jz8dhw0r.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::48) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA4PR11MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: b56ffd6c-585b-41b8-099f-08dd6bdc5750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3plZmVxeHhQNFNtTlFReVFwRWNqWlZ2SUpTclZ0UnI2SmRTQ0I5STZ4bzgv?=
 =?utf-8?B?akl5N2lWZmVxK242OSt4MnNDdHMxYmdvTW9oNjNGYnRzNnhwcGxCUmRxSVUw?=
 =?utf-8?B?WHlreGhwMWFrNGRWNjdHVTY0YmNGeEFramRGSEJLSU5hdmJxakFVWXVLZmRU?=
 =?utf-8?B?NTh2U2NUak12TjlJVDdMNzlacGR1VmpHQ2lOeDgwMDN2N0RwdGFBeHZ4eEZH?=
 =?utf-8?B?L3RtdC81RUJrWGVIRDk3N2J4eTJsajUwWkhyZ1l6NEZSeGpaek9MTzd1ZGRj?=
 =?utf-8?B?VUs0NGlhQU1sSzFCbVlEY3krV2JPZ1Nid3d0ZWxDQTJzV3V4REpqR2NZUUc4?=
 =?utf-8?B?QmJiNEtOSk5Hb2k4UHVvL1JUR1RraVVWbW4yVjNZblJReFYxR2VNY2xwMFhK?=
 =?utf-8?B?QnF2VE1NbUtSdlpzOENHdXE5eElPNVdvNnV0K1o2Nk5ZWklhL1IySWxlWVR6?=
 =?utf-8?B?d2MwZnVFUHlFYTRkb2hmWkxSU0g4NzEwSEYvbHJNVWNNeENscjd5eGgyQ3hl?=
 =?utf-8?B?K1liRVRjVXZVOGpGZHlZUTZGMXZTNkQzN2JnTkdGMjEybXFwR3VzUDk2aHRV?=
 =?utf-8?B?KzMrU2lvcnZoS2tBOUY3RGw2eVVQMW11dHhyNzRxNXRsV3JrWm9ZRVRFb2pR?=
 =?utf-8?B?c09YY0lyNjgvbExLUnR6L2t0N0czYmVwR3hyOUgzQVY1bzhoaDRrM1paTTJ5?=
 =?utf-8?B?WDNrY1ZnVUxSNjlyY3I5OSt3aWNCS2ViWE9yUFh3WHVmM0cwUW9hSGZsajBK?=
 =?utf-8?B?enhZTUF3ZEhhRzM5MndBOG1pUWxqSTBIU0FwRzlXT2t2ak1ablVZUWZWclJG?=
 =?utf-8?B?Mm1tcFlUNzJITUordWRKWVNmckZ0aHdwSkp5RWYweC9FMjhqTTd5YlhJNlVF?=
 =?utf-8?B?N0pHc09NSkY3RHZyRDR2b0REYm5TeHI4RGptWEdvZURXTkhXRXJIQTNxMXlW?=
 =?utf-8?B?cTNqL3ZnUWhzaFJyMHZ6blBEZUUvNXJsZ0tHeWZnT1VwdVZhRUJxblBUcFhC?=
 =?utf-8?B?dzFWT1Y5MVVpZnJCUFU4dzFPeWNWUEdQWWgvcFJRM01pa1NVaWhwYnNPa085?=
 =?utf-8?B?d3VFemJ5cUFMUFQ3V0Z3dCtROHJxRzcvcW5EZXY5SU4wZVZiaFFwaSs1ZFVN?=
 =?utf-8?B?ZlZOMmNlQzBFRkh6bXU4Y2RNZ2pid2xoWEV1eDV4a1JrbVh6aDM5eTkxYW1C?=
 =?utf-8?B?Sk5JN0tQSldZaXQvdkkwdDdZbnYzM2dNRkR3dEdOUVFaYTRFeWF2SXkvOXlz?=
 =?utf-8?B?WFJqZGUyNmpOSm1tM2d3cGROTGxGa0szdjhVeGVIN0o3bXlMb0JTS3AyZWNo?=
 =?utf-8?B?RmtVRENKS3NYMjk3Q2ROK0NFZDVEaVBzMnNab0Q5NkYzaUN6Tk1HL2g0c0Jk?=
 =?utf-8?B?d2lJVTVFL0VFMTN5Y3N0ZFlBaHBtVzJoR0tBN2dxbk8xZ1d2bitRQUhPbERs?=
 =?utf-8?B?cmZFZ0VJR2lDVGJMdnFZY0pUdzdaM01rQmExNDZvMWlUYlI5RGhIa0dEaFRY?=
 =?utf-8?B?bVJTN2grR1d2blRlalJkaWVCWTF4ZmhsNnIzQzhINjBOTkNiZGM5clRDTWFP?=
 =?utf-8?B?dWppL3ZQY1NGMmxKaEp5UnZqRFBFL1hHdC9ZQkhUTTRrT2FrUVZMQlVzbE5r?=
 =?utf-8?B?QzVQVm5sNjJvUFhreU4wdFhISWJWWmlTUTM1V1pQbnZkei9WbmMzcDdBSzl5?=
 =?utf-8?B?UjYzemJMR0V1cXROcEZ6OXc3WkZlWHpEa2VPdHZWRDhCaCt4dnBxblg1MENa?=
 =?utf-8?B?ZzBncFFDTE42RkM0bG5uV1ZWU3krY2R1WjZSUlV6UmlZdThxNWM4K0s1ZGtQ?=
 =?utf-8?B?ZTRWNXNNNW1sRzFTQWowOW5ySGlvWmRrdTdUWWZRSlFMaDQ4TWxEbjRMNmJB?=
 =?utf-8?Q?BZaPmKPMOqP/C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEVlL29zYWRzY2p4dTF4aWVhV0dIaTVUMXJFRlRJUUxNSVdJbkZlTy8relNs?=
 =?utf-8?B?bGxUNjhoUlI1U2lhTWFuaDdHN25MWTZ6SVFFdVFyTFJsZHZuQXJ0U1VtbXRQ?=
 =?utf-8?B?M2ttOW5BT3NFcGdqbytKRTlUenFUeGZhMnZ5eGxyRDU4MFZRTXh3dTk3RG5i?=
 =?utf-8?B?RmZ0MW54WWhqa3cvQWdrbWRPbHlubHBjc1Nwb3ZOeXVKU3RHb3JkQzZwWVpv?=
 =?utf-8?B?NHV5aGM2YVg0dDdZRmxXTnlYSVN1aEZsU1hieE9TbHR6NGJsMm5NWENvOFk0?=
 =?utf-8?B?SjgzaWQ5VGIwU09EU1ZtRVljbFRsNjVCcUVEb0tuZlZHN0FLRXJXenRDOXA5?=
 =?utf-8?B?cXJlWHBjVjJ0cVQrdld6VWpiUGlFZ1ArQUpCbVBOenBnR0hpa0luZXRXUXpM?=
 =?utf-8?B?VUdsdEdySXQycjB5ajlhUGw4dnJjckVwd3RRUG9TRW1XK1FhWENKRldybHBo?=
 =?utf-8?B?ODMxUHcyRWlDYVhiU0Ixc3dDSmZUZ2FIWWV3ZkQ5T3E4Wk9QVVRMbStQR2NT?=
 =?utf-8?B?NnAxU3N2NHl2MkMzTkp6UTZFUGtPWFFMSXNBZFJrNWlaK0lYUDJzQkx3TmxE?=
 =?utf-8?B?aTlMd3R2Y3dlMTF1V09iTkxoVkg3cW9hWUVFclc4dTE2OEU4Mk1Dd3lxc3kr?=
 =?utf-8?B?MzFRdTYrLytIZ2hxcys3N290WHJFOWdEdUl3allZbE1rYnFKRC8rZFREcG03?=
 =?utf-8?B?VzdhK0llcGtBc1c1ajM1V2VjOVV5dGJRbUdWQmo5Tm5qVC9HNk9aaHVBVG5W?=
 =?utf-8?B?WGpTeVE5TG1rYmU4NmZUU0tTYzIvNGVPSmZMMmYxSU84aUxkcXByenZXclBr?=
 =?utf-8?B?Zk5ydFBWUmg5Zjl6czdwTmJMZDF2c2xEdTVINDlNeDFkaStlSEhDNEt2VlRz?=
 =?utf-8?B?MmpnaE94UWU3MkorZnJ2ZUY0ZXFjUHZRaVBIN2JGS1ZZdmxBaE5OREowTzJI?=
 =?utf-8?B?c1UwZkpweUpUU1pPSGpMVGY5UEtMYStFK2lYT0svWHYwWHlBRGdVZ3NRdGlU?=
 =?utf-8?B?MEkyTHZXWFMrMmpUcGZTeU9aUXF3TzBMei9xaWtuZEhONlRnSGc0UC9SVTRr?=
 =?utf-8?B?U0tWMHNwU3pLMitFOVRLclY5N1RFVEZDZHp3M3YraXduRkNpVWM4dE1KTGM0?=
 =?utf-8?B?SCtCUHAvV1V1c2pwVUpNdFhZa3dLQkxnZ0wwbDUvOVpOeDFzNVRuNzJNSm1o?=
 =?utf-8?B?SHgyOW8xUkgwbjNicWRkOWlacDFPTFlxNHlDUURoU2RoTXBxUExlVWZwelVv?=
 =?utf-8?B?UjJDemZXTUJpU2ttbG5iZmxNc2M5a2xFTXcvN2xUT1VFYnBHQll0SlM1dnBP?=
 =?utf-8?B?TnhIRnUrbkVwODdwVFJoc1hDaGV0TGZZMkJISWNlMHVQTFg2ZlJ1OUxGR3dh?=
 =?utf-8?B?cEVjUnllLzkyNFhGM2RzaXV5dVNzMCtQcllSY0VVdjJPV0RmVDF0QmY2QmhU?=
 =?utf-8?B?aUdKMWVDNDV5NHQzaVZWdDdGRXdOZmlMakVqNFUxTisrSFR2Vjd0V2MwRVlB?=
 =?utf-8?B?N3pjcStWNGJPK0dlNzJ0bFlOODZqRGRLYjcrcXV2WnFNUnR3aFIvUlcxRjJT?=
 =?utf-8?B?WTJaaVVlcEhyQ1U1OTQrUitDMVBSQWhjTmh2REVDQ1h6K0VEaDhXM2xRU1E5?=
 =?utf-8?B?eGZIREcwWlIvaWpYNCtBWjZIMW4vZ1FvUlhNcjN6SyszNlBjYVN0VHIxZ1ky?=
 =?utf-8?B?VzBHOUlGR3AzYlBVYWRSbGVHVEJsd1JDZEdVNDR0MG8wZThpQkc1Z0xnVUcz?=
 =?utf-8?B?MitRNmNhMTNCV2V0QzBYckR5Zi9UUFZldG5RM24vU2NjSzBwaGtEL1FsS2lV?=
 =?utf-8?B?OHZkL0pyT0w5NEU1RVk4TWdocWFxNjI3NFZzN003cW8wb21kWjhnY2lGdlRD?=
 =?utf-8?B?VEVLUitvUjBQWUpTVEYycDFNNC8wclkrcXRoTlVGUnpyaU5uMVBZYXJoQW9x?=
 =?utf-8?B?T3Z1QWRaNUM1WnlEM280b2lMODFOdXlhMDg0ZTgwVkRNSlltckllWnpnazFX?=
 =?utf-8?B?dDBZTmlUMnhyTWkyNFFEaXJqemlOdzN2eDRVanRONmt3dmpDc3RkVmlVTjBB?=
 =?utf-8?B?b3BINDNPZ0Y2RG1wMjBQbGloc0hrQ3VkYkg1dEVMSERMN2JsQkt6Z3pHZ1FU?=
 =?utf-8?B?R2t4ckNKYUhUTXl2a3NvZ281bG5xZHBZZzVTK29yMWFCM1Q0TllrMlNLanN4?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b56ffd6c-585b-41b8-099f-08dd6bdc5750
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 20:33:46.0472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /FjQnDHa5RQYekcvDbyrVpwYlirPOnnxm1fBPvHym+7KCUJfmYRWHlWY/W92TC4xwEEFzoEm3j+VfcdpCZTdBeIAYarelld5kI1ZhruHRW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9249
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


On 3/25/2025 10:15 AM, Dixit, Ashutosh wrote:
> On Mon, 24 Mar 2025 19:37:32 -0700, Belgaumkar, Vinay wrote:
> Hi Vinay,
>
>> On 3/24/2025 5:18 PM, Dixit, Ashutosh wrote:
>>> On Mon, 24 Mar 2025 16:24:02 -0700, Vinay Belgaumkar wrote:
>>>> @@ -266,11 +274,24 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>>>> 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>>> 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>>> 		return read_engine_events(gt, event);
>>>> +	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>>>> +		return xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>>>> +	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>>>> +		if (!xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_gt_freq))
>>> This is unconditionally taking the forcewake and waking the card up just to
>>> get the sample. Do we really want to do that?
>>>
>>> So if we don't do that, both the actual and requested freq will be 0 if gt
>>> is in C6.
>> For actual frequency, the register(0xc60) does not belong to any fw domain -
>>
>> GEN_FW_RANGE(0xc00, 0xfff, 0),
>>
>> HW will report 0 when GT is in C6.
> Yes, no issue about act_freq, see commit 22009b6dad66. I was referring only
> to requested freq.
>
>> The requested freq register is a
>> shadowed register (0xa008), so that will not accrue fwake either.
>>
>> static const struct i915_range mtl_shadowed_regs[] = {
>>          { .start =   0x2030, .end =   0x2030 },
>>          { .start =   0x2510, .end =   0x2550 },
>>          { .start =   0xA008, .end =   0xA00C },
> So this still doesn't make sense because:
>
>    1. The fact is that xe_guc_pc_get_cur_freq() *is* taking forcewake
>    2. And that is in accord with the following comment in i915/intel_uncore.c
>
>       * Shadowing only applies to writes; forcewake
>       * must still be acquired when reading from registers in these ranges.
>
> Also see intel_rps_read_punit_req() which is called from i915 PMU
> (frequency_sample()) and uses with_intel_runtime_pm_if_in_use(), so we'd
> need to do use the equivalent in xe.

Hi Ashutosh,

   As part of a previous decision, in the Xe PMU implementation, we are 
doing a runtime_get() during pmu_init for all PMU sessions. So, device 
is going to be awake anyways. In this case, it does not make sense to 
just read the register without a fwake.

Thanks,

Vinay.

>
> Thanks.
> --
> Ashutosh
