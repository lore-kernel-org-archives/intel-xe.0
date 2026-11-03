Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA79606EE9C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 14:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y4+N481x
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3F610F5E7;
	Tue,  3 Nov 2026 14:09:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7672210F5F2
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 14:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793714956; x=1825250956;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1IpYOSSeiOensyBapuOhODYbm8nXxxyeg0hYPs4lS9k=;
 b=Y4+N481xdxnqsgWN4fuJXRd3GFVJQAmwhtlzXmurotXFw7pE3QLf0Oey
 uWVo5El4OE5VORn5LAJFrC/1pB1zQRdge+3i6dXXp+GBz+VH0toVd0rHM
 p7pguuECGfiFfOk8MnsHnE8/s+edIYlWjib4GkcCniFv5/sBli/aCScOI
 Uml2KZ9/Fp5FdADu5TRSWH/6Lu6Fo+8PIIlviPc1K3++HgkUvnKB0axlb
 MMQNdKwtCJ4P3l0TzbhkzFVEsvDTYquxSDtGx6KO1kNehRWS8G3Kg7XjZ
 mh6FD8W4ayw78hURiQ6xgE+w/sXubiBU1vLIbvk+IEBvnxGotm3998oCZ g==;
X-CSE-ConnectionGUID: qhMxomRiTMuPrat4N7t3dg==
X-CSE-MsgGUID: Dd7fVpkzQ+6p0ug4Xa6nVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2436149"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2436149"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 06:08:41 -0800
X-CSE-ConnectionGUID: e8ZLuybBSr2eKA8Dm/PTCQ==
X-CSE-MsgGUID: N/6D9r9hRCS3X0nX/RHX3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="8217851"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 06:07:42 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 06:07:40 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 06:07:40 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 06:07:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pf7D6+4yrlOZ6UCAB/HA/II6SpKSJiSXSIvGKQ282ibW1UZ7VkrYBAZ/Tju7SpkaMVqxWILShIVtOsc8MKZ4BcbuM38Sx0VbFBrcP8U4E4renQLOzIFsakRQ5dI+sIXgqp5mNISJu+A/gq/KeLTt7e0Nq/gNWSxBOT9TnG3ZldFGwN0rg1vrMRu0nluIf9/w5ZY+Cvw9A/f8qjOAaq2ygSffleMEB3sWxAwZCDTWW0Mw9MGwUiTRKJHmUnv7/28JNg73jDydba3HGw49LAFhAWIZ5ZC9JHGj1rYCH/mxZ/h4K0OqBIUtp3ymbuEHoStgrooiZHW0oE2d1jTukpZz0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIHAmf7+0F5O3QrdssS2Pqhq1aeNH16mcCpnsbaAkVY=;
 b=cph6dM294zId26STeaTsgxkv1A8+mqhlFR2G7aXVjMWCYS/n+UNsb/XNj2VcXDmcMxcmGuP4K6PkIBvUz6lY5f9UUjBrxpD7Hi31LnEGA6XBDPRLEVKZZPNcopw+r0Fn2BmwRt+rRFglQaQwn9B32IYKk0ypq8SNeeAwdCreEZK8hPIen/ZsT81La5t+fQq0YBAcp6x+uZIxGLciNhuKyrwzyK0c4tybnBShyMsVC1yZb/hzCnT40OW86iqH+j9AKq5G8/BjwzeU2YZHC6PPPVi3w1vI1FJbvUZ9VggLrxgsDBPx/98Kb/o7gOJvPHj74ZYU2loYtC8dQk4WHhJS6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by DM4PR11MB6166.namprd11.prod.outlook.com (2603:10b6:8:ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 14:07:36 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 14:07:36 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
Subject: Re: [PATCH v2 04/10] drm/xe: Factor out {min,max}_idledly_ps in
 adjust_idledly()
In-Reply-To: <auiFQzhrWnqYnoNE@bvivekan-mobl1>
References: <20261030-wa_16031259911-v2-0-919fa1c27070@intel.com>
 <20261030-wa_16031259911-v2-4-919fa1c27070@intel.com>
 <auiFQzhrWnqYnoNE@bvivekan-mobl1>
Date: Tue, 3 Nov 2026 11:07:32 -0300
Message-ID: <875wyeqa8r.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0040.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::16) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|DM4PR11MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a29109-0276-47ad-c603-08df39b3d026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|261021123027099003|260925022911599003|260925021911599003|260925021311599003|261026140227099003|4143699003|11063799006|56012099006|261028144727099003|261009223027099003|261022105027099003|261021121427099003|261026121527099003|10067099003|22082099003|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info: uRyu/2zO3FsfKVATVXRGGDk28RO5aNcjNQ35a7drKMKoFm1eHmIvnQA28pWm2VSrZevUpKgvOme8S8vFpcYUBAEOowF9aTZHkK+5fztNoXkN783gp0FRAnv6PhHJ+eXWz4HRKeLrFOaCpjbpmpfis5jOgpVUELRXlXJrA6DlvY0VHHUZZqAP8d/biV6Rzygzy4s+oBFjSm/+Ap+RPq0WT7+P9gk81/mHKH9fyGAeTSrETV41qgJ7JQLw6ozobcziX5/LARdh7nwAcEJ+C2qUh5IVl0GKRmk/6QPEH8kPQwyq3tkOMRjjPLg3yKJZsG+VEF5kH0jSw89xjmGKpV7Iw/ZOOMIveFlrzvQfAMSlFpfJML4xvbmOwft2DykqIbUuhIv0BgHzKRrrGZhIny9Wtn63RlMm2QLidJ/XoiKO7QQcMD4ybkYW/0tSHGZvigWg078J6qM+BguQmmuX9BZ1BU1HWNmjd5qa4+972VQrL6XZ1ugXMIjxqZc6og0lvaAJR8Lf9/rWXKWKOa7vNTx0ZpFhTc03eFzPJvtAZUVMlU8EBLOJfa7NaGYvnwHWyDYuNQrLuk8xB5oxtJ5dlqazr4tooSP/tnf+vORzbgaBsuzMOfQZfOy+DwRdPKeaDmAzxdYpF9Pe78L1QVomzYTCPBRDqLrzuiu462vFraHIYEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261021123027099003)(260925022911599003)(260925021911599003)(260925021311599003)(261026140227099003)(4143699003)(11063799006)(56012099006)(261028144727099003)(261009223027099003)(261022105027099003)(261021121427099003)(261026121527099003)(10067099003)(22082099003)(261102123227099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w8Gr6geRcUIoMGriGXqryoIIMDCJzHr5QtKDDfTn8Dcc8QK13FG3Bmx7/qud?=
 =?us-ascii?Q?wc3bsI3GgBSipH6BPNCh7d1QKHl+whE0ouGbdxEHguVRg0sZD0aLxafeHi6g?=
 =?us-ascii?Q?/huCYL6JcFaEJna2pr8/oz21hpKbH3LZVgXQIx73SN9EbgoWpNdqd+lndHna?=
 =?us-ascii?Q?JyUwLyYQbimhxmtdNtHYS6jWGjY2t3nNmXPACuhaEVB+Y0PXTNxnAKcOjusv?=
 =?us-ascii?Q?/9Rk5DriSevHWu9N5HIFuZbEPsc9i8hVlqT/1K/bla+1sD37oYDAh3EE4e82?=
 =?us-ascii?Q?gfjxH0Bhw7oqes+9YkIlpEHTJ4jhJbH+aG+w1nkoHQ/kQfOYFex2jfSKWrgR?=
 =?us-ascii?Q?4yMpTLzjU0cWmB/JFzOyMaam4O6Ncx/MMzq8g80mfHgLCYdaHI3wjYLT0sYm?=
 =?us-ascii?Q?bh7UJQieaqcehPadOlirgs7NXr9lEN/bdBOL+jNy9kwKozF3mj0UhOV26I4P?=
 =?us-ascii?Q?RjenU4u8RdVs3N4rRGWp5AXdNvK/LwcloFiE3y8/wkzhfBxUikicAUaLbUoW?=
 =?us-ascii?Q?ZJhWvwDIPzkF9EMF7ruTFzUYNnmZSZMAYKzGhL7fHLx37wcV7hnyoFu3egFe?=
 =?us-ascii?Q?BRcTMGK9FqRVCwkL2SZ6krxDgsQfZFeXiDYX6A9+4wxex8/I/u6gp6dByPGi?=
 =?us-ascii?Q?uik+xzK2xHu3YLPbsHJWloUlbSdIWuNyvFkN5vvAu1N25+yOtm1jLZUtwCAF?=
 =?us-ascii?Q?IvVfkEqpZxGfyzkNcAfrvULfitRhdA7jjyHNvW55ttolnLg0fhXH4tVW0oeQ?=
 =?us-ascii?Q?RP7TGvavrsaJbILMFTxDvaXQTv3p82xMbQmCUJgHN/ZNi+MHBeNuSr5wgNdD?=
 =?us-ascii?Q?RQ6ElVfYriSdS0miYKh8BvnjOBHVLQec7oKYiiiJFboLM3J8Xy4i765fSb7y?=
 =?us-ascii?Q?nDR+F+QgOhfhWPD1XxtnZVWcQJWT5klTLx4uSANDs8uId7C+8QFiAKHJOsth?=
 =?us-ascii?Q?ZczCgykiqCZuAlHfmf8i4iChUJW9IXf1KoaHEO6bjFiM9AOpHClvO8qtA3Lw?=
 =?us-ascii?Q?YGyIfy5LEK4s9qyU44D/rfJaIm0lHlvuHQnZcBXG08HbqGdGNnDqq45dRwX5?=
 =?us-ascii?Q?1+a/kWf/43wflJJEtMXNxxePxhWFf52M2pImkhbaPyzhao6ywLy3At+fT5LL?=
 =?us-ascii?Q?+TeeNkisy0U1l0+pl6Z0V3QnIXWnGqRe5hRgxhLXHBFwmZPKO+N7jXrZZHet?=
 =?us-ascii?Q?IooWhd+SZHEFHSmnWcsfWltLUY8noP7LXjNIBlWtqzaPjkq29kynu3kd+sAC?=
 =?us-ascii?Q?MczMGYFrfPM3KdT8/Rly0T8PaFlNCHVWYtKuwNNN/7gC7QCk/nu+yadIxbY2?=
 =?us-ascii?Q?LVKgFt51jddK04eZBR70aCPtlOPe1ZlBBZ49HkdyUS2hf7FoPWrarwSjlBJ8?=
 =?us-ascii?Q?/ofM+yzleEPI0FDAHGC6xwK1xDz1xryDsyXgk30bNY8SOHXI8KuICLzgmTUr?=
 =?us-ascii?Q?MDC1tJ68TjJD2eNemEfYItaBS5hZJiFTq46LoRNeYuC7e8RKBoG1lKCMedhP?=
 =?us-ascii?Q?ZghaL+t0vuVPtNVLM6+6CbYBbmB5gvLFmfc4lw9PG/JAE7ivG4UnKWZSoyl0?=
 =?us-ascii?Q?rRoarj1jxacIceCx2DrmLXXFbrJd1xrB2Wwq5WTf3WFSbj2T7Fc6attZvR1p?=
 =?us-ascii?Q?gngOiZbaI7XVLe5tGzYh4D+0O4XiT0Ausl86SG0tdmLH5QnoSJ2IYLXfyWdq?=
 =?us-ascii?Q?vuYpg5jMFSYuHITKcXWk0b9hM5Wth3DHBn6BZ5w7R5cvbXeWz6kBUZDjxqEF?=
 =?us-ascii?Q?HiRV9Es60w=3D=3D?=
X-Exchange-RoutingPolicyChecked: PKyLcQpXbjKP9Jj7/dd3pol36oNQiofjb0cYLYnVWsgQo+BN1TeF2D+ERmKrbPtcfgAGCFwV5uuAkcWkoijCNDxiE28M6tKRNLCqpane/THctOnwN3QK+ZzK2F6s7S3uzwBz2qL8Cf+LBm1oXAInrNilAGWB/y2vBYZcoplqV5UnqJJrTUxhrkTrt3zFaGXetUqqoTLOwUTuFLJDOLYFXZChSC4X6zlbbJAEUEF6T/VSg/zSz14j9u1FXpKHP5A48qYoO2MVqAebKFZGXOZFDmSpIvh9ArtzW/N/7SIFvVjRf6BGhiH4MdCnXJ1880cEOZO9gxKSXgEo/wnz2/5Jrw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a29109-0276-47ad-c603-08df39b3d026
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 14:07:36.5147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgpM3OirV2pkBPKpMEBkRpei55zEyLElbUpRAqPxETF7uqMOVvhXjOchRYyhLkRMv2e22VuPxpYzh+EAyB/Wog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6166
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
writes:

> On 30.10.2026 19:57, Gustavo Sousa wrote:
>> The function adjust_idledly() currently does the following adjustments
>> to the IDLEDLY register:
>> 
>> - Wa_14025941587 defines a minimum value for the idle delay.
>> 
>> - Wa_16023105232 defines a maximum value for the idle delay and also
>>   unsets INHIBIT_SWITCH_UNTIL_PREEMPTED.
>> 
>> We have an upcoming workaround that will also define a minimum idle
>> delay.
>> 
>> Let's reorganize the logic in adjust_idledly() in a way to make it
>> easier to reason about and also easier to extend.
>> 
>> Do that by having the workaround-specific logic only responsible for
>> defining min_idledly_ps or max_idledly_ps, and then keeping the logic of
>> how to apply them to the register field (with the right rounding up or
>> down) separate.
>> 
>> This separation drops the helper function idledly_floor_ticks(), the
>> clamped_below_maxcnt variable, and the extra quantization check,
>> arguably making the code easier to follow.
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_hw_engine.c | 100 ++++++++++++++++----------------------
>>  1 file changed, 41 insertions(+), 59 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index eb99284af3cc..01a7baf061eb 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -596,99 +596,81 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>  	xe_reg_whitelist_process_engine(hwe);
>>  }
>>  
>> -static u32 idledly_floor_ticks(u64 idledly_ps, u64 idledly_units_ps)
>> -{
>> -	return DIV_ROUND_DOWN_ULL(idledly_ps, idledly_units_ps);
>> -}
>> -
>>  static void adjust_idledly(struct xe_hw_engine *hwe)
>>  {
>>  	struct xe_gt *gt = hwe->gt;
>> -	u32 idledly_reg_val, maxcnt_reg_val;
>> +	u32 idledly_reg_val;
>> +	u32 idledly;
>>  	u64 idledly_units_ps = 8 * gt->info.timestamp_base;
>> -	u64 maxcnt_units_ps = 640000;
>>  	u64 idledly_ps, idledly_hw_ps;
>> -	u64 maxcnt_ps;
>> +	u64 min_idledly_ps = 0;
>> +	u64 max_idledly_ps = -1;
>>  	bool inhibit_switch = false;
>>  	bool wa_applied = false;
>> -	bool clamped_below_maxcnt = false;
>>  
>>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
>>  		return;
>>  
>>  	if (XE_GT_WA(gt, 16023105232) || XE_GT_WA(gt, 14025941587)) {
>> -		u32 mincnt_idledly_ps = 5000000;
>> -
>>  		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
>>  		if (!idledly_units_ps)
>>  			return;
>>  
>>  		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
>>  		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
>> -		idledly_ps = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val) * idledly_units_ps;
>> +		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
>> +		idledly_ps = idledly * idledly_units_ps;
>>  		idledly_hw_ps = idledly_ps;
>>  
>> -		maxcnt_reg_val = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
>> -		maxcnt_ps = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt_reg_val) * maxcnt_units_ps;
>> -
>> -		/*
>> -		 * Wa_14025941587 is applied before Wa_16023105232, which takes
>> -		 * priority if the two ever conflict (not expected in practice).
>> -		 */
>> -		if (XE_GT_WA(gt, 14025941587) &&
>> -		    idledly_ps < mincnt_idledly_ps) {
>> -			idledly_ps = mincnt_idledly_ps;
>> -			wa_applied = true;
>> -		}
>> +		if (XE_GT_WA(gt, 14025941587))
>> +			min_idledly_ps = max(min_idledly_ps, 5000000);
>
> There is no need of check, we can directly assign 5000000.

You are right, but still I would prefer this approach as a standard way
of setting min_idledly_ps.  It makes it easier to add new minimum values
before or after this "if" statement.  This also makes it easy to
move/drop this statement in the future if needed.

--
Gustavo Sousa

>
> + Tilak
>
> Regards,
> Bala
>
>>  
>>  		if (XE_GT_WA(gt, 16023105232)) {
>> +			u64 maxcnt_units_ps = 640000;
>> +			u32 maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
>> +
>> +			max_idledly_ps = min_t(u64,
>> +					       max_idledly_ps,
>> +					       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
>> +
>>  			/* Clear the inhibit switch without disturbing a valid delay. */
>>  			if (inhibit_switch) {
>>  				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
>>  				wa_applied = true;
>>  			}
>> +		}
>>  
>> -			/* Warn only on the value read from hardware. */
>> -			xe_gt_WARN_ON(gt, idledly_hw_ps >= maxcnt_ps);
>> +		/*
>> +		 * min_idledly_ps is applied before max_idledly_ps, which takes
>> +		 * priority if the two ever conflict (not expected in practice).
>> +		 */
>> +		if (idledly_ps < min_idledly_ps) {
>> +			idledly = DIV_ROUND_UP_ULL(min_idledly_ps, idledly_units_ps);
>> +			idledly_ps = idledly * idledly_units_ps;
>> +			wa_applied = true;
>> +		}
>>  
>> -			if (idledly_ps >= maxcnt_ps) {
>> -				/* maxcnt may be 0 if IDLE_WAIT_TIME is unprogrammed. */
>> -				idledly_ps = maxcnt_ps ? maxcnt_ps - 1 : 0;
>> -				clamped_below_maxcnt = true;
>> -				wa_applied = true;
>> +		if (idledly_ps >= max_idledly_ps) {
>> +			if (max_idledly_ps) {
>> +				idledly = DIV_ROUND_DOWN_ULL(max_idledly_ps - 1, idledly_units_ps);
>> +				idledly_ps = idledly * idledly_units_ps;
>> +			} else {
>> +				idledly = 0;
>> +				idledly_ps = 0;
>>  			}
>> +
>> +			wa_applied = true;
>>  		}
>>  
>> -		if (wa_applied) {
>> -			u32 idledly_ticks;
>> -
>> -			/*
>> -			 * Wa_16023105232 requires idledly < maxcnt, so floor
>> -			 * that clamp; otherwise round up to guarantee the
>> -			 * Wa_14025941587 minimum survives tick quantization.
>> -			 */
>> -			if (clamped_below_maxcnt)
>> -				idledly_ticks = idledly_floor_ticks(idledly_ps, idledly_units_ps);
>> -			else
>> -				idledly_ticks = DIV_ROUND_UP_ULL(idledly_ps, idledly_units_ps);
>> -
>> -			/*
>> -			 * Tick quantization can still push the rounded-up value
>> -			 * to/above maxcnt; re-floor here so Wa_16023105232 keeps
>> -			 * priority even in that case.
>> -			 */
>> -			if (!clamped_below_maxcnt && XE_GT_WA(gt, 16023105232) &&
>> -			    idledly_ticks * idledly_units_ps >= maxcnt_ps) {
>> -				xe_gt_dbg(gt, "idledly %s: %u ticks would exceed maxcnt=%llups, so flooring\n",
>> -					  hwe->name, idledly_ticks, maxcnt_ps);
>> -				idledly_ps = maxcnt_ps ? maxcnt_ps - 1 : 0;
>> -				idledly_ticks = idledly_floor_ticks(idledly_ps, idledly_units_ps);
>> -			}
>> +		/* Warn only if the value read from *hardware* exceeds the maximum. */
>> +		xe_gt_WARN_ON(gt, idledly_hw_ps >= max_idledly_ps);
>>  
>> +		if (wa_applied) {
>>  			idledly_reg_val &= ~IDLE_DELAY;
>> -			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly_ticks);
>> -			xe_gt_dbg(gt, "idledly %s: set %llups max=%llups inh=%u ts=%ups\n",
>> -				  hwe->name, idledly_ps, maxcnt_ps,
>> +			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly);
>> +
>> +			xe_gt_dbg(gt, "idledly %s: set %llups min=%llups max=%llups inh=%u ts=%ups\n",
>> +				  hwe->name, idledly_ps, min_idledly_ps, max_idledly_ps,
>>  				  !!inhibit_switch, gt->info.timestamp_base);
>>  			xe_mmio_write32(&gt->mmio,
>>  					RING_IDLEDLY(hwe->mmio_base),
>> 
>> -- 
>> 2.56.0
>> 
