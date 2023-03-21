Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF82C74A5B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 12:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3322A10E752;
	Tue, 21 Mar 2023 12:13:02 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883E110E752
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 12:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679400780; x=1710936780;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yLINg/PXPywsTZUv/8Gsv7YeJIJf87JXY+3PdVHB6aU=;
 b=D/0Gk7gmLOx+N7f/pn7vRRSGN8ArfiHLmoUX7tGDt+auEgApIiwNBZqm
 dGJAeBzXUnKlFXmYmaVd95mHUtsAQc8qEEUasXFdfCFHa/BsCsD5Rq7I7
 QmlMQ4LO3XoJykiZMShc3D/snyCcvjTxLxV5tKWAwHiI3JezjtYte0PQJ
 JetqUuF56jMSoMKj55s8hb2e2dQGeFJCyQ2N2XEzIlMpk4gRJ60qDp2YE
 NKH4eiGs5SpgytDCgcHMZNnsrhR7FgCEdax5DDLnX8dt2VmkncoOsHeSO
 UTrB68sNGzMri4UGTUba4xwZtzPyva0CxVv8M/XsQMwv9Jco0x3rU8nw/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="340465792"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="340465792"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 05:13:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="824914878"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="824914878"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2023 05:12:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 05:12:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 05:12:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 05:12:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 05:12:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUtm9xB5Z31aCS1jLnzDidw/nU8u3W2I7JbV1xWeCLxcZ3wqbVb+eUTQZoUEihRKrNwbLSkbQoO/CYh2Y2ltvT1t3ODhNkRTXeTlBwyiH2VoehXB1b/amDAkFZVAP1GJhl/avj+MPAuVgy3wdRpz8i2DrzGn1gxUZ0FxMF6a/O4YQ/fynTqq4AlpJtHmqXf0E1EsuwyBPWStZISyS88ufx2bmH3ZMXmi/RP5+X7JyAzeI4r0VcfoisHcKwuLzbp/Fz6ALMq3RgSjdgjL0iuNlWctV6KP7jy1nB34VZFYRiVuAFJngxEukHCTWUllcSfce2E+TBPbzETY+MnR3IjrkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csH1j5ObmVLON7ddwMJFqEt710PhFWWkRUXDy5tuqV4=;
 b=aXKcHxviC/PLNtajngU8Bt92LiMklWxpZ/oV3N6+bJEpKMDHBbyhUdrSejQo1VCI6oTqrKpnZbURvu+qZJmYdHHa3e2tUNjWLbta5ieN/uWgmeQ8WZTiIF8T18tV68TG1cX4uJebq93E7uApcYqEsJ/MDyNycSgyUGk2vwc0xUsAg5lPV+qz09/giuHT+Q7YCkv75aSswZ/MsO1s5PAJNo0YLAf2a4SoDgz+MO0uVlEioulxQEY/pL49RwrqKOrVRPsBN8wxOTiQkrsfKGHnP092MrKt7yHpMI7o3cZC4PCBKw4YaVqIAhNpYD5bzvF5tMm2fCNQHVfxXIGlOW5FNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 12:12:56 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%4]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 12:12:56 +0000
Message-ID: <cc14cd84-afc3-3ed9-f40c-a67fc86d1060@intel.com>
Date: Tue, 21 Mar 2023 14:12:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230321114407.169334-1-matthew.auld@intel.com>
 <20230321114407.169334-2-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230321114407.169334-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::7) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|DM4PR11MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: 70ce57da-309c-4989-f8f4-08db2a059a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 64M/y4BobQIkNiJU2ay1loy0LroMU2BCNKj2bCat9myww28EgBgyJZeZD/PrmUJt8dMSyQyZq0I+X6DdT2g5jd67DMZtTJxrFVOUX5h9A2ikzmHcjjX0zgaV6LX/q1xkXOLBvq+RhMXPd7e10DIsaya/S1/mmGIpmlAW65Pj2eXrQojN3ZmIIBqU1c1k/ki2k4RUFPXE3+wdCzfhDhflxidG5JS/To4DdhBjmQfczWOFkK+yTqHzYA6PhTnDs0bAYbwftObc2PzDPuka5Qfpzg4ZczsKozCzqDKGC8yT7PxAGc1ovt8xXwnGAGzmAdalF/YuuhjfNPJkWabVR44VnIB/aDxvJDNqXyfzdKQOT2pidb23B4RhkVfgqFpputTgYR1hOYl+AseAg+sL/nOF1mXkcqkYDT9A0PQdG/mBt12m4hTVXcjt99ASOhV3Rto81fY9MoDOXEXjzoaz5py5G0l3BebBIjVy7e9BoghSDyCAEz9OoOKvoteXxi5SYKWSa84L1XPKOLlifTdlaLEBv9w9XVPWoU1vbbTor9hbKoP8H2OzMybhy+4TQjDfGVIQ4EOy3U6fD3ZZtiL40OA3/aovYyPyGmMlm0dSi3V6NmQJClNHiaSK1lbQOQipcxW0Z+3ilV/zUqXseu4GRACwoDrEZgU4io5ZU5FiMOFTF411gtcmmUK2Ddc2fJyx+RSwGVwAFvAAgFlVEQhkcEB9gpLyS3aRJxjNZ3t1FIAMN8M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199018)(2616005)(316002)(478600001)(66574015)(6666004)(6486002)(83380400001)(54906003)(8676002)(66946007)(66556008)(186003)(6512007)(6506007)(26005)(66476007)(53546011)(31686004)(4326008)(30864003)(8936002)(5660300002)(41300700001)(82960400001)(38100700002)(2906002)(31696002)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NENUS1AzWTk5NTFyZFp1UXo3MytFelZpd1dzZUVhL3FaYVpCVDl5K2pqS244?=
 =?utf-8?B?c0sxL1FkVG5XZkl1cDlic0pZclBmbldTNnk3ZlBRR29MTUZ1UUU5R2JZaFlN?=
 =?utf-8?B?b3ZjV3Z3bmZBd01wRVFueTA5N0VnZ2VLUUtjaWN3cGhWcGUwczRqaytVV2FR?=
 =?utf-8?B?UXVWTW1HK2JvdHdGL01UYmd6ZTNZSlVNSXcxU25lcitYdlVlcVdjVHkvb0Fs?=
 =?utf-8?B?WFV1dHd5Q0hyVmdtaTYzV1NWMHZHSnZxZG54RWJUWG5rWVJ0cExYUjkwTGdH?=
 =?utf-8?B?S1ljQ3B1cktxNXA4eEdhcytvNFU1eEFKaHlrUDg3NWRDSWdNNDNDTzNlR3VI?=
 =?utf-8?B?eFBRMWI3ZGxmeGZLU3M0cGFzQy90WktXUWFJajMyRE1Cdk1BYi9aZ1NRb3JX?=
 =?utf-8?B?cGZWS3Mwd0Ftb3l0ZEFhRlMxYm1zWUFYV1FKT3E0cFk3a2JXRTdWZENOalJD?=
 =?utf-8?B?OEFxc2pkWXZOb2RucFh5RjJ0Uk0zNHhCays2VmpXUUFXSUxnTkdhKzhUSEFj?=
 =?utf-8?B?NVdYdm5IcG94alRpa1Z0dENkYTU1dDhPQ3BCbVJtV2xsbnVIOExUQnRXYUJi?=
 =?utf-8?B?VHZBejNsRjlucURWNUJIM1FXUFRkZ2xOMTEzRmNYcU5pdTZncjBBSDR0Wkpt?=
 =?utf-8?B?VTZUbG9qd3JWOXo4M2ZqZGNrekREekZ5UkhadDRGUnV2K3F6bWFvWjVrTkFE?=
 =?utf-8?B?VnZlRHcvdzRQT3VrUHFQNFVXSkVuSTh4WEZkNDJQVjZNMGRKazgwckJERWhP?=
 =?utf-8?B?RFJrbHlsMldXMFYzOTgwc0piak1IMmR2N24zS2ZsMGlMcFdiQmNCem9LN2Vv?=
 =?utf-8?B?YlJOVkgydkRUVlg4d3ZWS29va1NUOXBTVFE3VzB1UU9NVFBFK0xDcTJZZzMz?=
 =?utf-8?B?YXBRaWt0aGNxNEV2bGo4dVFvNWxwQytxZ3BkSXNmM2paS3BpR1hyTXRDTmNn?=
 =?utf-8?B?ZTgvN1o1WVdrcmhDVThZSnRTdmsrSzdGVE5peERHWm1IbkNJQkp4cjg1blVp?=
 =?utf-8?B?UmZ2WXRPVXR4UUtUTUQzckxUT09saTQ5RzREYmJwOHZST2hSMml1amlUSHhy?=
 =?utf-8?B?Zkx2MUhkYytUaHVSb0pCTjBEMEJRdHlWczIxbS9pdEFDYURXSUlPMzA3MVU0?=
 =?utf-8?B?SVFSMWYyd3BCM0VoVnJ2aC9KTUZob3E2bGd3bnFpK0hXUEZFck1iVHpQVjZq?=
 =?utf-8?B?NHZldkFBSkVybkZKVXpmbDNJY0k1MUdxejJEN2duclM0Z0FZYlpRNWxINCtV?=
 =?utf-8?B?SmdXRVUvb1FUNFZjMG96MEFGN0RXdWJBd3MyMlZGa1VWekdSVHJGMFAyYytU?=
 =?utf-8?B?dHBLaHNMa0E4TXJZaWlxOXovK3BySjdoczBoR3BITzJSbUlIT2J4QXRSRkdU?=
 =?utf-8?B?ekJjSGJLdTFDQklXRC9oSnBybTdyb0RFRTdHTVF2aG5qK3diUlhMWFNsODl6?=
 =?utf-8?B?dGdqUGhtQ2tHbFlNbThURy9UYXYycmYwR3NJUmJ0ZmtlQXhQa0JxNUZCL2Ju?=
 =?utf-8?B?RmtrUmtZNE80K1lDMDlCWjRHWU5SRVg0UjFRdUFlMWdNdUp4SlFKdU9qZDRN?=
 =?utf-8?B?cG43WFNPSXZLamdwTzg0dDFZemRUZjkzN2ppN3U0WXJ5Qmx4amVTalZYZXpZ?=
 =?utf-8?B?cFBWanM5Wkprcmx2T2dxVFNIV0IwOGlqRGo1d0UyQWdpdlYvQ3N6RXlXWUdq?=
 =?utf-8?B?L2lWRmNiaUNFTjNwaTFvRUQ0MGx4MCtsNjZxV3o4Q0RWSUQ3ZjRiWXZDZS93?=
 =?utf-8?B?V2FKYWZQbHUwRGk1eE5kaXM2cjJXVmsyQVdNOHRNU3EwK3V0RlpTODh6Ylc0?=
 =?utf-8?B?R1VCbVdGTGVtakdLMU1ycUtQenRMWVhqNnVSZk1ESGsxVUhkeE84M0k3Y3Ju?=
 =?utf-8?B?NjBtaTQ3UVJHbFVKMkV6Q09zNG5rS2VCUkdEZWpPdHNTNkpuUFFVNW1xRUpu?=
 =?utf-8?B?TUE1Q1dTTGlJaEhOeGpsWmdRNW5UVEFCREpDRDNHeDBYSm8ycEtPb2Y2N2FG?=
 =?utf-8?B?bFBhY1E4UHcveWprTHJpWUhBUUNjdW53VkR5ZnNoVkxMYW9oM3Viai8xQlVC?=
 =?utf-8?B?YkdqL0JYRHNscTFTTWp2Nmd6eU5taHcra241UWxuTHpSK3NWNmJ5L25MS1BG?=
 =?utf-8?B?RklLV0tXL3lnblZreVJsK3BDbzlDYXZwZlpMMUViWWduOWhXVjhMWjd2Ukl4?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ce57da-309c-4989-f8f4-08db2a059a50
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 12:12:55.8381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWSYdIbC1s2IRAo0xnqs+1SiJIpU2c+jxR5icL/7USDTfigemIrqqiDZy/TFnQpSTz6FfNxQYSxhfz4dmj1wer0dN43Iva1h3IImeSr2d8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6527
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v8 1/2] drm/xe/buddy: add visible tracking
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

looks good to me.

And thanks to Jani to point out XE_BUG_ON() stuff.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 3/21/23 1:44 PM, Matthew Auld wrote:
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
> v5: (Gwan-gyeong Mun)
>    - Move the check for running out of mappable VRAM to before doing any of
>      the roundup_pow_of_two().
> v6: (Jani)
>    - Stop abusing BUG_ON(). We can easily just use WARN_ON() here and
>      return a proper error to the caller, which is much nicer if we ever
>      trigger these.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c     |  18 +-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 211 +++++++++++----------
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   3 +-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   6 +
>   4 files changed, 129 insertions(+), 109 deletions(-)
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
> index bafcadaed6b0..78979c0b6024 100644
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
> @@ -96,95 +80,100 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	if (place->flags & TTM_PL_FLAG_TOPDOWN)
>   		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>   
> -	if (fpfn || lpfn != man->size)
> -		/* Allocate blocks in desired range */
> +	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
>   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>   
> -	mutex_lock(&mgr->lock);
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
> +	if (WARN_ON(!vres->base.size)) {
> +		err = -EINVAL;
> +		goto error_fini;
> +	}
> +	size = vres->base.size;
>   
> -		r = drm_buddy_alloc_blocks(mm, fpfn,
> -					   lpfn,
> -					   size,
> -					   min_block_size,
> -					   &vres->blocks,
> -					   vres->flags);
> -		if (unlikely(r))
> -			goto error_free_blocks;
> +	min_page_size = mgr->default_page_size;
> +	if (tbo->page_alignment)
> +		min_page_size = tbo->page_alignment << PAGE_SHIFT;
> +
> +	if (WARN_ON(min_page_size < mm->chunk_size)) {
> +		err = -EINVAL;
> +		goto error_fini;
> +	}
>   
> -		if (size > remaining_size)
> -			remaining_size = 0;
> -		else
> -			remaining_size -= size;
> +	if (WARN_ON(min_page_size > SZ_2G)) { /* FIXME: sg limit */
> +		err = -EINVAL;
> +		goto error_fini;
>   	}
> -	mutex_unlock(&mgr->lock);
>   
> -	if (cur_size != size) {
> -		struct drm_buddy_block *block;
> -		struct list_head *trim_list;
> -		u64 original_size;
> -		LIST_HEAD(temp);
> +	if (WARN_ON((size > SZ_2G &&
> +		     (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS)))) {
> +		err = -EINVAL;
> +		goto error_fini;
> +	}
>   
> -		trim_list = &vres->blocks;
> -		original_size = vres->base.size;
> +	if (WARN_ON(!IS_ALIGNED(size, min_page_size))) {
> +		err = -EINVAL;
> +		goto error_fini;
> +	}
>   
> +	mutex_lock(&mgr->lock);
> +	if (lpfn <= mgr->visible_size >> PAGE_SHIFT && size > mgr->visible_avail) {
> +		mutex_unlock(&mgr->lock);
> +		err = -ENOSPC;
> +		goto error_fini;
> +	}
> +
> +	if (place->fpfn + (size >> PAGE_SHIFT) != place->lpfn &&
> +	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		size = roundup_pow_of_two(size);
> +		min_page_size = size;
> +
> +		lpfn = max_t(unsigned long, place->fpfn + (size >> PAGE_SHIFT), lpfn);
> +	}
> +
> +	remaining_size = size;
> +	do {
>   		/*
> -		 * If size value is rounded up to min_block_size, trim the last
> -		 * block to the required size
> +		 * Limit maximum size to 2GiB due to SG table limitations.
> +		 * FIXME: Should maybe be handled as part of sg construction.
>   		 */
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
> +		u64 alloc_size = min_t(u64, remaining_size, SZ_2G);
> +
> +		err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
> +					     (u64)lpfn << PAGE_SHIFT,
> +					     alloc_size,
> +					     min_page_size,
> +					     &vres->blocks,
> +					     vres->flags);
> +		if (err)
> +			goto error_free_blocks;
>   
> -		mutex_lock(&mgr->lock);
> -		drm_buddy_block_trim(mm,
> -				     original_size,
> -				     trim_list);
> -		mutex_unlock(&mgr->lock);
> +		remaining_size -= alloc_size;
> +	} while (remaining_size);
>   
> -		if (!list_empty(&temp))
> -			list_splice_tail(trim_list, &vres->blocks);
> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks))
> +			size = vres->base.size;
>   	}
>   
> +	if (lpfn <= mgr->visible_size >> PAGE_SHIFT) {
> +		vres->used_visible_size = size;
> +	} else {
> +		struct drm_buddy_block *block;
> +
> +		list_for_each_entry(block, &vres->blocks, link) {
> +			u64 start = drm_buddy_block_offset(block);
> +
> +			if (start < mgr->visible_size) {
> +				u64 end = start + drm_buddy_block_size(mm, block);
> +
> +				vres->used_visible_size +=
> +					min(end, mgr->visible_size) - start;
> +			}
> +		}
> +	}
> +
> +	mgr->visible_avail -= vres->used_visible_size;
> +	mutex_unlock(&mgr->lock);
> +
>   	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
>   	    xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
>   		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
> @@ -213,7 +202,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	ttm_resource_fini(man, &vres->base);
>   	kfree(vres);
>   
> -	return r;
> +	return err;
>   }
>   
>   static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
> @@ -226,6 +215,7 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
>   
>   	mutex_lock(&mgr->lock);
>   	drm_buddy_free_list(mm, &vres->blocks);
> +	mgr->visible_avail += vres->used_visible_size;
>   	mutex_unlock(&mgr->lock);
>   
>   	ttm_resource_fini(man, res);
> @@ -240,6 +230,13 @@ static void xe_ttm_vram_mgr_debug(struct ttm_resource_manager *man,
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
> @@ -262,6 +259,8 @@ static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>   	if (ttm_resource_manager_evict_all(&xe->ttm, man))
>   		return;
>   
> +	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
> +
>   	drm_buddy_fini(&mgr->mm);
>   
>   	ttm_resource_manager_cleanup(&mgr->manager);
> @@ -270,7 +269,8 @@ static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>   }
>   
>   int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
> -			   u32 mem_type, u64 size, u64 default_page_size)
> +			   u32 mem_type, u64 size, u64 io_size,
> +			   u64 default_page_size)
>   {
>   	struct ttm_resource_manager *man = &mgr->manager;
>   	int err;
> @@ -279,6 +279,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>   	mgr->mem_type = mem_type;
>   	mutex_init(&mgr->lock);
>   	mgr->default_page_size = default_page_size;
> +	mgr->visible_size = io_size;
> +	mgr->visible_avail = io_size;
>   
>   	ttm_resource_manager_init(man, &xe->ttm, size);
>   	err = drm_buddy_init(&mgr->mm, man->size, default_page_size);
> @@ -298,7 +300,8 @@ int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr *mgr)
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
