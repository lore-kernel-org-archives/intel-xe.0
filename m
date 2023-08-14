Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581D9C001DB
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 22:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2587E10E021;
	Mon, 14 Aug 2023 22:52:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A685E10E021
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Aug 2023 22:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692053542; x=1723589542;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UEX2nmvXGfOQIBVOoPKqqPTwWYMVojeB8gTPZNY0bcU=;
 b=lR/ckqhJC10QUp+lakEbS0sdxLxJDk6h/0ElJ1PJr0QszN3/s03rKkuK
 dMaWvSahTyPLWR3D72oQlXuy4QFYwdgISr3bLrbXB5TvqMJSKZpWBjRb7
 dQWzprHAbzoB/bEh8FlT/NYnQOapUMQeaNKFvq1ks3A1t7z/XtYuz6/Z6
 N4yeeKdHy8h1nuCRLMPRhbBhrOlMWhNP8KORK82jCxe9k/Meu+ehoMBER
 M62PyOx1qH9mkQbZclphDSBR/Yjn5RRFlCuAi32uTySz+9nZSs4JNXbZJ
 +6KtHWbZjy8hZKjTHIKiv1btYcr1AwGxegsNBhvYnH0SG0KbTZip+nRN/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403132063"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="403132063"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 15:52:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="763081450"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="763081450"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 14 Aug 2023 15:52:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 15:52:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 14 Aug 2023 15:52:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 14 Aug 2023 15:52:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b06Gve4Uw50aGvJhhY4BfdcdlhNxlCj4nZoD+LjVngwz9o3GKI4DQz9sk0wENyD34z1vdm0/VdNfsly8qvUWSaxZyA4hl6dvx1j4CY4iKYX259+XeWHbllm7qiIupo9LoX4UQEIZOnVRy+/MQwqdTuFeWkMsV0rCF+j2vWeGOy3jyZxn9KUWSJrIWjIzYnqiXBcZ3bvdiCuadJrjRJKA6VqjJG6YPuaq70vhEU4AEAqBhuawvCY1OR8RWoBL0b2voMA6417JAgXhuzpTdgMKKn1BztQ8NY8IarT9x1YVh/Kyj3PxZkBME08a4le07zggE+uGSshHoFB/pgHBGmH6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBMNQj6+DQxtq6IsYMq+AovGsp7IPjm4P4UXTW0Enq0=;
 b=iUh8zJuYA0/J0CVUvpjZkITC4QXcI0EDQjF323rkcsp297zKa8+6PPoDXFm/f8nTGM8uqF6+VuQyanUH19XRev3PtsMZOGz6dN+UvcFO46boL3B/9LET/KabjMWrgcy+yopg+j8BgTvYG1XSXSIvbmcRF3u4pJo9t1xg6XNSPxoiSYbPEYodlIpfs2MdjFmrM2c/ErpVp/3H18GgUpuJG4HxeqbiRsX712Gd/ml0DqmIXsve9k4z/rO6btk9Qk+KXWhGPTZAYTHV+l3kX4mqVsYtDJALWtn9ck7uopyW1wl24/iGY1KCRcWkpIG9wKBtHMPY3M5S9MluinkV+nzcHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 CYXPR11MB8710.namprd11.prod.outlook.com (2603:10b6:930:da::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.26; Mon, 14 Aug 2023 22:52:20 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::439e:63f:b4f:f27e]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::439e:63f:b4f:f27e%4]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 22:52:20 +0000
Date: Mon, 14 Aug 2023 15:51:57 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <ZNqwDdiQM6VL+cU3@orsosgc001.jf.intel.com>
References: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
 <20230814223734.375449-4-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230814223734.375449-4-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BY3PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:217::35) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|CYXPR11MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 806d3763-a12b-4a27-dee9-08db9d191d7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: waEoBn+KlxomblpnEDPaJiBXpG5QhMknh9SX4TrfCDUQAnu9+RUIisSyX1+cotdRkOlopU61/Fw+oCq2NRRlwM2uPNN+lnxxmlrj2XHt7VwCCW+03XLlYqWhXNwxfrctO49Idoiu0DCzUiX8zO+2YV5jyxS9P0UI0v7uoWJX18o7jxn4QOq0xMs3hXAi6zXeMV+JIuaOZerlM1tuc+xTGXkcjdAfojkms2iCoEoeV4imqE8dGlupgnjVdHAI44nqtajBYaOC329Ie7OFK46x0fvJ0WSDdTCz8Ogz5ECDffarKDX2Gk0hkkZpPJIrT6L4I0eJbQj0LKrbCmxmgzQGqQu/bN3x9umVS3PkKAgtdW2vf2eAzR+EXBMB/Pr7s/ab62cce+GHqZJK6UxwZOgI1IW73gFXae7c5R6oUIRV/wTbFu1GauPuHKRhlTH5Qc//+zVWch/JY+QvhXKRiaMAtKQdRpPEq8MkjQUbeDhLtGKJvAVFj4n9wMFGm/ZJ5qXNglZ1egKT87VDyK5/cYvqWQQhB7cktrhkeQ3Rs52bnE7CwC0NxTsE6qaa8c/AifiTmx/bYOB3KF6TRC2LJbzus90/+MvQEWBHLzdeuhGjQ1Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199021)(1800799006)(186006)(38100700002)(6486002)(6666004)(478600001)(82960400001)(2906002)(5660300002)(86362001)(4326008)(6916009)(66476007)(66556008)(66946007)(41300700001)(8936002)(8676002)(316002)(6506007)(26005)(83380400001)(6512007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjJsQVdBM0hrRk1HZEs5OVlML3duczhmc3B3MDJmQVRkR2xMSitKOW9WV3Rq?=
 =?utf-8?B?SkRXVFIrWHREMFp3aStvVDB2TGltaHBXZHExczhTckZsU1NaV1ZNVXlDSkNI?=
 =?utf-8?B?MkN2UXNUUmwrVncrcndnNjl1aHppWmw0bjlDbmpjRkdJd3AzTEtCYjR5ZWNS?=
 =?utf-8?B?K0hNVTNncHovVVNNYVlQRjRyVEN2WEE5NTdLSFRPUUtyREFxR0o4NlE3MEF1?=
 =?utf-8?B?RWJFaEpIMzVuZnZyRktibmQxOU5xcWdnNW1ua2M4ZzlpWDZIRU1naEd6Z1Ir?=
 =?utf-8?B?SWg2V2RwaEtXUVFvMHo2cjk2REE0Tk9rNk1rcEMveDQ1V0pHSWxudkhXUkFh?=
 =?utf-8?B?ejBkUEY5clBVanhJVlk5Q3ZBWWt3VGlCWnlVR2UvN043RTZsVStmNmgycTN3?=
 =?utf-8?B?WEtOZ2k0ZHBHTG0vSGptbkFuRjROV1psSjNpSTVicjlMZHNQVmFUaWpUai9T?=
 =?utf-8?B?RHlERE13MzU5Rk5PUy93bmoxV3ZMMDNia1VYR2dydVZ2SWVNNUZtcC9YcnNX?=
 =?utf-8?B?UkVmSnhUREdkamc3N0VUOEZ1djEwdWdUbEFNZGltaWJjeFlrSFBxUjNud0Vm?=
 =?utf-8?B?M2YzNkFwMTh0Nlp3MkMyUGloaXpibzR5dEJQMG5WbklFOEQ4eEZTT1RDTjNE?=
 =?utf-8?B?eVZSSEovU3B4OEdpbWpqNFZPR3lNcHB3eEJsNVEyQ3ZDZjNHaUJYL0tyWUFq?=
 =?utf-8?B?b0RrZVRLWTZpVUU1YWFxcVFNNm55R2FQR3dsaDRhU3ZaWWVTck5kMzRaTkpV?=
 =?utf-8?B?blhCSmZRQStoeW5KQmFsM3VURzNwK0IwOEVsQWltSi94Tk9sVTZkaC9kUlhP?=
 =?utf-8?B?Rnpqa3pyTEFLSWNJQXBpTVRPcU8zVllnclprNHdBTitsY3FLV1UvQ0RjVGda?=
 =?utf-8?B?dElsejEwbUt0cUVqREg2OGRSTWRZZmRwNFVMMHBFMXdua2lGUlh2UWNrS3RS?=
 =?utf-8?B?RkJxU0NNNmQyajNXWGRXckJOWG8yRWkvNmRIaG5Ca1J5WHdGQmlSc3FQQS80?=
 =?utf-8?B?T1NCbCsvUkQvQzl0VFZpS2J5MzhxSUZhNTFLS2tERlpFc1VGRFZBcVE5dTIw?=
 =?utf-8?B?SjU4NzArOU5UVzZrbGZzVjhzQTd5T3d1eE9wYW5tVE5vOEFXUFZwVmlrNFFV?=
 =?utf-8?B?dTVxNnhmMUdWZ1JRRFlEbmVpRFlHTmswUzNKd3hJUWRNeVpwLytGK2p3c2ZM?=
 =?utf-8?B?eW5mVzZJZVJMVm5EZTduRmhzb1A3T25mV3duZWpnNTNreXJYMXhSU2FjUG56?=
 =?utf-8?B?MjR4QzhvQmJPeHY5dzUwdnZuTmFDcjdxclZMc3IyVEl1SGoyaHZaRE0xbDE5?=
 =?utf-8?B?UFZOWk04alRhaGIxNmNEMUJMKzdtVExvWUhSaGJ4M0RHWnlZVTFaNjBBaHVG?=
 =?utf-8?B?MU91VnBjWXhtb0FDM2JCYjVFc2xlV3crS3lMeFFyV2UzZy8vclVMNnAxaVhl?=
 =?utf-8?B?SnVtM1ExTGplUjNIaW5UVkZOZm5WOFhHSVV6R00wemEvd1laMjZuZDZGYlht?=
 =?utf-8?B?aUtiWUxYTnVvNHM1L29JYTg4RWdEbGpVNDRENWNuaDNIWGl1L2FYaHh3Wjcx?=
 =?utf-8?B?WDUyRFY1NGdzbHZYN3FyT29uVzNqYVVnOGdtSkJwZ1ZWWG50RzRnQW9GMU9x?=
 =?utf-8?B?bXhxOG5sWmY1S3hBUUdKRlhrZkN6Q3ByNWNITXoxS09HYW5td1ZLTnlENWxl?=
 =?utf-8?B?YnphRHV6UWJURk15RzR5WHpjV3kzeEVaU1FGdUVEdWpwa1Z5RERuUXowNlph?=
 =?utf-8?B?a3RtNDhxMmF2djJhU1ZPZW9mM0sxTHIwemRDeTQyOHR5b0NwcEIzeEpPVXVN?=
 =?utf-8?B?OUlpc2VKbmtpQmJ5ang2NnFVbzM4S0xBME42VVVHd3BUVmthbzNxSjh4c2Zn?=
 =?utf-8?B?dUdZRzNhTnlKZUpoUEVGVnA0WHZDenJZQ2RUdkVYR0twTUdFWW9vTjRUOUNF?=
 =?utf-8?B?RkdvM1VhWnAwZkYxWlc4WFBxcmZoRUdacjUxTmwyQjdiRGl0ZkJRWVp2SFM1?=
 =?utf-8?B?Nlh0dTFTSFhxTTRmeHB4TnNtdWRQcTlxN2VXMTNlcEF6U3JPSmdKZXBMdDd3?=
 =?utf-8?B?N3ZxNGtTNnkxZHVYY3lQcmNhUEhxbTNDdW91bGhYcEQ1TXZKL2VnWWhGODFK?=
 =?utf-8?B?MXdMSEFlTzVrOHVXc09qN0JReFhLdU9pSk1sS09Gc3RGZ0phNmk5aW1UcjRK?=
 =?utf-8?Q?cZAzUHRBHM/wwp6k9J26JIw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 806d3763-a12b-4a27-dee9-08db9d191d7d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 22:52:19.9000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Gv3shwyitYewxch/RP1po6HJSOun89hMlpqyTxbb6UhBD6JrB4QMp4aOwL/V4LHhQy7WWSJtqjv/aHMbBQJk+ItrXsmGP0lKziE/DAu5TU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8710
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/4] fixup! drm/xe: Introduce a new DRM
 driver for Intel GPUs
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
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Aug 14, 2023 at 03:37:33PM -0700, Umesh Nerlige Ramappa wrote:
>struct drm_xe_engine_class_instance might get padded for 64-bit
>alignment based on compiler used. Since engine information is kmalloced
>in the query and drm_xe_engine_class_instance may be padded, it could
>potentially leak some kernel memory to user.
>
>Add a rsvd field to struct drm_xe_engine_class_instance to make it
>64-bit aligned and zero out the field before returning to user.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/xe_query.c | 7 +++++--
> include/uapi/drm/xe_drm.h     | 1 +
> 2 files changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 99a4800c7c53..b9d565264ceb 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -65,7 +65,7 @@ static int query_engines(struct xe_device *xe,
> 		return -EINVAL;
> 	}
>
>-	hw_engine_info = kmalloc(size, GFP_KERNEL);
>+	hw_engine_info = kzalloc(size, GFP_KERNEL);

This was unintentional. The plan is to leave this as kmalloc.

Umesh
> 	if (!hw_engine_info)
> 		return -ENOMEM;
>
>@@ -78,7 +78,10 @@ static int query_engines(struct xe_device *xe,
> 				xe_to_user_engine_class[hwe->class];
> 			hw_engine_info[i].engine_instance =
> 				hwe->logical_instance;
>-			hw_engine_info[i++].gt_id = gt->info.id;
>+			hw_engine_info[i].gt_id = gt->info.id;
>+			hw_engine_info[i].rsvd = 0;
>+
>+			i++;
> 		}
>
> 	if (copy_to_user(query_ptr, hw_engine_info, size)) {
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 86f16d50e9cc..53cd57342620 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -753,6 +753,7 @@ struct drm_xe_engine_class_instance {
>
> 	__u16 engine_instance;
> 	__u16 gt_id;
>+	__u16 rsvd;
> };
>
> struct drm_xe_exec_queue_create {
>-- 
>2.38.1
>
