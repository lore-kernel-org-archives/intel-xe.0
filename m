Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA1AC35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 23:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E035610EA9C;
	Fri, 15 Dec 2023 23:18:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D773710EA9C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 23:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702682322; x=1734218322;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=unp4zkxRRBwAP3IuoDHfvEC3vTQNUobXdZYsLShv2HA=;
 b=bJ3bbCXzmjxnSduIbFN+2uMs8VRcugg5z+QOEImXzrbSJP/WUp+H071L
 m5DG0UGyMNg9Wao6vJx1mPbmOlE1O4ZKE/vK3WW2VHmlq4lKCbyk1c8wt
 1lSf75cYsLot0IVfER30HOl7RxlQ5HTKL3wlDquC7ThjbXHdHdyz0EgHV
 J0a2XLOmLz/GDGWleHLJ3ZHE0el5cFkpAGe9VbOa1vnKOBxHJzhUD4Z+R
 H01qTfU09BL5kXXtjqxgF0PUU9FLZ2ZuE+GBaZlUBqmUeE/vmj8dpXxkf
 Y7jjo85sXYT3aVYnOaFvTqaaSUvf75S4/kb+r9P8uxplbhSmDTCW19/j+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2180081"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="2180081"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 15:18:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="803862852"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="803862852"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 15:18:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 15:18:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 15:18:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 15:18:40 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 15:18:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTeky0SDwdKH5h1d9BefmZzYG7EhHt1+1S8xoR7WKlRNizZDyu/fCxOkAnYOYEWCDdKX9WskLxtCGDVxx8lQxF49q1LwhKzgFHLAYcUiUMbqrfVyEuhYXVNaXPdNYRCFxKw/cZoQ7z5KqHfzT/hHt6JQMfe9H8W6AWMSt0fhswzfpJ6KyPByWNwkV/zyxb+L4JPCwhNQCBVh31i3Zl75bvMyQBOVFxrj8pA+dTXpWgNQkYnRDoAaVf1FDW5ctYsjq8YTaIPz6p0jLy4ZtmZTKVvPUz3yRTYI8ORyukY9nivIF+Ib6egb+aZdcVmPS1pGjW+8Gqw2byzzdgjrj9ICBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8TcK5qwyMe9vSm4c3RECFyYjQ3d6whWJU4xfiplbCA=;
 b=QCd5cWGq0qyms6xKft+HPHplthCJESkssJDkNrINzVGoH1Cc5jGgfUP4JpVYXT6MpJNlwzPClGEDr2TDmXHxcqxjzc05gWehZX5JJgx4trUHt139su1g5e/0k5Sdvmw+VBiwZk1mD60VSUQ8cGU5Y+TOARwDTLZEZpJeo2n7GTt9oATJE9NazdjpfjMMBXs4h7iApb1FGZS0n3xXk6gp8t5DD433qc4FwBypvqZOa93TYGUp3gSkYpluSACY/I3xkqjNwlol8w6umOaBogiAPGYER1omxH+KiF8IJooqMOlZ5hYvZ3l7yKHtD0FhUaLJkLVGaOd7dhPSkVtYRWCGlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6358.namprd11.prod.outlook.com (2603:10b6:8:b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.32; Fri, 15 Dec
 2023 23:18:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 23:18:30 +0000
Date: Fri, 15 Dec 2023 23:17:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/bo: Remove unusued variable
Message-ID: <ZXzehrMYyxpwLB8n@DUT025-TGLU.fm.intel.com>
References: <20231214213954.3223263-1-lucas.demarchi@intel.com>
 <20231214213954.3223263-2-lucas.demarchi@intel.com>
 <rv7ti46hbq6degfwieckbwqgis7ubhsrlnyx7w4nddbafs47vx@76okakk2ajks>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rv7ti46hbq6degfwieckbwqgis7ubhsrlnyx7w4nddbafs47vx@76okakk2ajks>
X-ClientProxiedBy: SJ0PR13CA0200.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: e4dd65ed-88ed-41b0-3426-08dbfdc42686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jjqqkd2XFr0CCWW5NXWSYdF2PTOIqMDk04LMGH/+o97IKdw2GvokQuxWTN6ilH79P1xyvogbsD1ylpGHv6Pq2/RWzeS5cCHjqyJVnCKZdcwIf6Ur86F/MuA59oTOfNT1wwecv7NNRyMYY/DK/V2DvotvMNiiNPRc608vbiXmvpUtR5bfAKBKyh0QVO4AylWXAvHh7ARr1jf8MGroPILQV663sHK3u0vDf/N8dpQfg6vCPLC69vS5SGjeXB1dyd1wow7w/K+3jn5gYqkh1m3JO+StH+0t5RyZs17gZjlxidPIqrAKWUtOJGxxoeyKuM82kD25wnPTLwYcvyjNGQpkz9Yp2vsDQgjNiFTHnaUwzH52nW0Pa/cbEUCLNd74St3o+TL5666T9U1CtpLswuw360VMLsoUfbBWJdoVWTYi0tfIaF814oGWgHXr+yHapdI6qJ05P7HtOxot0OpggPxtHuAVyvtarnmC20WiEywHCPSVyqzovRZJiA14CnoHz0fmd4OLXRww5goYv6o0xBYUjyx5oSoh8f8dAK/gcy9LAQrxlhQRmt8379aQUnEfqadXXFOYOTeDoXvlvuMnOBFETxlZ0z3y+/k+Hkbz8qDumMXTlPMZoW98uab84uLgB0UY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(230173577357003)(230273577357003)(451199024)(64100799003)(1800799012)(186009)(26005)(6506007)(107886003)(82960400001)(86362001)(38100700002)(83380400001)(5660300002)(6862004)(4326008)(44832011)(6512007)(6666004)(6636002)(316002)(66946007)(8676002)(6486002)(8936002)(66556008)(66476007)(2906002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHpmanhuaTN6U0IvWHJTTHkzZXA3WXBwTnpqWXAvYWJ4SUNZRWtxZzFQT1c3?=
 =?utf-8?B?eTk2QkFHU25JaEZJb3p1M09hWEJKenk2d3lTamxGNm9pWVJHMis2MlFJUW5v?=
 =?utf-8?B?T0c2SWpjaFBJV0lhV2xCdXF6Rmkybk1acG16ZXU0bXlkT1ltUnpzUUFWTWxl?=
 =?utf-8?B?emkrcnNlLzRhREwxNXVrL2lYRTBqZXRXc1VGU0orRXN4R1JUYlBMcmU3WDFn?=
 =?utf-8?B?K1RSZDdNT0R2K2h0L2pFVGt0dHNXNUdsL1o4WnREMEZsU1dMSmN1WTFLMFlj?=
 =?utf-8?B?dXhsS2ZxMThBNHJWTXdtNmg3dWZRRVF5eXROTkZQbEZNcHdWdjVUdVhuNFI5?=
 =?utf-8?B?NnM4VGlhVDZRTWFsTDN1bE9VREx6dlpKWGRPWTRFTzNDemk2VUFKVXBTSURS?=
 =?utf-8?B?SFFDVEZIQllwSXBvVXlYVU1ydzB0dHlBRnp5Q01seDZJTDBuaFM0SXNNSlJE?=
 =?utf-8?B?M29TVk8yL3F4V1RwNGkvMkJhckpjSFlrZ09mNjJLcjNaRXNCTGh6TEszTUN3?=
 =?utf-8?B?YlZqSzdxcDErcmtYMCs1b0N1M3ZuNk9GZkdMd0VYOHA2RmtpSjBFMDhPdDl0?=
 =?utf-8?B?ZWpsTW13dDl1b29MQXJ3WmZIWFVzTHBHUmpNN2N6RTlUYjJXTDIxeStPQUxI?=
 =?utf-8?B?dUwyMWxPNzhxODUwMFJFVjEyY2Vzb3BOR21MYUtNQzhpUlBvaGV0ZTE2YmMw?=
 =?utf-8?B?NHQ5MExpZ0ZWZEN2WWZ1K2EyZlVjcUt6c3BUWDEzV3dEZlVDb04raUcwMVlU?=
 =?utf-8?B?Q1kwN0V6UWNFVWJrUzJBeDRycDV4WjBzTnJXcW9qb0E1M0ZDdlZVWkNIdURJ?=
 =?utf-8?B?cWVxU1FxYkVXb0wwMzR0WjlXZHJjMDdVTURPQWYvV3ROUWxLZ0U4ZUEvOXBW?=
 =?utf-8?B?V2Z3TWF6RGNPQmQ4Q1A4UEFBZkJPUFRSV2pjemZpb0hxdTNMYWc1bWxlWFVQ?=
 =?utf-8?B?OTlPREpjbnUyQ28wRTB5RzBraXRsQ0pkanQxNVB5aSs1Vm1pRWlCM1FLR3FQ?=
 =?utf-8?B?YmlPYzR6QzdjQWlMVWlrT05wRzJnb0U2RXAvdG1pTWVtZ20yc2xYMXZXN0Jy?=
 =?utf-8?B?WVYzV2hwL1lwOGZZL2laYWZyNjJoYW5qdWpsMmlzRjZDU0gxaFNQMnhVcTZz?=
 =?utf-8?B?dFBJVUdEajJReW9XbTdDcksyd25uUUZFNmdES3hmczk4Y3VHMnpzM1hnMmI5?=
 =?utf-8?B?UCtuZHdXeVd1RmFtWDUwMGpzOFE5cWs3MncxR1EzSnl5N3lpZGZkOVg0c0F2?=
 =?utf-8?B?Y2RxWTRYS1NiVG5Jb2dqQVl6dkkzV3NwTVVreENReGZBMmFSQnlpTzdmT3dK?=
 =?utf-8?B?Y1ZUKy9oNG9QNGpBQVZaY3lqazBkOEZFdnF2QUt3QVZvblZDbkdqcHhIdG91?=
 =?utf-8?B?cE9wblg2Q2c5b0VackJPcUZkeG5RdVhNUDM1M2w0WDhvc2NlRGJGNVI1MHhL?=
 =?utf-8?B?ZURNS09OTWI1RGxJZFNUS2hEbzdQTUFqd3VXSTRRalRMNUhtK0Z0cjJnUy8z?=
 =?utf-8?B?OEVqZHJ6cno5djQ5WmpjQVJEaXhTQ2pwSmkrSi9aQ1laQVZSR255Y3MrWTR3?=
 =?utf-8?B?L0ZOTUZrcU5qUGltSE9ReU50VzZjbXBIdEwyQUxjdXhrS083M1l3clBxTFlX?=
 =?utf-8?B?cW1mVzJYV1FrRmtLRGVxV2xxTHNqZzNsb3dSUDNzYUhiTnlMWkFFUzJkeWVM?=
 =?utf-8?B?NGIxc1FYREZwZW42SmVqa0Mvc083VHZTMlNIbzQ0YjhVcFo3SEpwcWpQdklR?=
 =?utf-8?B?NkZlOXFDVmZ6eGtYdlJYMHZKemxBR3RWbGJPcWtCZkxpbU5SN0lScGFZcWR5?=
 =?utf-8?B?cmwxaUpSVC9KOG82ZXQzY1ZPbTdZRUVSbWJsUG9FQk00cFdqMktRY3MxSkZB?=
 =?utf-8?B?OGljK1ROb204d0lSVndSN2FNZ2tKOENVZlRWUDVDa3hNdWRIL2t6OEZuU29j?=
 =?utf-8?B?UXc4blJRUVQxL0F0ajJCaXN3SVNvT0R2TVhjM0VIZTNlYVRRNnNnVmRYYmU0?=
 =?utf-8?B?cHloU0pCOHVWNk5odGxOSi9Hc0tjQzJLQTd3emtLNE9xVldkbkxVWEVqcXJt?=
 =?utf-8?B?eU9aZHh5anZxdVFyNmxYaEEyTk16Znk4akg1endHc1l5UTVhRktWbFd1ZWhX?=
 =?utf-8?B?d0dHaVdiZFZQLzdxWXEyQjU2ZVBlY0xNWGpGaVdjSGp3dTBEUFhiSHVLdG5W?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4dd65ed-88ed-41b0-3426-08dbfdc42686
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 23:18:30.5875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxes2RLNN1LfA7n0qlN2ZcS78/xITEE0bEKuD/tsuqFn4zqv8TZyf7Y7RKHdN3msvdu6CYwdGgALHNY3MTvg9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6358
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 03:46:04PM -0600, Lucas De Marchi wrote:
> Typo s/unusued/unused/, but I will wait other reviews.
> 
> Lucas De Marchi
> 
> On Thu, Dec 14, 2023 at 01:39:53PM -0800, Lucas De Marchi wrote:
> > bo is not used since all the checks are against tbo. Fix warning:
> > 
> > 	../drivers/gpu/drm/xe/xe_bo.c: In function ‘xe_evict_flags’:
> > 	../drivers/gpu/drm/xe/xe_bo.c:250:23: error: variable ‘bo’ set but not used [-Werror=unused-but-set-variable]
> > 	  250 |         struct xe_bo *bo;
> > 
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> > ---
> > drivers/gpu/drm/xe/xe_bo.c | 4 ----
> > 1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 7c0037aecff3..8e4a3b1f6b93 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -247,8 +247,6 @@ int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
> > static void xe_evict_flags(struct ttm_buffer_object *tbo,
> > 			   struct ttm_placement *placement)
> > {
> > -	struct xe_bo *bo;
> > -
> > 	if (!xe_bo_is_xe_bo(tbo)) {
> > 		/* Don't handle scatter gather BOs */
> > 		if (tbo->type == ttm_bo_type_sg) {
> > @@ -265,8 +263,6 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
> > 	 * For xe, sg bos that are evicted to system just triggers a
> > 	 * rebind of the sg list upon subsequent validation to XE_PL_TT.
> > 	 */
> > -
> > -	bo = ttm_to_xe_bo(tbo);
> > 	switch (tbo->resource->mem_type) {
> > 	case XE_PL_VRAM0:
> > 	case XE_PL_VRAM1:
> > -- 
> > 2.40.1
> > 
