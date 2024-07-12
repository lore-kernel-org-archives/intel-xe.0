Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2487FC2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 21:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B3B10E158;
	Fri, 12 Jul 2024 21:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRvYfMd8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31F610E158
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 21:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720820060; x=1752356060;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=18oYfD7JYrZ1wYFDb+B7blb5pzohU9NOLIHLSjDfy+o=;
 b=KRvYfMd8DB09ecjCEVg4VlSOhzuW1xHyvojx0j3LHCrq3DYk2BE99XkX
 n5ZkXyIVcz9OlayNCj4KNtC+hLuvi530DApDLJbGzT6G6/mIYC4kO0x+L
 uTX+UlcC53kuLTqonBPWBSIB7OTMK9VMxSuBx6psyB/Da4DjB+G57+/F9
 Y9eWna7dPiU8DCMr5DWCZiVi3vYgfg/gdSwjwwrwtAiSc2CeI+nmr3w8N
 8uuYBQ3eKEPhVuL/o+4i74X/SQ9dMtggJ99XOxgWFqVCUm+zua9Ws5Lr/
 1JdX5Jp1YC2wAMPnuueP0sPUENQa2RH4c9FeviD9niQaL5bIFJXMtU3bp w==;
X-CSE-ConnectionGUID: ob1lMIfQTXeATMFh9iblHA==
X-CSE-MsgGUID: FU18juLZQYS7IYPNAd5tbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="35710891"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="35710891"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:34:20 -0700
X-CSE-ConnectionGUID: SwesTCzpRa6akvmq4i/drg==
X-CSE-MsgGUID: b85G8da5SXGJXGNjyF6mUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="86536616"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 14:34:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 14:34:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 14:34:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 14:34:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 14:34:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5JLx1nvPY4u12Aby7OFVb+04PH/09Gcst/4YNQIOWAXACl7E+hATN4Xar9CN8vvgJqEdfC9Z73h691JyJWO/1d7bNHs7ZKs5H7S2sViFBNmmBRIzqonMs5Sj3GAfae+YUXhXf/N3E/blHmjLHQhGcKz5NpecbGEBkY8buP5GgZ7g4ZocMsEYOsWhnm0likBqQOZ6l+QUpqZ8MVE33FMcEyjxgnF4lI986blCfhi1AwKu6EHQ+eUWd4aHqMDdUAHI4al1rRBEU7RTrtl222k5MxG287yq5BXiMBrxu69nSximpKlyXxMRMZkEqkjUU8JJAEK2tSsyjNAWw3FyCjjsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzgW5jYPWvgsLBDoI8RZnlOLzGyGj+A0i56AElOUoBg=;
 b=iKH9yEvqmOchlGZjM5a0KOMqTJl9JcBsZ+SMz0Md22hUW9kFMQkNL+9jMquoBZblh3VPY+5y8ocq4itsyAPWCwn6LfXPHfIe0/4Pz8X0IsWk1CAaRb5wU6WslPycD9MMuyxLmz+SB5nei0ZLC0JdVJNMZ0VGBU2gQZ+EPnqWA1C+c48NM4nJAJ6F9ZqgmopaWEHfdV/visHO0HjyLrK1NzwlX1dXeMhYg0zSh5Rn0/srVfo1Vs9cFMJsBUmoo6L8eryybky7Q+lg7yxmWQOggtb15lrByJndMrGzWl4/uOVHI5KxmSqwW4dk+D91d87CIORYSQ93Fam+VrxhIvw5DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB5923.namprd11.prod.outlook.com (2603:10b6:806:23a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Fri, 12 Jul
 2024 21:34:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 21:34:08 +0000
Date: Fri, 12 Jul 2024 16:34:06 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH xe-for-ci] drm/xe/huc: Define BMG HuC
Message-ID: <umzxaqirskshitja2ozecnugrssmxz6ymush45kkk34knkr4d6@drxwsww6g4hl>
References: <20240712173604.2660566-1-daniele.ceraolospurio@intel.com>
 <cdd0b14e-689b-4866-84fa-99696bd42c06@intel.com>
 <kw5j3vyln5imnzj7pbog6vcw53wvcsopr63q35katnovhwksj7@oxeuzkgtijyj>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <kw5j3vyln5imnzj7pbog6vcw53wvcsopr63q35katnovhwksj7@oxeuzkgtijyj>
X-ClientProxiedBy: MW4PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:303:dc::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB5923:EE_
X-MS-Office365-Filtering-Correlation-Id: b0abe159-3e73-49f5-9ecb-08dca2ba5cbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+XHSTu2TT8OkfEf/ckYMmdLcEnhnS3b49wnkUteaxNsXqyDHWp2f2rOsckeg?=
 =?us-ascii?Q?AndHo6korVF4zX022yaDlqsIp/FlQIvvx+EeKVYHRcfbP0c0nlnDTED4bddf?=
 =?us-ascii?Q?5s5tjoCJUM73n7mX8tJtBvegTvjv0yg3O2nGjx7gC5vGAAxyAzsC3QlXiaok?=
 =?us-ascii?Q?2P1l4cM3qajoEBxooHqWmX8JLorjvc8k2a98R3IcEbp2vt9kMkyz7FH3tzZq?=
 =?us-ascii?Q?NYPY8GodOD2nrcUc37ZRaeVcUmniagceOUEYSmHqI5E6oA5DZuFyne4oa/uQ?=
 =?us-ascii?Q?qBjqtGZY8B0Je0BWoFLfcE5oT/TwmMnrG5aCYYPKDTcO4JFxqkYdJLsWUhyf?=
 =?us-ascii?Q?qRF86/VlDmcp7XbIlRenTE5GIhG14/UFmmLRF8QqCwkF5zG9jgISCffgvh/i?=
 =?us-ascii?Q?OMeE7sHVkRwXsjdVakBkFWskzNLsMZii+EVTFfCjBRuz5x2nQbPAFPoDlHPu?=
 =?us-ascii?Q?1DAOpULNF47RXev34NeaCqLbctaW6rX4nhdU6nv5IZGj9qFD0TLN0ZwwvxaJ?=
 =?us-ascii?Q?uUoUe1PdFTFjmdKoOFachOOsB76m4EUiBFzWfb9WjyTRUS6B5Jkxeo8FqtpW?=
 =?us-ascii?Q?1SvXPjjx1ejepQ8U1sKn74Un45Vlb1mqVq6O0B360i7ddmFQT1BXHNy3hzMB?=
 =?us-ascii?Q?0/Mfp6Ow/Wivmmx1XtpPNEx38EHu5D582sLMqI0G+pDJlrSB2IoD/FJ8+8h1?=
 =?us-ascii?Q?bgTxvmTPAoM3fEl6Vh7XgRjTECMYnYuqQRr9Yv3mekDXH7mNavnBQN1MOiEX?=
 =?us-ascii?Q?yObfoZbLC009Y/d0yexgmDPbN0o8FMc9rwz6ow06yNhlk+rt9QkjJFh63tQt?=
 =?us-ascii?Q?qd7ud4V2bwvT/U3S270akQZDLkvzjTd+XF1pgJthlBBbyZ9LXZiWnjtigH6T?=
 =?us-ascii?Q?PWy21Ce08OB9q9A9+vKsZDoFlZvO4XjPx9ERXwKoqlrfRrItuDc++h5ED3V7?=
 =?us-ascii?Q?8ZjUYG1Oo2ZWDSAuzRivIGYuQFsuUqpQMaCYn0DX1puHlvLl8qf3R8+cu16T?=
 =?us-ascii?Q?kY41cT0Iu6IPeoGX+GTIYoYidKOLm8Kvyo8Yn1UMEabDOCfiZfaby8GzGIvX?=
 =?us-ascii?Q?bJl+eQVAOU114OPudnR+sjztaOgCdlnDAESnYJE8xKtyA94KhN94HSyvoh8q?=
 =?us-ascii?Q?sH/BGbN0lRB4qWxdXb0ELhrKt+BFoU4EF+p5ZqFFWBG3Du5TohxPSnDWUHdw?=
 =?us-ascii?Q?G2uzSfgIWGf6Z/QMjU5okDrbFD71AvCsz4AAtzRAy5wsLpdYyfcxMjGynVfi?=
 =?us-ascii?Q?4WEyJ9C3cC5RvqyWUmOMt1qyG3QuE3zu3naaZZHUbSxUboQMq6efrWzOPint?=
 =?us-ascii?Q?Qfs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?20eynnWvdFe7zcZFh6GCCEmBpyqDdXPkQGtVc75E+gvwpnhFrZkbfxzyC6ar?=
 =?us-ascii?Q?K1sM2ECxQxWPy/JyiICwAN+MiCbVCKzSdIJl8SVlebuRs6xHkVtYFHjZiEDT?=
 =?us-ascii?Q?pcTEno9ozSWdXLIbi+RLNWteQOFB0gNM9DnHJA+vtyCR6sBie8a/z6gtly73?=
 =?us-ascii?Q?PKio+Wuf1A1DehY9PBHcJ8FuBOOq0VuU+sKA19rHqY3Qs59Duxw1dDb0a+jJ?=
 =?us-ascii?Q?WesLSCc7/Bga6Bum/WYwZO9JpCmjdqvYM1NAVkkM7YqQqxBuwpSM1DPS5TS3?=
 =?us-ascii?Q?TQEgdSow2HCTPY9NJ2QrQZJFsfHGpsgcyM2u7j5To8+XyyA0iWrEMcyzjwOA?=
 =?us-ascii?Q?ecafb5JanARDAvMErM9RHo8r2vlk4150GlOHVLRsShpGienmPnqwphHyu60I?=
 =?us-ascii?Q?qHLPGqI7Io512alqnewCSjtd+TTa+FeZvGUJoO5IJgIPJnH/NRkLrfHEO82z?=
 =?us-ascii?Q?elKUhCW0tDjm30fl8t9ZndMQYhwCkw7NURNoc6XODH6hV5JvbofTwVBOXaZf?=
 =?us-ascii?Q?wNCHkmUjx4ofnrqUjWPAlriGe/3rQRSPPoO010WzU+7gV4WHdwI00MZ3sooZ?=
 =?us-ascii?Q?5j8yA+m32rL2gxfQfKMcbIfHY1i+3vSdl8XRpLj8FKn7kr968NKwto3nxSie?=
 =?us-ascii?Q?lWUkTegZUn8OVxQESUokTryrrgMCHVEc7UZW29oyzPUUX9XANnyQuz/tLn1E?=
 =?us-ascii?Q?8Eda0EmT63DqH+m67EdIQ+CjbIj/wc1Vd2neyu56Jy9xbcS/HLQxKv3Iurrf?=
 =?us-ascii?Q?CtJZ265icErz8SUK9dMG7uYag+uLl2SW3nn9VTH9a/87OdhKTo5zLvrREKyK?=
 =?us-ascii?Q?/qxUWlBY1tDoaBoeGUhFkgoadGAWvQ+6KJPr6j1NovFoYrgTWQuYHlYMhmnk?=
 =?us-ascii?Q?jNo1xUG1oozW4hEHaoHFaWeZtNgrg1uWz/Kvm+yJosAJAY6HvnTkX64qXwzd?=
 =?us-ascii?Q?2CJ+PyEtTsRGGKPOKWE8Jz1/PIlkGmkvcOnL8Qj1dJPoR2MAIsrKbjI4Rqk/?=
 =?us-ascii?Q?M7kJh4eyiZtdCwQdPZGxTgS4c+nGXPl3651ASDJjtStLwxNjjHwry+zy96gu?=
 =?us-ascii?Q?hGCsTqH87wwdEMtICOT+fWAAOvkBMq1hB4msTKHgsKQY8Z5hA7hA/PchYj5q?=
 =?us-ascii?Q?9WDRtZkPHWKc4Om87C2Dicul0Sp5Ie0R7wI+o3H57eVA4aEfYTMB86SnHaYI?=
 =?us-ascii?Q?mvA1d4RRraWOG/qq4OjcNpYISMOdWhUR6XHpinaQ3YnB+0bnXgpNz2EK/K5c?=
 =?us-ascii?Q?jLFcHUiJIvQYpVkKZhWYqWDjeBwF0OA99nN3vSUms9zhgcB5jmkooaipf976?=
 =?us-ascii?Q?G5/nwEnSnpqDgnjRv8+EvTU7PrpvEjtVfeAFLlkuI5YH1wtFp6a6lbi1rNHZ?=
 =?us-ascii?Q?IYhtSarRWkBmGTCIGfSzzykHZbuw8iWzNRTkTIlxxvbNf0I/jqr+p9k9fQ8o?=
 =?us-ascii?Q?8Mse1YUM1G2tILAhW2zE/5yDvkfg87uRjEv2vyKdGETpTiwoC39WPt8c9YLS?=
 =?us-ascii?Q?o4VlAiQBsHblXllNAn/fRCBjNmRftj0IKCD+KBvhEJCz7oOyjA8y3LY98WrX?=
 =?us-ascii?Q?/n/yKZVPfaAQ/7TVGS5dRVUr3PSF2yY6NeLvXd6eU4+qqUnnEq64g7VzPHkt?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0abe159-3e73-49f5-9ecb-08dca2ba5cbc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 21:34:08.3933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vclOOZUwOXfWzklRvTTiROXbOP6ylSctAsHvLRt9v7Zs9qMBatDmmXLgic6evWvzEaxJEBczdIxdj45AeUVAC5/TtWPv177KWMNIrODd/7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5923
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

On Fri, Jul 12, 2024 at 03:05:32PM GMT, Lucas De Marchi wrote:
>On Fri, Jul 12, 2024 at 10:49:37AM GMT, Daniele Ceraolo Spurio wrote:
>>
>>On 7/12/2024 10:36 AM, Daniele Ceraolo Spurio wrote:
>>>First HuC release for BMG.
>>>
>>>This patch will need to stay in the xe-for-CI branch until we're
>>>ready to publish the HuC firmware to linux-firmware, at which point
>>>we can change it to use the unversioned file name and  move the it to
>>>drm-xe-next.
>>>
>>>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>>Forgot to add the gitlab link
>>
>>Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2260
>
>
>
>Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

and pushed to topic/xe-for-CI

thanks
Lucas De Marchi
