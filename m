Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC0BE7109E
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 22:01:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E8210E5C7;
	Wed, 27 Sep 2023 22:01:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AAD10E5C8;
 Wed, 27 Sep 2023 22:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695852107; x=1727388107;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WTHBhhjIE6OylJ3GbA51m0BT9laG3Z1ZsPpPrFU+MFk=;
 b=PmFvaMvvhH4Br+NL1Jh54R+ngoxUDxiumkUu1XabA9HILhh8TIcUx8+m
 hsqCUp1pKX8Xeqpq1yRwjCmbqP+Kzrps2zBbwftqlf9IY4cyBVrFhhRIr
 J77HNqXI1Ryc0YVh8Ypai6bOG5KMHZUwI+AQQrcko0D60jHciumFjSrnC
 LUcWF69oFYUVLzlBfsJ+4kOcSO2Dm/HsToIJl0YPV9ASc5rqmoIyO1+3R
 H8eBY+p7lWutMsZaUNLtV4BGhdTWqi5vT3x938IrInWPAV4CEjVswecuI
 tBmj4khJJeUJ7GoymZk5Ybvv9lrd7fAzIPTRr21dwUUhrmN3mdKrX0ZF5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="385799270"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="385799270"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 15:01:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="996319015"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="996319015"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 15:01:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 15:01:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 15:01:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 15:01:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 15:01:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3+wR3Y55xubIGdvzMXVxNlGK2CmgNSivieFrOse2s31hIiqyjL9czvebIDsD3DPXrls60lgpzGlmBgNQ0lWiKKZCsYv7try6BmxIsijOEdCAuWsV/l4xbQ90/1pBEdfg7QVDJU5CBcT4OrbaSzOBey0LsS/Yadds5IRNvOVyu/ggsMNPHvbEUQxsMn3ljmE23ePqW1uJB0+/hHlyc71uLrPxlxP43gX2NYMMp4ZVq7xmrom0SL/hZeyE+ydc/jNdbQ0lE88mpIFvp6Lcjh/PQnL5j3lg4C2v6TMDFXU/FIZRUdkhpNgaqkVHc/2+qDu1O6HU+uOPGYDj2Z2bB9QkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpbxj/bpHPHaH2BKlvb5aHpSfGXWW5UIpbFvHUZ4K6c=;
 b=I5NmWGD+6cv1ANqaWrW5xKc7dasa+NHehJQYlONevHHfiB2T/1b/NeoIwEoSi4s//6CzjGYfbh1HO6AfxpbtB59i68dsZhnicDa1VSxE76T57rYtQ3M9UZzZlx9QiE+SQjc6Lq4N8BdNpoZsPDXLE0/xututWJyEpjBOrkpHY9PYpZ7R23wj6xhuFS7V1pS2Wa+LBa5adfufXXjepJ6eM2NaxnfpqC0CefqfsbJRIVVA3GqZTKr/Any/NSzIRNv8djsYB2z6Rzi2bdwwgw+8F97wqCTRmVQm8Wi9ns72JnvJnOvJGJ3yWHee5sBJzGTFmQJ0PKIBVZkfnF4WTU7ywg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7908.namprd11.prod.outlook.com (2603:10b6:8:ea::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.19; Wed, 27 Sep 2023 22:01:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%6]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 22:01:40 +0000
Date: Wed, 27 Sep 2023 17:01:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <fmph62flkf7oi234w4456sagjcxh2qq22nm76bhvmdngozbs2c@f6fggusj73fh>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-8-lucas.demarchi@intel.com>
 <20230926224159.GN2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230926224159.GN2706891@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0066.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bd489f3-cc55-4d00-9254-08dbbfa5540d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I95fAmw0V4YhI2jr/fvYVW7SeXyGpx9a0B2EIJpl5IOeJnPJY2DxnoBwNui5g8wEIqdlk88g4/5JZc770f6LnTSrA5/JYDdXGp4jr3TYjTdf34mQa/gWEZjiQMTNW9pY/A4UvaMR+TBfze+tDFiJlS7S5ub1ZUUU8oVwd+EdLX8oOqfFoDm8UVMBTbL/QnhBU0bPy8SmbV2Z0XrZjZ3sW/+pY5DSCgJpq7oRLORdren+YvHnmIToc/2hI2+YHscdmFWYlbLz55BnAGPUAidmWoRAs9mZlArxv4ZshqA3GQEsZHBYV2hUDGHjs8ulEcaYcr/lhX1+jMJqGCJMZVGDCmSadbUbqUZHj4lJgbYX6lS92NG2poKxkEYMgIx1KDa9mik9w/4kQ9D6RF9kPhWs7L6U7w0vCZPzpT4z3ZHVJiAJ75dpTv9cHgZw54IR0mHhJXER+Xdb0rqfVK2ZcN+P4/7fN7cefx5bHeID3wKT0SdB4anofCQQM81FOaWsh+tLzzEjI7zy+dTtS16ewiTExcLbbliLHo5agPLpqV8FYboeAWlwo7x/2gp/5oHN08Am
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(39860400002)(366004)(346002)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(66899024)(9686003)(6512007)(478600001)(6666004)(6506007)(86362001)(26005)(82960400001)(30864003)(38100700002)(6486002)(316002)(6862004)(450100002)(2906002)(83380400001)(5660300002)(33716001)(4326008)(8936002)(6636002)(66476007)(66556008)(8676002)(41300700001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xdf8D4iDZCrVPrQokv8wntTusEi/IB1csZmxW0NTn2V0J7Cg9yIP0MH+8x?=
 =?iso-8859-1?Q?nntjQobBGc5R7iBz839tL9vNbY13yOZHewbX9dieiRPIZsgYDYOpmXtDNw?=
 =?iso-8859-1?Q?kDzndj+Q5tjIJDV9ggnK1ZDe4m2vC2B/Q4kej23sr5zyJLSsA/VZ3SC6yH?=
 =?iso-8859-1?Q?Yzz63kpMvQ8N/OM5EtY5wYhmV0VvBXVMSLhJtNNlcm2i4trq2IBeP2x1m1?=
 =?iso-8859-1?Q?apiVLQz79j+r321JJ6eu5r8OZhzYrpbnsLnLYHqFd2im4GGsViSScFHbv/?=
 =?iso-8859-1?Q?Hui0+4egsaIMchZgy93xKBvxEGF4n9ZVcok9VNHHh641Rt/2G4l7H6DI/4?=
 =?iso-8859-1?Q?UX8UQR1t7uqCcOYcExMRZskJH50YIWzo3HNBuqgnNpnl58NMNmRCzdFNI4?=
 =?iso-8859-1?Q?7955labaDPPxDnQxV+7WuPRd8csw1L3Po4//L1Dxz0yNazdDudg3uLI9Fj?=
 =?iso-8859-1?Q?xNrlvu3p3XDxnJ9NTYq0HtP+4XPPlbt82gyWI+gejeYOQ7ZBWeU6CCBZjX?=
 =?iso-8859-1?Q?DQPCBYHfhlnreCM/T4dfyroTyWmr0bdbQo9M08dPYHdQrQ4zrrZU0eazh/?=
 =?iso-8859-1?Q?cRsWH2KIReM10yTxfaCtXj5rj6Z+ylKK7QdYueBbM4Mj/kKr82dBOrTrOJ?=
 =?iso-8859-1?Q?yKfS4s0gKcR90uy+kfkTx7jzVFXPPUbjtMzPNzrNpM4l6UgGKFZFt1cYne?=
 =?iso-8859-1?Q?GotY4+FtiyTHNUPzKt7dEy4xwaw3mUzoj/rLg/3FyX4BsLz0IK4b+HMHLk?=
 =?iso-8859-1?Q?pta0IEjrJnL69wOTQP2aNHNnSVTcHMOmvKj1BI0iFg/4W/h6iSv7ONeNNT?=
 =?iso-8859-1?Q?HdGFPaylkr4rY+syGx32+/eVpIUkX+0f6VhF8TnLayoaV54gnU/bkpF+pH?=
 =?iso-8859-1?Q?2xy2L+ls+Sy5xwfWMdRL6pm7pT1pWsDkyIV7YGc9SY48WQCndEI3W1+YMZ?=
 =?iso-8859-1?Q?U05DFPteN9+xD03Knpundw/nFDqqQEuhvWOL5rZ9ODWdiIriD2uD1hxITc?=
 =?iso-8859-1?Q?tay6nHfyOIgQ16oeDjnmzEowpKaUH+6G58z1Dedc4CX0fs7aNk1Uo2ISPT?=
 =?iso-8859-1?Q?Q+AANaaoWbgZ+fIVK26Dc0KIr84/ssa5nBYBJhxnwBRFuXHH6Aw6C4rih4?=
 =?iso-8859-1?Q?/I4XDmaCxIDtqAlonCqbepjL1HKiYyTHfLhVAEsbD4U0lWp5pcsqLyrqxp?=
 =?iso-8859-1?Q?uqUIBlbZltdkY92zEJDvGrnKVZ1GIi+HGI/dY0WZ3tl+SuZuvo7HgQlvnd?=
 =?iso-8859-1?Q?lkIyQHLMNdSwsVIx7UtS7/y0m8vvGxgn5Ml2a2eQdVJiLsJDWN1rOuj0bj?=
 =?iso-8859-1?Q?Of7bT3xpUHlHx6c7vwgfjJT7ZLSOuKL6J5ZE9hdeX1rbTjQ2QvUgXpAjvc?=
 =?iso-8859-1?Q?cVnBSIa6Cjzf/nyh3Wlygi2HLHTg8qDC4JhyEaNBnNrHLwWsX+EIC7CwXI?=
 =?iso-8859-1?Q?PXP1FVm1j/F6TQhAKUlYR1/NQQPPuLXTys2mpm30zNnoMsdep3FnC2XZhj?=
 =?iso-8859-1?Q?nWmQSh4/t2CZzs3THvjIbaRqOIcvBGF4pNzT6xgoFkkwIyYAT4QakSck6J?=
 =?iso-8859-1?Q?s5nG6mhKNzU/wT6N2ZG0uHQTHCBc+6ImBSJtHvFZvZUtoGbc7tbHMTTcKq?=
 =?iso-8859-1?Q?hM/6ZYAOa9wETOKVhyGfLcTPNZQ1BlPCR74XNGOxhGY01efc8g82+EoQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd489f3-cc55-4d00-9254-08dbbfa5540d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 22:01:40.5361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQRv27cHqMXdHhSqF4n+Y+YPFmatMXtXCJ6ZRm7r1tJ3Kqlr9jiW091/TaBjb7Bc/RQefj6vKYtPzEFRoidJuVg9N5tiB0ZoP040CJzNT6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7908
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 07/14] lib/intel_mocs: Stop encoding
 mocs
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 03:41:59PM -0700, Matt Roper wrote:
>On Fri, Sep 15, 2023 at 06:23:39AM -0700, Lucas De Marchi wrote:
>> From gen9 until xe2, the various gpu commands use a mocs object that is
>> defined as
>>
>> 	[0]   pad
>
>Might be more accurate to say "pxp" here since that's how it's actually
>being used in the code.

ok

...

>> @@ -276,9 +276,9 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>>  	ss->ss0.horizontal_alignment = horizontal_alignment; /* align 4 */
>>
>>  	if (mocs == INTEL_BUF_MOCS_UC)
>> -		ss->ss1.memory_object_control = intel_get_uc_mocs(ibb->fd);
>> +		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
>>  	else if (mocs == INTEL_BUF_MOCS_WB)
>> -		ss->ss1.memory_object_control = intel_get_wb_mocs(ibb->fd);
>> +		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
>>
>>  	if (buf->tiling == I915_TILING_X)
>>  		ss->ss0.tiled_mode = 2;
>> @@ -295,7 +295,7 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>>  	ss->ss9.base_addr_hi = address >> 32;
>>
>>  	if (is_dst) {
>> -		ss->ss1.memory_object_control = 2;
>> +		ss->ss1.mocs_index = 1;
>
>This is an accurate conversion of the existing code, but it doesn't seem
>like there should be a magic number here.  Looks like this originates
>from
>
>        commit c4b2b2f07fe8231afb8514fab19218dec95d562d
>        Author:     Tony Ye <tony.ye@intel.com>
>        AuthorDate: Tue Nov 13 14:36:28 2018 +0000
>        Commit:     Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>        CommitDate: Tue Feb 5 12:23:09 2019 +0000
>
>            tests/gem_media_vme: Simple test to exercise the VME block
>
>with no real explanation.
>
>Since this is a gen11 function, I guess we could probably switch this
>to I915_MOCS_PTE to try to match the presumed intent here.

ok

>> @@ -2763,9 +2763,10 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
>>
>>  	blt_tile = fb_tile_to_blt_tile(fb->modifier);
>>  	stride = blt_tile == T_LINEAR ? fb->strides[plane] : fb->strides[plane] / 4;
>> +	mocs = intel_get_uc_mocs_index(fb->fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
>>
>>  	blt_set_object(blt, handle, fb->size, memregion,
>> -		       intel_get_uc_mocs(fb->fd),
>> +		       mocs,
>
>Doesn't this function expect just the (non-shifted) index?  If so, we
>shouldn't shift by XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT above.

It seems it doesn´t expect the non-shifted, but it should and I missed
that in this patch.

>
>>  		       blt_tile,
>>  		       is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
>>  		       is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
>> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
>> index 429511920..9f8e3dea3 100644
>> --- a/lib/intel_blt.c
>> +++ b/lib/intel_blt.c
>> @@ -58,7 +58,8 @@ struct gen12_block_copy_data {
>>  	struct {
>>  		uint32_t dst_pitch:			BITRANGE(0, 17);
>>  		uint32_t dst_aux_mode:			BITRANGE(18, 20);
>> -		uint32_t dst_mocs:			BITRANGE(21, 27);
>> +		uint32_t pad:				BITRANGE(21, 21);
>> +		uint32_t dst_mocs:			BITRANGE(22, 27);
>
>Should we also rename all these dst_mocs and src_mocs with "_index" too
>as you've done elsewhere?  Or will that cause too much churn?

ok


>
>>  		uint32_t dst_ctrl_surface_type:		BITRANGE(28, 28);
>>  		uint32_t dst_compression:		BITRANGE(29, 29);
>>  		uint32_t dst_tiling:			BITRANGE(30, 31);
>> @@ -98,7 +99,8 @@ struct gen12_block_copy_data {
>>  	struct {
>>  		uint32_t src_pitch:			BITRANGE(0, 17);
>>  		uint32_t src_aux_mode:			BITRANGE(18, 20);
>> -		uint32_t src_mocs:			BITRANGE(21, 27);
>> +		uint32_t pad:				BITRANGE(21, 21);
>> +		uint32_t src_mocs:			BITRANGE(22, 27);
>>  		uint32_t src_ctrl_surface_type:		BITRANGE(28, 28);
>>  		uint32_t src_compression:		BITRANGE(29, 29);
>>  		uint32_t src_tiling:			BITRANGE(30, 31);
>> @@ -628,7 +630,7 @@ static void dump_bb_cmd(struct gen12_block_copy_data *data)
>>  		 cmd[0],
>>  		 data->dw00.client, data->dw00.opcode, data->dw00.color_depth,
>>  		 data->dw00.special_mode, data->dw00.length);
>> -	igt_info(" dw01: [%08x] dst <pitch: %d, aux: %d, mocs: %d, compr: %d, "
>> +	igt_info(" dw01: [%08x] dst <pitch: %d, aux: %d, mocs_idx: %d, compr: %d, "
>>  		 "tiling: %d, ctrl surf type: %d>\n",
>>  		 cmd[1], data->dw01.dst_pitch, data->dw01.dst_aux_mode,
>>  		 data->dw01.dst_mocs, data->dw01.dst_compression,
>> @@ -646,7 +648,7 @@ static void dump_bb_cmd(struct gen12_block_copy_data *data)
>>  		 data->dw06.dst_target_memory);
>>  	igt_info(" dw07: [%08x] src geom <x1: %d, y1: %d>\n",
>>  		 cmd[7], data->dw07.src_x1, data->dw07.src_y1);
>> -	igt_info(" dw08: [%08x] src <pitch: %d, aux: %d, mocs: %d, compr: %d, "
>> +	igt_info(" dw08: [%08x] src <pitch: %d, aux: %d, mocs_idx: %d, compr: %d, "
>>  		 "tiling: %d, ctrl surf type: %d>\n",
>>  		 cmd[8], data->dw08.src_pitch, data->dw08.src_aux_mode,
>>  		 data->dw08.src_mocs, data->dw08.src_compression,
>> @@ -914,7 +916,8 @@ struct gen12_ctrl_surf_copy_data {
>>
>>  	struct {
>>  		uint32_t src_address_hi:		BITRANGE(0, 24);
>> -		uint32_t src_mocs:			BITRANGE(25, 31);
>> +		uint32_t pad:				BITRANGE(25, 25);
>> +		uint32_t src_mocs:			BITRANGE(26, 31);
>>  	} dw02;
>>
>>  	struct {
>> @@ -923,7 +926,8 @@ struct gen12_ctrl_surf_copy_data {
>>
>>  	struct {
>>  		uint32_t dst_address_hi:		BITRANGE(0, 24);
>> -		uint32_t dst_mocs:			BITRANGE(25, 31);
>> +		uint32_t pad:				BITRANGE(25, 25);
>> +		uint32_t dst_mocs:			BITRANGE(26, 31);
>>  	} dw04;
>>  };
>>
>> @@ -940,11 +944,11 @@ static void dump_bb_surf_ctrl_cmd(const struct gen12_ctrl_surf_copy_data *data)
>>  		 data->dw00.size_of_ctrl_copy, data->dw00.length);
>>  	igt_info(" dw01: [%08x] src offset lo (0x%x)\n",
>>  		 cmd[1], data->dw01.src_address_lo);
>> -	igt_info(" dw02: [%08x] src offset hi (0x%x), src mocs: %u\n",
>> +	igt_info(" dw02: [%08x] src offset hi (0x%x), src mocs idx: %u\n",
>>  		 cmd[2], data->dw02.src_address_hi, data->dw02.src_mocs);
>>  	igt_info(" dw03: [%08x] dst offset lo (0x%x)\n",
>>  		 cmd[3], data->dw03.dst_address_lo);
>> -	igt_info(" dw04: [%08x] dst offset hi (0x%x), src mocs: %u\n",
>> +	igt_info(" dw04: [%08x] dst offset hi (0x%x), src mocs idx: %u\n",
>>  		 cmd[4], data->dw04.dst_address_hi, data->dw04.dst_mocs);
>>  }
>>
>> @@ -1557,7 +1561,7 @@ void blt_surface_fill_rect(int fd, const struct blt_copy_object *obj,
>>  void blt_surface_info(const char *info, const struct blt_copy_object *obj)
>>  {
>>  	igt_info("[%s]\n", info);
>> -	igt_info("surface <handle: %u, size: %llx, region: %x, mocs: %x>\n",
>> +	igt_info("surface <handle: %u, size: %llx, region: %x, mocs_idx: %x>\n",
>>  		 obj->handle, (long long) obj->size, obj->region, obj->mocs);
>>  	igt_info("        <tiling: %s, compression: %u, compression type: %d>\n",
>>  		 blt_tiling_name(obj->tiling), obj->compression, obj->compression_type);
>> diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
>> index cf3b8e4fe..6a4ec25e4 100644
>> --- a/lib/intel_mocs.c
>> +++ b/lib/intel_mocs.c
>> @@ -51,22 +51,20 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
>>  	}
>>  }
>>
>> -/* BitField [6:1] represents index to MOCS Tables
>> - * BitField [0] represents Encryption/Decryption
>> - */
>> -
>> -uint8_t intel_get_wb_mocs(int fd)
>> +uint8_t intel_get_wb_mocs_index(int fd)
>>  {
>>  	struct drm_intel_mocs_index mocs;
>>
>>  	get_mocs_index(fd, &mocs);
>> -	return mocs.wb_index << 1;
>> +
>> +	return mocs.wb_index;
>>  }
>>
>> -uint8_t intel_get_uc_mocs(int fd)
>> +uint8_t intel_get_uc_mocs_index(int fd)
>>  {
>>  	struct drm_intel_mocs_index mocs;
>>
>>  	get_mocs_index(fd, &mocs);
>> -	return mocs.uc_index << 1;
>> +
>> +	return mocs.uc_index;
>>  }
>> diff --git a/lib/intel_mocs.h b/lib/intel_mocs.h
>> index 255eac0ff..278f143ec 100644
>> --- a/lib/intel_mocs.h
>> +++ b/lib/intel_mocs.h
>> @@ -6,7 +6,7 @@
>>  #ifndef _INTEL_MOCS_H
>>  #define _INTEL_MOCS_H
>>
>> -uint8_t intel_get_wb_mocs(int fd);
>> -uint8_t intel_get_uc_mocs(int fd);
>> +uint8_t intel_get_wb_mocs_index(int fd);
>> +uint8_t intel_get_uc_mocs_index(int fd);
>>
>>  #endif /* _INTEL_MOCS_H */
>> diff --git a/lib/intel_reg.h b/lib/intel_reg.h
>> index 3bf3676dc..f97154d2b 100644
>> --- a/lib/intel_reg.h
>> +++ b/lib/intel_reg.h
>> @@ -2562,7 +2562,8 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>>  #define XY_MONO_SRC_BLT_WRITE_ALPHA	(1<<21)
>>  #define XY_MONO_SRC_BLT_WRITE_RGB	(1<<20)
>>
>> -#define XY_FAST_COLOR_BLT		((0x2<<29)|(0x44<<22)|0xe)
>> +#define XY_FAST_COLOR_BLT				((0x2<<29)|(0x44<<22)|0xe)
>> +#define   XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT		22
>
>Not a problem with your patch, but I'm surprised to see GPU instructions
>defined in intel_reg.h...   Seems like the code has been organized that
>way since 2009 and nobody has ever reorganized it.  :-(

it's worse

$ git grep "define XY_FAST_COLOR_BLT"
include/intel_gpu_commands.h:#define XY_FAST_COLOR_BLT_CMD              (2 << 29 | 0x44 << 22)
lib/intel_reg.h:#define XY_FAST_COLOR_BLT                               ((0x2<<29)|(0x44<<22)|0xe)

but the _CMD variant is not really being used or updated. Someone will
have to cleanup this mess, but it's beyond what I'm trying with this
series. One mess at a time :)

Judging by commit e5fe17165cbf ("intel_gpu_commands: Use kernel gpu
command definitions") I believe there's an ongoing conversion.

>
>>
>>  #define XY_FAST_COPY_BLT				((2<<29)|(0x42<<22)|0x8)
>>  /* dword 0 */
>> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
>> index b8959d073..6c410e8a8 100644
>> --- a/lib/rendercopy_gen9.c
>> +++ b/lib/rendercopy_gen9.c
>> @@ -138,7 +138,7 @@ static const uint32_t gen12p71_render_copy[][4] = {
>>
>>  /* Mostly copy+paste from gen6, except height, width, pitch moved */
>>  static uint32_t
>> -gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>> +gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>>  	      bool fast_clear) {
>>  	struct gen9_surface_state *ss;
>>  	uint32_t write_domain, read_domain;
>> @@ -173,11 +173,11 @@ gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>>  		/*
>>  		 * mocs table version 1 index 3 groub wb use l3
>>  		 */
>> -		ss->ss1.memory_object_control = 3 << 1;
>> +		ss->ss1.mocs_index= 3;
>
>Minor spacing glitch.

ok

>
>>  		ss->ss5.mip_tail_start_lod = 0;
>>  	} else {
>>  		ss->ss0.render_cache_read_write = 1;
>> -		ss->ss1.memory_object_control = intel_get_uc_mocs(i915);
>> +		ss->ss1.mocs_index = intel_get_uc_mocs_index(i915);
>>  		ss->ss5.mip_tail_start_lod = 1; /* needed with trmode */
>>  	}
>>
>> @@ -187,7 +187,7 @@ gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>>  		ss->ss0.tiled_mode = 3;
>>
>>  	if (intel_buf_pxp(buf))
>> -		ss->ss1.memory_object_control |= 1;
>> +		ss->ss1.pxp = 1;
>>
>>  	if (buf->tiling == I915_TILING_Yf)
>>  		ss->ss5.trmode = 1;
>> @@ -282,10 +282,10 @@ gen8_bind_surfaces(struct intel_bb *ibb,
>>  	binding_table = intel_bb_ptr_align(ibb, 32);
>>  	binding_table_offset = intel_bb_ptr_add_return_prev_offset(ibb, 32);
>>
>> -	binding_table[0] = gen8_bind_buf(ibb, dst, 1, fast_clear);
>> +	binding_table[0] = gen9_bind_buf(ibb, dst, 1, fast_clear);
>>
>>  	if (src != NULL)
>> -		binding_table[1] = gen8_bind_buf(ibb, src, 0, false);
>> +		binding_table[1] = gen9_bind_buf(ibb, src, 0, false);
>>
>>  	return binding_table_offset;
>>  }
>> diff --git a/lib/xehp_media.h b/lib/xehp_media.h
>> index 65a72d950..087eb2ec0 100644
>> --- a/lib/xehp_media.h
>> +++ b/lib/xehp_media.h
>> @@ -109,7 +109,8 @@ struct xehp_surface_state {
>>  		uint32_t double_fetch_disable: BITRANGE(17, 17);
>>  		uint32_t corner_texel_mode: BITRANGE(18, 18);
>>  		uint32_t base_mip_level: BITRANGE(19, 23);
>> -		uint32_t memory_object_control: BITRANGE(24, 30);
>> +		uint32_t pad1: BITRANGE(24, 24);
>
>Should we name this 'pxp' to match the name used in gen9_surface_state?

ok

thanks

Lucas De Marchi

