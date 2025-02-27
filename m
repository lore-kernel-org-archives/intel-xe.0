Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0568C197BF
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 00:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6843B10EBBB;
	Fri, 28 Feb 2025 00:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IZWnc4W2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5D810EBBB
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 00:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740700809; x=1772236809;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XtEE2r8UdC3qEHgBhabCRqWztghM3u8OKBIE/uJu87M=;
 b=IZWnc4W2I4y4W44mMW2/k7ZzTkvehnMOBmszeFES3vKXuMMi7slllm6M
 lGEEM+zGtBTmyjtW8DL5Xv51hzcN8XfU6kGhBPsrwTo8BCh//AyA6uYM4
 0KD7YWFeuy0V8yMqBXO1Yx2jKZe1155olKhZ/Rw1R046tEjUF/ZuFjYpQ
 NQsAei0Jtr5hwZCZgqvjm72fXybMt/qLeFLqNuXPTN2lqo8jI1TdU525h
 l7C2QEj+Z/nNO6yzzFh1US+yR9Xxs2NwWBWqTr0utybXjEyTQNqgGrNt0
 /X4g2L4d1OVvCNHQKoquNQh12GtWMyOfRkCQ7TAJz8UC7e47i/7bLvqnL w==;
X-CSE-ConnectionGUID: UF5YCaQvQeqlcum1tHlrVw==
X-CSE-MsgGUID: fYb4VuvgS/SSJEk7zU1vUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40792820"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="40792820"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 16:00:08 -0800
X-CSE-ConnectionGUID: kSO2zxRnTGWvpUnXtSK8YQ==
X-CSE-MsgGUID: 3C3fvyvzR+6krp2dcpvbRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="122298734"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 16:00:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Feb 2025 16:00:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 16:00:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 16:00:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpqPtkv9GsipsFtt32K6Lk5wViWHKC31SEVVcDV64GUDlUx4u5zDYY3el+p/nUBFbg+Wm/NBNiKcZFf5jLbRwfqqV5UDxqZzgKBItZ9yTip0sXZ2n9/2QyhUKNSnI2pAgx3M9GEjyk4+btz6mEwwWOX62Y+mwYyX8I3DufjY8HpCw0FPTlgsP0srsLy0ftiUaYyYGhsxC7e/NzUxXUqvXFN0lx2zKWWSltl0g6dI6b/l36TecU+hACiR6bWiRuh/BDvxMM7pp6cCGo1P1vvZb4N/umsFJTHgAa7k6uO/gJBBJH6r8IHzPVYAhrQ38nhCDE6KCt+33OFVEmEFZe+otg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlnsBtvgTrgRbpwXC0qUjAaPwxhQ4yRrgqYjttDyGOo=;
 b=Ihm48HejHy0cMHN+VQwmRT469HsCJxF5584ydRNyP4s6cxdwEvaf1ecAqTdZwge57A8/eE2eEU2RM6Fq2nQaQEDaF4oKdCmiRa5P/CELfm6zDlUjGgyJV8IbD4MQ3oUHG8KcdvRdvQHAexv9ibpcPSLS2tpwLdbOyNRo0xxIDMzlBz7TCLzD9aCY2gp393fD6QKPiCOrkOfL7bpdZzOjyddr3KHA1v8MHLA/EC6sTNOuMUnnuWrK6jT51e4aP1g4HIljqAUOpTeRu0IqMxvLPVkAcjdIgwfjd/gPm/7yhKgfsnx/oyosFavFXYTt5Xkj+cAgCRbW4uVaRAuKEWqs8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 23:59:58 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 23:59:58 +0000
Message-ID: <03101dc5-00cc-440c-9358-c136ba6d961e@intel.com>
Date: Thu, 27 Feb 2025 15:59:57 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/guc: move KLV helpers to common file
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: John Harrison <John.C.Harrison@Intel.com>
References: <20250227010530.3002093-1-daniele.ceraolospurio@intel.com>
 <20250227010530.3002093-2-daniele.ceraolospurio@intel.com>
 <02842531-7ce0-4518-a6c9-9530f946bb26@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <02842531-7ce0-4518-a6c9-9530f946bb26@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0121.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::6) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY5PR11MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: ed856846-9924-4b6a-22b6-08dd578ad725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUt0Z05VcldzaDZsTUNCREMzY2tJYUJXNml2QTZGbDNXbTFWd1pBdVhTa2oz?=
 =?utf-8?B?ampOeFQzbzdxMDJGd2s5YzVKNVd3SnE0czdtaGlBdzZ3ZzVVUWNKSWFTUklT?=
 =?utf-8?B?OStTUXMwd2ptVmtJYmZIUE40MEZkbDNTQ1NucUY5TDhFUDNRSjkxcm9LYXRu?=
 =?utf-8?B?ajFlS3NiQWgxc3gvN2d0eVdWNUpJSDNNWkJSakNOdGsyajduUlZoQWJuYW1z?=
 =?utf-8?B?RHhMM0g4a01ITU5Vd1RHV25LREZ2VEtLd2hEYjZPKzJTZndCa0huZ2kxbjJE?=
 =?utf-8?B?RWlkMWZJRXpFS0lpRDRNQmJ2aVR6b1NIRWdDck55RUJJZFVMSytka0xHVXJx?=
 =?utf-8?B?T3ZiNHJpUWQyODZVanJidEFBZUw1RjV2bThzRlJKSVJNRGl4bm1RMUdoQ0Jw?=
 =?utf-8?B?eUI0Ti9pbDRtWVpKcWtUVGo1UTZtWS9uamdjZU5peUdEM053REVKWEE4TytF?=
 =?utf-8?B?cll5S2xBWXFwUHErcjFGSzIwWW0ySzllbGdDTSsrUnF0SllmTFEyUitnTi9t?=
 =?utf-8?B?TDRpckdWMmhhWUFhRmZrVHQzdGx0L2dpNy91Z2UwNytyRWZWSnBFSUZvNGdY?=
 =?utf-8?B?NmlMcTgxQm1FTG16ZmZCdUx1M3dXWnltRkVlMk43cGZwT0dqN1JlemYrZm5S?=
 =?utf-8?B?VE1sRnVVTlFzaU5COUtSdGZ4VU9xQXhqTVRaOUczY1gxMDF4RzV1Vno5cVZp?=
 =?utf-8?B?ODExMlgyVzk0WHgzZXR5RHd2aDhhelpvcEprL3d5Uk9BOUVmSmRmME5vMDcv?=
 =?utf-8?B?VThaTndnWUZvOUtYOG1QaVdpZEIvemV3eUE4NDVDZTFJbHI5KzFoVE90TUlP?=
 =?utf-8?B?TEFDVFBtWHRiZG9aaEV3Y0E1aFg3cFNOaE56SG93S0d6d1dZQ0p3OGJQOXkw?=
 =?utf-8?B?Y0pKUk5UV2dqM01wY2Vmcll5WHVJS3dndnBEQVY3Q0pjb1lVOEp4YzN6dExt?=
 =?utf-8?B?WFJIYkY5cjl4ZTZaN3BNek1oa04xK0lRQ2U4bVJqYlhpcGU5Smd1MThmRGwr?=
 =?utf-8?B?YkpMdWl6eU1YaUJ5ZlVEeHdhRjlKT0YwdUo5WFBIazRTQnVHNjh5eXE4OVRt?=
 =?utf-8?B?S0xlQlQ1cDlSc0NiQWlQSG45Uyt4RlNURUZiYTV6emFFTnBPZEM4dE1zSVVp?=
 =?utf-8?B?REhTdU9LS08vNjlYTEI5UzNKVXdZUW5EOTZQZ0VhVWZxVU5vUGxLcEo5NnZl?=
 =?utf-8?B?WWF0eHBjVnJWdmh3Qm1KTTNMeStWR3dsb1JjWGpNWkhWZzdyWTdzQmdZM090?=
 =?utf-8?B?YUUvTmRaM01NNnRIUzBxQmpvMmkzRFFycitkamQ1dG5MbXppOEM1cGc1cWhy?=
 =?utf-8?B?M2ZQNzVGK0tyTUdFZnhYMTNjS1Mxa242RURPYm5vdDQ0dlhxOTU2NXhRSDBR?=
 =?utf-8?B?TUVaOVl4VDBMOHhPeThzYTFJb0kzTnM3WWs4cTZQZnRLaThoeHJheEdKejJV?=
 =?utf-8?B?aEtSdUhNV0o2eE8vQ293MmJ3NVU5TVI0ME9qc282cmZ5WVJ0YmlXQ081R0xC?=
 =?utf-8?B?S0IvcFVvWjNpQkllOEJsQ0tqNGlObFlBakU3MHpTUW1DTmI4RExxczI4Q1Fx?=
 =?utf-8?B?MU4zWUllazVBaTdNTG9hRHdaNWUrVlhzdDV3SVJ3WDJlVTdpL2FyQ1pvVGJD?=
 =?utf-8?B?V0cyUk9hZ1FkK09uckRJQ1dWQzVqZHZnN1Y2b05MMjhwNE5rMDNNa0l6K04z?=
 =?utf-8?B?OXVwZFpuWGY2dy9JNlVlajY5dVNKeEl0dGRRK1MzbnMyQmN1N1REYzZkQk1W?=
 =?utf-8?B?MW1GSTZLSFdvRk9LYnl3OUd5QTl4d09UUHhtQUhLeUhPWEdUZDdXblJXa0tL?=
 =?utf-8?B?U0J5d0lZU0hodFc1ZDN4SldCajg2b2wrbElxeVYzVks4QndnMXVqR2ZuaFRT?=
 =?utf-8?Q?uiTuH252S1P3A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjNzTFZwL0pJcnRwbzlNVWNiTTArQm5FajhTbEVDV2YvQzZQWm9YTEJwbWVp?=
 =?utf-8?B?eHEwclAzaE03U3l2MTdnQUR5dVVpa2ordHpVOVJmSnIrT3EyY2U0TVlWSGNL?=
 =?utf-8?B?NEpIZmppNTJrZ3p3VHYrK21OZkVQUm8yYlVwdHRxOXZ5a2V3dWE5SFo4QThk?=
 =?utf-8?B?YnNvbnozU215YUpiemVWSVpJVlJvYU5pYm5oN1J4Y1BOWDBNNVAxZ1ltUkx5?=
 =?utf-8?B?YU5FbDZQOXVGYjA5cXpjckZzRTVNTkxTWVdMdDJaZmJoazRIYmh3c29RSUpQ?=
 =?utf-8?B?QWhIbTEzUVpDSklNS3FKU04vSWhqWEdkbnZLUGNxM3BDRCttS3NRd1RrS0F1?=
 =?utf-8?B?S0tjOFBNWVhzMlA4UkM2QjlMNDRjTElTZ1M1UVdIRXdBYkZra01oTmJpM3JN?=
 =?utf-8?B?MGFleEl0TzNOMnpKQmo3YU9hYjl3NkN2WmRncUlDRkxaem9QRUZscU5FWmFt?=
 =?utf-8?B?ZUJIUEl3NG9VWTJvNXBkN2JUM2Q0ZTgrbEtJRWVzNEpJZytlWlVJL3FPcTd6?=
 =?utf-8?B?SC9vZmNCanJ5bHlrRW4rQVNraVlMU1VOLzQwZkNlWDNKN3pQbklDMmlmdjgx?=
 =?utf-8?B?QXNxZzZlNTAyZWJiREN0OU1aZEp1UW54dzJpM01Mck1qcFkzUlpnckZRT0Ft?=
 =?utf-8?B?SHk3clIzdDZHb2hjK0Qydlp0NXd3VUtsaGdXUW5pWlVxK0FTRnNKdWdSVTEr?=
 =?utf-8?B?OUJRSmRSZmJMWkRidUZqQjRlVzhEdXgxdlhlTFNUdWhXRitINWw2TWNIdHFK?=
 =?utf-8?B?eVRGVTZHWjNFZHlGMDVpMzZhRDQxeVVoL3g4Q2U4eTZ2ejV0TlFQQ3Z0WlZQ?=
 =?utf-8?B?M05MUHFFU1lKK3NLL2lmMTF4ZG50ZkNDQllTUmNFTEFiQWFuMFMzLytSVnVC?=
 =?utf-8?B?ODJOaDRZdlJ1TmE4SCtjdDFkRlEyMk1ZVWRpZll4Q0kyVFBmTkxiUFF0SEFW?=
 =?utf-8?B?ZktZZWNibm9jVlBXL0I5WXk0eFQ2ajFPeGF6NDdvMWdrcTdQZUdvQnl2L1Zz?=
 =?utf-8?B?RFdBQ2hIc20wSjVVVlVWUVFTRUUwd1RKRFdjbkJxN3hUd3hsRlplYkVwSXc2?=
 =?utf-8?B?VlRiL1JvRVpjb1U5KzIxbEM1ZzVhSWtuNENDaXo1dVIrL3lMMm9UajFqL0dx?=
 =?utf-8?B?MjNWOHVTdHFPK1VaeUZGNXRDZWFINjJ6TC9YajFBV0grcmNGa3VySElSNnh0?=
 =?utf-8?B?MFZ0ZGl4cTZ3d1kzd2huWXJYU2RpSDQvOTlhNFZENFlDS2NzbGs0VHNhYlRj?=
 =?utf-8?B?c0JUbUgzMXNKOTRwQjROTlZkeldPNW9BV25LdzRJSld1d3Q3OEtDL2JMUEVw?=
 =?utf-8?B?UCtQQ3RjaWtJT0luWkRWSmVzY1A4WG9KNmlXUldOckNLR1lsdkxjcTN4Nzcy?=
 =?utf-8?B?T29TYW5leVBTQ1UwU2ZyR0cvNWdOQzNqdFZ2dVF3QnN5Tis1OFlDU0NVU1d4?=
 =?utf-8?B?eG10bUVON0txbTZaU2JEY0o1WVFlS0Z2NUxUR0ZHNDc0dlR0VUZmdHFnOXA0?=
 =?utf-8?B?SGw2dURTMXEyYXlzeCtrR0JqU1JPWkswTFRoZ3RCN2tmWkNEUitZQVAvZ2lH?=
 =?utf-8?B?dE1QQjdCZUZGV2lOOFNmTVhPOFh1UjVLV1hCd0Y5ZkdhbldBSytUejlsWDVt?=
 =?utf-8?B?bnlNYW9wdjh0YStKZk94T0FtT0lvRVBtZzhMZ21iTFg2TGx0c0M5NXZ3NW1V?=
 =?utf-8?B?MG94b2lDdk5GdE9UV1JWb29sVmNiL2FsaFdUTWxUZG5SaWxQaG1tV0dsRzND?=
 =?utf-8?B?bzBoUEZyMkIxK2kzeGZtbVFPSlIxb29VVW4rYnpMcmdFb0tCQUYyNUpyQVJY?=
 =?utf-8?B?SHljWGdqSWN5Q2ZEMnBvaForTG8wZFg5MUc5QVBvZ2k1RlJKcm15ZzhmME9U?=
 =?utf-8?B?OFdXU3g2Q1c5czMrTVFpVDVyaEhyVkFwNjM5YXY1eFJLc0VMQWI2NzNscklh?=
 =?utf-8?B?Z21yRWJRSFlvUjhmUDVERmRTN3hNUkVkZk9QVXBGbjg0M2N1Q0RtaEpGaUUy?=
 =?utf-8?B?aDNxZE1iTXJrNUpuOGp5cXRjL0JNaU5PMmY5VWkvWWc4VmxaSlIrUjFLTm5x?=
 =?utf-8?B?QkJCeitMZU9iZFRMNGoxYVVZdmM4UDVkYXkzVHdKaERvSWMybTg3cmhrVjRi?=
 =?utf-8?B?UWtrWVBYNkNYM1BSbzRsSGFDNXMxejhCVkVUWVVlbVdYTVBLaDJWa2dBVlFl?=
 =?utf-8?Q?17jNuUTEnlZh0iMuzFKnnHs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed856846-9924-4b6a-22b6-08dd578ad725
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 23:59:58.4920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vswp92ztJd/dZMB8cnIutsV6PFwx3+qNBisq5CrgBd+GTRo0osZ4A30E9+dJjeaeIOubdbRPdLb1vcJQg92+eZl6vaztsIqDEa0Am7O0It8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6187
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



On 2/27/2025 3:29 PM, Michal Wajdeczko wrote:
>
> On 27.02.2025 02:05, Daniele Ceraolo Spurio wrote:
>> The GuC uses the same format for all its KLVs, so having the functions
>> to set them in a common file will allow us to re-use it for different
>> types of KLVs and not just the WAs in ADS.
>> The next patch will make use of these functions for a new H2G command.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ads.c         | 89 ++++++-------------------
>>   drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 62 +++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  7 ++
>>   3 files changed, 89 insertions(+), 69 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index fab259adc380..ed3304a11812 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -22,6 +22,7 @@
>>   #include "xe_guc.h"
>>   #include "xe_guc_capture.h"
>>   #include "xe_guc_ct.h"
>> +#include "xe_guc_klv_helpers.h"
>>   #include "xe_hw_engine.h"
>>   #include "xe_lrc.h"
>>   #include "xe_map.h"
>> @@ -283,56 +284,6 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>>   	return total_size;
>>   }
>>   
>> -static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
>> -				      enum xe_guc_klv_ids klv_id,
>> -				      u32 value,
>> -				      u32 *offset, u32 *remain)
>> -{
>> -	u32 size;
>> -	u32 klv_entry[] = {
>> -		/* 16:16 key/length */
>> -		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>> -		FIELD_PREP(GUC_KLV_0_LEN, 1),
>> -		value,
>> -		/* 1 dword data */
>> -	};
>> -
>> -	size = sizeof(klv_entry);
>> -
>> -	if (*remain < size) {
>> -		drm_warn(&ads_to_xe(ads)->drm,
>> -			 "w/a klv buffer too small to add klv id %d\n", klv_id);
>> -	} else {
>> -		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>> -				 klv_entry, size);
>> -		*offset += size;
>> -		*remain -= size;
>> -	}
>> -}
>> -
>> -static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
>> -				    enum xe_guc_klv_ids klv_id, u32 *offset, u32 *remain)
>> -{
>> -	u32 klv_entry[] = {
>> -		/* 16:16 key/length */
>> -		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>> -		FIELD_PREP(GUC_KLV_0_LEN, 0),
>> -		/* 0 dwords data */
>> -	};
>> -	u32 size;
>> -
>> -	size = sizeof(klv_entry);
>> -
>> -	if (xe_gt_WARN(ads_to_gt(ads), *remain < size,
>> -		       "w/a klv buffer too small to add klv id %d\n", klv_id))
>> -		return;
>> -
>> -	xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>> -			 klv_entry, size);
>> -	*offset += size;
>> -	*remain -= size;
>> -}
>> -
>>   static void guc_waklv_init(struct xe_guc_ads *ads)
>>   {
>>   	struct xe_gt *gt = ads_to_gt(ads);
>> @@ -343,22 +294,22 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>>   	remain = guc_ads_waklv_size(ads);
>>   
>>   	if (XE_WA(gt, 14019882105))
>> -		guc_waklv_enable_simple(ads,
>> -					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>> -					&offset, &remain);
>> +		xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>> +					 GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>> +					 &offset, &remain);
>>   	if (XE_WA(gt, 18024947630))
>> -		guc_waklv_enable_simple(ads,
>> -					GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
>> -					&offset, &remain);
>> +		xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>> +					 GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
>> +					 &offset, &remain);
>>   	if (XE_WA(gt, 16022287689))
>> -		guc_waklv_enable_simple(ads,
>> -					GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
>> -					&offset, &remain);
>> +		xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>> +					 GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
>> +					 &offset, &remain);
>>   
>>   	if (XE_WA(gt, 14022866841))
>> -		guc_waklv_enable_simple(ads,
>> -					GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
>> -					&offset, &remain);
>> +		xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>> +					 GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
>> +					 &offset, &remain);
>>   
>>   	/*
>>   	 * On RC6 exit, GuC will write register 0xB04 with the default value provided. As of now,
>> @@ -366,15 +317,15 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>>   	 * future, so GuC depends on KMD to send it the correct value.
>>   	 */
>>   	if (XE_WA(gt, 13011645652))
>> -		guc_waklv_enable_one_word(ads,
>> -					  GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
>> -					  0xC40,
>> -					  &offset, &remain);
>> +		xe_guc_klv_enable_one_word(ads_to_guc(ads), ads_to_map(ads),
>> +					   GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
>> +					   0xC40,
>> +					   &offset, &remain);
>>   
>>   	if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
>> -		guc_waklv_enable_simple(ads,
>> -					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
>> -					&offset, &remain);
>> +		xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>> +					 GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
>> +					 &offset, &remain);
>>   
>>   	size = guc_ads_waklv_size(ads) - remain;
>>   	if (!size)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> index 146a6eda9e06..50eab2086ee3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> @@ -7,8 +7,11 @@
>>   #include <drm/drm_print.h>
>>   
>>   #include "abi/guc_klvs_abi.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc.h"
>>   #include "xe_guc_klv_helpers.h"
>>   #include "xe_guc_klv_thresholds_set.h"
>> +#include "xe_map.h"
>>   
>>   #define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>>   
>> @@ -146,3 +149,62 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
>>   
>>   	return num_dwords ? -ENODATA : num_klvs;
>>   }
>> +
>> +static void emit_klv(struct xe_guc *guc, struct iosys_map *map, u32 *klv_entry,
>> +		     u32 size, u32 *offset, u32 *remain)
> s/klv_entry/klv
>
> s/size/num_dwords
>
> KLVs are always u32 aligned
> 'size/offset/remain' all should be in dwords

That would mean having to convert back and forth between u8 and u32:

- allocation is in u8 aligned
- params to this function would be u32 aligned
- xe_map_memcpy_to below needs u8 alignment, so convert back
- the GuC expects a u8 aligned size, so need to convert remain back to u8

Just using u8 everywhere seems simpler instead of converting back and forth.

>
> this will also match rest of functions in this file
>
>> +{
>> +	if (xe_gt_WARN(guc_to_gt(guc), *remain < size,
> do we need xe_gt_WARN in production?
> maybe xe_gt_assert will suffice?

I've kept this the same as what was in the original function. Not sure 
why it was xe_gt_WARN instead of assert.

>
>> +		       "klv buffer too small to add klv id 0x%04x\n",
> s/klv/KLV
>
>> +		       FIELD_GET(GUC_KLV_0_KEY, klv_entry[0])))
>> +		return;
>> +
>> +	xe_map_memcpy_to(guc_to_xe(guc), map, *offset, klv_entry, size);
>> +	*offset += size;
>> +	*remain -= size;
>> +}
>> +
>> +/**
>> + * xe_guc_klv_enable_simple - Emits a KLV with no data to an iosys mapped buffer
>> + * @guc: the guc structure
>> + * @map: the iosys_map to write to
>> + * @klv_id: the KLV to enable
> key ? there is no Len nor Value
>
> this will follow other functions in this file

ok, will rename.

>
>> + * @offset: pointer to a variable holding the offset to write to
>> + * @remain: pointer to a variable holding the remaining writing space available
>> + *
>> + * The function checks if there is enough space to emit a KLV with no data and
>> + * if so writes it to memory. After the write, the offset and remain variables
>> + * are respectively increased and decreased of the written size to be ready for
>> + * the next emission.
>> + */
>> +void xe_guc_klv_enable_simple(struct xe_guc *guc, struct iosys_map *map,
>> +			      u16 klv_id, u32 *offset, u32 *remain)
>> +{
>> +	u32 klv_entry = PREP_GUC_KLV(klv_id, 0);
> 	u32 klv[] = { PREP_GUC_KLV(key, 0) };
>
> 	emit(... ARRAY_SIZE(klv)

Why? this function is specifically targeted to writing a single u32, why 
write it as a u32[1]?

>> +
>> +	emit_klv(guc, map, &klv_entry, sizeof(klv_entry), offset, remain);
>> +}
>> +
>> +/**
>> + * xe_guc_klv_enable_one_word - Emits a KLV with 1 DW data to an iosys mapped buffer
>> + * @guc: the guc structure
>> + * @map: the iosys_map to write to
>> + * @klv_id: the KLV to enable
> s/klv_id/key
>
>> + * @value: the data associated with the KLV
>> + * @offset: pointer to a variable holding the offset to write to
>> + * @remain: pointer to a variable holding the remaining writing space available
>> + *
>> + * The function checks if there is enough space to emit a KLV with 1 DW data and
>> + * if so writes it to memory. After the write, the offset and remain variables
>> + * are respectively increased and decreased of the written size to be ready for
>> + * the next emission.
>> + */
>> +void xe_guc_klv_enable_one_word(struct xe_guc *guc, struct iosys_map *map,
>> +				u16 klv_id, u32 value, u32 *offset, u32 *remain)
>> +{
>> +	u32 klv_entry[] = {
>> +		PREP_GUC_KLV(klv_id, 1),
>> +		value,
>> +	};
>> +
>> +	emit_klv(guc, map, klv_entry, sizeof(klv_entry), offset, remain);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>> index c676d21c173b..231f7c4b0947 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>> @@ -10,6 +10,8 @@
>>   #include <linux/types.h>
>>   
>>   struct drm_printer;
>> +struct iosys_map;
>> +struct xe_guc;
>>   
>>   const char *xe_guc_klv_key_to_string(u16 key);
>>   
>> @@ -61,4 +63,9 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
>>   #define PREP_GUC_KLV_TAG(TAG) \
>>   	PREP_GUC_KLV_CONST(MAKE_GUC_KLV_KEY(TAG), MAKE_GUC_KLV_LEN(TAG))
>>   
>> +void xe_guc_klv_enable_simple(struct xe_guc *guc, struct iosys_map *map,
>> +			      u16 klv_id, u32 *offset, u32 *remain);
>> +void xe_guc_klv_enable_one_word(struct xe_guc *guc, struct iosys_map *map,
>> +				u16 klv_id, u32 value, u32 *offset, u32 *remain);
> hmm, "enable" does not fit here, maybe:
>
> xe_guc_klv_emit_empty / no_data / no_value
> xe_guc_klv_emit_dword

emit_nodata should work.

>
> and those should be inlines that use:
>
> void xe_guc_klv_emit_simple(
> 	struct xe_guc *guc,
> 	struct iosys_map *map,
> 	u16 key, u16 len, const u32 *klv,
> 	u32 *offset, u32 *remain);
>
> like:
>
> inline xe_guc_klv_emit_simple_empty(.. key ..)
> {
> 	xe_guc_klv_emit_simple(.. key, 0, NULL, ..);
> }
>
>
> inline xe_guc_klv_emit_simple_dword(.. key, value ..)
> {
> 	xe_guc_klv_emit_simple(.. key, 1, &value, ..);
> }

This seems to just make things harder. xe_guc_klv_emit_simple() would 
need to handle the case where we have data differently from the case 
where we don't, potentially with 2 separate memcpys (one always done for 
the key and one optional for the data). I really don't see the benefit 
when the current approach still makes most of the code common in 
emit_klv() and only has separate arrays. Also, that wouldn't be a 
"simple" emission anymore since it'd handle all the possible cases, so 
the naming also wouldn't fit.

Daniele

>
>> +
>>   #endif

