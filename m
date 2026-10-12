Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A442DCA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 09:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4473210E451;
	Mon, 12 Oct 2026 09:08:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34E610E451
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 09:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791796095; x=1823332095;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/66c/qXjLYTeXPxBUI2WOLd8B0UztDqmHbqjcKs6XGM=;
 b=Q1aRDpY2okHACOkuHk5BO3HcczyFGJE/w4RPaWFLLOk6dDw2yz1ulpjq
 XcYFibRDgE2rbMGK2SNVGGg9b2QBa8nBf9sDJArdEiFR6rbv/kqNQB9fa
 ANaeGiDCioDBKiOFDk4J6WDPW2YXUX+QoUEUiVzXX7kNw/Ugk9kckaLwI
 2Wb+Wgi4TT/AJOdyWgBR38n41WqjVKQBFJr51BAfKMiWVpD3WdVsgc4Ji
 N251wERH/ZZb/XZAxulrIMrNq/P18vwzAzmEdowlYk8c7IU4hpJtAWXR+
 hsfLNzHXvdWvYyrkYIOoTINuVWcpUFVZjyuz9j8WJ5qsm7ixlOoDlXeuy w==;
X-CSE-ConnectionGUID: ZhdEKOctRhS9ddRpeLfn6g==
X-CSE-MsgGUID: DDHjKb/6S8KqRifpdl6WEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="515044"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="515044"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 02:08:14 -0700
X-CSE-ConnectionGUID: 6GcVnuafTMunncVMOpDvKA==
X-CSE-MsgGUID: GGCwymq4Rba/iA+/+eMR6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1181397"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 02:08:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 02:08:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 02:08:13 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 02:08:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SbLQuns+LEvLKAlGqmKu347U7ORmql7diT7rtfvTTUMngj17Wdfrb0qSX4Dn577p05wIUpX+V88Fu6tiG58jTZeOEC0dh+irv8BZQfkvFptyShQRYxgsM6wc0thQrmG3779dvxj7gjRRy7P0F/Uo7dIERu0rBWUII8rR0X/71X5/tFT5dK32wjtjdp/bMbAtAornpf3mOlQ6gDiiFLfpLdI5ru6flwXTKj9/9O4q91pToN+zdY4xzXmPo4JOjFgoS2AyPMVmPxH7T1da9WP8otXi5Wv8DDDc4LKiltQsixBz86R+DeoReP7RRYJs3CaHR8OF9KqngozEisVSLQUDJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiyUgIwdfMcEwCnlBxGeVcgV9YUFJdSx1JTvAZ82dJ8=;
 b=i11zUCCzphw9lmTFAsp6KMVJkcEaKZHHoeVlVFc+sOije8VPDwq8zw/psXj5EWwu/4KJC63y0nzeCRfr7j6Lrm98AlQy01YGkvwJHJtzPmB71JyTxbzWMX4yRDuWTibvqlNBx9ojpOidhSn3XYSCytVggD1eVu09jQFqigNUJ9vpWefhSgnCSL4B+fMPrprJT2sjRs6z0Zsz4J9Ce2A4Ky+tsk4VGAc9di42MWblsgZcYVk4pptAXDl8ohsgGK6qAwN9wpbf5ataa4NWQ4KGCzbZK4HsGUxL+iU1TROOZNilo6Ify2ESKvSzUinpT0FTFX10kr86U8C0aZpixm6XCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CY8PR11MB7057.namprd11.prod.outlook.com (2603:10b6:930:53::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 09:08:10 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0496.019; Mon, 12 Oct 2026
 09:08:10 +0000
Message-ID: <82884f13-e5de-4ab8-8723-beecbf764965@intel.com>
Date: Mon, 12 Oct 2026 14:38:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/12] drm/xe/vram: Report VRAM errors using structured
 xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
 <20261012051823.2201360-13-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261012051823.2201360-13-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0249.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CY8PR11MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e8b695-c317-43ae-7cc9-08df2840561b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|5023799004|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vbICNpDTqYwAUyPpcD44wK4srVBiRWIzy/hk6ZuG52jjVG9U6LCN9wVRopujv2hZAWMXZifuxY6vLMVfsU67oUZBjeYl7Lth6VJvrFz4oJZjf9jNbBUd5vwjydfHuDQ1eSyy5LEdMgkV3p0FjxsMAXQ6HXxJ4mBlxGRj3sLOqTjXn0XuVVuAeCrJK0YUTS51zuEBROXUaTWUsQCXXayG/XBcIMZXrQ39NKLtEs+IxRlGST+BS87Cd8jtCDZ0Lpgqb0DKM/898yPnL8j+thCNhZfSktCE2ix3chlTW/J/mzXaYbXt7LW+ldEfqIGLCSL/AsCx+IOMmfYRObDpl0ybefv/3SRH8cxhLyxGxhOet1G76G7izHDDfdLuBNH+JBW93GSKRCtJOmJzpPY6oWF6uRn11FdDVpYbodhvFg0fDgoqF7JRn20KycBEedB1oPGDlKT6vYL2+n4sNpNJILu8Xbj3qFUebSyGOUmvm1+WAGXbyVWvPYuEwTrgTgUmfYnAD+D8WyhG7+stwVzIK7IA1vNMqqQfPymYVUhEkSQ8LmDfZgBlr5pbN+T+hnG3EjrIOt1bHJlGmSSFgHw8gEhHhHScHizcEpWK7x8mSRbspYfk90IwatPqJ3GGt2Qz0hoM+e02lapE6GoTvGOY8EyVbC7gVUOK3PJ0aGpgofzBi4I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(5023799004)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWRYYnA0L0IzMmI1L0drWXNMemZvbnZmUlYvNEIveCtYcXJSeVdxSmxrcXM0?=
 =?utf-8?B?cDZha09scHJzbHhMOWhJZjFyVXo3YnJYdHp6WmNLY1Z1Ni9ZSGY2dHNRU0Fi?=
 =?utf-8?B?aTB0RElUQTgrdVZrNVl1elUxbTlUTjlxWjNBd2JqWDFBVkhSamR2VXA5bEtw?=
 =?utf-8?B?RTZYR0ZsWGxmeFhIV2dDNVRJcUFiQ0VoNXc4LzFYUDFUbUlUV28rTHZqaW05?=
 =?utf-8?B?aHJMaERuWmcrL1o1QnZzM2Q5WnIvNFU1cHNXOXBnZkVkQm1yelM5cnZlWUFP?=
 =?utf-8?B?YWc4dEhMdnZna2dDeUxXT3lzYW9NYmNsZUtCTWkyZU5WTmtJY0E5MnVDS1cx?=
 =?utf-8?B?T09zOUNxdXBUdUlLbzRvTWl2czFRanBmamE0QjlnS1dsbDBjd3VTb3FKU3RS?=
 =?utf-8?B?R2pPTFdQU0xvV1ROY0xscFhNc0RJYmVDS0s0OW1BeVZwc1htTnZENnB5S1RI?=
 =?utf-8?B?YlYyOWJhY1BKTXRUdG00YmR3RWUvL3M3Ni9KUzNPaS9oMHJ5bmJ5RndsbHdI?=
 =?utf-8?B?S0xZdHdMRXpYeHI2RXBSYjMxQmNiVEpzNkJyejhhSHJpODJWQ3J3TWs1Y1Uv?=
 =?utf-8?B?WWNlb000ZTFWcDNRa28xQWRBWTBvMnNpV0VhTUV4TC9iNEp2bzBwRm1QM1dr?=
 =?utf-8?B?NzloNyt1amRER21TcktIb014TVRBSUw2V3kzdTluOUFTMHNUUmgrZStmTm1K?=
 =?utf-8?B?Y09FaHdEbXA0d1hFa1ZKV0hjQm52Qi9OdTBuMkpPdFkrVTB5UldnVWxiR0Z1?=
 =?utf-8?B?R29mM3dZT2k2cDJiUTlxbVk0cGxDVm1CYSttbUZuY1BmSHc1TkFrRmFFODJx?=
 =?utf-8?B?TE4rWUFhYU5MTmJvdCtMbHZZclQyRXRLT3ljbTZDcHhYU2VqQXUwbU1tY1Yw?=
 =?utf-8?B?Y3dPcmcycjhTaVdGZDhTNkFuWG9NQ1hlZDBycXE0UGhXRCtlMFBEMDB6VlNG?=
 =?utf-8?B?UzBlS05kU3I4R3R2SHBacmo4UjNiZExqTzZncmpiT1htZlJBMjg2V0JBWFVh?=
 =?utf-8?B?NHR6NGhYeVNHajVnTXBjaVpkUDJVUVJHTDdGZm9CQTdjN3kwamZIV3hHWGJO?=
 =?utf-8?B?Wk9kQUcxZERWQ3QwS1ArQ1FhQXMydnloSDVJeDdNc3V0bHMyem9UN3FjcGtZ?=
 =?utf-8?B?QXpXVHpUWXZ3YXI5YTZ4ZExXTGhmWkFGVkwxWkpYY0ZvN2h1Sk51NmlNaC92?=
 =?utf-8?B?NnZ4L2ZHZDVOaTRMQnhTRzYvRHJtQ1JYcjdkYkFmZXdnUUhIMDFuYm5UOU1P?=
 =?utf-8?B?STBJT2I0NXpjTzY0bGVkUndjenpkdjFpOFJnaFpXRWZweExkMEFpWVFtVTZS?=
 =?utf-8?B?MEN6aElNNHArSzl4djdDYkhJWEZLaFlrcUwxZExVS1JkMUJpaWRhdlhiZlBQ?=
 =?utf-8?B?ZklGZEQrMnZMMUlnOUh2by9XdkNTd2czRXhiY1VpalVlN01VK2VueHlPcENC?=
 =?utf-8?B?eHh3ZVBLTXRRRDlOYXRsaHljS0IxdjF1NFh4cjF1T3duWmhzd2pIcVBDbU9n?=
 =?utf-8?B?TWlMN3pYMEdwTDdBeWtRUFpSdEFZT09BV0RpNzdLTU51VkFQQ2JnaG9PUGti?=
 =?utf-8?B?K1dDcGtyOTFsdGJFbnN0dGJSS0NTRFEyRFpIVFZNSUlVNmVqdjFtS3BuNU1H?=
 =?utf-8?B?SFNOeGVKdHBKNXdSd2xUVG9jckdHWW4rVURFSi9Ob25OUlQvakZNN0Jhb0hR?=
 =?utf-8?B?aHBXU0hDRWMxMFpHQnQ5TDZNYWdMWVBMRXVzNTVYa1VKNjRjNmIvSW1ybU5F?=
 =?utf-8?B?U0E5ZjVIdDhENnUrUzA0MFlwbzhYTmZaVFVwYXdqalFzNnA3a3BXNGdtODJu?=
 =?utf-8?B?TkdRWUw5RHFMNXJXUGFNT2xhQ2pQcUZwSDcxbG9NOXpaMWFHbEtOUWdSTTJj?=
 =?utf-8?B?VFIzdjFRTGpiZjY5bVdQdzVBbktWdHhrOHI0cy9PKzdoMTZxbXp6UWg4UGxq?=
 =?utf-8?B?MkpjTWkwMnBqK3lLOUZOejhuWDRtT1hDSk5IV21YZXlPd0YzaEFXaHhkdC9J?=
 =?utf-8?B?ZjY4WmVyRnJ0endTTnB4Wlc4a2ZhSUg0U2pBWU5JZDE3QkZFekxZcHZUM2I5?=
 =?utf-8?B?NGhPVHYwdGdCYldtS0sySUMraWtBRG9YY0IwblRSQnBHc0xtcitmK3lSc1BF?=
 =?utf-8?B?RGw5UWxQMzZveWphV3UySEVaRVFZa1d4VFNoaVpkT0craFhtYzg5ZmdySk1H?=
 =?utf-8?B?V3pwWittV2JldFNkTjAzeTN1SVljOStQeGU4dWgvTkE2ekJYd2EyR3VlOEEv?=
 =?utf-8?B?cXhrZFJBeVl3cFAwaUdQTnNPeWtEQjFpSjNqZnUyYlptSW9nWmg0KzdETEFk?=
 =?utf-8?B?WjdPMXNjRVpSUFk3NStXQTY3ZldsdnJXUVN4cHJEMGlhQlJwNEhObk5RRkVt?=
 =?utf-8?Q?uKKRrPogkhRpPAiI=3D?=
X-Exchange-RoutingPolicyChecked: MbQ5zyQ03bIM9Ma3sz+qyrIgZW7QM2DzsZplmqWbHS920xsCsqwe1dnzPGUBGSWtsw9vLAmMWMDE25w7VjF3IgMGEi0XSNJtKlfJRMsVHIIEf6bkirVFlpt6jh4qZ3AoxcZbqrjBNw2/gK5kNxtaoUR35irRnS6b+XOytsRGmUiepsz8+EXF2jF3wQvvMEwt3xvgSipUjmJiYnB0rcgBuTwqYUdXHNIVz23nVqOQw8AvStK4cG4zdfrSl0HxuJLzYp1WaKYOcDzxrnBLqBgGFlSmIo48cZ9geUm8RAR79V06tPWJdVPO0W6MBeqeqYNDHrhEkvvj+a6urTVi+GmInQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e8b695-c317-43ae-7cc9-08df2840561b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:08:10.0953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hU0686Ld5XV+IYQEQYAShWFnb2c2COBTxhfhPqngr9CujXyRalfyn8AAPfBHF1eIYzkZAMplS3tXQbm9Kt99TR00XR6WIAxpRkHVkchGdZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7057
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


On 12-10-2026 10:48 am, Dnyaneshwar Bhadane wrote:
> Replace drm_err()/drm_info() with xe_log_err_fatal()/xe_log_info()
> using the VRAM component tag. The "no CPU visible VRAM" error uses
> tile or device as the log location depending on the caller context.
>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>
> ---
> v2:
>   - Update the ternary condition (Mallesh)
> ---
>   drivers/gpu/drm/xe/xe_vram.c | 38 ++++++++++++++++++++++--------------
>   1 file changed, 23 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 73aef047eb38..772704dfe12f 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -17,6 +17,7 @@
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt_mcr.h"
> +#include "xe_log.h"
>   #include "xe_map.h"
>   #include "xe_migrate.h"
>   #include "xe_mmio.h"
> @@ -46,7 +47,8 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   
>   	if (!resource_is_valid(pdev, LMEM_BAR)) {
> -		drm_err(&xe->drm, "pci resource is not valid\n");
> +		xe_log_err_fatal(xe, VRAM, -ENXIO,
> +				 "PCI resource is not valid\n");
>   		return -ENXIO;
>   	}
>   
> @@ -227,17 +229,16 @@ struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 pla
>   
>   static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
>   {
> -	struct drm_device *drm = &xe->drm;
>   
>   	if (vram->io_size < vram->usable_size)
> -		drm_info(drm, "Small BAR device\n");
> -
> -	drm_info(drm,
> -		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
> -		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
> -	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
> -		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
> -		 &vram->io_start, vram->io_start + (u64)vram->io_size);
> +		xe_log_info(xe, VRAM, "Small BAR device\n");
> +
> +	xe_log_info(xe, VRAM,
> +		    "[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
> +		    vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
> +	xe_log_info(xe, VRAM, "[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
> +		    vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
> +		    &vram->io_start, vram->io_start + (u64)vram->io_size);
>   }
>   
>   static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
> @@ -255,8 +256,14 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
>   	vram->io_size = min_t(u64, usable_size, remain_io_size);
>   
>   	if (!vram->io_size) {
> -		drm_err(&xe->drm, "%s without any CPU visible VRAM. Aborting.\n",
> -			tile ? "Tile" : "Device");
> +		if (tile) {
> +			xe_log_err_fatal(tile, VRAM, -ENODEV,
> +					 "without any CPU visible VRAM. Aborting.\n");

Rephrase the message, out put looks like:

<3> xe 0000:03:00.0: [drm] *ERROR* SIGID=108 FATAL (-ENODEV) Tile0: 
VRAM: without any CPU visible VRAM. Aborting.

> +		} else {
> +			xe_log_err_fatal(xe, VRAM, -ENODEV,
> +					 "without any CPU visible VRAM. Aborting.\n");
Device is required right? and rephrase the message.
> +		}
> +
>   		return -ENODEV;
>   	}
>   
> @@ -321,7 +328,7 @@ int xe_vram_probe(struct xe_device *xe)
>   	err = determine_lmem_bar_size(xe, &lmem_bar);
>   	if (err)
>   		return err;
> -	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
> +	xe_log_info(xe, VRAM, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
>   
>   	remain_io_size = lmem_bar.io_size;
>   
> @@ -343,8 +350,9 @@ int xe_vram_probe(struct xe_device *xe)
>   			return err;
>   
>   		if (total_size > lmem_bar.io_size) {
> -			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
> -				 &total_size, &lmem_bar.io_size);
> +			xe_log_info(xe, VRAM,
> +				    "Total size %pa is larger than resource %pa\n",
> +				    &total_size, &lmem_bar.io_size);
>   		}
>   
>   		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
