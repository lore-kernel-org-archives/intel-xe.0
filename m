Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE60E71D56
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:51:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975EC10E577;
	Fri, 29 Sep 2023 20:51:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED6910E4FE
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696020700; x=1727556700;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e2KuF7iwGoO9LOUzgZrtmxrfH881GVW62EfPVwHcQSk=;
 b=jfbiXG0W0KSmyEQaRNwIb42kWycpXakViyO5FwxmhMmaOxjEuPRqdaJ8
 875Lr843zT7PHga7yJcPh30kE+Tw1nsdGfeO9BU4zK9vkrjzofdKtXJVu
 w6LCBaj0G3CcCnT1sMLC5B6rhFsb5CllCSLVDp7/gxWI/wh5IPBwvLuDa
 Zp25brkuMjNqTqFnxo/oTlJBiOBrmlkDGxWuT5fSX8CK6DtkGrDCUOe26
 bYHPQ0YNOTKvCaOA3rAt7vo3hm0d8D7ZLXa/rx4ZH6qj+B/xaIT5Stl+e
 chhT2dibRu5hXnmeDqEeDnU3otpmtoQdzTslIv4UEEhhQl5wpG09mNjBk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="367430843"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="367430843"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:42:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="964287"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 13:42:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:42:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 13:42:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 13:42:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=at8jLmXUD2tkzpRXFa5iNT6gWB1c0sPZlqpLM4BI9+Kj2y1K1pzH778tiOwSJv06hjxLOaG/wCxN5j33n2KlOi3LuJ73KEZeGOfBjhQBqgSRornuoaHC/Xn2kUdD/ok/3U+FTCYzYpshwBMlf6itp8OF4ViZN9UpQVf2mhzIh7OrdD0mCxREFlpfPgXMUUwnxOVeEBRBNk6e1XHP3WDSsugPGNzgyquimccpBsEIDlHUZaYLDYrWxG1J6SP7xoQFor5aV0m+5bxDaTJDclKIy5xxPN9ZV74nxUJ0KX90n2YJ6zCAba6/jJ7gqwQ2hKFW5U+/BDDS7cKMNbTfH7EbUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbI6Vr/2h4RAWTUXmDFmejspIBUOOq7f5lDRFZr5Glw=;
 b=Fxr2KUQJfWp+bDOLY6rtX8ptoyaVWzGEZ4VGVyJCjk51MT2jKm3yTnM0FbZLqRrJ17F9z5pLbfm61n8kMlOpdbaO5iplJmQ1GC60M1BfJW4sv7/dLd57Mpp++gtvmU3F7znFgYN103wKlaQE31Kn+nPEptFUwDTJ7gL/PDWW9OOoKnEHVf4/5uWdN3rqNWYE3T7IEDGfL/HvClY/Ib5Hk0UF5a6HYFHEbGs3t+ak+dU8u9WWjTitDtPu8Y9bIaqt9ZGgde98IferCk6NuT3KbF/IAH8UADEg2d4baYa47rAtJHetl6biark9frzif13QpJPd9aYAibOKyWxS45BnJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4877.namprd11.prod.outlook.com (2603:10b6:a03:2d9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 20:42:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%6]) with mapi id 15.20.6838.016; Fri, 29 Sep 2023
 20:42:31 +0000
Date: Fri, 29 Sep 2023 15:42:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ojjpmlz7ycio5q4qyt3wklovb2mo23axn2upsvhrssbnmfjfru@nmqcfkqs7hco>
References: <20230929044351.3145468-1-lucas.demarchi@intel.com>
 <20230929044351.3145468-4-lucas.demarchi@intel.com>
 <20230929161022.GH233750@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230929161022.GH233750@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:74::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4877:EE_
X-MS-Office365-Filtering-Correlation-Id: ae93d4db-c4cd-4a20-e550-08dbc12c9a0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uarUYu+R25tD+OD+zRWQI7/kgnvSExIjAS9FXMCLKBctv7HhVhmgB2OBhYrjh0+AUNhHTh5YVcxytHCxMgIeW0KUGPonKnshMAQS3sElETGF7iGFgQjYgsZKOx2NcR0R/ArvyxdUy7nIHd7J832eZqSbesRwrUljhsDRTtDLgr3GxKtmpmoopI402OWz5vByQk7ShIw3JHmH7cwbygmULgRmWHZgMT0WAi+tB1vmvYLSziueeihh+3D0ZGqQhhyOnT80z2Ry6d0AOs/Xlxo7iCIG3JUbxVqtuQCqbsa/+OppV53siSmEolL3RZ8RGlOyDlb3jxazcR8a+HbhxE6yqPpFcx9ywR9yBE3i1jMKGCTH1sO6kyg+bWD1n5ky7HvSmcc/O4XrQnmskaS4CTS7hM7DeY9OqUPN0tcqki9Q1C56cZNfg9m68ARu4mPauo34XTIOFS/PhXk31u7dG5bnN5F90ikBIByTOTVjbLy0jPwIpozpuWRtuEuB8BuOS2pX0FQuKr54WBRRKOJb/Px/8urRX5OIx9LXwmc40hLe05rI5e4WEkMsP6JOYAWnKdNg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(396003)(39860400002)(346002)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(8676002)(6862004)(41300700001)(8936002)(26005)(66476007)(4326008)(316002)(2906002)(478600001)(66556008)(5660300002)(66946007)(6636002)(6666004)(6506007)(6486002)(6512007)(33716001)(9686003)(83380400001)(38100700002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UT/ZJah0PgqqHu48JMU8BXPezNxwF5QACb2Vy0+WSP70JjJCC8fFEcJgvHf+?=
 =?us-ascii?Q?lDvr4/oYFnbEjqau3GMFDSYBk6GpX/KgaOdyH39J1GimoAdU03fnazqln6yK?=
 =?us-ascii?Q?vzVGSq3KlMysvyOyXXEkEM+XlJNNkB7FstZhoiIZg/8vJmNeiuTYJ+ebNusQ?=
 =?us-ascii?Q?+7iXEKWzHqJPju+R0ZGom81c8m+Du1NFMI40L/+Nu8nJeE0xhOXLDVAG9Xmn?=
 =?us-ascii?Q?ApnOcDn8+tOafRYPkdQ2gvtBlyHNTVqrhNalkL3EjWZ7N1EtDTVHGYA5RP5F?=
 =?us-ascii?Q?IJ6aCJIZXi+ACrRXxKNXfYWFDe62L/1VzUY5pVTxjnB5qJ9Ikvu4t93r2JvF?=
 =?us-ascii?Q?pdpwiv6s9+fvVmP5eEgc/gHkXNg41DMUC1TDdqU3ej7CFbKw6RO3Q7CVpSqs?=
 =?us-ascii?Q?Po1ybMgFFUOY83Gn9KDe1JYjUCqM7dO0vpnWNteIEGs7G1O867l409lxkHCr?=
 =?us-ascii?Q?gc1+bjb8zn3C2xlcjTN8IL20+0jE1U4gDw7Qc0Qqy3bz0AgF9q/C1lR0QyNX?=
 =?us-ascii?Q?1hid/Y7lCzz+BEPRV7ljxmTwOVWeAM4qO1UqM34E+e5PVnnD2PkrItbWmUPp?=
 =?us-ascii?Q?i+WmXUk16VIPluh/OBnqZzBZhaNrhD6/p09aftzvZPRE17ozns5YMG8Eu/2T?=
 =?us-ascii?Q?a8p60RxLykGnut9yvJRVw0wdvXuNNgexYk3gZhJco77tcCiDOpQOA9ruii1M?=
 =?us-ascii?Q?RFdW9hdqolXm9qdI2B1pPigvYz9WH0z+OtCA6FrNzzmBP+JUTgbTpcJwfvhe?=
 =?us-ascii?Q?vjWpP+dyNI9h/5mH/Q3PDf6UkO/YftGNtkdf+EqrpCQU6oYv29NDY2zcN02m?=
 =?us-ascii?Q?PYH/Y4bNMSPEgX3Ca50jBULGtabqEfq44s7LGMyTHmvWkBGxEWUYOR5tp+sW?=
 =?us-ascii?Q?rVKa2nq2JmAcLBpUToCGY6VxWgUjOftE99xOfKuGCWDYFXn92VG8prVf7S4Z?=
 =?us-ascii?Q?Q8FO1YuBf1zZEI7JgUiDkXIXWnca2CwOSB9rH4YgCXqYoyof7upcwucUy7js?=
 =?us-ascii?Q?D1h5ALGmeKfVONE/vvfxsIUkoksxkewMZUvy0A9N2l1nfeiLn1OrvfJSG0Nb?=
 =?us-ascii?Q?Hg0O0LXd+sRkZm+bTp2Bx2A0+PdHaN96CO//ZxWPCfasngEHR/18quQQ0AA+?=
 =?us-ascii?Q?/e6PFhY/xRjarUszo3uArwFr7D6pzibOJJ90gNdfnu562EcGY5Um3JAp/CfT?=
 =?us-ascii?Q?CA4DZ5rWrY29Xuo2tgGtgNTj7KB7abfwtUnFJAxNORlZUxEOxV1TspiW02cg?=
 =?us-ascii?Q?q6N42/5HHTP1A+0qWS2a8FkRiIQDFIzBJ6a4nWGZHT8lAngpM1BM4+usXHgv?=
 =?us-ascii?Q?RiN43Wtw+xkbVdhD6w/CntQToY7dy5WbvqMKFnkWtcLQIfHCHz5mtDa9DXCm?=
 =?us-ascii?Q?wWtgpZFSzsPHfNkYHMjrROOmVOQOpB+/sqKPDZDfD1p3HsYg266JC7QgQP5r?=
 =?us-ascii?Q?F7c1Ybwrqq3Qn1cMVR8Mx4qYI8us6pd+WvgaKJwAB5dDyvj4ThYMRfmppnv1?=
 =?us-ascii?Q?QL2+7/kpDkh97Bi06Od6xZPd/knGEbR42mCHP23OdWwrbN3rZQ1DKixJVZIu?=
 =?us-ascii?Q?1Th8RIP6GOJYAUP+DozGusa3ykZM6HiZVKhKIKe/6fpTu6+42JB9WsDQSv/I?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae93d4db-c4cd-4a20-e550-08dbc12c9a0a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 20:42:31.2934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FY9Hoop8VeNF2N0h4P4knTRYxThdwkdsahFHQs8HkYrBHReULr1lg2B9LbsJfG9ktX8Ifd7+xawXSqgKyFqbkl194MShMnmV38GM4GnbG5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4877
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/xe2: Set tile y bits in
 XY_FAST_COPY_BLT
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

On Fri, Sep 29, 2023 at 09:10:22AM -0700, Matt Roper wrote:
>On Thu, Sep 28, 2023 at 09:43:50PM -0700, Lucas De Marchi wrote:
>> From: Haridhar Kalvala <haridhar.kalvala@intel.com>
>>
>> Set bits 30 and 31 of XY_FAST_COPY_BLT for xe2 platforms. Its setting
>> Tile-Y for source and destination.
>
>This explanation is actually the opposite of what we're doing.  Setting
>these bits marks the Y-major tiling format as Tile4 instead of legacy
>TileY (the setting of "0" for these bits to select legacy TileY isn't
>supported anymore).
>
>We're also missing the explanation that we're seemingly supposed to set
>these bits even in cases when the actual surface is linear or x-tiled.

Yeah... I think rewording it like in the bspec would be appropriate:

Destination or source being TileY is selected on dword0 and there's
nothing to set on dword1. According to the bspec, "Behavior is undefined
when programmed the value 0". So force those bits to 1 in xe2.

>
>And this patch also highlights that we're still setting these bits
>incorrectly on DG2, PVC, and MTL --- on those platforms it may not be
>mandatory to set these bits even when the surface is linear or X-tile,
>but when we're working with a Tile4 surface we definitely should be
>setting them (bspec 47982).  The simplest fix is probably to just change
>the version condition here to start from 12.50 instead of 20.

Before xe2 it's doesn't have the comment that is illegal to select
"legacy tile-y", although applying a platform filter does filter the
value 0 out.

Humn... can we go even simpler and always set the value to 0b11
regardless of platform? Even for platforms like TGL or ADL, I'd expect
these fields wouls simply ignored if linear is selected in dword0.

Lucas De Marchi

>
>
>Matt
>
>>
>> Bspec: 57567
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 2 ++
>>  drivers/gpu/drm/xe/xe_migrate.c           | 9 ++++++++-
>>  2 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> index 1fdf2e4f1c9f..cc7b56763f10 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> @@ -57,6 +57,8 @@
>>
>>  #define XY_FAST_COPY_BLT_CMD		(2 << 29 | 0x42 << 22)
>>  #define   XY_FAST_COPY_BLT_DEPTH_32	(3<<24)
>> +#define   XY_FAST_COPY_BLT_D1_SRC_TILE4	REG_BIT(31)
>> +#define   XY_FAST_COPY_BLT_D1_DST_TILE4	REG_BIT(30)
>>
>>  #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
>>  #define   PVC_MEM_SET_CMD_LEN_DW	7
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 2e6ce2daf414..b682d34bc1e5 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -543,12 +543,19 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
>>  		      u64 src_ofs, u64 dst_ofs, unsigned int size,
>>  		      unsigned int pitch)
>>  {
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>>  	xe_gt_assert(gt, size / pitch <= S16_MAX);
>>  	xe_gt_assert(gt, pitch / 4 <= S16_MAX);
>>  	xe_gt_assert(gt, pitch <= U16_MAX);
>>
>>  	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
>> -	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch;
>> +	if (GRAPHICS_VER(xe) >= 20)
>> +		bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch |
>> +				    XY_FAST_COPY_BLT_D1_SRC_TILE4 |
>> +				    XY_FAST_COPY_BLT_D1_DST_TILE4;
>> +	else
>> +		bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch;
>>  	bb->cs[bb->len++] = 0;
>>  	bb->cs[bb->len++] = (size / pitch) << 16 | pitch / 4;
>>  	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
