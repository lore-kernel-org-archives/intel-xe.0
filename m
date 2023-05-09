Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30DEC77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 17:09:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97E510E39B;
	Tue,  9 May 2023 17:09:17 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C318B10E39B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 17:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683652155; x=1715188155;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HyFJKRRfvGvED4veOlctVCH5PIy6k5PixQ1/wj6FL0E=;
 b=cwrLBekkAiiCq58JgUV0zXE/M8JeM5CdAetYHRGxoB882VmROc14PMy4
 EkZyVmyz1nFRw3dKqd6FCUx8kT2RQ0Z9PemKKOjHkrayrViEgV+zhuCNY
 rour1hMLNKjZaYrVkyqlHCNpNbk2AzlDH96EArcChFU19sfGt+KWWx27u
 Dq4XBD0Ix2LyUm8Byd7jG2+trY0hgYX3yaNpcntLrK0Dz6fhQ43ff6FUk
 KkSfqTrwo8wUBiilskZldE2tRdGUeqX3Adk++JqTysnfEi0VoBcu00uLU
 03py5wP/TCYVrNTi0oHXa4PDukh5alePqdQE+NacUgf38K4nzgRhGr9gr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="348825409"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="348825409"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 10:09:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="701938515"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="701938515"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 09 May 2023 10:09:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 10:09:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 10:09:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 10:09:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 10:09:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5Hobnliii+61ShTiFIRs647JatggBXGByG5LSNbHttvHqJEf0yfZLWw09YhNHS3pb2GK4Mwme0FX1wiv9f8Kuo2LRpDwqBrC6cJ+reoMpM/hBM7+IWUxFWIK8hffxVgR+X4nVoa944wdn5rlMR7FjndHRkaUirLn7yHwsycQLcmfK3v5VkcFdcv1x7Dx/6g/tklyJp+hsWCN6pZ9XS0hRkvdv/E8zXWtEokq2aeiIaHuZ3AY0ssrPbADpfnT7brxh3EF3UnAjmraojqCKvuN/vCmJ/yKx9OUCJ7++PjbL6TLWdycpJzC9ISfUlSx0AIYpkwPUawHshvEAO2wmt8zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADhyyp9+KddGu2Bqniz+WRvUL+jIPe2c8S4ss0diHfE=;
 b=SOhUrCULxfsWc4+w2joiYIi0xqYT00+tAhAOdxL4LA7vr+CvyxZmpMtlpA6UTdy5oFrVL5rJdSdAad95U2p0G1vygqKrpofw02zqE/Wc+McRqY33qPKMmVtXT+YOqi+qD0GvU0v3dJmRwGwANNjKPTqkTD5X4pBp3BVMpoFsxdjQtTKPLCbBo2LTHeyZF0MAU8FGXtyTTKr+JNyq6i5CW9JPSQyvtsr7JMl9sSBlfIG5daZ5YYQBCWB/kboGuWRxCHr91m5D1QdbzUnSCo8Lp+OW5uyUp0xI4lhaF7FCQSvbAsLr8gsgwcxM1VdFH1G1T5JkQJVYvjZ6PZUxwo/uuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5937.namprd11.prod.outlook.com (2603:10b6:a03:42c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 17:09:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 17:09:11 +0000
Date: Tue, 9 May 2023 10:09:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <t3xgc2hzjtbru3k2x7emvrxtypsuejj4ms25rq6x2lsoo4auai@v77oi3plujhm>
X-Patchwork-Hint: comment
References: <20230508225322.2692066-1-lucas.demarchi@intel.com>
 <20230508225322.2692066-3-lucas.demarchi@intel.com>
 <ZFpmQOxiO1DGB5/b@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZFpmQOxiO1DGB5/b@intel.com>
X-ClientProxiedBy: BYAPR08CA0057.namprd08.prod.outlook.com
 (2603:10b6:a03:117::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f371975-05cd-44c2-029f-08db50b01bd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gsr30cwkRQ4e6lGz2izIFWFz+KCAH0CLuL7bDxYcQAk3CkQUFYlHRBgSxrk7y1tWAUVtDhhgwgP+kOQKjo2K4Y7pzhWeV7C7nSZQLTHdQ8nKkeScM1BbjtSaVTp8hCSMhcgjX+yEPZi10oQjGZuDQmhOeA48J3oQZ2PRKsqp0JHGRsLXkaE2QxHdE9tbUSO8BGwD23mQOgdsJ7Wg1katIek03zexknjVPt+/CFDfdk0zRomo6hHUXHvvtHplX9O/DNyt5Rz484MeXXq4FeL2V6aaIWgxFa6p+Zv8fAUKKU16s6wKl7wGXM52DYrjKfrLwSxgtuAqqOa+p5iM8JWhA7qoeDfNdcarDaBQFApqOvvCCVyNahOw3XEKNwikMnBoD4JlfYAWmNagDNdTRLTTZ4uaFM8Z+u4x8FUKfmWQLeK7i1crm2bxG1I+DY1+li6GPSO4PBWxgerFFQX93Exye7C+H+v5d5O04UpnG9tmKe8eUs/ELmc9fbeN6Fg9q2Peut6NXm+7GcXmYIS1r64uVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199021)(4326008)(316002)(478600001)(6636002)(66946007)(66556008)(6486002)(66476007)(86362001)(83380400001)(26005)(6506007)(9686003)(6512007)(6666004)(2906002)(5660300002)(41300700001)(8936002)(8676002)(6862004)(33716001)(82960400001)(186003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o8Skjxlvf0klBfLM+G0zvgRnlq4+XYcwDppqzGe2Rd7AEwtClRy1A9ffxjB2?=
 =?us-ascii?Q?vYWcWKp6aVpe7ubsT5FP5MGcypg1nMxFOd5AXfyDBpD1Gz0mmZt76uMUULQi?=
 =?us-ascii?Q?g23MJ4dHcBuZA3tkm1WYDQJTZFsBa/3Dn75Ot+M57eYxw6Hwx1vf/08vmONo?=
 =?us-ascii?Q?GyVzL9lCMz11eKTeiZ1m89YDmUSCB7yAvYpC04UBtN79IGKFTIYKuEPRJl4E?=
 =?us-ascii?Q?8UZTDVQzQKVwBwkjITIIplPEyZR4ZxIt3tUn/ne7zgQn0RFGLeEU7N99Bu0b?=
 =?us-ascii?Q?YrlMzv/Hf7stHAwfbxMNNHyB+OZSa9WwibEuvniEf02hESAuSGTnvG//U4vy?=
 =?us-ascii?Q?O1E9JI1w9z3jx8YelHBJU/dsXcsmgNQgaTlnqrTkazDXVbWxbGTFgBIOEHMn?=
 =?us-ascii?Q?r0rCZVaGUNIa8qCkc/krP+ynjPNY6CS3CaC7hI8CSyYjgD0KxCmmb0P7NLzN?=
 =?us-ascii?Q?QKK+5APRy0RdgJPYZjrsgNLmB0yMvKjfOyOqkr371/+VqoJ29LkBTk9T3lsC?=
 =?us-ascii?Q?Zv+nX6exv+JgilK1ma7086UqABqgV5TxtsGQWcfxV40N7sjblFULPSkxdkl8?=
 =?us-ascii?Q?LQzDvXaJgciXgtWaBvM532UDAHzCvYKr68ZyfMbzxhL78vCv23Gun4wwmMWu?=
 =?us-ascii?Q?GS+7C5ShcmB92JjCRY2tm+meAPluymOlxUg3xbZllxcXGK+KQp50V7mSkM6x?=
 =?us-ascii?Q?J/4jutO35YQs8fKl9tHulB+m+mSQZLNQ9HwxJvxKKNNoJ3GDOhi6jOj//w58?=
 =?us-ascii?Q?n0BBHVUSkvtGKBWpi9SR6EnBoYAW2+rL+4/E9UdQ203dks+XG371UsvKs6aJ?=
 =?us-ascii?Q?1a636CnNMPR7pNV5aCBmhCvRAqHDH5LviCo6nSzPT7qUrTl8FJjEK12YYvj6?=
 =?us-ascii?Q?nHDz3IVyrYM0Wmh+nsD2yE87v3zWtdCfocGSd0Teiia/gfQ5/OyGSe7sElAL?=
 =?us-ascii?Q?tg5NzB9pW+XA0+odkdYrpznagLHMYfkf7pVdZGZR0utOqlYyDczzjDFHifwc?=
 =?us-ascii?Q?kcF/uaGbusDOcF8vImOwhWRTze9NdlHfmZt9XGx+yDY8Q8n59iA+Tm+x5yIQ?=
 =?us-ascii?Q?ZpELRX9ejAPG9UPOJyyc9QdvipOm7yNgm0sAh92Z6SrmGsPUf/x7iI9VPODi?=
 =?us-ascii?Q?tECenPqewquKlncThLmrq3HZDjq9SabOuiXcKOpT5JjFpSUIrQRB6S3L2AcA?=
 =?us-ascii?Q?p5suC+6xn/Uo9T77wv37gmGSTHy8OqGTxeEsiKyEmxzyXwmO+HPc2x5z0fnd?=
 =?us-ascii?Q?mQufcsZiWRxAF+LkPLIaqQEBS5qsn22IxcBlPCqLHGDUVvBXJyW4Jlung5x5?=
 =?us-ascii?Q?v8qXXtpsSBtJVyAFogmnfMsVoQKYKXhqXXZ8bgkzRL6rQ4gYgNiwWmBH3M5o?=
 =?us-ascii?Q?xtTzUUL4JOS7uczi3GsX/IMOVNtr1AgEpe0G/oWn4EISyaPRWlJ3n/298puo?=
 =?us-ascii?Q?5kn8CGASNz8waSWMGLfuIR+KBhauQTMrWzduy8lVlBuToxPgS/B+SPuDG2WX?=
 =?us-ascii?Q?zOpOdE7sbJTisGI8Tb1ety0PPB1Hl1pAhCWt/GkeyqzJB74/zpQFtMXcMZl9?=
 =?us-ascii?Q?xU6kO58LFNWERT17Fx67sOs/waQ53kntXGf6oKb/b14gk5hUxqEeEmBLMK3q?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f371975-05cd-44c2-029f-08db50b01bd5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 17:09:11.7552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSQXl8jNy9Y/RPDNeMPYes5Mh+x8VcTwD8Ju3Kx1LUVbimUCp/7lFA5VR+vbdOGD7gYR+fv+vIT0IU1Q59+96+B9sQfWwnCdQQT7k93nu6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5937
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/4] fixup! drm/xe/display: Implement
 display support
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 09, 2023 at 11:26:56AM -0400, Rodrigo Vivi wrote:
>On Mon, May 08, 2023 at 03:53:20PM -0700, Lucas De Marchi wrote:
>> WARNING: This should only be squashed when the display implementation
>> moves above commit "drm/xe/mmio: Use struct xe_reg".
>
>I wonder if we should then try to move this patch under the display

that is the v1 of the patch

>instead waiting for the next round of moving the display up...

but that then means build will be broken for all the commits between the
current place display is in and the previous commit, rather than just 1
commit.

I think the next display move will be messy as there are commits in the
middle that depend on the display being down. My attempt to moving it up
last week
(https://gitlab.freedesktop.org/demarchi/xe/-/tree/tip-display-rebase)
led to a bigger squash at the end because leaving some commits behind
didn't make sense and adding them on top didn't look good neither.

Question: is display in an acceptable enough state now that we can stop
doing this and just leave it behind the build config? Maybe just move it
once more and stop doing that? Another option is to accept the display
move is painful enough and maintain it with just a single commit on top.

Lucas De Marchi

>
>Also, could we change the subject from fixup to future-fixup so the
>a git autosquash doesn't try to move this before we are ready?
>
>>
>> With the move of display above xe_reg conversion in xe_mmio,
>> it should use the new types everywhere.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>  .../drm/xe/compat-i915-headers/intel_uncore.h | 103 +++++++++++++-----
>>  1 file changed, 74 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>> index 90d79290a211..14f195fe275d 100644
>> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>> @@ -17,82 +17,127 @@ static inline struct xe_gt *__fake_uncore_to_gt(struct fake_uncore *uncore)
>>  	return to_gt(xe);
>>  }
>>
>> -static inline u32 intel_uncore_read(struct fake_uncore *uncore, i915_reg_t reg)
>> +static inline u32 intel_uncore_read(struct fake_uncore *uncore,
>> +				    i915_reg_t i915_reg)
>>  {
>> -	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
>>  }
>>
>> -static inline u32 intel_uncore_read8(struct fake_uncore *uncore, i915_reg_t reg)
>> +static inline u32 intel_uncore_read8(struct fake_uncore *uncore,
>> +				     i915_reg_t i915_reg)
>>  {
>> -	return xe_mmio_read8(__fake_uncore_to_gt(uncore), reg.reg);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	return xe_mmio_read8(__fake_uncore_to_gt(uncore), reg);
>>  }
>>
>> -static inline u64 intel_uncore_read64_2x32(struct fake_uncore *uncore, i915_reg_t lower_reg, i915_reg_t upper_reg)
>> +static inline u64
>> +intel_uncore_read64_2x32(struct fake_uncore *uncore,
>> +			 i915_reg_t i915_lower_reg, i915_reg_t i915_upper_reg)
>>  {
>> +	struct xe_reg lower_reg = XE_REG(i915_mmio_reg_offset(i915_lower_reg));
>> +	struct xe_reg upper_reg = XE_REG(i915_mmio_reg_offset(i915_upper_reg));
>>  	u32 upper, lower, old_upper;
>>  	int loop = 0;
>>
>> -	upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg.reg);
>> +	upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg);
>>  	do {
>>  		old_upper = upper;
>> -		lower = xe_mmio_read32(__fake_uncore_to_gt(uncore), lower_reg.reg);
>> -		upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg.reg);
>> +		lower = xe_mmio_read32(__fake_uncore_to_gt(uncore), lower_reg);
>> +		upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg);
>>  	} while (upper != old_upper && loop++ < 2);
>>
>>  	return (u64)upper << 32 | lower;
>>  }
>>
>> -static inline void intel_uncore_posting_read(struct fake_uncore *uncore, i915_reg_t reg)
>> +static inline void intel_uncore_posting_read(struct fake_uncore *uncore,
>> +					     i915_reg_t i915_reg)
>>  {
>> -	xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
>>  }
>>
>> -static inline void intel_uncore_write(struct fake_uncore *uncore, i915_reg_t reg, u32 val)
>> +static inline void intel_uncore_write(struct fake_uncore *uncore,
>> +				      i915_reg_t i915_reg, u32 val)
>>  {
>> -	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg.reg, val);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
>>  }
>>
>> -static inline u32 intel_uncore_rmw(struct fake_uncore *uncore, i915_reg_t reg, u32 clear, u32 set)
>> +static inline u32 intel_uncore_rmw(struct fake_uncore *uncore,
>> +				   i915_reg_t i915_reg, u32 clear, u32 set)
>>  {
>> -	return xe_mmio_rmw32(__fake_uncore_to_gt(uncore), reg.reg, clear, set);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	return xe_mmio_rmw32(__fake_uncore_to_gt(uncore), reg, clear, set);
>>  }
>>
>> -static inline int intel_wait_for_register(struct fake_uncore *uncore, i915_reg_t reg, u32 mask, u32 value, unsigned int timeout)
>> +static inline int intel_wait_for_register(struct fake_uncore *uncore,
>> +					  i915_reg_t i915_reg, u32 mask,
>> +					  u32 value, unsigned int timeout)
>>  {
>> -	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL, false);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg, value, mask,
>> +			      timeout * USEC_PER_MSEC, NULL, false);
>>  }
>>
>> -static inline int intel_wait_for_register_fw(struct fake_uncore *uncore, i915_reg_t reg, u32 mask, u32 value, unsigned int timeout)
>> +static inline int intel_wait_for_register_fw(struct fake_uncore *uncore,
>> +					     i915_reg_t i915_reg, u32 mask,
>> +					     u32 value, unsigned int timeout)
>>  {
>> -	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL, false);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg, value, mask,
>> +			      timeout * USEC_PER_MSEC, NULL, false);
>>  }
>>
>> -static inline int __intel_wait_for_register(struct fake_uncore *uncore, i915_reg_t reg, u32 mask, u32 value,
>> -					    unsigned int fast_timeout_us, unsigned int slow_timeout_ms, u32 *out_value)
>> +static inline int
>> +__intel_wait_for_register(struct fake_uncore *uncore, i915_reg_t i915_reg,
>> +			  u32 mask, u32 value, unsigned int fast_timeout_us,
>> +			  unsigned int slow_timeout_ms, u32 *out_value)
>>  {
>> -	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg.reg, value, mask,
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg, value, mask,
>>  			      fast_timeout_us + 1000 * slow_timeout_ms,
>>  			      out_value, false);
>>  }
>>
>> -static inline u32 intel_uncore_read_fw(struct fake_uncore *uncore, i915_reg_t reg)
>> +static inline u32 intel_uncore_read_fw(struct fake_uncore *uncore,
>> +				       i915_reg_t i915_reg)
>>  {
>> -	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
>>  }
>>
>> -static inline void intel_uncore_write_fw(struct fake_uncore *uncore, i915_reg_t reg, u32 val)
>> +static inline void intel_uncore_write_fw(struct fake_uncore *uncore,
>> +					 i915_reg_t i915_reg, u32 val)
>>  {
>> -	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg.reg, val);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
>>  }
>>
>> -static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore, i915_reg_t reg)
>> +static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore,
>> +					    i915_reg_t i915_reg)
>>  {
>> -	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
>>  }
>>
>> -static inline void intel_uncore_write_notrace(struct fake_uncore *uncore, i915_reg_t reg, u32 val)
>> +static inline void intel_uncore_write_notrace(struct fake_uncore *uncore,
>> +					      i915_reg_t i915_reg, u32 val)
>>  {
>> -	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg.reg, val);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
>>  }
>>
>>  #endif /* __INTEL_UNCORE_H__ */
>> --
>> 2.40.1
>>
