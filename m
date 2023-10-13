Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D734ECDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 19:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D97610E63E;
	Fri, 13 Oct 2023 19:14:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A02910E63E
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 19:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697224493; x=1728760493;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pj/vQy607ksk/xraQR3K7sC6sqMyAXQArm2JlcNXM8Q=;
 b=mTvz08QKhMCwm5+J8unvyJX4XmXMjU0jryJKcNAG7VFNiAQ+xp10RRWh
 oGyIhUuIIkGoVKiLlVEdDAlOpfykQ6xQRAcKO9su83km8t3VD2+xpUeSO
 gJfMCKUnyr+vsVy254m5UaN9Ua/CdQdZHUOnxrktrAGAeBdB1ZQCubXh+
 S3nb0lC/CylMK6cFQg/u3etO6NCSE/P9vWSBbWSHIAyghzZwAycRw8TGr
 L8bOlVo+auuQ71Y617ZnYekEUS32wd02evHB8Hwir563eRmRMYVAd09io
 7ChtD93GlyXKAJZEbUypaSzMQWjpvT/gMg6dL7yHXqb2RRYtoOPp0qTW3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388098479"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="388098479"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 12:14:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="928531736"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="928531736"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 12:14:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 12:14:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 12:14:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 12:14:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 12:14:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzoxLZf73gC+q0zJM8x5yrXq8nz1Qg2gfLKWadDCzq+kA1YFYSp90h+34RwYA3J1O4GdNs36Vj859Pfrvg5pmAzaaKV5xwD3n+e/Wg87bisd+t0rHWCajgYA+nVRZlfM3NLeUBzUkMtDyrKuhrwypj60SG2OAwC7ApxYwNF4JlS9pl0JJ62i5fszcPLPqMN/KBclvUZXfxsHj4RdeclkOEpr3HDAGMazE58vY+QYSgiXUIuEKHWb3HyBKSzvTUOE+B1Wa6s34H192yoRDT6hNGmObLRtv/hYbDAM577I8L+XzN74FWnJtxyzpnqXdwISKBjP35kAogT/QmF3h3F/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AR2ae3pqgD44f9dINnMTxCsng3Rk6DGPMxwzUb46jkk=;
 b=ZyQ5wC4bOvpi73Khj2Rx6P036EL1v+v2P4Ybt9sU1C6n6heXnHb1rJt2L7N4rgh9dLw6IP3809QjanbzZi5QboH78BauArpLtZ61Ek5zFVf2nyIeS7FkyqCzLwBLE1DVE7oP1q/Oe2EbCb0wsrusSPN7Fa3ulRYhEnfzSAimm7QHy+KhylRNMkiV5dqpxbUfs3g1nPuYb7UqidNp0pOr+iE2XSVKYdHclpF5y7Dx9NNQho/EgNfYv/YXcBsH/LRU5celzcJoFq4Wvyy5cZioOXn07B86UTdRdQs5D+Hf5CWq9l1bKiT9/81DtMkUeaXTGdLnvmxuOYEptue8nWH30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7082.namprd11.prod.outlook.com (2603:10b6:930:52::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Fri, 13 Oct
 2023 19:14:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 19:14:47 +0000
Date: Fri, 13 Oct 2023 14:14:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <i63fsiycwbpsrygevcjkljhdavxd2x4eijmxnkrcrfmyxt7l6p@4sbiaps23upz>
References: <20230915223459.2964036-1-daniele.ceraolospurio@intel.com>
 <20230915223459.2964036-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230915223459.2964036-3-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba224c4-fb0e-4890-874b-08dbcc20aa65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VAsMDDdulA3swbkTRKH4pl1kx3IuKzRnvqck43XeVZBcFUPhZ6jUI618xdwUJA8g6joOalgGdwAuk6ER8IYU9gZtKhof24n9qVTr+SH5ci6pFEqt6mJ8kLhScqnIrGdtFCkee1EFnagAtYysUJGwW3Lf2NeyEmOfnG50N/HEg3xL2Aet3U14yEApQE6E7nwu3kOtN+en+Wb3OSzVRFtUbRlwwuEhklEseaS/yqfXnf72vKeUn3vBK3HkOUMD1Kv6l+QJztT3L2yykGh9HS0G3edkKyo1vkhkU12sZeOx6+dUnPw3dyVSbf89Rz0UrAOreOdJef26797jddud/LPecabOrVi9bsakaYFwJ/c0W45Y1n3AtczZUYyk5cavthJ0pG+4QBeuXojL3myErmAzryBktDONGhP0NnWJwa9ec5D6uPiRnQe3VNABCHyWzbq9b9bKx1COm42ybKHlglm8XJye6BJJgmJb6TXpfChKjHdSeQ8lKECR2M9IRshQkT+iIsRuf8Kuols4IT+MZc4erOk9aiyrhstWhsZAHf7P7WHx1suy2BI1k38VN+SKEhWM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(39860400002)(136003)(346002)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6666004)(9686003)(6512007)(6506007)(478600001)(6486002)(83380400001)(316002)(26005)(2906002)(33716001)(66946007)(41300700001)(66476007)(6862004)(4326008)(5660300002)(66556008)(8936002)(8676002)(6636002)(86362001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?igUBT2qbw1PkOfXonoOpb9pfaOBtvH4VeqReNPI95z3+1fXPon8w9mak6Rk9?=
 =?us-ascii?Q?Yd8O8ZMl0jSqqxANZAkcbcGIBEHOj9o5YqxiX1o+pBlMC1AyM1IyDm5lhfN3?=
 =?us-ascii?Q?Twf11B1rWkG1xzZbQtRvYlRCli5etQcFadv9bs35Dfp5JNnKj1+47pmtsifb?=
 =?us-ascii?Q?ks1TjyRzfEo3gGALhBX6ojTUBimLENM8B8YeT9qRvuS7DjbhunuQyeubNxOM?=
 =?us-ascii?Q?9ZIMq8PBz6ZlUrN9EUxtUg1Z54rsakJ/frAFcY9twnQdHNbrx24rjz7cx8MO?=
 =?us-ascii?Q?Llb2aDP11IaIEyaBnqCAg6+wqNdFryHVdE6f5y1UlK+mNAoP1zHTjAsE5kL3?=
 =?us-ascii?Q?rR1d/PqeVDDoHehhtZ7w+k9tXbNNyNpjss21kV8M+2UfwzMwYHlV5PailFMu?=
 =?us-ascii?Q?J8oQvbASfxNU1g7Q0g5eoDRptOpqTZ84XJa8K8VZNAdHmG14vVPwYIMQZPmh?=
 =?us-ascii?Q?8yWtQoLi+hjpE4u4tCdiLG8aGDvfHaq1u6rZ451CrK+dY1zon27rjl5batcP?=
 =?us-ascii?Q?REjR13u0FIk3VtgCPRbb9svQtC4I67LdLLQJZ1QBV0fQjYTVXtvUnEfKJdMu?=
 =?us-ascii?Q?m0WKD1nwg5eBMlngUH20yE/V7RPWiuLor1wp8wkIBB++lc41CtlJIITI6AeS?=
 =?us-ascii?Q?x6NxPRTR9T6h2tml9YLIndj0i590Q+lhEG3tlinvO7CbrVlFdnYcvnhVkX1g?=
 =?us-ascii?Q?mTjF0I+X0Hm4hmfM/lmsYAqHQdmKmEFRPgmpSkYpRJ7kUGqJXKXTBfVzm55/?=
 =?us-ascii?Q?lVz0SBsT60jIYOt3ZSwlp2sxDIUq80NhRXLzJg9OOwK5aB6uMlSN34+9b1L3?=
 =?us-ascii?Q?xCG2OLCaYfpyYmCdCOfF0kuaFpygk3L7wNeeKACg7QKh9iCK4JvAKIhM9h5b?=
 =?us-ascii?Q?4CTDdXwn6N9IreAf3cwUoIfN+0a9aWxsu5QlX1SZOUJQ2N8sE8lgWBztcK7B?=
 =?us-ascii?Q?mSsUDA+/FzkdnrnR3VpdKaJBmgQlX0du3Vk1rUCsQ3DJacdn4S0/hs52/T4y?=
 =?us-ascii?Q?d7YCTZexz+GywFA7Fkx4/qHeO09PZmd04sEvv4ycja0prdHERK1WdZJpcmgn?=
 =?us-ascii?Q?OHI4TEhaOnSxIogxGxXrv29ZaqsTk7VPHL6ZrfFVZFncD6dzPDJPw66mPXhj?=
 =?us-ascii?Q?tMaoVpYWFqHIMY5QKfbzL/cIjnWHYBXO+HXqkWThO+wxsIT+BMfNNNZOzF1n?=
 =?us-ascii?Q?z49UqDdA7dAaMHML5PEuTwz4nQHRQ6Iuz0ZLm29+44rNePTc2h2/9Kosl85O?=
 =?us-ascii?Q?9MsrBOQEnLYcS4S+OrJVa7uoKIWmEOoUJ0qVe7npjSdpfG2/WyBJSDw4fKZ1?=
 =?us-ascii?Q?qmuFC8kkXVTVabBFJLIfQXXZ11eMIbgc9VB3qiPjspTDkhbbVzT7ubuphId7?=
 =?us-ascii?Q?PzhzioSPyvblHxTFoEChVt7wkNMgdH5KTXm1CW0px9cVBP8OsPrk6SXX5ew/?=
 =?us-ascii?Q?hre4z+dpis1yBrN6HMjKNpz6veWI09m0+mnYfjaxHzbmsMIQQsyw5uGul2b+?=
 =?us-ascii?Q?XngAlnrrSEhOd4GAtGYD5uBzbHGSV7pvGhpnwXtbL5ZRPCS4+gbXoOnSSZEK?=
 =?us-ascii?Q?IXRp2bHXqv5fY92YaHFmA1AtUbrnvtWFn5kyDpmSZbk+YIWQL8+lD5+V1837?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba224c4-fb0e-4890-874b-08dbcc20aa65
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 19:14:47.5918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xU0+doUwosoiwyMDoQ+GftuqntH+I2ApjbNEzq9AMt0gEffnZUJS1m0iZLW9dNqNr5l9TkvsA2+6tHiAIWvy9l7Q8LPne3F0ojfRMlYzrSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7082
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe/huc: HuC is not supported on GTs
 that don't have video engines
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

On Fri, Sep 15, 2023 at 03:34:56PM -0700, Daniele Ceraolo Spurio wrote:
>On MTL-style multi-gt platforms, the HuC is only available on the media
>GT, so we need to consider it as not supported on the render GT.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_huc.c | 11 ++++++++++-
> 1 file changed, 10 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
>index ff86b7d8633e..700c43fe287b 100644
>--- a/drivers/gpu/drm/xe/xe_huc.c
>+++ b/drivers/gpu/drm/xe/xe_huc.c
>@@ -166,10 +166,19 @@ int xe_huc_parse_gsc_header(struct xe_uc_fw *huc_fw, const void *data, size_t si
>
> int xe_huc_init(struct xe_huc *huc)
> {
>-	struct xe_device *xe = huc_to_xe(huc);
>+	struct xe_gt *gt = huc_to_gt(huc);
>+	struct xe_tile *tile = gt_to_tile(gt);
>+	struct xe_device *xe = gt_to_xe(gt);
> 	int ret;
>
> 	huc->fw.type = XE_UC_FW_TYPE_HUC;
>+
>+	/* On platforms with a media GT the HuC is only available there */
>+	if (tile->media_gt && (gt != tile->media_gt)) {
>+		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_NOT_SUPPORTED);
>+		return 0;
>+	}
>+
> 	ret = xe_uc_fw_init(&huc->fw);
> 	if (ret)
> 		goto out;
>-- 
>2.41.0
>
