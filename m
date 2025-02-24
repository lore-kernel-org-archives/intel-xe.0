Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6E5C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 15:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD65710E42F;
	Mon, 24 Feb 2025 15:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aldvzv4P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8794110E42F
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 15:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740412321; x=1771948321;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1aKaJXYCzMTV6X6rPdG/l8qfhp60SJWd3pNwsGoa6xA=;
 b=Aldvzv4PbNREOsdvp+Ds3p3KEasS1e+v5GI7Q5W3698UoHcw5bFSn87d
 G0EINwZl+MVPJzsHn5qQVu59jXC0rdxhqCplWWyQmAXMzUMKFV1W51F6O
 d76eqPRZB8cD+fY8ERIctm/ffEPu0uNu7kEsbtiguGS63JRCWJ91rHNE7
 3uZMqurbDfqS9D/B/F39FpEG2XrewQufT+Qb22NRuWWGXcqeIj2QxBaav
 4fDnXx4nJtc7As1V/l0jci78GVtwHKC/j4NPtmwIticWTZSium4GNB9kD
 kzicRAfKG6kRzu4B17sfpHKd5sl2xEG7XvUCd+slfdWvaM1XzNffY98aq A==;
X-CSE-ConnectionGUID: o1dYeVnfT0G4mnyypLDfCw==
X-CSE-MsgGUID: sy3hJihPTAK6Qle7D+L1xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41187863"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41187863"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:52:00 -0800
X-CSE-ConnectionGUID: BLjGAfIdQCKAR/uLF+vhBw==
X-CSE-MsgGUID: D7MXVXGET+SdZzlvgFo0OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116999759"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Feb 2025 07:52:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 07:51:59 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 07:51:59 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 07:51:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xg8RqAC/v/IGB1ATPhx8AtszUE+kXWUB4tVVXXoJhk2P1wzdlwoswfDTf6PxAeovp0+5cLQneZw/C8DVj6SMToRYFexnaxsGScbgCOAQ/be2rm+SYCa+NlODC8IRx1gD+6cr7KA1t7MCxH9C28YrbM/bWPiM77hjoI759qbXW9CdivkB6tv4MHwi6Y4308EpZ7qzxcSuja5pmFU8d+EXhPs959FN8XNfGwuIbb41wqYpAobtq/jK29rlyQxQh+xNc2mG+mKy8yZl9okrv39z9JejrbyAZoimtL9BcS6drqmyU+MAYAuZdZZjR7qJvYdFhiNDM0/Sz7ELsgcZpJ73qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxsPIh2SdnL2MgXCYDxKQo9YuT5FD+AY2hodYALMttw=;
 b=RB0b1lSpUuQBFOX8SBsqLNWZ7WKrj2s/l8MB/twJGhUOt823DRsRoapdKrBva22VI6sCwMyg7aNpcEah7/q928zV8ihayga1uAI0OKVFQ1xdmvxxOYGI1bOD8RMno/N9/3NmfH02ET5lVHcH8+4ZlqvaKuEflZROe+tcIBNKfeW8eRouQ/3yTvQzGZansP8u71DdhovVCVlU83rL9Gtmvf0NLth/35Kt9MIFBllmyZXNyA3MBIs4zrYTt8uZUqV7iXZbon+A4Ztp2bfK5sfxano+1LiR5Zlg8m+WrdM8oJr9Yaa59xwHGcrxvBYl9RIPw5cHUktLxSDKeBhF2YrsqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8347.namprd11.prod.outlook.com (2603:10b6:a03:544::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 15:51:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 15:51:53 +0000
Date: Mon, 24 Feb 2025 09:51:50 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 <intel-xe@lists.freedesktop.org>, <michal.mrozek@intel.com>,
 <vinay.belgaumkar@intel.com>, <szymon.morek@intel.com>,
 <jose.souza@intel.com>
Subject: Re: [PATCH V4] drm/xe/uapi: Use hint for guc to set GT frequency
Message-ID: <36e5pjziscj4defoojfsi7wwwfzgizaf7giqm6jsyeswzeiofg@nyfvmosdgjal>
References: <20250121131605.1115338-1-tejas.upadhyay@intel.com>
 <Z4_KuCgUWvM1eBjE@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z4_KuCgUWvM1eBjE@intel.com>
X-ClientProxiedBy: MW4PR03CA0307.namprd03.prod.outlook.com
 (2603:10b6:303:dd::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: f295b5c4-b575-4e7f-da87-08dd54eb2898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?avwIVtiQruWXySb3Bh/PiqaWMZnPpApafP8g2oXOakm2ahXsOQMlOwSTknLY?=
 =?us-ascii?Q?DEW5nKuqEZSWpNgD37Qs7/n38PKBJu2MBfoUoUdq4yyvaZkVSm8tToJbIRPJ?=
 =?us-ascii?Q?Z9KP07utWK8Ivv5JFwQKCHNb39GNVdBEN4c5zCJIgYBdzFnQFSCwSwakGObk?=
 =?us-ascii?Q?cKN0bUAhYx6hNpC90vB22YNYokuOh+KBxQhSv77jzNoywiyHmzQtdrg29lVg?=
 =?us-ascii?Q?SrD5wFRTfaudK9EOcbMv9IKNW1IDkiyTMva3dqDHaprc2wMCL6jqZREngym9?=
 =?us-ascii?Q?j/VSTXKk25Hh98RK9pSZSQn3MlEHX4TedNyW0q3SJz0CzPTPOA08TKguAMDz?=
 =?us-ascii?Q?FgueCIKuezdBNR12jPpr73Ui+KpqYnhC3/LFua/u9TEZjeughWWrsGCPmyGp?=
 =?us-ascii?Q?bnSXKsB4hnls88hO8eWMK9p4/QtyRPdsaLbALdt3KCw1iqXQSWVhDKvjyr7j?=
 =?us-ascii?Q?JtTGecY8Qp2YeSXeeikf+7+sQQZiOVYYZT0sP7XQ5SCRAyIiZ3D6/lJeR2s5?=
 =?us-ascii?Q?+8+gE3fSpexxbrlHEF8xGNSni0mmPfphQ7nJGkLKgMifenQ+lr64CqCnPwO0?=
 =?us-ascii?Q?CMUY0G76sESpA5sdA1ecJ//9qKCKi6u7mZL5lzGeyVx0lHwA55+CXh0B0x73?=
 =?us-ascii?Q?6qR0QJJCxOLoUS5jisQpSnPar236ZAW4ExYWov9I07NInTi1DWU2zKe3XTaG?=
 =?us-ascii?Q?rvTDqVca3+4MRbH9ktJv+wZMSysqGsfC7R8ibudbMHiMJyGI7aCfv38+c0Cf?=
 =?us-ascii?Q?v7a1cK5oIHF381b0/xaqiCZnLe3Q/oxqGKzv+OqlQWx9uPcKBc1GB3IiOekT?=
 =?us-ascii?Q?mtKt2qUrJ8lDCWpuXbJ4NmIHG/oNn5+nvKFGM0bbcgU4p43TIknNsj7wbPFa?=
 =?us-ascii?Q?ulL2hlF/bwuyLYNQDGpV2a758GYApWdDkDfl8qkCncINnUZJ9A/VEMcjgSCB?=
 =?us-ascii?Q?/0g5044sC8hxka7omgi6AcV9LxyxnG5/0XxLtYMAcG/gjG8b2gbPYnT3gMzw?=
 =?us-ascii?Q?pTAEQmqlZr1nojNDwFpMW1kDi3k/seuXZGZFxiQUrJXO9dw4DKNdUeItq9T9?=
 =?us-ascii?Q?jdalTXkygMVvS5Pcf1zdMqRn8WzI4/eXu8olGZiO/n0KkYF6CTdtlpHIPOp/?=
 =?us-ascii?Q?3woBRV5U+jrMKXncLqRTBC28MZHwHGGwq09QYaycFLMpIhkNklHl4L/i5rPK?=
 =?us-ascii?Q?+NBAGleagsZejfNSVwvOaDbiNmTfR+fMP0U/q0dxChIrwmP6nbzQ2ez0atQv?=
 =?us-ascii?Q?xM73Ox8ziWYQSZexZi7oQv7Yd44gNIowB1J+PPE5WGh/R/T3ApoIXUtJLfss?=
 =?us-ascii?Q?F+ki/mRrwCJZx+XQq5U6pP64z4n8+Gw4GlzGzUw/8C34tFvSpFcQr9/e7IQv?=
 =?us-ascii?Q?HZAttoB+ixlpG2uQo+gZxQddzJPZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iChKIzJbXKxjlvDFbxuh1lREfoIy0Su4ibtM0TYI9x/L3oyoM6AQW4vSky/s?=
 =?us-ascii?Q?ShNl/0DufrqlmuirhG0GvGe3mbIFy9s4d8wgWWGsO0S/0sKYrdWXg0oy5Rlk?=
 =?us-ascii?Q?h2zrk4ZLBNUn2/nc4XOsXnBQBML8RpLpcQupsZy0/AqMNETRxSEfjlNjM0xt?=
 =?us-ascii?Q?jfacYYcnWZi1oqtyNxqSn7oMghlROBudg6TzkEOEBbdJJjIxsEQqJXjyuaq8?=
 =?us-ascii?Q?JmpKh+MzSrBcZd/H585RzEeeZH2zHooQxH5Em6eotSY2/hKNOT9c8PifvC/P?=
 =?us-ascii?Q?LPorYeI4IPkiE5p0VYtnRU3U1Th2g6mm0PQeDWZTIMreMJQ8bJbaCjlY9u0j?=
 =?us-ascii?Q?VgGraZ+XfLvAzEcG1rQ1iAxpKcXQZfxbeFMW1uF5H+hiQpKayGTrvMUp9nQ1?=
 =?us-ascii?Q?pWnQkEYB0Nwr7QTlmYx9KtI08FURhaDr4ml9+coyaO+h6wOqrJa/Qbi7RK1x?=
 =?us-ascii?Q?CjIWItbxnVN15b4ICDiS8mDN8QYmOl0kNMuR/aGONEXdVV0uZedMjl0f1bv5?=
 =?us-ascii?Q?iFQnhgqKQoWWiPFEnZhdRPVLHpGEq0ssZYc7KZgcVFSBqdeUps4dIf5oZ4HE?=
 =?us-ascii?Q?/XBeJ60v61P0kdfc8osUuKiixSBmKP1mZAed/5UB7DpvXIGl2eeHWGTyfaSt?=
 =?us-ascii?Q?7S4VzHW0LOOoaSFjTSwvYWN7xwj00Ud8ItxBxQQEJNGydCm2lM5sI2FWyiqp?=
 =?us-ascii?Q?WHc6igZU44l2WomEs4rDT0rwB4I6rhl5ii4xHOUpAS4wor85nwhwz3sQMuYF?=
 =?us-ascii?Q?Wz1IZcJ4skS5Nooait+40tBk1acKbUvSbOu/Be41AFHr/6c2itfAeXcJqTkv?=
 =?us-ascii?Q?i6Yo75VHD5QP9q6bAzXKt+tHih8YdDjcPgWnzK2LI/zeIT2LdR5E258Bj4qp?=
 =?us-ascii?Q?3aZX6q5Ez0h9IrAjd2djWm9ivzPKgvO2T20vVvSn33G0NEPfUAZurd8OeP/P?=
 =?us-ascii?Q?twFkDg4b5RbE+QIU9V9t6QHcgK/7dGODt1L9G+PHMU7egtzJl8gaThVyVfbE?=
 =?us-ascii?Q?T0pRquoWpR1CmSZPsJ7YmVOqyn38QdEaXY/aBuDDmaM13WsuBbC83WOYPVG9?=
 =?us-ascii?Q?1I8zHwZi/PW+UAr7CzM63AbAlM0p80SQLI2IYdnKE938v3sil0MCQS6V6gaw?=
 =?us-ascii?Q?wPbeozxLOBWqXmaQXm8i3S4lTdq+Ht0lDqEEKIum32jzrnmfmH9sQKsTTrtF?=
 =?us-ascii?Q?znbqZ3Yb4VJkSdySZobNZu1FCRHgmtLfiPwZxCUCK97lrq6dhLmEbcHU0O0W?=
 =?us-ascii?Q?/Es9n1xmFuQypDqNkaaDzlXMC3Hpg3njs2VAtIq/atW/oNdnR6axmgFNx0gD?=
 =?us-ascii?Q?WI2nfyO740VhOQ9yeOE8WammIxpffOknF6whKP0DxkzC4Doa0AVHP7kIQDbp?=
 =?us-ascii?Q?k1SjYhbqMyoa67p3NR5hN4oqPBh2IZUXg5ZDCB+3ID3xe7F6D6mY7dQpK+7E?=
 =?us-ascii?Q?/9E0pEy80MytEVDI5D57okHWM/zWOsi7MbfnWUhmea/qwc/ayGmqmOUtVJ8g?=
 =?us-ascii?Q?cJ/8dN2xCKnIHiKE3STaNgANUyPov+j36upSGaiC+vSV5RRRxt/1v74E0bqF?=
 =?us-ascii?Q?NGlgwQHCpjGl/pE7JjEIcH+DdosbD6d3RSTqjGfvb5knZUYNArbhNFJvancd?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f295b5c4-b575-4e7f-da87-08dd54eb2898
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 15:51:53.3917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /22pQ0cxvj4EQXgrujJpZeW3tMY2cuha9TJgpr5X3twHYPqzT2Bk4jxLCtK4QIk6bWNlu4hTBRacWGwIB1YTM0O5MJUhZjfSSDqLi3X/r2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8347
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

On Tue, Jan 21, 2025 at 11:26:32AM -0500, Rodrigo Vivi wrote:
>On Tue, Jan 21, 2025 at 06:46:05PM +0530, Tejas Upadhyay wrote:
>> Allow user to provide a low latency hint. When set,
>> KMD sends a hint to GuC which results in special handling for that process.
>> SLPC will ramp the GT frequency aggressively every time
>> it switches to this process.
>>
>> We need to enable the use of SLPC Compute strategy during init, but
>> it will apply only to processes that set this bit during process
>> creation.
>>
>> Improvement with this approach as below:
>>
>> Before,
>>
>> :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
>> Platform: Intel(R) OpenCL Graphics
>>   Device: Intel(R) Graphics [0xe20b]
>>     Driver version  : 24.52.0 (Linux x64)
>>     Compute units   : 160
>>     Clock frequency : 2850 MHz
>>     Kernel launch latency : 283.16 us
>>
>> After,
>>
>> :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
>> Platform: Intel(R) OpenCL Graphics
>>   Device: Intel(R) Graphics [0xe20b]
>>     Driver version  : 24.52.0 (Linux x64)
>>     Compute units   : 160
>>     Clock frequency : 2850 MHz
>>
>>     Kernel launch latency : 63.38 us
>>
>> UMD will indicate low latency hint with flag as mentioned below,
>>
>> *     struct drm_xe_exec_queue_create exec_queue_create = {
>> *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
>
>or 0 ?!
>
>> *          .extensions = 0,
>> *          .vm_id = vm,
>> *          .num_bb_per_exec = 1,
>> *          .num_eng_per_bb = 1,
>> *          .instances = to_user_pointer(&instance),
>> *     };
>> *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
>
>What about moving this block to the uapi documentation?
>we shouldn't miss a good opportunity to document our uapi ;)

so.. the request was to move this from commit message to the uapi doc,
likely include/uapi/drm/xe_drm.h not Documentation/gpu/drm-uapi.rst
as it was done.

Lucas De Marchi
