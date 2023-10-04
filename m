Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1ECE7B611
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 13:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6759B10E380;
	Wed,  4 Oct 2023 13:40:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFED10E381
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 13:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696426848; x=1727962848;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LTP6PSR+yGBnIimPdFAB27Q+XZd70igpqBKLfij8veY=;
 b=GYSc/vnuJd3OUTFF++7r1KL+i/aGRWeI62aMKGMoKRQ1vb3mncrKxJGX
 XEp68EpZBJdprthYnnyAgBLa3v4EBpObb+30nqVQVU8C04yp4xPC+XYqw
 qW5DzpUtsfGYKhuLXj+ABtESXv2VuZYvzs5lwoUqNtHfhlfdXXNpHBFcX
 bvmVmMH/r5gtPs8RBY57lGqnt6rvSmtgdfcgOPIWSHiSVHnAmZiGeX7Wb
 4T5c0v+JunvMjIgBrtAAZa34BOsv2zCB9HSxVG5CEStNkCQTyb35wKLmo
 ljALaeyLjoy44tslGTNoDJQ0ItXnoGEm6s7gMRGSvw0klB9nLGTEdO5bo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="449665995"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="449665995"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 06:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="867375112"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="867375112"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 06:40:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 06:40:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 06:40:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 06:40:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcjBi7/kjnZkVczmcb64O6n3wKYPXiW2+TV8dGXeVKx3XRHYDw9A0yvPK/H1aNsQWN6SWxe5jBLn8rIqnSwIKZ+LfM/JRy3x9nuFm09zwaZ2vv2cW04y9/JuBnNKEHksvDnW3+gFfp6LHYUBfOFU9V4puA4fEP5/kugP4wumziVSYOu2agBv19RyPnf2O0wYXkqh2DlCN39snHHb4uGHg9Zsa8wiTRtaD+ydlyJ3IQVKBSvoPg/PjHsMAhW3WdRIGwS0bb34my14rOG6ZFtnqqoRGPOIcEmVT8bMjxqm81oRO36mK4lQO8LAmK6seJJY9BLxwVggxQHmNH1HteRT8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiXVcMd/A7D450Ghq6J5nqFiJF3t1B6A1cbtjwqfS3k=;
 b=WhQs+Be/VDIMGkrxEvaoiffdhk9YygoVU3TBqAH6OQcIRqX++mApYugqdkUPMEzHMaF9ChbTGf/SWmXdQQa+bd7OQdmk06HkxeI9PnytxNpUiR7f/R0FKebHZJSNL+KoGJVpXGDOD7C1Ob7reCsvr8myz5MIfx0NiK0dDXlcLXvD5eZuGdm0ZonYVg2o/yqv4d81zK/hBgx5iG5CQUTdOBIPqQ1TDNavOymVCuOYB3MVEQQfKzsy0g851oZoZKK5wgtKQbgqWhr4Afb5K+sS26OotonOhnFkiElO9oygIU78a/6/5sBkpbf/ejV4t53/JqgQ/Vp/BEIGKqf86l7tBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ1PR11MB6179.namprd11.prod.outlook.com (2603:10b6:a03:45a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Wed, 4 Oct
 2023 13:40:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 13:40:45 +0000
Date: Wed, 4 Oct 2023 09:40:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
Message-ID: <ZR1rWD6BZgDOk6+3@intel.com>
References: <20230926212056.40881-1-stuart.summers@intel.com>
 <20230926212056.40881-2-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230926212056.40881-2-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR03CA0381.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ1PR11MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: c4bbbe5c-9ffb-4c1b-1d39-08dbc4df827a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JB/iErDom3THghdL6Zdlt0Ns0IGL+O6d9EzZ1MIR8mrBWDtSXlSfuLltILqLfM1g6wav1YSRREFg7DctTdhX7D/BLNRNBPfHCL/qId3qdH2dHB5+34kRxzBJ9fdmcDL4LJcGrOmaLnMSQz0O/RnywCi2j/yWuqaJlmI7/xtblNn3AYGgp/n85s5DcCx6HfM4I6WJwdaF1//rjDfcMGQH36EwXENgWXDgsiURLArqhe9tAXicSc1LSXcqxmTDL4Ai3GoJTgyO39rS4hRnchMbFk52krJv5LCfLbPxfo3hdVKamZJN19yK5OlMJStws06Hsvw8ycE04mEo82nTPhWGAwA1FYPshyv+FnmIEi7wV3MLS8a1lBKMF67AzGaYfw8SdZkvt9tCi3659Nn0N1EXNxdjBcScgKpkTNVMkBqIJKX9je2WjiPck3ruV/5d7Q8i+z84ectV6ORb8XYmF4UvRVuczMBHlrTpFOB0txtL7t91WyRiqPK35x7rCNvyE3zxxOO6DcQMTlWnwNuBeAGZqnLIWzrE7R0IqzU2PK5KrhpEBEs/dg4AoE6KvAEnuZEFamIOO+x53X/VIcQ3Nwcdr4+RD3hwQOg2cURRZO0vRsE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(396003)(136003)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2616005)(6486002)(6636002)(478600001)(37006003)(66476007)(316002)(66556008)(26005)(66946007)(6512007)(6666004)(6506007)(8936002)(8676002)(41300700001)(44832011)(6862004)(5660300002)(2906002)(4326008)(82960400001)(36756003)(38100700002)(86362001)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sx8vZHJvDS9SWqdj4jvEB6WqC+phmzfL4RWIl2udCR8GpRyhCE4LKvogBH2+?=
 =?us-ascii?Q?nJ25WNpZAfaS4bj971GT3RfIvjshuisacJ86ZM1DmhkU4CnNCOqiZBnYqCI2?=
 =?us-ascii?Q?rjbijXDsTw/2M6uY0OeIidQcWbUyRWQgPpOgZ6XbYbhs0ri9bS0lkZNjA9Bd?=
 =?us-ascii?Q?gaYzOF579h/vbSLst3Fyspx1Ms4gOy6FNanB533At5ouu/qdS0ZRjFWPEqbe?=
 =?us-ascii?Q?BPlJ9ktxjKc5k+9vkjjj7SpJV1aify6xuat8+ZAOlL80nUJTiDXuQrTz8cjW?=
 =?us-ascii?Q?RPcgdcdlz3zpoFW/nt1UDAWWdBO6OlWpWPZUt1RSrztyrj9fp3RjkU4dMnqc?=
 =?us-ascii?Q?/GIsv4bEcEeV2WcX/bnr0uMTL8ItksVqZEPr7g/8yRMZLzeYY05zDGvG2y2w?=
 =?us-ascii?Q?ruZNBq+gIcKhhZ1gVBVccoilLFwWKa/S48eiMeO0g19nFDB1gLs4Dlx0rfFW?=
 =?us-ascii?Q?sM8Ke7WQsTXnu7dB1MxQX7b++uPJJbOn2NIFJ7/PCKoU9nLUMA+XN5QN/PjK?=
 =?us-ascii?Q?haOZsgvG3rPj/wL7VgRBavbgctTwkS0M8DMcAqoLfWCRlSOrBSwMfAzonwcW?=
 =?us-ascii?Q?Ev9zbsag9n9m89jCi4l/hKqOydTmlU7BmULIZrAcWiboe9f7U2YIP7+zRp5L?=
 =?us-ascii?Q?f5lKqhN0sH5eozXgIQZUSv8Nte5vp2Bng/BLsJhNdCNdOZVPyI6Ru8lxweDK?=
 =?us-ascii?Q?6hojq3jYk1YoaKP8XECvRgBniZEq1jtzTW4P5tjHTOrDsdXKCv6/zd4tG771?=
 =?us-ascii?Q?o2PyNm6sszCgmUdgTcwTfhhXedKA6nI1qjr+Jcn7Su9xsOwcduKWn8PTNvI8?=
 =?us-ascii?Q?0gBhI+VYWtjgLnwy/k94uHR4pbZXHYg5rMFCInL+oe5j56WO582pVWAuuM1M?=
 =?us-ascii?Q?yAq1f+SkhUjTBsVWlExPvsssaSwzedCd9J7AbBWIbM4mFf3VdS/d677iM7YM?=
 =?us-ascii?Q?T4nhsomg9nCSjrH6N6slHycOysA08dHAwBud+5o+DkaB/f50aqcoB/Vet1u3?=
 =?us-ascii?Q?CUkeWAx0sM/7w/uOOn6zL/lC7Vrsk3RJZc/pOGr7up6U9Hlo1qgy2ZjWbu60?=
 =?us-ascii?Q?CMo/pc3suTr7eLOFZZElg28+/xMnNivse+sje1hGTm82yeHA3nttEkbd+5cp?=
 =?us-ascii?Q?EUmtvEG8JcEdufSbZgXh+67CmER3xBG/bUB67Q/bpglCkAMLPtZNCUO/x2IZ?=
 =?us-ascii?Q?ByeLetOuv/VOAXfjqVIFi5Fs9ivRl5CPYTzwh4JMfdbPXEEgPMxwM1Guqm98?=
 =?us-ascii?Q?+YwtqRQ4P3Ez2BDD0zkQ/V0vbNgDA/xWJbz6PRfRrUoou3aCZyBR+2CwKaOG?=
 =?us-ascii?Q?XDarqMdXcCbjRu78MLkVoui5CJSc3/WsP7nED/SJ6dvy4aMbBi5+Tcj11Pvd?=
 =?us-ascii?Q?Wr0ghgzn1cUwLkaI1D0lKJ4CGjtlGVTUB1Rv/+fgIVxN7H7W4ZZ2jUW0yP2M?=
 =?us-ascii?Q?4dIHlyQUqSoGME1xOg8VW/CQkkLiyUUBoMAoIAXzRDjAfTTqxDw7LaD8zukM?=
 =?us-ascii?Q?0QKiZL6Cn2v48Q7tw2tS8/Lrvpqb+cETeeZd51OwgZseI69xLedaErX6m5fh?=
 =?us-ascii?Q?2tzjNc8FADETxyJAaL5Wu6Xu38hkPq7k2l25w+F/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4bbbe5c-9ffb-4c1b-1d39-08dbc4df827a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 13:40:45.1982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U06pDu3Lh1PkxCdg+XqfxH3/8qhhfL2tVAd7WAS9yzIQB5BrwCopWqcdBzC09WjHNClnneiTBKKCyNZFLJR3hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6179
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Add coredump to wa_bb timeouts
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

On Tue, Sep 26, 2023 at 09:20:56PM +0000, Stuart Summers wrote:
> We're seeing some hangs during driver load on some platforms
> in CI which are hard to catch manually. As such, add the dump
> at the time of the hang.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 1aa44d4f9ac1..80ea076197e5 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -46,6 +46,7 @@
>  #include "xe_vm.h"
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
> +#include "xe_devcoredump.h"
>  
>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>  {
> @@ -187,8 +188,10 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)

please notice that xe_devcoredump doesn't have any kind of locking
mechanism, because it relies on the serialization of the gt_reset.

Once you start calling from other places, then we should probably
add some data protection there.

But also, maybe we should define and print some kind of 'type' var
that is and argument to xe_devcoredump() and that gets printed on
top to ensure that we have a clear indication from when they are
coming from a gt_reset and from other timeouts?

Cc: Maarten

>  	xe_bb_free(bb, NULL);
>  	if (timeout < 0)
>  		return timeout;
> -	else if (!timeout)
> +	else if (!timeout) {
> +		xe_devcoredump(q);
>  		return -ETIME;
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.34.1
> 
