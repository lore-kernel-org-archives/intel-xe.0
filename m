Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0701C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 10:00:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FE410E0BD;
	Tue, 21 Mar 2023 10:00:04 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F43410E0EE
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 10:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679392802; x=1710928802;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=quYxbqwXasKbiOg5T34zMgvS0ydABTHxDGNsSWJBO6U=;
 b=ZWFbgNhlYI3DsOKdx5PBkhYsKjSl1F04mJL1/VBJeS5MR2hD2xHSrhoc
 wNjtx5C0OCEXsTCKvQJHv8XZ9b7tqSn0VwnG26sSZcQXCr4Hzs7tbLvdy
 dHjwjYHQvTYs6D9grVI6A4s7UOLNm+fX59IJPx4MtucWiifigWqsNHHrM
 tyrc2fdhnfzhK5S3dOUEk7fJtCof6RPYUugrIMz58JEA49lRwzDILMzQz
 zp42nwHZhNLHO6mYoW+z5itu+1pPQOlsBWcwFh7eXoD2djKaT8jKufxCB
 kF+bfFJkxfodmgdCrX6P1TH0a9Dlgucupl2WNdr2z72qGJTOtUlXGMS/p w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="319288224"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="319288224"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 02:59:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="927346386"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="927346386"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 21 Mar 2023 02:59:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 02:59:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 02:59:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 02:59:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 02:59:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9XCHpMarv9k+zOAFN8TE+UJU/QcAPuWEaELV/3fDRJUDjbxvdvUGJXF7vkPv4UMtFCpJE9UU1q5c1R7D5xt0CvxVZikk8WRDQLO/tLxCpoeUOleS21TJsmE8m89JV8NYpdQlLLI/gfLaLl2cxebd673Lgwp/a2v8MOgrOkVr7SIfcMcV/Mxi/CihgKh2LI9HBHMgG52Q1hA5M9uiIrdIzAYlfeugUvVEW6NkWEBpzSfTQ0RkaR2G63X07xsYubxguRPvxmwCn37IbPVff0BKqdfK1YWsPk4A8gjXaSj0UV7JHBehMwC1xLBjVzyzXnLAI1k++90hjj8G01xpJoeug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvFntgg9qjDe+y3C0pT96T9zgDfRmf+xK8wp7CVyFqI=;
 b=NSa+OARdbyiY584rzD4XRTuu8BHSXoqqOFbzZX1fI9Lr4Zv4hFE/0FHJig1lMvSsVAOdtDkLvy2Bz8XEwuVLBwhUdSzvbpn5O4DB5ruuqS2hC84WZXRBAFMxFig5pvHHvToeO9f2k24y4cmJndNa3SQbd4gV7Vg4MDdkDAhwTUFaFbBzLfwJs/whfcKSBUlz9j/O7G1MgBPxNfX4Mhnni0PhepuUiyeqke1rJBUi5Ttf69EZFfl8QcMGr4KxCcOOW6GOYE29q1Kg59bh21lDOVQ5Lu4ytcnMrCOqd0RAxVoWsPzch/zKgbJ1tfJjhEwDRShMWthhBtaRUnySTWfCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by PH0PR11MB4887.namprd11.prod.outlook.com (2603:10b6:510:30::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 09:59:39 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%4]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 09:59:39 +0000
Message-ID: <86d4b9ca-eccf-023a-c4b2-1acf1297eea4@intel.com>
Date: Tue, 21 Mar 2023 11:59:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230321091035.133800-1-matthew.auld@intel.com>
 <20230321091035.133800-2-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230321091035.133800-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::20) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|PH0PR11MB4887:EE_
X-MS-Office365-Filtering-Correlation-Id: ac6c35b9-9e6a-4d05-3573-08db29f2fbf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1HQwpmkrgt0MwM2oBd4WjGoaZ8alYLdNZXPEJNywACaJj5vJA5aDrwp2s5zFO+zfMK1kKcgqzdnOWQFDO+633zXsJlewS3skP5mo/ifwRuzI+WHYz+ws17sykZQPs4soBNIPHv8qsWFPGTFDf7Prftk3rQU0dti6bepwXsF6aO0Z7oeOj2PjHTlF91X/FpKY1QKN7hbSIbFAgLzKKNah1RcTZoxXhxgVYVf+o4JHf86MlwckJNg7woo0mMgeNIDIENH237l8BNdi8YCi8somV+Y2jNhmJcI1mw5YceEMkfYXpPsCR3s8uIAFRB7ktAcoWehZJtNhGpQUWG2sejN0Xu+LJLt0N/Gr8JkWqy8QZaBonKg4cY10/OZXdM79hbL/VUXuGmtD7Lf2z8IW7Xv1YbeydGB8pBPARl96hm9Zp5gWYH3zdu3Tln25ID/CBy4LhfpXDCGLGYorBo+i0Jr+Buqeem24xhfC1VOmX1aQIl2z+cfjHzVB2d75oAOA3w4NuuczXUmOUl+qwb0lrxzXLC+LAAo2wWBXZtPabSfrZ77OAvUNtxdjNEK7pzxQTV9XmKzKGOqCSrooJhsqNLBYJP6LC/nyd1RqClMhQlTOgNNnejITPngjo9uR4Nt2NBvc78aKUG6Nb46vgjRY6Fu6+rCa0WXFOKCk/fEN1tXisQhui1PpcjrSvq0ajLmUZHdlRjuxOD6Ney+84GB0aYGHBpFjWZqVJdUaBN14a28ZJX0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199018)(31696002)(86362001)(4326008)(36756003)(54906003)(41300700001)(66476007)(66556008)(316002)(8936002)(30864003)(8676002)(478600001)(5660300002)(66946007)(2906002)(38100700002)(83380400001)(6666004)(26005)(186003)(66574015)(6512007)(6486002)(6506007)(53546011)(82960400001)(2616005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1ZqbVlxL25sMEJtQXNHQmg2Z2hUb2tzWkVIR1RHMTRscjFPM1dVUDZkbjdB?=
 =?utf-8?B?VkppQzdFUmNDRC9zTE1rTXpPZnhHZ3NsNW13TDhVNyswdVJVUlVXN0JMWkxq?=
 =?utf-8?B?bDV0SFE0cUJXamhMWnZ2dVhZOWVlNzN0R3R4bVFVRFc5TjNuYkpMR0gvTkxM?=
 =?utf-8?B?VzROMDV2ZDFPeFViWElvK2MwSytyZmovQlcyVEkvcm0zd2xYbWdCUWdscnJx?=
 =?utf-8?B?MEZtNDQzZkpYWG1mM2YvN0VVblpWS0FWTTU3eHdJQWFHVW1IOTk1MWsvV0o3?=
 =?utf-8?B?UVNiczdpRUJwWHNGNDUrSmRqeHN6UFhjMGNOOVJockRuK0t1NkhieHVTcTE1?=
 =?utf-8?B?NXlrcDZoL2VmaEN5ZTZkOFdtMHVWVTJtMXdndGJxRnYvL2dGVnlTem1MRFVp?=
 =?utf-8?B?NXZNUmV0ZzVEdzRwMC9YSXg4RDJoQlRtNnUxOG9xc3JocEROdUkreVhSM2E0?=
 =?utf-8?B?a0Q3QUQvQTNhWGo2bFdrZ3UxdHBaOHhlV25zZmt1aU91YnFHYW93bXQzUEYz?=
 =?utf-8?B?OTZ3ckNyaVM3VktEMUo5RVMvNjEwN0p5VjBrVE1qcFRkbTdtbmVFc1VuUG5n?=
 =?utf-8?B?Y3hhUEJjQ3VoYTVoRmRubEZxWllJSDF1U3ZueVp5SitsU3NCMnNRcVkvN012?=
 =?utf-8?B?b09aQ285M1V0cHh1WnJlaU1qQk9SUks1NWVFL01rbVNTVWFOMzlVZTNvd1Zo?=
 =?utf-8?B?a2plQmNYWW5NdGdleW8xRlc4cHRLRE9CWlNnejR3M2d3bFMzNE5VdDNGSWEv?=
 =?utf-8?B?TzNrUzNQMFdyQ2ZEWjl2V3VSRExsZHlSbGJuMnNSbWd2d3h1eUtsaFV5NTA5?=
 =?utf-8?B?T0pPcDZEbHFrN3RIbUIybGU0TXd6YmJRazY5TVRBN0Rsb09oTU1aOThJbXN4?=
 =?utf-8?B?UG5SVjlFcnhIYXlOYitDQ3d6UkNhYmlUQjhTaDlmK3BYUTdSWE1hZSt6dm1N?=
 =?utf-8?B?T1kwMjJ2WUNkTGFoa0F6UDBMRTZDZUFZSkdPZWI2OVMyMHlZQWlrZ0gzZWV6?=
 =?utf-8?B?NVVoQi9NZjhmVXVFQmU2WksxR29uR3RORmJXWTNwQUcrWUpDZlJNQlVaN0xU?=
 =?utf-8?B?MTNnSVNLWHE0SWNsZjhFM3NoWDRjZjZsb0NOMEExa29pcHRFajgrNGtadG0w?=
 =?utf-8?B?ZHNpK0NCYVMwaGh3d2c4M2N3R25zNG96Nm16SVpHbHovUHpvYUJvUWdhWHE5?=
 =?utf-8?B?T0VRZ2tGL21ZSzlwUDdVcWJ0b0Jrc0U3S01sRUloVHVacnNHNDZYRmh1V0sw?=
 =?utf-8?B?ZUNoQTA5Mm5RaXRsY3IzbmNCS1FIWmdCbzc5QmRTd1c0RU9TSGQzVDFNdTZv?=
 =?utf-8?B?K3BWdzd3UTkrUFN2c2Evc2d0bWF5VUJDNlp0S1o5YXNLcHlsSlJjZ1UwUXJM?=
 =?utf-8?B?M25xQUFGUFRxdytmUzduYWRLODE0UngyTENEQ0VqQ1JFRFpYbEFIN2pLOGlI?=
 =?utf-8?B?U3ROVHlwSzRUdWN5Y3IxNExpUzNnejR4WEJrUDZnQlZEcFFZRzhaZkwySXlC?=
 =?utf-8?B?ZEJRa1Q1S1FwUGNad3pSSUdibXA3NS9qQkFyVE94clJia3FDQzduZWExc0xQ?=
 =?utf-8?B?ZkQ3T1FadEc5dWlwUXVRUzFlc2xPWE95ZXVJcVo0ZFhhNi9ONWxTeVBmeWh5?=
 =?utf-8?B?UUpyMWkvRzR1Y1pxTDJ3TmVzOVJXVXR3TDNUZ2dBaU9mMEh5dWFHSjRhOGhP?=
 =?utf-8?B?clFFZ3lxZ3oxSHJGQk9UUFN5TFFiNWVNeDJSNkFvMkRWZEN1dWt2bXRZemc4?=
 =?utf-8?B?U1pGWTVEYTdrSnB1L0N1aUNla1U1OGpxM0s4Mk56dCtCbzVIQkhlRmZxZVhu?=
 =?utf-8?B?SlJCS0Z1MVpSMSt6WWpaOHgrMThjaGFJVSs3K2h5Zy9EMUpjMmo4NGhDWkFB?=
 =?utf-8?B?UmFhUDdYTmxreklzNElDeWdyN2ZCNnJUY2tTTnd1ckRaQUVqWE5XOVZQMUpr?=
 =?utf-8?B?ZGh4OVAvOVpNWUkxd21tVmpFWll5OGZmd3N5YmhQRXludVY4dkx2YWpXa21I?=
 =?utf-8?B?SjVHTWFxVzZ4d08zaEJmSFBBNmJnejRQOHNjQXMxUDd6cHZOYXpaQTdINmRR?=
 =?utf-8?B?eVJQbUZUY1VEWHNnTVplWDRuRGpUd0t2YzNnUjdEbzA0UUdPby9hbFd4cTVU?=
 =?utf-8?B?aEdQOSt3UEhPNkNqZ2IyeEZjdGNaREx4VnlCUE1ZbE0wa1BPbGFRcGRnVW82?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6c35b9-9e6a-4d05-3573-08db29f2fbf2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 09:59:39.0554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eeUpMo7FwX2/4/eEHQV4/+b2HLcJDMVLB/2GewYWLqLecHXzJQVKO0YQnfyhDDER9o6eK+znL88TPQtcgPhr7ju0l0R2+gazHOoqVDWTAXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4887
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 1/2] drm/xe/buddy: add visible tracking
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 3/21/23 11:10 AM, Matthew Auld wrote:
> Replace the allocation code with the i915 version. This simplifies the
> code a little, and importantly we get the accounting at the mgr level,
> which is useful for debug (and maybe userspace), plus per resource
> tracking so we can easily check if a resource is using one or pages in
> the mappable part of vram (useful for eviction), or if the resource is
> completely within the mappable portion (useful for checking if the
> resource can be safely CPU mapped).
> 
> v2: Fix missing PAGE_SHIFT
> v3: (Gwan-gyeong Mun)
>    - Fix incorrect usage of ilog2(mm.chunk_size).
>    - Fix calculation when checking for impossible allocation sizes, also
>      check much earlier.
> v4: (Gwan-gyeong Mun)
>    - Fix calculation when extending the [fpfn, lpfn] range due to the
>      roundup_pow_of_two().
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c     |  18 +-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 193 ++++++++++-----------
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   3 +-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   6 +
>   4 files changed, 111 insertions(+), 109 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 9629b1a677f2..31887fec1073 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -135,7 +135,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>   {
>   	struct xe_ttm_stolen_mgr *mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	u64 stolen_size, pgsize;
> +	u64 stolen_size, io_size, pgsize;
>   	int err;
>   
>   	if (IS_DGFX(xe))
> @@ -154,7 +154,17 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>   	if (pgsize < PAGE_SIZE)
>   		pgsize = PAGE_SIZE;
>   
> -	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size, pgsize);
> +	/*
> +	 * We don't try to attempt partial visible support for stolen vram,
> +	 * since stolen is always at the end of vram, and the BAR size is pretty
> +	 * much always 256M, with small-bar.
> +	 */
> +	io_size = 0;
> +	if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
> +		io_size = stolen_size;
> +
> +	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size,
> +				     io_size, pgsize);
>   	if (err) {
>   		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
>   		return;
> @@ -163,8 +173,8 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>   	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
>   		    stolen_size);
>   
> -	if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
> -		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, stolen_size);
> +	if (io_size)
> +		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, io_size);
>   }
>   
>   u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index bafcadaed6b0..917d0ca22439 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -49,45 +49,29 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   			       const struct ttm_place *place,
>   			       struct ttm_resource **res)
>   {
> -	u64 max_bytes, cur_size, min_block_size;
>   	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>   	struct xe_ttm_vram_mgr_resource *vres;
> -	u64 size, remaining_size, lpfn, fpfn;
>   	struct drm_buddy *mm = &mgr->mm;
> -	unsigned long pages_per_block;
> -	int r;
> -
> -	lpfn = (u64)place->lpfn << PAGE_SHIFT;
> -	if (!lpfn || lpfn > man->size)
> -		lpfn = man->size;
> +	u64 size, remaining_size, min_page_size;
> +	unsigned long lpfn;
> +	int err;
>   
> -	fpfn = (u64)place->fpfn << PAGE_SHIFT;
> +	lpfn = place->lpfn;
> +	if (!lpfn || lpfn > man->size >> PAGE_SHIFT)
> +		lpfn = man->size >> PAGE_SHIFT;
>   
> -	max_bytes = mgr->manager.size;
> -	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -		pages_per_block = ~0ul;
> -	} else {
> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -		pages_per_block = HPAGE_PMD_NR;
> -#else
> -		/* default to 2MB */
> -		pages_per_block = 2UL << (20UL - PAGE_SHIFT);
> -#endif
> -
> -		pages_per_block = max_t(uint32_t, pages_per_block,
> -					tbo->page_alignment);
> -	}
> +	if (tbo->base.size >> PAGE_SHIFT > (lpfn - place->fpfn))
> +		return -E2BIG; /* don't trigger eviction for the impossible */
>   
>   	vres = kzalloc(sizeof(*vres), GFP_KERNEL);
>   	if (!vres)
>   		return -ENOMEM;
>   
>   	ttm_resource_init(tbo, place, &vres->base);
> -	remaining_size = vres->base.size;
>   
>   	/* bail out quickly if there's likely not enough VRAM for this BO */
> -	if (ttm_resource_manager_usage(man) > max_bytes) {
> -		r = -ENOSPC;
> +	if (ttm_resource_manager_usage(man) > man->size) {
> +		err = -ENOSPC;
>   		goto error_fini;
>   	}
>   
> @@ -96,95 +80,82 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	if (place->flags & TTM_PL_FLAG_TOPDOWN)
>   		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>   
> -	if (fpfn || lpfn != man->size)
> -		/* Allocate blocks in desired range */
> +	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
>   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>   
> +	XE_BUG_ON(!vres->base.size);
> +	size = vres->base.size;
> +
> +	min_page_size = mgr->default_page_size;
> +	if (tbo->page_alignment)
> +		min_page_size = tbo->page_alignment << PAGE_SHIFT;
> +
> +	XE_BUG_ON(min_page_size < mm->chunk_size);
> +	XE_BUG_ON(min_page_size > SZ_2G); /* FIXME: sg limit */
> +	XE_BUG_ON(size > SZ_2G &&
> +		  (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS));
> +	XE_BUG_ON(!IS_ALIGNED(size, min_page_size));
> +
> +	if (place->fpfn + (size >> PAGE_SHIFT) != place->lpfn &&
> +	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		size = roundup_pow_of_two(size);
> +		min_page_size = size;
> +
> +		lpfn = max_t(unsigned long, place->fpfn + (size >> PAGE_SHIFT), lpfn);
> +	}
> +
>   	mutex_lock(&mgr->lock);
> -	while (remaining_size) {
> -		if (tbo->page_alignment)
> -			min_block_size = tbo->page_alignment << PAGE_SHIFT;
> -		else
> -			min_block_size = mgr->default_page_size;
> -
> -		XE_BUG_ON(min_block_size < mm->chunk_size);
> -
> -		/* Limit maximum size to 2GiB due to SG table limitations */
> -		size = min(remaining_size, 2ULL << 30);
> -
> -		if (size >= pages_per_block << PAGE_SHIFT)
> -			min_block_size = pages_per_block << PAGE_SHIFT;
> -
> -		cur_size = size;
> -
> -		if (fpfn + size != (u64)place->lpfn << PAGE_SHIFT) {
> -			/*
> -			 * Except for actual range allocation, modify the size and
> -			 * min_block_size conforming to continuous flag enablement
> -			 */
> -			if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -				size = roundup_pow_of_two(size);
> -				min_block_size = size;
> -			/*
> -			 * Modify the size value if size is not
> -			 * aligned with min_block_size
> -			 */
> -			} else if (!IS_ALIGNED(size, min_block_size)) {
> -				size = round_up(size, min_block_size);
> -			}
> -		}
> +	if (lpfn <= mgr->visible_size >> PAGE_SHIFT && size > mgr->visible_avail) {
Hi Matt,
Since lpfn can be updated by roundup_pow_of_two(size) operation, 
shouldn't this check be done before lpfn is updated, or should it be 
checked with the original lpfn before being updated if you are going to 
use this code in this location?
> +		mutex_unlock(&mgr->lock);
> +		err = -ENOSPC;
> +		goto error_fini;
> +	}
>   
> -		r = drm_buddy_alloc_blocks(mm, fpfn,
> -					   lpfn,
> -					   size,
> -					   min_block_size,
> -					   &vres->blocks,
> -					   vres->flags);
> -		if (unlikely(r))
> +	remaining_size = size;
> +	do {
> +		/*
> +		 * Limit maximum size to 2GiB due to SG table limitations.
> +		 * FIXME: Should maybe be handled as part of sg construction.
> +		 */
> +		u64 alloc_size = min_t(u64, remaining_size, SZ_2G);
> +
> +		err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
> +					     (u64)lpfn << PAGE_SHIFT,
> +					     alloc_size,
> +					     min_page_size,
> +					     &vres->blocks,
> +					     vres->flags);
> +		if (err)
>   			goto error_free_blocks;
>   
> -		if (size > remaining_size)
> -			remaining_size = 0;
> -		else
> -			remaining_size -= size;
> +		remaining_size -= alloc_size;
> +	} while (remaining_size);
> +
> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks))
> +			size = vres->base.size;
>   	}
> -	mutex_unlock(&mgr->lock);
>   
> -	if (cur_size != size) {
> +	if (lpfn <= mgr->visible_size >> PAGE_SHIFT) {
Similarly, shouldn't this lpfn also be checked with the original value 
before being updated?

except that, it looks good to me.
> +		vres->used_visible_size = size;
> +	} else {
>   		struct drm_buddy_block *block;
> -		struct list_head *trim_list;
> -		u64 original_size;
> -		LIST_HEAD(temp);
>   
> -		trim_list = &vres->blocks;
> -		original_size = vres->base.size;
> +		list_for_each_entry(block, &vres->blocks, link) {
> +			u64 start = drm_buddy_block_offset(block);
>   
> -		/*
> -		 * If size value is rounded up to min_block_size, trim the last
> -		 * block to the required size
> -		 */
> -		if (!list_is_singular(&vres->blocks)) {
> -			block = list_last_entry(&vres->blocks, typeof(*block), link);
> -			list_move_tail(&block->link, &temp);
> -			trim_list = &temp;
> -			/*
> -			 * Compute the original_size value by subtracting the
> -			 * last block size with (aligned size - original size)
> -			 */
> -			original_size = drm_buddy_block_size(mm, block) -
> -				(size - cur_size);
> -		}
> +			if (start < mgr->visible_size) {
> +				u64 end = start + drm_buddy_block_size(mm, block);
>   
> -		mutex_lock(&mgr->lock);
> -		drm_buddy_block_trim(mm,
> -				     original_size,
> -				     trim_list);
> -		mutex_unlock(&mgr->lock);
> -
> -		if (!list_empty(&temp))
> -			list_splice_tail(trim_list, &vres->blocks);
> +				vres->used_visible_size +=
> +					min(end, mgr->visible_size) - start;
> +			}
> +		}
>   	}
>   
> +	mgr->visible_avail -= vres->used_visible_size;
> +	mutex_unlock(&mgr->lock);
> +
>   	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
>   	    xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
>   		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
> @@ -213,7 +184,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	ttm_resource_fini(man, &vres->base);
>   	kfree(vres);
>   
> -	return r;
> +	return err;
>   }
>   
>   static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
> @@ -226,6 +197,7 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
>   
>   	mutex_lock(&mgr->lock);
>   	drm_buddy_free_list(mm, &vres->blocks);
> +	mgr->visible_avail += vres->used_visible_size;
>   	mutex_unlock(&mgr->lock);
>   
>   	ttm_resource_fini(man, res);
> @@ -240,6 +212,13 @@ static void xe_ttm_vram_mgr_debug(struct ttm_resource_manager *man,
>   	struct drm_buddy *mm = &mgr->mm;
>   
>   	mutex_lock(&mgr->lock);
> +	drm_printf(printer, "default_page_size: %lluKiB\n",
> +		   mgr->default_page_size >> 10);
> +	drm_printf(printer, "visible_avail: %lluMiB\n",
> +		   (u64)mgr->visible_avail >> 20);
> +	drm_printf(printer, "visible_size: %lluMiB\n",
> +		   (u64)mgr->visible_size >> 20);
> +
>   	drm_buddy_print(mm, printer);
>   	mutex_unlock(&mgr->lock);
>   	drm_printf(printer, "man size:%llu\n", man->size);
> @@ -262,6 +241,8 @@ static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>   	if (ttm_resource_manager_evict_all(&xe->ttm, man))
>   		return;
>   
> +	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
> +
>   	drm_buddy_fini(&mgr->mm);
>   
>   	ttm_resource_manager_cleanup(&mgr->manager);
> @@ -270,7 +251,8 @@ static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>   }
>   
>   int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
> -			   u32 mem_type, u64 size, u64 default_page_size)
> +			   u32 mem_type, u64 size, u64 io_size,
> +			   u64 default_page_size)
>   {
>   	struct ttm_resource_manager *man = &mgr->manager;
>   	int err;
> @@ -279,6 +261,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>   	mgr->mem_type = mem_type;
>   	mutex_init(&mgr->lock);
>   	mgr->default_page_size = default_page_size;
> +	mgr->visible_size = io_size;
> +	mgr->visible_avail = io_size;
>   
>   	ttm_resource_manager_init(man, &xe->ttm, size);
>   	err = drm_buddy_init(&mgr->mm, man->size, default_page_size);
> @@ -298,7 +282,8 @@ int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr *mgr)
>   	mgr->gt = gt;
>   
>   	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + gt->info.vram_id,
> -				      gt->mem.vram.size, PAGE_SIZE);
> +				      gt->mem.vram.size, gt->mem.vram.io_size,
> +				      PAGE_SIZE);
>   }
>   
>   int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index 78f332d26224..35e5367a79fb 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -13,7 +13,8 @@ struct xe_device;
>   struct xe_gt;
>   
>   int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
> -			   u32 mem_type, u64 size, u64 default_page_size);
> +			   u32 mem_type, u64 size, u64 io_size,
> +			   u64 default_page_size);
>   int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr *mgr);
>   int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>   			      struct ttm_resource *res,
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index 39aa2ec1b968..3d9417ff7434 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -23,6 +23,10 @@ struct xe_ttm_vram_mgr {
>   	struct ttm_resource_manager manager;
>   	/** @mm: DRM buddy allocator which manages the VRAM */
>   	struct drm_buddy mm;
> +	/** @visible_size: Proped size of the CPU visible portion */
> +	u64 visible_size;
> +	/** @visible_avail: CPU visible portion still unallocated */
> +	u64 visible_avail;
>   	/** @default_page_size: default page size */
>   	u64 default_page_size;
>   	/** @lock: protects allocations of VRAM */
> @@ -39,6 +43,8 @@ struct xe_ttm_vram_mgr_resource {
>   	struct ttm_resource base;
>   	/** @blocks: list of DRM buddy blocks */
>   	struct list_head blocks;
> +	/** @used_visible_size: How many CPU visible bytes this resource is using */
> +	u64 used_visible_size;
>   	/** @flags: flags associated with the resource */
>   	unsigned long flags;
>   };
