Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71555CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 17:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADBC10E4B4;
	Thu, 12 Oct 2023 17:00:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B58910E4B4
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 17:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697130036; x=1728666036;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hqsFsKyBSzyXheIvPcOItkLMbaJ5a5tEAMIWoM4aJvM=;
 b=UOJXCCZKeJMnk07+bu1oHpJRtW691LzyXo9w58G+oPaq0FiD/xFec2TN
 BztMixKKKbCr0rhAo+ifplU2UnTV2WXhDZbW8Vh3m2rIBE7738XZ5JenK
 Cf0WvAbLAsXytRS5NlrbxK0z4AGMufbb/t1bfkYqviufvCUGk37Yj5eua
 BXUkfel17C7M6KMcq4ADrvHHsef/ICLYTRghnBnJMLOTF6sYUbbwH49cN
 UuRnRZHiC8/mNsnJewcMmaUar4+0c9PFot4q9o2wiJKvP1fHdm+6GD2cY
 31wcNeLbt+SYqbeUUsA3LK4AGQJx5UcHyr/VXzoSOf5c2aZgc+xUZ+tab g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="370047861"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="370047861"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 10:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="747955497"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="747955497"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 10:00:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 10:00:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 10:00:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 10:00:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADCvdMs/FcjDlEbxi5V7rA3ENVJf0lz+7ZipBUpBzRDaCz1Q1YhIeAPmOr6o0480kY2oXiQYml/vEI69thxTltUTHFLa0tdFwEcYuCiqCr3AZVr0hSnSGpRIphopKfwpWx6Zli/8TrgCb1CTTSD97d9VtOpJh5hr2+jOUgBm7BbB45O2V9+YJ08Schx5GmMz5riEhagNF9TEhq/5C6oNjzWcL6ZLQKuRNJfq3AzHhg0EQiAt+lHeP8dHxgBkaoVy/da8znCK7Q0ybDloWM9HBYg7hG5I0FeGtdTCnngHwwUc+px7IWUUlC0zUgWuQhlq+sC4DVGjlDcznNhjPjrL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKkSavmtnN1S2A7FWcNYLPgzQxBOunEqZI0id0Xfn+s=;
 b=jpxNUczLsQZQoGX/6OB9E5jNDqqw4U2hIMb0AEOwsHlbkMfBG1YW2hDEktVFO2Tgk9rmFnrOXzTy8XGIOy2+yqDQ1B3wKlYjayVH1soUczmLwSng+q4+VChzgpJ9X6OQiXvOvJxnBXDTmv8EAQs97TC+IUvbQs+ymRon1CVT3/EH66Fk6/47/OR1Fa5Nats2cwFeqFiKCCCtF1izbsNPmMaR5g8a6RRLxSpPwu+xwzCW00vsIv+kO2FSuWtDy3abNswz/TblzXIPzHMvPmldZ3w9OkKcbkwBewIpWRSKLGXQuUPBEJMYB+dwz7fuRPwcLXp0ZGVTqAOE7T59lm587Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA3PR11MB7464.namprd11.prod.outlook.com (2603:10b6:806:31b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 17:00:30 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe%7]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 17:00:30 +0000
Date: Thu, 12 Oct 2023 12:00:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Message-ID: <5gdgcz7dq5bkdswph6bn7vcvdzeltdbay2lnvwkfq3nngq2tox@kzzfemaguhbp>
References: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
X-ClientProxiedBy: SJ0PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::30) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA3PR11MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: 69d52691-c509-43e7-4110-08dbcb44bd8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LVBXxy/AR0RO8qLFRY9vSZuXEGT6Y2EjD7Bd/L5s8wBKQgwiGpBGc6zzJI22WzaSQ1zolU8+UXDq2XvMgJlOBezV7bJ5m/RRXLmMeSRhko3k0kdL/vzxaXPSs+0/ElRO6dASWdUwbzYW7melIpkn3rS/LoRFlZ2/0RNLMeYckmA/WwyeNDaB3ry2+I+m2wx7y90D/ygJz6/sxmUnTM8wlAPUWGaLDBUzfYyJ7FPhnbTbSw9VdJ2cS9310qzROQYa8O6LcKolibp3j1flhctu665oMBrChkjF2svmDhs5Zofb0iyvvk8VES3yoCA3mX06Jcu3iJ39mztADy3YfEzvlbsXAsWXooTdD9Kjmfw1bL8AI8d4JzvpZigzD9wTyLAPShWxYsTjf4B85UbCNaer9+7NKIRHQ6R+jLsLFBl2J6QbcHlpVPw80VeKGrvsx/6qMuw/4Bf4FV5W1UaKzqDg0YF6ewma7FYa0y9sG0rORMmPwV2rQHzLtQRBaMws6Z7siQP7mg+dGV4dFxb/upk1Bwt93Z0U75PBZJgTS3ihKO2/6oL7qbI748JAIuK49dXMJ4uP1P0MjriNZRjWL/OjCBSgrMWG9Mk4zEO0Ok94b/w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(346002)(376002)(366004)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(83380400001)(316002)(6636002)(38100700002)(8676002)(8936002)(6862004)(82960400001)(86362001)(33716001)(4326008)(66476007)(66556008)(66946007)(6506007)(2906002)(41300700001)(6666004)(9686003)(6512007)(6486002)(5660300002)(26005)(478600001)(27246005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bnuYkKvdtkOGo/ktR6rW6wEvMHAqtExrXq69KKssYdzCe8s+rX6UrzoVhksW?=
 =?us-ascii?Q?gqnTZcMe8m9ZZorPqG3k9FsuUWTK7J5b9lRZvPA6GHB0Xq8w9KH5cAgXECn+?=
 =?us-ascii?Q?wO+iDgn5ws9TRsYGYRn07METWo9/ZtHFflFeqVPvc2OuO4yE2WktDCMp/FRr?=
 =?us-ascii?Q?jbhNqp2bPWySR9W3TkTdxhBTLQcF/BcWGE3WyjHfMWP1ibII7plqEyIdXF7F?=
 =?us-ascii?Q?1lNoErWJSDjDAF0qmkMEUPe88UFqENywgCqVv3AZxYedrx6/88F4+9yFoDFv?=
 =?us-ascii?Q?8EVntG5CrcHDfUvBKcujsi2v2mGW+0RvzVUMZIouZMzAkQe40GZAcJ8J0Fhq?=
 =?us-ascii?Q?aoa8KWodJkg90/z12MeQRN+cPrLzBUY0Xi/ElP+z0CJO2YjGQQpD1s9nQQLH?=
 =?us-ascii?Q?qadiDwxP52QdSHLTwAnJg3aHaJeZZce75y1XPdrBNfesd+qqOl7bE9AASXxF?=
 =?us-ascii?Q?MJrpIcuDc886jC2bjwxxfBipJpPIDi3fs88zJu4wBaobDyieXLXs5QV73jTo?=
 =?us-ascii?Q?GBuMshaVfL1YHBacXXi7LTC3jx/xXUiaSjjmqeFNSixqpF618wsCv4D6Dk2j?=
 =?us-ascii?Q?GboJ0dzBorbWvf8dY/XdP/o5ezL43Ab/kLYS0juvEdWxcTFtplQ2mxfqSSw6?=
 =?us-ascii?Q?c5uND6EGTV5fJ8/mx+8W+04z+uIop3h87gLE/KX0usszAVcWt/cE1xH5iGDi?=
 =?us-ascii?Q?WhShDPX48/CN4S1xoT/Gbm+Z9cQKZLGpDqFC+POK8MfESbOGsAOrn06ebHrU?=
 =?us-ascii?Q?zUMyCvpRkAy1SbMwzZ1JmdhKt8TZ0nLmjKRN1l9D+7oEPSc8SfLqIzZko4HS?=
 =?us-ascii?Q?U0uyRp0m2Wi3/dmdV2Osr8+D7vQHwOOICPOYOy4sYRMFhHd3Y67Or9zpNd8B?=
 =?us-ascii?Q?Ht5CK6Abd4K2bMcz5nTNuAb4Zy10UbLtFZSnzh5K4fuCnYEtngVVWMvz/+Lv?=
 =?us-ascii?Q?fFaK2jDOL03H9dU6InkzqxCZ6xDchO2zVu2+bc4luLLD4MsdTfKX4H432GuJ?=
 =?us-ascii?Q?4c8v+1MfolxwGLd4yaKUII8RlCxL0MwKr31MW+E3AqJinzyqfJ1uJ8nrWDP/?=
 =?us-ascii?Q?F3DvbT9CVbTneV+XO2zBz0E97vox2p4c+/CRvlspCmnRp08FagVrJruE4l9E?=
 =?us-ascii?Q?8Fep5cVq1Eit26xLTKMFrUM9UrHanU3lHYJX3pLhtnUnOVBuDwYjgI902m6X?=
 =?us-ascii?Q?qZwBCh2qt7oMWOcxArHuO0MY8QfbPL6foocbiuBMnapwfKL08z7QPJqv5GHH?=
 =?us-ascii?Q?pLxHKrQj4Jfr9RKx33g1g+7qLx9vVkIDWlvZVwQvBmEkL5ri6HDxhHhG4ztI?=
 =?us-ascii?Q?seHzJYvmqGgkgZbqM1Lz03i1VXj5H4DFKjGu4cbON+FdLZjGkWBJ5FvNFQeq?=
 =?us-ascii?Q?Xr3NHjS/D4XNYlcAxqd7iRPDfEr2ueQ+iIFhVIyCcTBM4s8s/KVIxGl2XziO?=
 =?us-ascii?Q?0ezLZaCXqPer2oM6JxjKPAestoMb1OHU7jU8hXg8TjhjnRmicAa/tiz2NcmH?=
 =?us-ascii?Q?5SwraB8BGxaX75gRLEKbtpjlz1p1CNxZxMzJXDKw1Fj2qnfeyY/X0qD7jjRT?=
 =?us-ascii?Q?Ncn2KB5mJp1xo7oUWNRI8lmE7wqYTuHMsKBsvkdtbGhdHgCGnT2p1xtTg08S?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d52691-c509-43e7-4110-08dbcb44bd8d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 17:00:30.4434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhl940Mzaxt5sMHVNnIGWMtELVv2PVM7YTcuXnr7zIBWP0rHn6pohniv30h4LLh4MZqTYb8zfydJiq3kxdxGMdSR3hdhiKpNpInlRqjk3rE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7464
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 0/6] Fix compatibility issue for intel_dmc
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

Patches 1-5:

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

For patch 6 we need to change the define removing the directory like we
currently do in xe. With that you can add my r-b in that one too.

thanks
Lucas De Marchi

On Thu, Oct 12, 2023 at 06:24:04PM +0530, Chaitanya Kumar Borah wrote:
>This series reverts hacky #ifdefs from intel_dmc
>
>v2: Rebase
>v3: Add compat headers as fixup patches to
>    "drm/xe/display: Implement display support"
>
>Chaitanya Kumar Borah (6):
>  Revert "FIXME: drm/i915/dmc: xe way of getting at stepping"
>  drm/i915: Add wrapper for getting display step
>  fixup! drm/xe/display: Implement display support
>  fixup! drm/xe/display: Implement display support
>  fixup! drm/xe/display: Implement display support
>  fixup! drm/xe/display: Implement display support
>
> drivers/gpu/drm/i915/display/intel_dmc.c      | 19 ++----------------
> drivers/gpu/drm/i915/intel_step.c             |  5 +++++
> drivers/gpu/drm/i915/intel_step.h             |  1 +
> .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  4 +++-
> .../xe/compat-i915-headers/i915_gpu_error.h   | 17 ++++++++++++++++
> .../drm/xe/compat-i915-headers/intel_step.h   | 20 +++++++++++++++++++
> .../drm/xe/compat-i915-headers/intel_uc_fw.h  | 11 ++++++++++
> 7 files changed, 59 insertions(+), 18 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
> create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
> create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
>
>-- 
>2.25.1
>
