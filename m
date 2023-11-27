Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88145C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 03:21:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AD910E163;
	Mon, 27 Nov 2023 03:21:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A0C10E163
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 03:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701055306; x=1732591306;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ds4nfhGriAJAjxZzmsEj/1omizuiZDl9c7p41gHlxHA=;
 b=UKSfTUEyUOPusiG2eto8iyz2YTjm8v9OcPKGDyfCGb/QPvT4nNburGwo
 VSFzzZLVP9vdJR9VsJ2Vwb15A7CGqcnTGRMLV20VaFiBGrH+ypmJQr73d
 2TfnG8yDn2sXUR6J/SF405TLp0lfitnAiBdszWi8v92Srd9RQp1mrkiVo
 69bN+GQUDxXKVCZKGNv7KpuOn3yQe2oZ3RE1l6fhRuqB3smTlyirkKUTb
 6i2bwIf2m3GjBZ8vyDTF70euyOfhjDr50xn+bYOs6hkMVYGPYaN5n2kRH
 yJxhQstid7iafuEGcZ3BW+m7NfE+7g42mmLn0t4f/q8BmQbToG/ozvc2M A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="371981877"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; d="scan'208";a="371981877"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2023 19:21:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="802544634"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; d="scan'208";a="802544634"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2023 19:21:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 19:21:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 19:21:42 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 26 Nov 2023 19:21:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/Fu/L3ujU8fK203VQuVH+/3hVEIGKJi1+yK1vTrmQwWC4d/j0PArvz7vmo0LEPHJUI+L0cW/VPiG7WzGlLgcSzKLneHSh15XrywcbE23EHgwZuz1HZwXkejJVWIb1fz1ccXYsjIv9kTl3v5P7Aw2dkqDH6566FJ/j4kVApmKOFNFGZnCO7kMxdquGX5kXAub3IMhBIHNqZC6P0o+MnEKOQhycQ2THqN17JDL9iMEVjdmMK5/xJ2+KvXjaCGBSbgQvAwg6jUU1eiQWJuvrTM4N1GS2Y7m6/z2nj/x9bbxBvD6GqnLlHSU7K8JzRmgvzzL7LOmnx6EMDIWSlKj8GwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5sOawzkRP64s4+rVS6JzMCmwjBO+mUoWiURKBab5GM=;
 b=MaHX3MynOs1aLZ/OWP1+v2+l8AdTxtqa1ufIhAg4VoDAJYSBvotSvtsIx2PNLJV2IW5a73vPQx/Ru2ffnlSKV2dQd5O2tuwzwpnus/wjIORZOXXc5SODiApOhQzRoPlJz+e46obIRi2iW9eoPuozCLlkymhAuAYMyZN+AogU2iFSwgWp61Cyl5/j1PEh9mggCvhAuBkPp6et+ZgOWsBIk59933OnOohD4kJdfAKMbZeMWVY1Uwa/9JUtx5jPFkwKVO9wnJpjY/PL7BeSeMBYGqgkVS/85ECd6Cb/+WCOyPc4knNzLffsD8ffU4qGwF6saSS8KNN989bLcMSgLBxQ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB7269.namprd11.prod.outlook.com (2603:10b6:208:42b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 03:21:35 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 03:21:35 +0000
Message-ID: <2551b2f7-3ad4-4c1a-b5b6-f1dbe336ba90@intel.com>
Date: Mon, 27 Nov 2023 08:51:29 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
 <20231121100906.3587649-5-himal.prasad.ghimiray@intel.com>
 <07b47a67234eeef5208214c9ea60272771aaaa5c.camel@linux.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <07b47a67234eeef5208214c9ea60272771aaaa5c.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::20) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA1PR11MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d3b1d22-115d-49b3-ef9f-08dbeef7f5cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yVG2giqKW//hEEg230l3b2QzYdcWepETdsJv9SvZINMBl2+FdHNreq9B7H5YRNGiFISSoezmbPG0PlnjZFoRFka71fDeJv1yfufJbrb+w1M1ioAqiZ9c2fuTJBMBO6r9MCmf3njZGSkbEoZc2hO4lhZorkHN3eC1ae/NPNPKjv5NxHpPcQJkFOBUoXUYCYOSnIcz5o1QhMWDJOhC3C2lslwxcNFI/UXAdlIu6da3LPz0fGQpu5feRXvD+mqQQ6p5nMx3B0OIHM5oNXhwu23lqCzQZKQqFxcTnzHvMl65cBIlmNywBG+Aq6GCbyC4jwtXdWbPDWdIVwVESLHdKxynD08TwIubeymzJr1dE86m7IRNZrtujFqScw1Hyl+gARjuMSBqMu19GYev2Fd2u/Idcszmor2gJEiqHCTcpgtnJ4Mo7ColhDj/Rt8Q9iTHIHlIE07xqSHsqi5prWsVVxwDD6JOXivsFi4EzM7Vdx6Bo1z/vyHKmvIJQESAVcQRl4bFEXzASrNlM2K5AAW7Yxeq37ymrdkyWyJKoH4jtdBzefb0k45IRS+zCYmX4MPuQSG1RtUXHBaMC+leNLZWQvRNVk77FEziNX3AAyuBambU0TNaSSWkMbqUFC3rVChBAJkePEIkailO1sbMZRl7cM4fHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(366004)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(41300700001)(36756003)(31686004)(4001150100001)(2906002)(83380400001)(5660300002)(82960400001)(66574015)(26005)(86362001)(2616005)(6512007)(53546011)(6506007)(6666004)(8676002)(8936002)(31696002)(6486002)(478600001)(66946007)(316002)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm4yd3ZzYUlSWGRTYkpuU05jWFlRbks3ZkZDaDB5dURBUXNXc1ZjUitCV1Js?=
 =?utf-8?B?azBlbjdBVEZINHRZeGplWkR1Y3ZpNHBlajVxZXpKLy9IRTBMT2Q4ZWd2cUFl?=
 =?utf-8?B?L3RNWE5yY1B3V1pScjQ3SGNPMFlBOVA5RDRubWRzU3FqWTFSZlF5amN6NUs2?=
 =?utf-8?B?SSt1ZFhPUnI0bzZqNHVoQzdMZlcydHFHd0RYa0JtR2FuT3F1TmJOcmJFTDht?=
 =?utf-8?B?SktqZE1LbzJTdkIydmxzSTlOTW45bVAyMWZOSTEzcDM5alNXeTI3Q1RKMkNU?=
 =?utf-8?B?V2k3Znh3WEJCNWdYRnk1bzNwc1U1Y0NXWUdEdDB1NWkxSmxBRVZXaDRDL1NT?=
 =?utf-8?B?a3B3TXNMRjhpZS9uRlNQYVdRa2d1aVlRdndHcnhmVDRkcy9KdHIwMzlwVDZk?=
 =?utf-8?B?Mkt2UG9VNmp2aHhtS243OEFab3VabWp4Vk43SWh6My9mQ25kQmw4NWlpS2Fp?=
 =?utf-8?B?d1dKbC9JUnVwRTV1eC9lanpOa2pmdWRZMjZSb0o3WTBMRVJUUEVjSElYMm53?=
 =?utf-8?B?SExHN0h5b3hvNTRVOWdxLzNXRTRrYzBOTTNteGJOWnJZWHlCaENaanFnSWl1?=
 =?utf-8?B?QXdFakIxekQySDJvVXdjUE9WL21kS3o2dFk3bFdWd1JkOUszaDhPVExpalor?=
 =?utf-8?B?d0dwY2lBY1Exc2I4d1NJcmJOcHgxdUltZ2I0cktEa2o2emdnU1l5dmg3ODJw?=
 =?utf-8?B?SmcxUGtuV0VkckdBOUVMZStBVG5haTVieFhQYkFYUEd1Q2NWWHRub1JxQi9D?=
 =?utf-8?B?emVvRll4MEtDZHZoeVV3aVRLVVlSeUxsbXpjdVpWa3B2UC9YYzQ5QVp0emUy?=
 =?utf-8?B?S2FTamFkMmk4QjVSeWQ4SGY5ZFFwcmMyYm1YWm9vN3poWGVBRFVYSy9JaFNH?=
 =?utf-8?B?QUJpRndmMUZ3QldXVlRpRWp2RVg4bWRqTnRFbE9GTXhFV3BLN0p3M0w3VDZp?=
 =?utf-8?B?TGtEcXE2anFtV0JpeVFNOUNqUnB3RkRQTGhiNzNyLzcvcnkrWCswOXphUjA2?=
 =?utf-8?B?VWRNWXZDUk51R1V2aTNUb09rQlJzTjZ6TFRQUEtDNk1DSXRuM2JIUG9kcmdV?=
 =?utf-8?B?V2ROdXNNcUlxRDFCUVVNdk90UWo5V0VnSlhmdTJnZTgwNTc4V2FNOENySHUr?=
 =?utf-8?B?V1daekVTVEtiSVNzTGFpaGJkT2xLRG55Slp6TGVBVDJTNUZ3UlNuUlB5eVo0?=
 =?utf-8?B?VEp3UC9wZ2k2VVBtc20vN3MvZGhXQWUybWJsZ1ZCbUhSS3NWcVhuTFRiQlhY?=
 =?utf-8?B?UXpaZlRBYWtIeFp0Z1NERTgxMzRnMmkvOFRQMWtlUzB3ZUFHVDdOQXpTaFho?=
 =?utf-8?B?US9TWnNFRTNCSVUxcEt6dy9PdWVQaysxOXhJM01CMStJMWxXZW13dVZBV29v?=
 =?utf-8?B?SmFML002M2ZvNGlMTzRoL21JWHR0OGEwUDlnWEo2SGNjV2lySzJ5ZjJwQ3pR?=
 =?utf-8?B?OUFrdVBuc2g3aEFNWWY3dVE1bDFuYTlDSmxhQVhnK0F5b2owY3VienJ1cFpl?=
 =?utf-8?B?S2d3RFltMHBJRkpWb1BWRzFJMUNneVFsUUZTcW5BbTdsR1NEWms4eTJIM1hB?=
 =?utf-8?B?SDlQRlRJbUN6eDNwWHQzZXFiQXJUVnRGclZlbTRzaG5jK3R4b1JqcUNvVkdN?=
 =?utf-8?B?UHN6MTR0M1J3T1BPRTQ4aVJjRnlVTEZwK3Qwa2JZNWtGM2FjY2NvcWwwNEVE?=
 =?utf-8?B?UzF0YzIrWWlkQXA2N2RyVlFQdDBCQ00vNHJha0tjUGQzODhSVmw2d05zK0FW?=
 =?utf-8?B?RGpxdUZ2QkJXRHpWclNNWStEelNaMWxDcDZOU1lldVpnbjFmV2xlRkpybW5Z?=
 =?utf-8?B?bXdWMHhiZUR3TXN3VHdDOHl5T3pzT21KeldidkQ0dEZac1FQNFc5WVRFR3RM?=
 =?utf-8?B?TVJIQWZVY2VHS01BTHpUaXorVlRsL0M1cVVuZGlqZURXR2ZZUEkyenRMRlQ2?=
 =?utf-8?B?NzNPc0xlekxYb2RYSGY3WFNjeVE2UmdLckRvRDhBcHh0NC9EZThiYWtURngr?=
 =?utf-8?B?aFhwOWdObUMyTW5jRXhKZnNZeVJVYm1rMCtIRGZXdlhQV3BSdmNQd3hGSHd2?=
 =?utf-8?B?Wkt4RVpMbDBUdzFGTDNkdEQ3VUdxbzBVZzVZZWpJYU5CdW8xYjFTSWtTUkYv?=
 =?utf-8?B?c2c2Kytnd1R5aXFndGxZcHJxd3BJUFBxWlJPTVR0Q0ppOVRNSnZMdmh2dmVQ?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3b1d22-115d-49b3-ef9f-08dbeef7f5cd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 03:21:35.4329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVVqJvq8/Orah/5SO6FFxdGbKtGHYCornTBf3FDwX8FHT2DVzCiWbhMcGy3BAQ2XmkYws3rg0NIhLR8+wKGjhwXXpPbXmCOd4fqnXLq4V5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7269
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v2 4/6] drm/xe/xe2: Updates on
 XY_CTRL_SURF_COPY_BLT
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


On 24-11-2023 16:41, Thomas Hellström wrote:
> On Tue, 2023-11-21 at 15:39 +0530, Himal Prasad Ghimiray wrote:
>> - The XY_CTRL_SURF_COPY_BLT instruction operationg on ccs data
>> expects
>> size in pages of main memory for which CCS data should be copied.
>> - The bitfield representing copy size in XY_CTRL_SURF_COPY_BLT has
>> shifted one bit higher in the instruction.
>>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  1 +
>>   drivers/gpu/drm/xe/xe_migrate.c           | 23 +++++++++++++++++----
>> --
>>   2 files changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> index 7f74592f99ce..47459841aa69 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> @@ -13,6 +13,7 @@
>>   #define   DST_ACCESS_TYPE_SHIFT                20
>>   #define   CCS_SIZE_MASK                        0x3FF
>>   #define   CCS_SIZE_SHIFT               8
>> +#define   XE2_CCS_SIZE_SHIFT           9
>>   #define   XY_CTRL_SURF_MOCS_MASK       GENMASK(31, 26)
>>   #define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK     GENMASK(31, 28)
>>   #define   NUM_CCS_BYTES_PER_BLOCK      256
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index ed2f3f5109f3..06706fad67aa 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -523,21 +523,31 @@ static void emit_copy_ccs(struct xe_gt *gt,
>> struct xe_bb *bb,
>>          struct xe_device *xe = gt_to_xe(gt);
>>          u32 *cs = bb->cs + bb->len;
>>          u32 num_ccs_blks;
>> +       u32 num_ccs_pages;
>> +       u32 ccs_copy_size;
>>          u32 mocs;
>>   
>> -       num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt),
>> size),
>> -                                   NUM_CCS_BYTES_PER_BLOCK);
>> -       xe_gt_assert(gt, num_ccs_blks <= NUM_CCS_BLKS_PER_XFER);
>> +       if (GRAPHICS_VERx100(xe) >= 2000) {
>> +               num_ccs_pages =
>> DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
>> +                                            XE_PAGE_SIZE);
>> +               xe_gt_assert(gt, num_ccs_pages <= 1024);
>>   
>> -       if (GRAPHICS_VERx100(xe) >= 2000)
>> +               ccs_copy_size = ((num_ccs_pages - 1) & CCS_SIZE_MASK)
>> << XE2_CCS_SIZE_SHIFT;
>>                  mocs = FIELD_PREP(XE2_XY_CTRL_SURF_MOCS_INDEX_MASK,
>> gt->mocs.uc_index);
>> -       else
>> +
>> +       } else {
>> +               num_ccs_blks =
>> DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
>> +                                           NUM_CCS_BYTES_PER_BLOCK);
>> +               xe_gt_assert(gt, num_ccs_blks <=
>> NUM_CCS_BLKS_PER_XFER);
>> +
>> +               ccs_copy_size = ((num_ccs_blks - 1) & CCS_SIZE_MASK)
>> << CCS_SIZE_SHIFT;
>>                  mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt-
>>> mocs.uc_index);
>> +       }
>>   
>>          *cs++ = XY_CTRL_SURF_COPY_BLT |
>>                  (src_is_indirect ? 0x0 : 0x1) <<
>> SRC_ACCESS_TYPE_SHIFT |
>>                  (dst_is_indirect ? 0x0 : 0x1) <<
>> DST_ACCESS_TYPE_SHIFT |
>> -               ((num_ccs_blks - 1) & CCS_SIZE_MASK) <<
>> CCS_SIZE_SHIFT;
>> +               ccs_copy_size;
>>          *cs++ = lower_32_bits(src_ofs);
>>          *cs++ = upper_32_bits(src_ofs) | mocs;
>>          *cs++ = lower_32_bits(dst_ofs);
>> @@ -992,6 +1002,7 @@ struct dma_fence *xe_migrate_clear(struct
>> xe_migrate *m,
>>   
>>                  emit_clear(gt, bb, clear_L0_ofs, clear_L0,
>> XE_PAGE_SIZE,
>>                             clear_vram);
>> +
> Unrelated change. Please remove, Otherwise LGTM.
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Thanks for the review. Will remove unrelated change in next patch.
>
>
>>                  if (xe_device_has_flat_ccs(xe) && clear_vram) {
>>                          emit_copy_ccs(gt, bb, clear_L0_ofs, true,
>>                                        m->cleared_vram_ofs, false,
>> clear_L0);
