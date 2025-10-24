Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB3ECCF9E3
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 14:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C881F10EAA4;
	Fri, 24 Oct 2025 14:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbYRtwKd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FF310EAAA
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 14:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761315943; x=1792851943;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x9XLMtqXpPcKDR3u+OmS8K1/gtMaesarmWWVVMBfFLM=;
 b=UbYRtwKd/yWPHs3ZUUtj2t9A8YntwOSdRl/UrBKPxocTpaIRwuRN048X
 Uk2gKAzqZBWsVgqaVP0xFJRLvrzjas6MhpqQkwZByFP386jhUhZTrdrQL
 /6FXjP2wESBPTm25WB60XdnC95umsQ6QtyVYHHKNHgVbYtDAWPqluOdTZ
 BiYuF23CPKsRkP7CxJdi+qEzSH6/PXeS6IpmU4m5tbE4+5pYZNWbkDBUv
 ODDKYgaeWFGGoJ6LpNJRSGxN3JYawOK/C2gYxbRppXDd+SN4DBnm5l1Xn
 qxT+oRnVVgAWOiPsFwAR1s8pgh5G9HZ8BqJOSYX44CB/om02yZ96aTvBq Q==;
X-CSE-ConnectionGUID: aTp+XEU7SHSjyxbuV/K1sQ==
X-CSE-MsgGUID: 3Paqa5K8QYKorwuHl4NOhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74100542"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="74100542"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 07:25:43 -0700
X-CSE-ConnectionGUID: /pw7JANdS46eQAEzPycycg==
X-CSE-MsgGUID: 2ZluMZ9jShilG70CLHQENg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="221645072"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 07:25:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 07:25:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 07:25:42 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 07:25:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYAOH2ixLoGEycpn+8lfhUOOZd+AEizC+WEqtO2nMPBU3qV9jT59dFsARO6lACc6dQYrKaAabQFTGewwSA8yFslNifuy8kPwwU9eP+aSfoa2OivYwp9S+UnA6w2OMiGbnDhKPHRxcRiXAHkanz4NUipU+7IykvzLS8KNrcEAc+eSxq8jPTNVHx74NbrlAvE6jfEf4pBSPQY1pnP1ZMuhHMZuuhu+Qc85hm0Igz1WPDeo2TOtT3ryRUzWJZMRa0iSCAFD1YdvFcHCVId9qeAbOO083A3Q0mf4QktgLw1BIGaiJT1pBMDGqbhOz/wBB+lxfK+x5/q7L+CocI+5gvXxKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3Vs1dbWMz9bwaUqzr7o2GY5mdGKl7xM+jjZawnNb0U=;
 b=YS2iaEePvar7oRclpwEQL4XrIW/pvOZVe8BDven2VvFNK2anSqx0lUEK8qK2mH3AQ2cWBdHqGgbBI7OZBhLgIMGaV8hSRF81IFcvxP/IcL9BAZqTtwLvp/X4yEp9X2poyvWD+oeQaxSYc++hi6VKyURjZjjMIJNKX26La4a071oJ8rtauO2MvMHbdFyCk9gDV8AMhhI/jA6hdJU7Az+vOSbqw6wFf2CVnBMpH6KbSOWKTehNi4TkRvLJgdwvbX2L4kcaab97Qp04C2KTUhrPofWiBESdSjesy+N35EaLFSIR6NhFvVU0XMdq9clTKD0OasrMKeEgiCophQ6zdnpZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SN7PR11MB7090.namprd11.prod.outlook.com (2603:10b6:806:299::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 14:25:39 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 14:25:39 +0000
Message-ID: <670ce0ec-ce9c-4003-afc8-8e508e41564a@intel.com>
Date: Fri, 24 Oct 2025 19:55:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] drm/xe/migrate: Use AVX instructions to prevent
 partial writes during VF migration CCS batch buffer updates
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matt Roper <matthew.d.roper@intel.com>
References: <20251024133522.16970-5-satyanarayana.k.v.p@intel.com>
 <20251024133522.16970-6-satyanarayana.k.v.p@intel.com>
 <aPuFuykBdiwM41Z2@intel.com> <aPuHjlbbeJq8FpWr@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <aPuHjlbbeJq8FpWr@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::7) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SN7PR11MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 4761cf15-c757-47c6-e59a-08de13093451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDlEeklFUVBEeFgrOXBwNE5JOXNXOVc5UnhOSzF6bnRmMDB3dXlZM1pIaWNv?=
 =?utf-8?B?RFQyYWxqM0RsVEdIZVFpOXRxMmwyekt4aXRpR0xUN2V0UUM3TVpFOHVYdTNn?=
 =?utf-8?B?LzQ4RzFHaVZqSGM3Mjc3dlowQ05yWjBKdTh0TkRUMlRoU3ZTdXBENmF3S05F?=
 =?utf-8?B?U1NGSmNrV2xsUFh5bjJoMTZ1Smk0cjNKWHlhWHhkbzdtU09iZmMxQjNaUFFi?=
 =?utf-8?B?NTI4UXhsRGp3TklGaEthWC9tZVR2SWR0RVpGdFJoRE92VzNDWkIrOG8yd1dm?=
 =?utf-8?B?L3AzV290bXZHdExpNHpILytHWk82WVh2TnAvWWsrODRQNGRqZkxDeUlzajZh?=
 =?utf-8?B?WmNlK0tlaTR3T21OK3JyVlZQeVQwRkM3UUdPSm1qQlFqYjFwTzhHdHQzUUJ0?=
 =?utf-8?B?QjZ1VUVPSDRQaGdERXpQSmJTZHhvNUF2L0gvbGgyK0R4a1JQNXRzb0o4ZllQ?=
 =?utf-8?B?dXcxTEluckpaMmgvY2lJdXFoYTZtZWVpZklxVDBJY3hZaDVNSHVEaEg3elFG?=
 =?utf-8?B?eEcxZ1pmREtGOGtkOXFLeUZ5QXFWcjNYYnArNlB5ODFlV0hYMmZwRHJzOGM2?=
 =?utf-8?B?RHE0bjNsZC9QOEdWa3UxYkt0VU5TQ2hnTGpaY29YWXRCVkhQYTlqdVBxeE1C?=
 =?utf-8?B?blpHWUF0WlRpaGhMeCtqSWZtaVJNL2IrOTBDYWhjbVVUVm9XdlRxY1pzbkMz?=
 =?utf-8?B?a3VWaFE3RDVXdjBzT244Nnhqd2FLUVUzWmgycURDMHRTRUl5bW9rbHlpd3A0?=
 =?utf-8?B?ZGdpTUlWRmUrcVF1bTdwa2w1ZWNuaHpHRDBXZFRWZ2JYbTlSODBpSElnVzU0?=
 =?utf-8?B?RWl0SWpicXBLbnJjVTBzdUlxQzFDR0w4Yks4SHpMU3pqZFNmb0ozaFhGOXR2?=
 =?utf-8?B?STBRZm1CN25IdUpYeGo4VVYrcWtwLys1K09nMGJvZktNaFNNWFdudEhjbWNW?=
 =?utf-8?B?eFAweTFBTFluM1d6RGhRbk5kVm1JNGxGelB5QlEzY0UzY0FmakJsMGd4aWx6?=
 =?utf-8?B?SVlNNUNPZ0didjB5VXlwNHpVZ0M3ajgzNmMrMlJ1cEtxTmNjN3laWDdhcElo?=
 =?utf-8?B?K2wyZ3d3czA2cnp4Q01UWlJxM1RuT0Fnak9wSm9BYjRsT2xFTGNLTEk3RFp6?=
 =?utf-8?B?SHdpMFZlQjRRMDNtU3paRExhY2FDSkc3a2JNUWZMQ0I1U3JGL3NzM2x5bE95?=
 =?utf-8?B?VDgwNGtmVHBEejB6Qmg0U1h2eVVLWGRJaGpzdFplS0ZncWNydk9Ca3Q2WkN3?=
 =?utf-8?B?QzhMZzlYNGJDa3FpbG4vRE1sUFBQbE9qVlpzNlJubmtXQnJQNGI4M3JvR0xO?=
 =?utf-8?B?V0xLMFJOSEZoeHpBZFV1UU1XdDVtRjFOdEZneFZab2FHNUMrRVhqWmVadUFR?=
 =?utf-8?B?aGJFMjlNc3J5YnFGNmJTRFFCQlhvOWtFZmFqZW96S3RxcmdNQlhKT0Q1SWdr?=
 =?utf-8?B?Q1dyU3MxOXUrSnEwQ29Bc2oyQW5rRWthekwyUlRkOEJHNVJrREhkdEVMaFIz?=
 =?utf-8?B?N25jd0t4dkFLaHFmd2ZDMzJMWTF5TVpYdDRBcnhGTlZBWlFrMzBLR1JGcFlL?=
 =?utf-8?B?cEMrcjFiWVNrQ3NxazFSTWN4Z1J0UW5mUlZ0b3dHU1ZseEN4RzlzdDF5MnJ2?=
 =?utf-8?B?elZ0N0RyTlBQLzQzdFc1R2lvM1ZtSUx3NXlxcmZ6UUd3TzEzd09zQjNYQzRR?=
 =?utf-8?B?enVNeEY3MDRldU8yVmw5c2JrRHI1ell1Q2FWQ05mcytIS1UxUlEwNzdyVHFr?=
 =?utf-8?B?RWZLdXVSWDhlYTB5dzRsQjJzR25iays2Tm01dnpncXZlaEMzNGZ3YjNOUmxD?=
 =?utf-8?B?RmgzWUx1dENFSG5vTGFVQ1FiYVJPN3RRMTBsR2lJME5CL0ZaaDlnWlFnU0VW?=
 =?utf-8?B?M3pEOC81NC9vdS9vNUJRc1RPQVZQQ0t5WWJpQ2NRNFZZMk1mMzJHS1lEUFJP?=
 =?utf-8?Q?vFEB1c9sJ1GhY5gHIrhGVInZovp+4TBL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enZKUTlaYkxWeXlRZ3E3ZHBvS2ZCYmM5Y2lmR0Irb3lpNDZqL3RBV29GR2NN?=
 =?utf-8?B?Q1lvQXd2WFhYQVVjU0hnYVNGUmxvclViNTk2dUNteFFnYnFNWVk1aFdVZHhL?=
 =?utf-8?B?Mmc5VmxSSHJnRitpRnR2WHJnNFJWeXJPZlFvRUVDNzM1czJhUVZESGdWVkRl?=
 =?utf-8?B?R1lHVlYySkFkbW9RSGtLVThyZElpQkRCYUVtTWJESWJHdUQrbWVSUXVSVTA5?=
 =?utf-8?B?eFhpWkxGTDFUakwrY3pmLzVHdHJjd0ZKcEQxZG1uQnBUQUVXWEdaNkFuTXNK?=
 =?utf-8?B?SjQyYzV2OVF6andYTjh2WFNBb28wS1BQblNHNHJFczE2UWJJVllqZHppbFVL?=
 =?utf-8?B?M2lVcUVJWkFPN0JkZm4rRmZlUndHQmxXeVg1L1dXMG9xZFNFNkFIaUdkaHg4?=
 =?utf-8?B?Y3NCSGtTMVR5NzhtNUFldTg4Qi9zQnpCQXRTNmh6Rnhna0NKVzFSU2hySGs5?=
 =?utf-8?B?WjZuZU55SHFZZll2ejJOT09IY28xNHQrcXVhMWRDWXpvOTVtUDliR0pzb3pQ?=
 =?utf-8?B?R2l0YytZQ1F0RUhrMkdFNTBUQlNMMWlXVWdYdVpIZXFGVnlPQWs3bWVhdnFt?=
 =?utf-8?B?dTQ5WDZBSzljOW5NeXo5d2dTTFFyU3RCeE5YUDRTMWJXQUVyOVdDeWVoLzUy?=
 =?utf-8?B?dHQvZGg1WC9vTzJwd3lHQWtUMzNaMjM1REU3cG5ZaHhoTUVtbkM0QUUzZWpK?=
 =?utf-8?B?K0JrRHhEWHkrZTUySzF5Q1QxTk9OVnZzWkwycW5YajhrRjlpcEI1NGJxOGNN?=
 =?utf-8?B?Q1F0aFAvczVaS1NNMXZDaUFCMWZwOEl4RDFNcGFBa1hRZkRYaGcxV0FQMGhL?=
 =?utf-8?B?My9jZ2Nqa3M1S3VZbG1oMk1oMzU5MEJQaUZwMHRqS0kwcEd6LzJ6aXh1OWp3?=
 =?utf-8?B?OEFVV1RWa1A2ZWpaWHUzaEVDNWNkWFhzK2lDUk9lWUpEMUZoUk9DOUV3eHND?=
 =?utf-8?B?WE5YSDhjOUdRYWgxMzdXYytMNkF2WFp3NThsY3ZYSmZlbWNiYk11cnpTeHVZ?=
 =?utf-8?B?N0JURDJmV3RiVWNyUzFjNnNmRXFvRUYrV2cvRThmRzA1R3VUK09JVDhnK0pH?=
 =?utf-8?B?VjNTanJYTVBBNU1vQTFtLy9QWndpZVFZMlIwKzFyNE5kTk40RVlyL1h3UHZK?=
 =?utf-8?B?eTY5d3pnRnVuK1VIT2kyejE4N3RmSFpPSEFMZVpjU2E5VVdZMS9OK3ZaVGdQ?=
 =?utf-8?B?SjBiQzEzTGlBc1R1T2VEUlZscVp6M3c5RTJQQTFzYzN4eG16cUpKVEdnUUds?=
 =?utf-8?B?Rm9CV3Rwc1BhdzRuZXV0OUQvQkVFN0FrdGFFcndWc2RNNC9UcHRrcHNwYlNt?=
 =?utf-8?B?N3NFUUZlUHBvSkdBNTJEVVF6Y0l4RllhdjVxMVZxSkNXMUJ1WDV3UTVFM2ls?=
 =?utf-8?B?d05rYVYzWWxheGRZc3ZHRmxyTWRGWUkrWWxmK2hKbEt6UE1rZytrVWNIZTAw?=
 =?utf-8?B?VmNZaUsvSkxIbURwK3NCWjh0YUxOT091YkJUeFMxdXJLQnI4V21WdTJkaHAy?=
 =?utf-8?B?NUxJa0ZJcjNwRUxLWlVsQlVlNE5BTCs5UmJZei9kUDU5VGh4dUxVM0R5Ykh1?=
 =?utf-8?B?ZzIvd2E5Q3RaWUhyRzE1TUU0UVlJcVl5Vit5QzJIMU5ZbTE3d0JmV3NwOFBR?=
 =?utf-8?B?Zm56Y2JlN0l3ZDh5aWI4eVhLY3NaOGtScDVxWGZtYnA3Myt6WjRWUVFzUFdo?=
 =?utf-8?B?aThybHZlMHZuL09HMk1vb2dEL0tOK1djem9OZXh2UGtGT3ZveFUwYXhKdzQz?=
 =?utf-8?B?Z3A0N2QwcytnNkRWeDZ4OFhlYXUwU1pnS05VQzNvdkt6VU9kUnFEM1JVSUFj?=
 =?utf-8?B?SytmUVAwdW96ZldMMFB3dnlIZnV4UVpjMVpCMEhvaUNtOWwwcm9ZSS9qY3Ri?=
 =?utf-8?B?WUFBYlEyZnlBdHBnVVBqcjdCOTdqRkY4YzkwWWkwOVNUakRpeUVvKzFPUVIy?=
 =?utf-8?B?OERkbkJkaHorR3ByUFhrcDU2Y05sM0NDNzFqMU53S0xLekhmOUpmK3J2ZHRa?=
 =?utf-8?B?QlhXbVdFNGJNYTNsTGNlMERvYXZESjNVNklYS2Y3c3picFRCdVNWODJqUjZj?=
 =?utf-8?B?UnBLUmZJVWFuSXN3SVJxeGx1SnJuRm5iZnM5bm1TVVZzK2I4VEN6Y3R0aUp4?=
 =?utf-8?B?N0cxcUtZMStlSjNLZ3Q4aUZFbjdubVlsTkE2UDN1QTBZR2xrV2V4VFdoVitH?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4761cf15-c757-47c6-e59a-08de13093451
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 14:25:39.0471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fe3yjGJPVUASCuyukgExDn7nrqHwEfSLE5M0LZtKp7noIrVjbuTlC/ISw1BPPwQyDJfVdPl7w1OOgb3nVOTRcAZQbVkXOYvCs+xu7EP4I4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7090
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



On 24-10-2025 19:35, Ville Syrjälä wrote:
> On Fri, Oct 24, 2025 at 09:57:15AM -0400, Rodrigo Vivi wrote:
>> On Fri, Oct 24, 2025 at 07:05:24PM +0530, Satyanarayana K V P wrote:
>>
>> Hi Satya,
>>
>> First of all, thank you for the updates.
>>
>> Second, the subject is way to big.
>>
>> This should be enough and under 75 cols:
>>
>> drm/xe: Use AVX instructions to prevent partial writes during VF pause
>>
>> more below:
>>
>>> VF KMD registers two specialized contexts with the GUC for migration
>>> operations. Save context contain copy commands and PTEs to transfer CCS
>>> metadata from GPU pools to system memory and restore context contain copy
>>> commands and PTEs to transfer CCS metadata from system memory back to CCS
>>> pools. GUC submits these contexts to HW during VF migration.
>>>
>>> Each context uses a large batch buffer allocated via sub-allocator,
>>> pre-filled with MI_NOOPs and terminated with MI_BATCH_BUFFER_END. During
>>> BO lifecycle management, segments are dynamically allocated from this
>>> buffer and populated with PTEs and copy commands for active BOs, then reset
>>> to MI_NOOPs when BOs are destroyed.
>>>
>>> The CCS copy operation requires a 5-dword command sequence to be written
>>> to the batch buffer. During VF migration save/restore operations, if the
>>> vCPU gets preempted or halted while this command sequence is being
>>> programmed, partial writes can occur. These partial writes create
>>> incomplete GPU instructions in the batch buffer, which trigger page faults
>>> when the GUC submits the batch buffer to hardware for CCS metadata
>>> operations.
>>
>> Perhaps we could summarize the thing here and move details to the comment
>> near the assembly. The important part in the commit message is to have
>> the 'why'. Some of the details of the commands like MI_NOOP fill and all
>> could be in the comment near the ASM.
>>
>>>
>>> Standard memory operations like memcpy() are preemptible, meaning the CPU
>>> scheduler can interrupt execution midway through writing the command
>>> sequence, leaving the batch buffer in an inconsistent state with partially
>>> written GPU instructions.
>>>
>>> Replace standard memory operations with x86 AVX instructions that provide
>>> atomic, non-preemptible writes as AVX instructions cannot be preempted
>>> during execution, ensuring complete command sequences are written
>>> atomically to the batch buffer.
>>>
>>> Expand EMIT_COPY_CCS_DW from 5 dwords to 8 dwords to align with 256-bit
>>> VMOVDQU operations. Update emit_flush_invalidate() to use VMOVDQU
>>> operating with 128-bit chunks. By ensuring GPU instruction headers
>>> (3-dword and 5-dword sequences) are written atomically, we prevent partial
>>> updates that could compromise migration stability.
>>>
>>> This approach guarantees that batch buffer updates are completed entirely
>>> or not at all, eliminating the page fault scenarios during VF migration
>>> operations regardless of vCPU scheduling behavior.
>>>
>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>
>>> ---
>>> V7 -> V8:
>>> - Updated commit title and message.
>>>
>>> V6 -> V7:
>>> - Added description explaining why to use assembly instructions for
>>> atomicity.
>>> - Assert if DGFX tries to use memcpy_vmovdqu(). (Rodrigo)
>>> - Include <asm/cpufeature.h> though checkpatch complains. With
>>> <linux/cpufeature.h> KUnit is throwing errors.
>>>
>>> V5 -> V6:
>>> - Fixed review comments (Rodrigo)
>>>
>>> V4 -> V5:
>>> - Fixed review comments. (Matt B)
>>>
>>> V3 -> V4:
>>> - Fixed review comments. (Wajdeczko)
>>> - Fix issues reported by patchworks.
>>>
>>> V2 -> V3:
>>> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
>>> - Updated emit_flush_invalidate() to use vmovdqu instruction.
>>>
>>> V1 -> V2:
>>> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
>>>    (Auld, Matthew)
>>> - Fix issues reported by patchworks.
>>> ---
>>>   drivers/gpu/drm/xe/xe_migrate.c | 114 ++++++++++++++++++++++++++------
>>>   1 file changed, 93 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>> index 921c9c1ea41f..005dc26a0393 100644
>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>> @@ -5,6 +5,8 @@
>>>   
>>>   #include "xe_migrate.h"
>>>   
>>> +#include <asm/fpu/api.h>
>>> +#include <asm/cpufeature.h>
>>>   #include <linux/bitfield.h>
>>>   #include <linux/sizes.h>
>>>   
>>> @@ -33,6 +35,7 @@
>>>   #include "xe_res_cursor.h"
>>>   #include "xe_sa.h"
>>>   #include "xe_sched_job.h"
>>> +#include "xe_sriov_vf_ccs.h"
>>>   #include "xe_sync.h"
>>>   #include "xe_trace_bo.h"
>>>   #include "xe_validation.h"
>>> @@ -657,18 +660,70 @@ static void emit_pte(struct xe_migrate *m,
>>>   	}
>>>   }
>>>   
>>> -#define EMIT_COPY_CCS_DW 5
>>> +/*
>>> + * VF KMD registers two special LRCs with the GuC to handle save/restore
>>> + * operations for CCS metadata on IGPU. GUC executes these LRCAs during
>>> + * VF state/restore operations.
>>> + *
>>> + * Each LRC contains a batch buffer pool that GuC submits to hardware during
>>> + * VF state save/restore operations. Since these operations can occur
>>> + * asynchronously at any time, we must ensure GPU instructions in the batch
>>> + * buffer are written atomically to prevent corruption from incomplete writes.
>>> + *
>>> + * To guarantee atomic instruction writes, we use x86 SIMD instructions
>>
>> Here you still mention 'atomic' since we already know this is not 'atomic'.
> 
> I still don't see how is this supposed to do anything useful without
> atomic writes to memory.
> 
> If the GPU is executing the same memory we're writing then nothing
> short of atomic memory writes is going to actually fix it. And even
> that would require careful alignment of things to guarantee that
> each command is completely contained within one atomic write.
> 
The CPU and GPU operate on the same memory space but at different times 
during VF migration. The critical issue occurs during the batch buffer 
preparation phase when the vCPU is still active and writing GPU 
instructions, while the GPU will later execute these same instructions 
after the vCPU is paused.

During batch buffer updates, if the vCPU gets preempted while writing 
GPU instruction sequences (such as the 5-dword CCS copy command), it 
leaves partially written instructions in memory. When the GPU later 
executes the batch buffer after vCPU suspension, these incomplete 
instructions cause execution failures and page faults.

AVX instructions provide atomic write operations that cannot be 
interrupted by the CPU scheduler. This ensures that GPU instruction 
sequences are written completely before any potential vCPU preemption 
occurs.

AVX instructions (VMOVDQU) guarantee that entire instruction sequences 
are written in a single, non-preemptible operation. The 5-dword CCS copy 
command is expanded to 8 dwords (padded with 3 MI_NOOPs) to meet AVX 
256-bit alignment requirements. By the time the GPU executes the batch 
buffer (after vCPU pause), all instructions are guaranteed to be 
completely written.

Here we are ensuring that GPU instructions are fully formed before the 
GPU attempts to execute them during the migration process.

-Satya.>>
>> Let a summarized explanation in the commit message and put more here.
>>
>> I'm sorry for being picky here, but I want to ensure that the information
>> around this code is clear so we don't keep having to explain this over
>> and over in the future.
>>
>>> + * (128-bit XMM and 256-bit YMM) within kernel_fpu_begin()/kernel_fpu_end()
>>> + * sections. This prevents vCPU preemption during instruction generation,
>>> + * ensuring complete GPU commands are written to the batch buffer.
>>> + */
>>> +
>>> +static void memcpy_vmovdqu(struct xe_device *xe, void *dst, const void *src, u32 size)
>>> +{
>>> +	xe_assert(xe, !IS_DGFX(xe));
>>> +	xe_assert(xe, IS_SRIOV_VF(xe));
>>> +
>>> +#ifdef CONFIG_X86
>>> +	kernel_fpu_begin();
>>> +	if (size == SZ_128) {
>>> +		asm("vmovdqu (%0), %%xmm0\n"
>>> +		    "vmovups %%xmm0,   (%1)\n"
>>> +		    :: "r" (src), "r" (dst) : "memory");
>>> +	} else if (size == SZ_256) {
>>> +		asm("vmovdqu (%0), %%ymm0\n"
>>> +		    "vmovups %%ymm0,   (%1)\n"
>>> +		    :: "r" (src), "r" (dst) : "memory");
>>> +	}
>>> +	kernel_fpu_end();
>>> +#endif
>>> +}
>>> +
>>> +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
>>> +{
>>> +	u32 instr_size = size * BITS_PER_BYTE;
>>> +
>>> +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
>>> +
>>> +	if (IS_VF_CCS_READY(gt_to_xe(gt))) {
>>> +		xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
>>> +		memcpy_vmovdqu(gt_to_xe(gt), dst, src, instr_size);
>>> +	} else {
>>> +		memcpy(dst, src, size);
>>> +	}
>>> +}
>>> +
>>> +#define EMIT_COPY_CCS_DW 8
>>>   static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>>>   			  u64 dst_ofs, bool dst_is_indirect,
>>>   			  u64 src_ofs, bool src_is_indirect,
>>>   			  u32 size)
>>>   {
>>> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>>>   	struct xe_device *xe = gt_to_xe(gt);
>>>   	u32 *cs = bb->cs + bb->len;
>>>   	u32 num_ccs_blks;
>>>   	u32 num_pages;
>>>   	u32 ccs_copy_size;
>>>   	u32 mocs;
>>> +	u32 i = 0;
>>>   
>>>   	if (GRAPHICS_VERx100(xe) >= 2000) {
>>>   		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>>> @@ -686,15 +741,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>>>   		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>>>   	}
>>>   
>>> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
>>> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>>> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>>> -		ccs_copy_size;
>>> -	*cs++ = lower_32_bits(src_ofs);
>>> -	*cs++ = upper_32_bits(src_ofs) | mocs;
>>> -	*cs++ = lower_32_bits(dst_ofs);
>>> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
>>> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
>>> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>>> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>>> +		  ccs_copy_size;
>>> +	dw[i++] = lower_32_bits(src_ofs);
>>> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
>>> +	dw[i++] = lower_32_bits(dst_ofs);
>>> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
>>>   
>>> +	/*
>>> +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
>>> +	 * save/restore while this sequence is being issued, partial writes may trigger
>>> +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
>>> +	 * write the sequence atomically.
>>> +	 */
>>> +	emit_atomic(gt, cs, dw, sizeof(dw));
>>> +	cs += EMIT_COPY_CCS_DW;
>>>   	bb->len = cs - bb->cs;
>>>   }
>>>   
>>> @@ -1061,18 +1124,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
>>>   	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
>>>   }
>>>   
>>> -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
>>> +/*
>>> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
>>> + * save/restore while this sequence is being issued, partial writes may
>>> + * trigger page faults when saving iGPU CCS metadata. Use
>>> + * emit_atomic() to write the sequence atomically.
>>> + */
>>> +#define EMIT_FLUSH_INVALIDATE_DW 4
>>> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
>>>   {
>>>   	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
>>> +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
>>> +
>>> +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>>> +		      MI_FLUSH_IMM_DW | flags;
>>> +	dw[j++] = lower_32_bits(addr);
>>> +	dw[j++] = upper_32_bits(addr);
>>> +	dw[j++] = MI_NOOP;
>>>   
>>> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>>> -		  MI_FLUSH_IMM_DW | flags;
>>> -	dw[i++] = lower_32_bits(addr);
>>> -	dw[i++] = upper_32_bits(addr);
>>> -	dw[i++] = MI_NOOP;
>>> -	dw[i++] = MI_NOOP;
>>> +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
>>>   
>>> -	return i;
>>> +	return i + j;
>>>   }
>>>   
>>>   /**
>>> @@ -1117,7 +1189,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>   	/* Calculate Batch buffer size */
>>>   	batch_size = 0;
>>>   	while (size) {
>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>>>   		u64 ccs_ofs, ccs_size;
>>>   		u32 ccs_pt;
>>>   
>>> @@ -1158,7 +1230,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>   	 * sizes here again before copy command is emitted.
>>>   	 */
>>>   	while (size) {
>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>>>   		u32 flush_flags = 0;
>>>   		u64 ccs_ofs, ccs_size;
>>>   		u32 ccs_pt;
>>> @@ -1181,11 +1253,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>   
>>>   		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>>>   
>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>>>   		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>>>   						  src_L0_ofs, dst_is_pltt,
>>>   						  src_L0, ccs_ofs, true);
>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>>>   
>>>   		size -= src_L0;
>>>   	}
>>> -- 
>>> 2.51.0
>>>
> 

