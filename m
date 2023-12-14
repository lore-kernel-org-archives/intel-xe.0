Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4151EC4167D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 21:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E974810E237;
	Thu, 14 Dec 2023 21:48:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779C510E237
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 21:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702590389; x=1734126389;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=X2swHnabUaC3N4TFbEM96jEWEf9JOWoGuu4wr9TnZ/k=;
 b=h37W7aLoCQuwzoODXmW42mJjJROGZfktw/hIes+u5Ay2tiJNgGyA/UTm
 ZWnS8jSHGanZzIDIOIUVIezjmHlb8e6ULYRGmZOQILyW0IN1iQ9ka4eWR
 Fr5rwUpNc0AGTSmOe5EpIaaHwERl9qgR812UWBnLqHbjwJDCNn8Fa2Fgw
 pSAoppVlJUG6gAFihjQzK7hHzSJXnb2tVtPpaq65kElzBL5WOWmGf4XBO
 HEupWM98Fm5L+RHst3fXIrAEGFp7Jkl5p0yxNTqfPpgMJvmXQQbQPC9yB
 8xPy9XnhXtuPFWsNPa89RzXWBUuxSJ1e9aslREoJzsCXyUzjly6kfAkBq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="394935691"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="394935691"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 13:46:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1021709500"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="1021709500"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 13:46:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 13:46:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 13:46:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 13:46:10 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 13:46:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCTi4GdB7xgGY1FvLhhCeOUzNKqXptKSfRxBFpZdI1tsO2VJHecWLXdbcaNqiSmAhKr8NpzXzBominwYPYyq8iThyw41ioYe6ftxKSzQVq6sDGdUMDhc8w8LjdJ802y0J+FNvMIpodGwlQ96wkvRdVCO4oY5ZDFh5FBW25VZm/8t906d9HcJIiNXHooLTLiv+oZ6FLpAdYqXsWHlj9fgRYw3BZyAcwHPozmPoUspvAPBZl6XT21/7o0wYnSOb1OZtj/VrLmhYnGjNpPf9bRSlbNb6tGXt60Cm8xZnCzPYKAqaKcBklehD4xPLAdE7sLpLp2V73AzCh4yGRKxNneDNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxyM08stPgJSNQGr5oZ8/bR2Q/ip5lAD5xjAvHRZeUk=;
 b=kw/nF2aejILrQYPKNZN0VW/3cw1wJO9B5qbrDXXSS22Qcr9rZud79A0mtTvp5CydZFuBZy/Mlpp/OVkfJ6p/+0l5+uSfk2tPLH03PSkfjzhfvdFV20Bbp8adekXqos2RdYu+JsQLLXbe2H3ouVURECL++9+dzJ/7ej34IgVqNkyiLQ3BdrGg9rm59GVD8UuKnD7OOElSP1fix4DxPx3X2vVUFL3EtxRfQn3VP1w33PLDTMaREwIIVwCTWB1LA2fM9NXh6mSdm8BJ7lcWWM9eU24Y/ZykkLRqJ7NQ//sa9qp+NPS9lcEmzxdk8a1UruSNE30JPCaVmKxLb+CxaQZOvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB5992.namprd11.prod.outlook.com (2603:10b6:8:73::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 21:46:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 21:46:08 +0000
Date: Thu, 14 Dec 2023 15:46:04 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/bo: Remove unusued variable
Message-ID: <rv7ti46hbq6degfwieckbwqgis7ubhsrlnyx7w4nddbafs47vx@76okakk2ajks>
References: <20231214213954.3223263-1-lucas.demarchi@intel.com>
 <20231214213954.3223263-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231214213954.3223263-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR07CA0099.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB5992:EE_
X-MS-Office365-Filtering-Correlation-Id: fce11f66-d1eb-4810-46d6-08dbfcee14c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KHrAF2Tq9qwkowFdjK59d5NftLpitC4dyruHK33ldkGU7oQSmQQUPZgZCTdMscMWKyvIQ34Gu+Y6/54svfAoWW/R2ZhyH+fF7JhnxEWD0FGYW5sLZ+2wELp6LI+15JC/sdlBKh8qmvjTg/Vp269+EnG8aqkoyPH1jDUHiDOZd7K2aP3Y67CgcjczmKmZivPaoPO0dGlcis59iL4wb8QdPFbdEiwRbBHanX+KGLu2rtrflxmryQ2BQjTE1rtGRJf6n0qnx1vJ4Ytmv5KmE/AWf8FO1bL/W1Vgv9FK+VmPoEStPnVKVHyzxoC4FmqNCaKLs1X9zGoTQ7lVBVT2uAkLONMlxh5NA0fzOAPbi34UrHB86fv9dH0EqAobww0drR1D508BSLwyoXhli7z2mQCmpozhCb8PWSfBvjWz/Eg91eIzGOqORVh4/JU3LMvRwoIK71F4fxbChQea+8mgvxbM6E1KQQwW8G9lfLWH/POmCVwOVHpi17GCJPBqgwsW2mZatgNsEI25vjw2Bryb20C5O2dmjhMK2rN+Rfs3fCSS30WW6DiXFS4aU4gR/allHAkSFfEpacR7ZZoxDl3i01uh9SF3j9G+VnD6qfwYffozj04fKd3pqVnTxHu/1iLK4LFA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(396003)(39860400002)(136003)(376002)(230273577357003)(230173577357003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38100700002)(86362001)(82960400001)(6512007)(9686003)(26005)(6506007)(66946007)(478600001)(6666004)(6486002)(66476007)(54906003)(66556008)(6916009)(8676002)(316002)(83380400001)(4326008)(8936002)(41300700001)(33716001)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXFUN3RSWDFHeWt6OUNjS0tRY0lBNFR6OXc0NHJiRHBVb2RJSWRQRS92dlFx?=
 =?utf-8?B?OVdOVlZOZnoxOHpWQ1M3eUNPb09mT0Vja3QrTEJCbWtodlZOczVhcW1nNDh3?=
 =?utf-8?B?R0NYYlJlWHJVUFQ4TEZSc1Ixb3VqZGRDMnE4RnJzZEFWR1o0Q1c2WmpnZllG?=
 =?utf-8?B?b0RjNXpOMVJ6d0dna0Y1SC82THdsL0Fkcm85TmFwZ3RKeHFkWXBLSkcrNXNu?=
 =?utf-8?B?b0hEbkZJMDkwOHB3dzMya3RyUjF0eEx0Z2xNQTl6Z3UzRDRuaHJ2cjNPVThh?=
 =?utf-8?B?bmszV1FnWkVKVlhkMFh6SmUvb2U1aFd1dHlLdlRPSjBzK0RpWjhkZFVNSHgv?=
 =?utf-8?B?OGFUVjc0Q3J1VVQ3M1VUczNKMCtEckVVTUkvM0hmVkhJRXdVdGRMakZzZXBY?=
 =?utf-8?B?bTVObGs5bXZJY29xZ0sxcW1TYmMxeUE1VTREdjdsTitnWjRJUnVyTEk2NUlh?=
 =?utf-8?B?Yjl0WXlldUtnVUpnNSszeTNQK1F1bERMcnQ5QVRmWXh1RFhRejR0djJXeUgz?=
 =?utf-8?B?bk1OeHRIM2NYc1NBcExXZWh0Ymw1R1pqd1ZiN1pzeXBEeDh0MDdDczdOME9j?=
 =?utf-8?B?aWM2UUs1MWdpR3V2aUdJV25ZK1VnT2VKTHMxMDFoY0dVL1JiQ1hzTlExNG1L?=
 =?utf-8?B?b1FHOWtIRW5VdzU2N3djUHpxS3hnS3g2a0xzQkR6TzY5MEdwZDZySXM2VEVP?=
 =?utf-8?B?QTY0MWZVZGVNQlpuMHVvSEJwYy9WT3pmY2lQT3U0bDl2eTUvZnArZmRvQWF1?=
 =?utf-8?B?Y0J4dXJURUs2RjZhZTNwYUE5Z1pCR1VOUFFQdnJVb3RhMGdDUVB1dGNTbTJa?=
 =?utf-8?B?empyaDYxUVBGc1ZWcVUvUlhXeHZMNWFaVWx3TFoxanA3bUlmaC9OTkQ1bWVk?=
 =?utf-8?B?NUdrRHRKT0FDYmZ2TUxqQTFhUCtzRXVkdE0zemxGNmRETG85SFpFUmlOM3Uv?=
 =?utf-8?B?UnAyM1I2bEdhUjNYZ0hHbWxBZkhZSkEwN1JnRXg2TnZIaG05OWRvRm1ZRURR?=
 =?utf-8?B?aEF1QzQ1ZTZ1ZlNTL2NZM0VoS3dCdGFSeXBYdUhrZVVkM3d6UG5kbXVqSkNB?=
 =?utf-8?B?c01RYVY3akpIUHVNUk83UTd6RDJUM05VWk9VVzEwcCtOZVBDeFh0WXpCaWRi?=
 =?utf-8?B?QjZIRzVRUEVDZFBBbzdhdlU3QWxEWlUwbEJ2bkxwVHpTM2FNSkJiZnRwMUFz?=
 =?utf-8?B?bEd3M25kdGtQc0swTmNtU0pZYlVqNjUvYk50Vis4UnlZM0JvV0JXQ01uU3Bj?=
 =?utf-8?B?dmdodG9UMzVjV3ozN3ZhaFVTSFZBRGJLODlGM243Tm5uUFF3L3pUcjQ0WkVW?=
 =?utf-8?B?emRUY3U2dGVNclI1N3R3VnBLcjlqL1lybHovbGEwczFIeDZhUG5PTU5WdWJ1?=
 =?utf-8?B?ekNENG41ZENmZm5xM1FEVnkybTdwSitiamtsSVJMcTdGSG5UdVVXai9mQThv?=
 =?utf-8?B?Z1VROE1UeVBBQWg3emt4bUtPbll1Z2RYdVJnanI4Q3RTSmFOZDEwdTFTWFFL?=
 =?utf-8?B?NUhTMi9BL2d2bXFzdVM3dzlaSFZ3d1hSRjFnbnVBVExyTkFieFYxb0RWdTk3?=
 =?utf-8?B?TjhpUFFWY3ZRSkM3V2NOcTg0YzZyWldPcG9iTHV4eVlyd0Z5c0lUMlQ5Qmpt?=
 =?utf-8?B?cEQyOWJyNmFyOHZaTzJ3Y0pGaUtSU01zb1p2Qk51U1k5VFhTK0hwZWxEbjl3?=
 =?utf-8?B?aUdGdmJybXE4bVBOTE5waVdQNDRkdkZTWkRlc3N6bkRnUFFtQTR5Z05CQ3Rr?=
 =?utf-8?B?dVk2UkIxc2FYbGlVUXJxOHdjRkNmbC9kYXVYUHVwZWJsd09uU05hRHRHZUo1?=
 =?utf-8?B?SW53TlpJZCtxRkdnRDFpc3lOSmtQKzZISTMvVVdiQlV3Vjkrbnl2QTRKeXRG?=
 =?utf-8?B?bWlVQytQc2djbWs0b2hFWDF0c1k1L0w3Mm0xMm5FSG1VSzE1SW5sMGZiU1hR?=
 =?utf-8?B?dUhwbHBXSGNmUWpLUE5scXBTa25oK2Y2Y2lPN25aMU5qR25rQ0xHaXVaSU9j?=
 =?utf-8?B?UndZb2NZdXFMZHQ5QmZ0OGVpNVcvcjBQdjRQS1ZGazVaMGZYWDFKSG1mclM1?=
 =?utf-8?B?ZmlqaHB0eWR5dUx4M25VVVE0V1lvZkpzRGdQKytBL3pva09vdTlzYW8yMGIv?=
 =?utf-8?B?R3FkSjlzR3d0RmZLMXdWanRxMzJrdmlZRS9rRjA5UWt4RWgxVVArbWU2Znly?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fce11f66-d1eb-4810-46d6-08dbfcee14c7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 21:46:08.5922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOWEv/bc4PkC2+2tsuKAjHH55Y8Cm9iAQPuUB/xUCSqUNtc9heqp6+HSg7NlPycD9ywSnPxEYHroqt+t0ocbHrSx2u7Ke/x+yM9oNsIrzms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5992
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Typo s/unusued/unused/, but I will wait other reviews.

Lucas De Marchi

On Thu, Dec 14, 2023 at 01:39:53PM -0800, Lucas De Marchi wrote:
>bo is not used since all the checks are against tbo. Fix warning:
>
>	../drivers/gpu/drm/xe/xe_bo.c: In function ‘xe_evict_flags’:
>	../drivers/gpu/drm/xe/xe_bo.c:250:23: error: variable ‘bo’ set but not used [-Werror=unused-but-set-variable]
>	  250 |         struct xe_bo *bo;
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_bo.c | 4 ----
> 1 file changed, 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 7c0037aecff3..8e4a3b1f6b93 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -247,8 +247,6 @@ int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
> static void xe_evict_flags(struct ttm_buffer_object *tbo,
> 			   struct ttm_placement *placement)
> {
>-	struct xe_bo *bo;
>-
> 	if (!xe_bo_is_xe_bo(tbo)) {
> 		/* Don't handle scatter gather BOs */
> 		if (tbo->type == ttm_bo_type_sg) {
>@@ -265,8 +263,6 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
> 	 * For xe, sg bos that are evicted to system just triggers a
> 	 * rebind of the sg list upon subsequent validation to XE_PL_TT.
> 	 */
>-
>-	bo = ttm_to_xe_bo(tbo);
> 	switch (tbo->resource->mem_type) {
> 	case XE_PL_VRAM0:
> 	case XE_PL_VRAM1:
>-- 
>2.40.1
>
