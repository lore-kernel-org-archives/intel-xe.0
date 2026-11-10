Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE89160A2600
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 15:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NAJntb4/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F7010E14A;
	Tue, 10 Nov 2026 15:31:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A27010E14A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 15:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794324713; x=1825860713;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CWE91Gu9gUSgFOJgWwLfsqnTGaWlY5LTSfFiCkYxJeI=;
 b=NAJntb4/SuHDu/xjWX6xI5LAafBHkanRPdReKfSQVpJByCe/EGSCC++z
 5qqHiXWWMvqrBdQKzNPqBdcs/lDR6h6riba/Oc1ad/AQk5fSi0PSs0zF0
 P2BtQokIAjoM6rgBg7bB8pZly8wnkc3sfT4vBJFkFHdwz13aOf2r0lnTH
 jGjW8lUnGeL2Kp0axeBHvaaaFg6KWsLVD5lFJbpoRKWHc6FUZRnKqXao2
 KJCpRFGI2bAQ2xnj/A6eAgWbzwOuKEn12GJyUZwD5Jw8RbZHXRa/iPuv1
 squV5vwVBqOtB5jzZbmp8EMIfuApOYjRgj9uog4K0UAvaCXx1195/YuR8 A==;
X-CSE-ConnectionGUID: 93Vo28L+QBOARyNzu2skHQ==
X-CSE-MsgGUID: /Li79P0mQ7GyAIc776pZtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3099792"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3099792"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 07:31:53 -0800
X-CSE-ConnectionGUID: WrRhZ8X1SqKgDTXmKySr9Q==
X-CSE-MsgGUID: ZcbNGNR2Q2q5bz29LOR1/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8062360"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 07:31:53 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 07:31:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 07:31:52 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 07:31:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihssL7RmEXXoQtsoqsVSy4Ke5jv4lMsHtLgm6+QHDClCYiG0pmBbL0rN2qjEM/UcJACb6XiYTjF/XaImbN5XeSIyRapV4kMulMK/2ERPCZKKOZoLfMgEtKlKdoIeDNHL2WNZOjpdExJC8K9J6pB7cW4Gv9KoIzRVFtoJotmHFopMgLCCn4wb2Ceiiym9alVHwi04CtsCEWbneV3baBoAwKJchMEbz0ZkjnGkM73BhVemY3BvhVBtwSHdl0OZewh3TcQ1UDQRUvSsh4dnKyLF9HPJzA3WvOu31VukA4aq5pXaP2z+qoOnsg7SoLKmmCkAJg8fu/rTKLu/cfW6HL97ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rnw71iJkI/g32QvaEnRAhdnRaSHQrTpRrm3HKk8sXl0=;
 b=Xzn28orpKugz/1zEh+5BTo6dc6AY/tixiCHJpB9kAwYRsiqKGYEAd9mApcTuzQBeyb16+8sXi12MHuI/ebhIFz0Zcxs99gZK1yc4YQf4lEdEdGXsuQHXC6vIrBIsNDw8N4VD1/WZLpnlOxb756OepxCa3/o+ZHNoNkqJI5VCS+14jJWGGOb6RXuwOawKyB9Z7yyYkGlRiiVFI71f2ZOIcSJzOZeNyDUwk9svBxPlqbZFB+zMoEsZ0gmeaTyJZcnDcWKbCk0svcbnOwtFrv2QtXioCRTpMsHx7I6d7plbIDfLr9nXugmtF7ffL5wjKfRvMh73uH0ggYraC43TjDtx8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by SA7PR11MB9542.namprd11.prod.outlook.com (2603:10b6:806:4d0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 15:31:50 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 15:31:50 +0000
Message-ID: <cfb7a910-823d-416d-beab-7a6e3077788f@intel.com>
Date: Tue, 10 Nov 2026 16:31:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [v7,5/5] drm/xe/ggtt: Add KUnit tests for usable and shareable
 pools
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Maarten
 Lankhorst" <dev@lankhorst.se>
References: <20261021085716.709503-6-piotr.piorkowski@intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20261021085716.709503-6-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0102.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:355::7) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|SA7PR11MB9542:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b2084fa-e543-41f2-c67a-08df3f3fbd24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|6133799003|56012099006|11063799006|261022105027099003|261026140227099003|261026121527099003|261028144727099003|261022113327099003|261022075727099003|261102123227099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: WNq/KtlCx+mEKKZQgmHLHe0dXQZjteDOuBf3wy+qJAnrre2t2p8phvz6hRY5Nu1PY/X1qwU0VJAUicwMy+rt29aui3uMf/LpIJKdd+4072hoZJI8eeYSQUO4x4mQEskHK+91phMRNBKzZJ6cvHdQvgLzI/Qnly7gzvFxVRaf5aLHKAvvDQZ9V/Cia3aNsRkoq9b5BqdAnilGBUI77DUejK9Z+bGvgJVMEFz8dzGk/XpgSDKPSAt6Ig7NqupT+1cGPw0WsH4tOAAVjzKVoyXErzL8zsD2xbP8+awg21R3/czEREMeyzw+ggafxaC2YvPbPm2Iv472Fsw0rDRgQ7Kl/NuMmn1R5ZHtbRjUmTfKD1lS8PZjGVfEaRYJPvA3BDr5Iujkq69PtIDymGP8DMzVJ2ooxK6ozCm4dBgrNyE4z6N7tB0i9Kp8iGOIVUXVOqFLj3F9N7zDUehHQqH/Y9UOkQOYKNO6DfdfF/O2Hrgq5umLFRziFZO6VCJ/09NDJivigzGTOqnmekpAnR9quruoA8bgxoj+TTKK+ZCVJ7reoRF/OSfJS3ahcumoPP+CAPgnXHMrlIiqIJZpW2JRGDk+x3NrMwU7SQV7cr2wsr/jH4i96Q1I+OspC2giSQjqFeQMyBQh5GVjHHoavKlnNZ8iUnbDe7npv1Gi/566LgxTg+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022113327099003)(261022075727099003)(261102123227099003)(261021121427099003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjFsTU1RMmxENHFtTWpBTU1qWEZUQVNsbm45T3lBN3hkZUowdWpYWDZ1MHhM?=
 =?utf-8?B?aHg2VVloM0N1MDZ6MzFpQ2l6QlR5SUZ1RWR1bnZHelQ0UDl2L3NzeEFlWDJB?=
 =?utf-8?B?TTI4eE9kMVQxdDJFdDBqMG1qYkZrSHQ4WHFFRHBUWnZFeDV4YWJPRGdxTjVs?=
 =?utf-8?B?dmlQRnh0ZHU2c002NWlDTEVlRjdRWGk4akJkN1luai9uSGp2end6YmtBTXQ4?=
 =?utf-8?B?MzJCM3gvYWtkNnBNZHNhbE1kOVkzdzRBQVd4aVR5R2s2V2lmWGZLYndQRDYw?=
 =?utf-8?B?SDhuMGdXR21LWDdDQll5cWV1cC9uNjJQemVzcGFCalJJeXN4enNrdDk5cDJ3?=
 =?utf-8?B?UUNhdmVJaUdrNVorMWMvOEptdDQ2TCtmTFNsTHBnelBtQ28xcHM3SWRqb3Rw?=
 =?utf-8?B?L3QxOXYvZkp2YXlGMCt6bWhCUnA0alI4ZVV1ZXMzNXFHNUxsVERVaG5jaGtF?=
 =?utf-8?B?cXhoZUxxRHZ4NGZPMFB5YmpNNG42RThwejVlY2Ryc3AxKzl1QUt4UlR5TnhO?=
 =?utf-8?B?S2RxTjAvT1IvWWk4VzZqWDJ2d1dBZzliZ08wSEtpcnZwbTVUM0F2WGQ5VEps?=
 =?utf-8?B?NGozRzNLSThYTGgvbk5tc1h2Z3l4V1JMREl5RzdzWDRDT2R1NHBRakdyV3o0?=
 =?utf-8?B?V0NlSjFaZjNNM0ltcUtjL3dNdVpORUVjSUhaUUFQYVN3WENYRnBvTUFrcUhW?=
 =?utf-8?B?Vi9Gd0MraldPV3p5Nk16cUt3Uk5tbHRGYjJWV0xvVi9yZ0Nlc1pPZGRvV2xF?=
 =?utf-8?B?Z2FnTjAvT3hVODJMSHQ2MUNTZFlqcEZzaFB3bk9WVmtTckFtUXMxQWczQnJl?=
 =?utf-8?B?WERlMlBSdW9zclpFZmEzOTZOcVk0R1RocTRBZVZyLzFlWGg2SVU4di9nL2Ju?=
 =?utf-8?B?ZVZtK0J6NWYrcDRlemI0cmhtMVFleVlxb1FHUXJsNy9ZSWZEQkhseXFlUG5E?=
 =?utf-8?B?SE5sYWFlS08vaVlVMHJLMkR0d3RXRzc4L0tEV3l5d0kzNXZEYjJkT1NpKzJG?=
 =?utf-8?B?VXBVL3M2OXRhZTJ3SDR4L3JqaHFKdVdEajhKcVIwSVVpMU0xSWNoTmhyS0JT?=
 =?utf-8?B?c1c5VWpVZUhBSWZzUzRJNzNxZjhMUm5iVWxUd3Q4aVloVkxjRzZSbGlUOXU3?=
 =?utf-8?B?VXFwdXVhenRDcnJSaGxUbWhpMkY2em1TTFpkQ0hKZFpKZG94dkdLVGNITEJO?=
 =?utf-8?B?Q3hpVmo1SS9pdTVZbmpGM2dkaTVLcHhzL0FtWkFwcVBVN0JScnV3dit4cjFz?=
 =?utf-8?B?VklGRW9pbWkzUVZzd21GbzBNVjZJZEVhSXVKUWVxYzdvSUsyLzFvak1Mc0cx?=
 =?utf-8?B?TXZZM3pNWmM1YzlmcENQSWRRUVp3cHFWaUJ2WG9Ta0ROaXFzcUZSbHFjbk5H?=
 =?utf-8?B?dHgrdW9YcDc0b1o1TGxCMGkyQXdYODFUUks0T3BOV1FQSmhFdnk1T1ZQUHRu?=
 =?utf-8?B?UDZyOGpWWUpNUFN3WExJYTRsaTZ0cUFWVEY0MmtIVVZkOGh6YlluY3hRNWhn?=
 =?utf-8?B?T0tlVVpwZFZRVExRUXBRaTY2cnZqY3pmTHAzMGFoMEFLR3V2Y2poRWl0SVRw?=
 =?utf-8?B?YnllRFpkWW5POXFuZjhQRWo5a1FxaUxZUVp5aFhjWCtodDRlcm9uYUFmSnB2?=
 =?utf-8?B?VlNMR09rVFdncUxBc0M4S0h3QzFkRHk5eVFNVGhtcXRtMFJnNkhSeDkycTZx?=
 =?utf-8?B?WTBWcFpESWxnNmU1VmxMOEpFM3pIcFBCVFI3TVlHVVZtajFnNmMzcDhYVk1x?=
 =?utf-8?B?bGtmelhPRTlXdEFQN09SZStnL09KYWZ3NnlMU0Nzb3lmTTJHdTlva2FiQ1ZK?=
 =?utf-8?B?UGxYUlZWV2RxdVo4Q3FLNy9CZzJkdmhDTGZZa3k4WW9oKzQrVXdXYVNncDRx?=
 =?utf-8?B?NFk5ZXFoUWExWllRcDN6MVBBVFlKY3pvS09XVG9vMUhUTDZKN0srSlg4Wlgr?=
 =?utf-8?B?amtSeHdUSGxyenFWajk4bUxVL1VyTmRhcExPMTc4c09WZURQMGVTN3VqY0o2?=
 =?utf-8?B?eWtZUUhaUlhsOXJYZzBZL2FpSlpFaDk0L2czeUZsbk5JYUJ1dU5VQUVlcmE5?=
 =?utf-8?B?SkFBQnEyc1BhV1NGOEVqQ2dNeTRoelpxbmgxMUhuZ0QybmFWc3ljejRPTEZq?=
 =?utf-8?B?LzBaUVNWTnVBejZ0ciszaDVadnBrMHFhSmJUNjZUTVBaR1NINDZhd3o4YlVO?=
 =?utf-8?B?UHdHWWlCTlNuL2oweUtFYVRWNU5GNkJ3YUVmazhKU01LcE1LM2dWNkpDVk00?=
 =?utf-8?B?S1NyMWhRZjFKbFgvc1grUHpTaStnOEY5MDRzVFJCcnVkSThzSnNjTTVrbXIz?=
 =?utf-8?B?aXBXMGlPTEU3Ukt3bVdXc2ErL293bGgyYUhVdXFxREJUS1Z1bk5EUT09?=
X-Exchange-RoutingPolicyChecked: i/KrPQtT1iFEAEiCzId6XdmoTiHkkWGNuQNuI5DVPoSniLGijJcIDOi0DzrcqZpSTTMTjI+ACbfKIPTfkSZ4xEZgqjc1zbnfE7uVayqXKfnJb2gBbARI7OXlIovx4XaL1A+0Oa1nOPzxTt+csAs/nBeAtLkGIemFZAdZD7+sF+Yu8V0WLkqfrgYK8HbhQ8TbFxHf42/m47bG8hkjRwv2lhs6oL34olYQhyW8/zuMgQY2gIUw5EvYJEJmlh4oknvfV+bRIE+WtgbrN17C+hqXoKuT6J0igsUALzbeDKfJXoVED2X/3SYTPHs39PZylvKyuEWkK0E14Ih+8OEhooO1gQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2084fa-e543-41f2-c67a-08df3f3fbd24
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 15:31:50.0158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tri9rCSfjtPAfTvgNxASmunIZLNkFjrWtb1Q+oW/cJJz9OPnmzxild2Cx1WTvlp6Fqpq4bgnKkk4RFSJRwdiRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9542
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/21/2026 10:57, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Add GGTT KUnit tests focused on the newly introduced usable and
> shareable pools.
>
> Cover range initialization for native and PF modes, including partially
> overlapping pools. Exercise allocation direction and conflicts between
> the pools, as well as the unavailable shareable pool and requests
> exceeding pool capacity.
>
> v2:
>   - Init ggtt.lock with mutex_init() in each test.
> v3:
>   - Rename the test file to use the _kunit.c suffix.
>   - Use shared GGTT setup and cleanup helpers.
>   - Split PCI IOV coverage into a separate KUnit suite.
> v4:
>   - Release allocated nodes through KUnit deferred actions, so that an
>     aborted test does not leak them into drm_mm_takedown() (Sashiko).
> v5:
>   - Move ggtt_test_insert_node_shareable() under CONFIG_PCI_IOV to fix
>     the !CONFIG_PCI_IOV build (Sashiko).
>
> Assisted-by: Claude:claude-5-sonnet
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> ---
>   drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c | 341 +++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ggtt.c             |   4 +
>   2 files changed, 345 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
> new file mode 100644
> index 0000000000000..53c17d4c1da99
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
> @@ -0,0 +1,341 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <kunit/test.h>
> +
> +#include "xe_device.h"
> +#include "xe_kunit_helpers.h"
> +
> +#define GGTT_TEST_START		SZ_1M
> +
> +static u64 ggtt_test_accessible_size(struct kunit *test)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> +
> +	return GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
> +}
> +
> +static void ggtt_test_fini(void *data)
> +{
> +	struct xe_ggtt *ggtt = data;
> +
> +	drm_mm_takedown(&ggtt->mm);
> +}
> +
> +static struct xe_ggtt *ggtt_test_create(struct kunit *test, u64 full_size,
> +					u64 usable_size, u64 shareable_size)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> +	struct xe_ggtt *ggtt;
> +	int err;
> +
> +	ggtt = kunit_kzalloc(test, sizeof(*ggtt), GFP_KERNEL);

Can't we use ggtt = xe_device_get_root_tile(test->priv)->mem.ggtt; ?

Thanks,
Lukasz

> +	if (!ggtt)
> +		return NULL;
> +
> +	ggtt->tile = tile;
> +	mutex_init(&ggtt->lock);
> +	ggtt_init_ranges(ggtt, GGTT_TEST_START, full_size, usable_size, shareable_size);
> +
> +	err = kunit_add_action_or_reset(test, ggtt_test_fini, ggtt);
> +	if (err)
> +		return NULL;
> +
> +	return ggtt;
> +}
> +
> +static void ggtt_test_remove_node(void *data)
> +{
> +	struct xe_ggtt_node *node = data;
> +	struct xe_ggtt *ggtt = node->ggtt;
> +
> +	mutex_lock(&ggtt->lock);
> +	drm_mm_remove_node(&node->base);
> +	node->base.size = 0;
> +	mutex_unlock(&ggtt->lock);
> +
> +	ggtt_node_fini(node);
> +}
> +
> +/*
> + * Release the node on test exit, before the GGTT is torn down, so that an
> + * aborted test does not leave it in the drm_mm.
> + */
> +static struct xe_ggtt_node *ggtt_test_track_node(struct kunit *test,
> +						 struct xe_ggtt_node *node)
> +{
> +	if (!IS_ERR_OR_NULL(node) &&
> +	    kunit_add_action_or_reset(test, ggtt_test_remove_node, node))
> +		return ERR_PTR(-ENOMEM);
> +
> +	return node;
> +}
> +
> +static struct xe_ggtt_node *ggtt_test_insert_node(struct kunit *test,
> +						  struct xe_ggtt *ggtt, u32 size)
> +{
> +	return ggtt_test_track_node(test, xe_ggtt_insert_node(ggtt, size, XE_PAGE_SIZE));
> +}
> +
> +static void init_native(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = min_t(u64, SZ_1G, accessible);
> +	struct xe_ggtt *ggtt;
> +
> +	ggtt = ggtt_test_create(test, usable, usable, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	KUNIT_EXPECT_EQ(test, ggtt->start, GGTT_TEST_START);
> +	KUNIT_EXPECT_EQ(test, ggtt->size, usable);
> +	KUNIT_EXPECT_EQ(test, ggtt->full_size, usable);
> +}
> +
> +static void alloc_usable_pool_high(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	struct xe_ggtt_node *usable_node;
> +	struct xe_ggtt *ggtt;
> +
> +	ggtt = ggtt_test_create(test, usable, usable, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node),
> +			GGTT_TEST_START + usable - XE_PAGE_SIZE);
> +}
> +
> +static void alloc_usable_pool_oversized(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	struct xe_ggtt_node *node;
> +	struct xe_ggtt *ggtt;
> +
> +	KUNIT_ASSERT_LE(test, usable + XE_PAGE_SIZE, (u64)U32_MAX);
> +
> +	ggtt = ggtt_test_create(test, usable, usable, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	node = ggtt_test_insert_node(test, ggtt, usable + XE_PAGE_SIZE);
> +	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
> +	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
> +}
> +
> +static struct kunit_case ggtt_test_cases[] = {
> +	KUNIT_CASE(init_native),
> +	KUNIT_CASE(alloc_usable_pool_high),
> +	KUNIT_CASE(alloc_usable_pool_oversized),
> +	{}
> +};
> +
> +static struct kunit_suite ggtt_suite = {
> +	.name = "xe_ggtt",
> +	.test_cases = ggtt_test_cases,
> +	.init = xe_kunit_helper_xe_device_test_init,
> +};
> +
> +#if IS_ENABLED(CONFIG_PCI_IOV)
> +static struct xe_ggtt_node *ggtt_test_insert_node_shareable(struct kunit *test,
> +							    struct xe_ggtt *ggtt, u32 size)
> +{
> +	return ggtt_test_track_node(test,
> +				    xe_ggtt_insert_node_shareable(ggtt, size, XE_PAGE_SIZE));
> +}
> +
> +static void init_shared_pf(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	struct xe_ggtt *ggtt;
> +
> +	ggtt = ggtt_test_create(test, accessible, accessible, accessible);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	KUNIT_EXPECT_EQ(test, ggtt->size, accessible);
> +	KUNIT_EXPECT_EQ(test, ggtt_shareable_offset(ggtt), 0);
> +	KUNIT_EXPECT_EQ(test, ggtt->shareable_size, accessible);
> +	KUNIT_EXPECT_EQ(test, ggtt->full_size, accessible);
> +}
> +
> +static void init_partial_overlap(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +	struct xe_ggtt *ggtt;
> +
> +	KUNIT_ASSERT_GT(test, accessible, 0ULL);
> +	KUNIT_ASSERT_GT(test, usable, shareable);
> +
> +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	KUNIT_EXPECT_EQ(test, ggtt->size, usable);
> +	KUNIT_EXPECT_EQ(test, ggtt_shareable_offset(ggtt), accessible - shareable);
> +	KUNIT_EXPECT_EQ(test, ggtt->shareable_size, shareable);
> +	KUNIT_EXPECT_LT(test, ggtt_shareable_offset(ggtt), usable);
> +	KUNIT_EXPECT_EQ(test, ggtt->full_size, accessible);
> +}
> +
> +static void alloc_usable_pool_low(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +	struct xe_ggtt_node *usable_node;
> +	struct xe_ggtt *ggtt;
> +
> +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(usable_node), (u64)XE_PAGE_SIZE);
> +}
> +
> +static void alloc_shareable_pool_high(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +	struct xe_ggtt_node *shareable_node;
> +	struct xe_ggtt *ggtt;
> +
> +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
> +			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(shareable_node), (u64)XE_PAGE_SIZE);
> +}
> +
> +static void alloc_partial_overlap(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +	struct xe_ggtt_node *shareable_node;
> +	struct xe_ggtt_node *usable_node;
> +	struct xe_ggtt *ggtt;
> +
> +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> +	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
> +
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
> +			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
> +}
> +
> +static void alloc_partial_overlap_usable_full(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +	struct xe_ggtt_node *shareable_node;
> +	struct xe_ggtt_node *usable_node;
> +	struct xe_ggtt *ggtt;
> +
> +	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
> +	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
> +
> +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	usable_node = ggtt_test_insert_node(test, ggtt, usable);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> +	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, shareable);
> +	KUNIT_ASSERT_TRUE(test, IS_ERR(shareable_node));
> +	KUNIT_EXPECT_EQ(test, PTR_ERR(shareable_node), -ENOSPC);
> +}
> +
> +static void alloc_partial_overlap_shareable_full(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +	struct xe_ggtt_node *shareable_node;
> +	struct xe_ggtt_node *usable_node;
> +	struct xe_ggtt *ggtt;
> +
> +	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
> +	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
> +
> +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, shareable);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
> +	usable_node = ggtt_test_insert_node(test, ggtt, usable);
> +	KUNIT_ASSERT_TRUE(test, IS_ERR(usable_node));
> +	KUNIT_EXPECT_EQ(test, PTR_ERR(usable_node), -ENOSPC);
> +}
> +
> +static void alloc_shareable_pool_unavailable(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	struct xe_ggtt_node *node;
> +	struct xe_ggtt *ggtt;
> +
> +	ggtt = ggtt_test_create(test, usable, usable, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
> +	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
> +}
> +
> +static void alloc_shareable_pool_oversized(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +	struct xe_ggtt_node *node;
> +	struct xe_ggtt *ggtt;
> +
> +	KUNIT_ASSERT_LE(test, shareable + XE_PAGE_SIZE, (u64)U32_MAX);
> +
> +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	node = ggtt_test_insert_node_shareable(test, ggtt, shareable + XE_PAGE_SIZE);
> +	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
> +	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
> +}
> +
> +static struct kunit_case ggtt_iov_test_cases[] = {
> +	KUNIT_CASE(init_shared_pf),
> +	KUNIT_CASE(init_partial_overlap),
> +	KUNIT_CASE(alloc_usable_pool_low),
> +	KUNIT_CASE(alloc_shareable_pool_high),
> +	KUNIT_CASE(alloc_partial_overlap),
> +	KUNIT_CASE(alloc_partial_overlap_usable_full),
> +	KUNIT_CASE(alloc_partial_overlap_shareable_full),
> +	KUNIT_CASE(alloc_shareable_pool_unavailable),
> +	KUNIT_CASE(alloc_shareable_pool_oversized),
> +	{}
> +};
> +
> +static struct kunit_suite ggtt_iov_suite = {
> +	.name = "xe_ggtt_iov",
> +	.test_cases = ggtt_iov_test_cases,
> +	.init = xe_kunit_helper_xe_device_test_init,
> +};
> +#endif
> +
> +kunit_test_suites(&ggtt_suite);
> +#if IS_ENABLED(CONFIG_PCI_IOV)
> +kunit_test_suites(&ggtt_iov_suite);
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index b7e3d626e8cb8..3dd029bc76dfc 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -1395,3 +1395,7 @@ u64 xe_ggtt_node_size(const struct xe_ggtt_node *node)
>   {
>   	return node->base.size;
>   }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_ggtt_kunit.c"
> +#endif
