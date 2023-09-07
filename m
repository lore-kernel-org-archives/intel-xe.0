Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFD1EE14D3
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 05:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E08F10E02D;
	Thu,  7 Sep 2023 05:26:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1545710E02D
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Sep 2023 05:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694064380; x=1725600380;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QoGNrjhkqITNPYIj+p1sl5I/zFzRJRBstlNMrdCqX5Y=;
 b=PLiT/izdiLAYXolF3ZZSiOUF1AfCNRJ3Ux/yZtTxdivzFFPZRZ/QNWVq
 i4/njHpYT8Rfhm+PY2jOofuZnUlcs1pKvk0CF4U8SxRCWBe6fuoBnd+ZE
 5smhuX7SZHbGl7iImf4TfNwhhcO11RnlSUBJI49mfnuPkd1ZhztQJnIb7
 IT1PW64YH96rEDICQQZy6pzhGaA0ydEVJyrZYWVOit5Vlf8Efwb7qCxJc
 hpuVzS+WDlNJnfQRU6NHZm1uxGDc6iOTdfubVY7/jsZpcyoIhJO+Ihoi/
 T5+4st3Zz0s8We3rKgMVOV7DLne7qE9Q43xcZATpZIGMHEn1Ztby4DjCZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="463639632"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="463639632"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 22:26:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="865476562"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="865476562"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 22:26:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 22:26:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 22:26:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 22:26:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaGbF61GE+45H4irmkh/+2l8CXXsP1YDBT9Iz+90zwzSYEmT/26BHGKdfssUHYQKhv0oL0bsdnCqU7raXklY25MTdC78TMDVUvvADJ0pMNbRw1eICjQnyAzEMJj83nVaqG/mjssYjVY5RZuu2Op7fWhcywVQ7wKIeI4/L46M2I70ot53hluats9NFmAHRMEVs/8XhwOyYid3X78ewfeISkf5kd9V9bBlo0gLS+pbX2NLoluatUKEMjtJZHNAM46tiMUhx8RLQUYA7K34n2DPFr8kyKdbJvXRqZbPyDCtrCjrWuzT+TyNdeCDMZ4NsDfCxT0ugOwchhwbhPd1NNDrjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmooJpyhndrX2u8ZoFZFNcSPq6yC/eApqE7HGq7sFwU=;
 b=iOTiwZ+ZDSJcZ1kRqM4soTJsUOumPUe4Z2V13dAgj8OKFvRw7kaLWYEwJ/nMtiSpm4fB8yocMgJak/uCE9z7lGxbsBu4K14+Fc9sUmszvecsGmmD4iL5WTjAVgKbVrgM1YkGMRRlR/h6n2wCnfmtowcwNvx/DPyejkKUY3tVFjiAgxyVWzda8CnoQZ1URo/AL5J7BiE7T3opTcUq8KX0RnJVq15K49wnCdhMOoz3XdlTjh770yZZjf2Dbsot5ast19ulPmJ+0tyLBxRDESrcxCAmgS7kM3JMZtRWMDu1VjtAmBYfZdn6RUQ5KWZgCy5mLnu284qRXtr9eG2eBY+MUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6328.namprd11.prod.outlook.com (2603:10b6:8:cc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.33; Thu, 7 Sep 2023 05:26:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 05:26:14 +0000
Date: Wed, 6 Sep 2023 22:26:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <wkeve5cu2cymsduozzvrpaozdtflt5rpc662jaegmy4wpfzgcr@d7foj7t6akxu>
References: <20230906230010.2704642-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230906230010.2704642-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY3PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: 892e0c87-95b3-40a1-ffa4-08dbaf62f3f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zVwrEv6Y7/zrkvkjk1g/4qAoUh5Y1lpls6HblDY3qDUEShPZ9Ogp18LfL8tme0apWuA0hSTPBhFsSjbarGG6ITel2huSnkzHLH0fqakf8O0QNS3RCYrNriY59UZDIxtmduVKu++8GVs0ZkQby9mxa1aPUaB6TnUUqdZUKMievYaBACVXvcV8NOijdW0PbY0fQJKEyfAv47489gWQ1Z/J3I7XvueNdSI3wT6mGK1xcz34yjckwj2QgpPWp7LlMFhefW+gWKzq1X9TyuB8GJtJBItr+sfn7fbCvdxTcvPBdYWuW3Lkj7njX41OtP7lgbJv5OKGH8GrI1GrXi+Q3+tfOrk4xoBYQF6caJxMitUWeZ+qZl6y87bFLR996pKPqx/qDCdK1IIm1SBPZqc038Dojcj3Dyg4es9X3xYkDT4CS1nxKLK55kKitegWD18DUL8wMqwYAvYA5MONOgPW7wVIwXeuwEPdSPdNskkqrrAZMNP8k2UTwZKVUkaqqoYgKlZyYz/UjCVGcoN4jdK346o7ACDofAmXXNpJRG4aGBx3M8tLfsoutAG60EFsEFBZ9TA9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(39860400002)(136003)(396003)(376002)(186009)(1800799009)(451199024)(2906002)(82960400001)(38100700002)(33716001)(86362001)(6486002)(9686003)(6506007)(6512007)(316002)(66556008)(66476007)(6862004)(66946007)(4326008)(8676002)(8936002)(41300700001)(6666004)(6636002)(478600001)(83380400001)(26005)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0lp57mxgagxU1xNgIEJidaX4WUsA4QU7CPLWU2t4oY2zNKM73g4p4o5/qWlg?=
 =?us-ascii?Q?N0ovWY5iebUfSc2FrHgi5KPWIP/nDPCtd/smBhhygO9xlW+qaGGlPbOIeQIP?=
 =?us-ascii?Q?Ccy1NPBEkvvxpDqb4ceTlqXvWaFiZ5BfbHLzKaN6ZIX+uNMuY8DIBx9+Grvk?=
 =?us-ascii?Q?HctlcV6HXdsjyeyTsuK+Ve+4g/O/exJyymc6gw2Q1fpDCJyLvowpVLfgkntB?=
 =?us-ascii?Q?NFhnZu+w0FiT7qPuRPW1AkJoBbSZvMd8WikIqtDJCqVzNIl8P3tWXkjoCTw2?=
 =?us-ascii?Q?mfOZ3SM3WWkuwjruTXL7UOcuyN3XWqvU0GQ1QA3T5oaSY1FRroTZhWsEKAVa?=
 =?us-ascii?Q?7cl9cr/9nzmAIQmYRI9j/40SR++He9orEuwOYtx1ZX1/NNXpcUFta57lXIYK?=
 =?us-ascii?Q?7g0JZ7LoC2WfxDPUATGm3JgFTYLo2WtsqapM0jOFS0Y7p2NeQgZR0PWUyRsQ?=
 =?us-ascii?Q?11lXLUEQNIerv85ySwtVgE2gsaPO7PWdWSr1ZNGWXxqfGOX2QicinrFVU4Cg?=
 =?us-ascii?Q?uBxmIMmCfTHSGZXRSof5ATlaYHkq8Z3PMj2SYzUNzq7+L7NHibdL1wmTxemo?=
 =?us-ascii?Q?SfBZuY5hMXETO6sf5PNB+0PQE4aQQLruBkHYP1kZE0xJscFVLBisQmncDkPx?=
 =?us-ascii?Q?49J6LJAr3SZnpLKelsLriqJ8egXh6wt5irGpN/bGR23mh5ETY0m0siYnbq5j?=
 =?us-ascii?Q?euP/Uq9sisOK55bkVT+WNZHJHbNkjfAQnnBe8JkhtG0Rh6DUmE//QNzlhkpG?=
 =?us-ascii?Q?WmOEb1T1AkWZvrtsXxLWV/kgIFuWmqxQ2Byr4qWE6PeFmk/oFBzOtGGJV+Vz?=
 =?us-ascii?Q?+P7PknV2eyzYmdkHF2JrqawDOuGs66SFSd8z8Iyuxllqb+J5pJfcczUSd5So?=
 =?us-ascii?Q?Q4Vw723uyXaZEfBbOomAjJxBQYMY+stXSkmufccNEeRoNjKWhaPRYpxwfL/E?=
 =?us-ascii?Q?8FyWCdx/nZa/nZnMfvewSQ8ehC7eApU0aJCmf8xDGTNYWtclOlmj5BySbc1K?=
 =?us-ascii?Q?wljc2Hr3maGNHyA0uAZHoVNWrpRWqKWQfitCgYHq+EtH6w5Fq0AdJ7HGvkeE?=
 =?us-ascii?Q?gO1im32l74YeEufrShgApIbUX1JYfKpIAO9vvR1VXSM0OrEL8zndwDJH+lQ9?=
 =?us-ascii?Q?8w/l9LvluIz0ZsnM7yCwy/idTL7XKkvoIGgrhyu+nUD0abh/yz1gtShfpITD?=
 =?us-ascii?Q?QZTzJvw1RyDV9xzIN4H/iEsxugpMl/Wb89jh3wuBGnK7CfC8dGQVPaoGJEWa?=
 =?us-ascii?Q?VtQMqkxe/9MxvhtKGN0OYbXWg/oTSuCy+OgMMQ+ksndISMbb7iJo5avLev5Q?=
 =?us-ascii?Q?0doIwzvyXvlFVkCFunEEzNq8pVp0SKTa1++/hLug4dyGbaFVQByxuITVw+cR?=
 =?us-ascii?Q?+lZJDO1Ma5iD2ZN8n3K3W4n+J/7i7vktBgOYpG0OkAgg0/LGgskX8Rl1djfF?=
 =?us-ascii?Q?WXEDW8K+sfvMFcGIhTnyPrI1iMk2+t7zakYe0dWtcamjoXKG1nieL8K18i0T?=
 =?us-ascii?Q?/RQ+YfhUHL7ZNByIz2AcZDZxVKkBR5D9bFTpNRmZTLFWbTqtzWrQdTEZmPML?=
 =?us-ascii?Q?IrmOlEaFvJFi18GalS8xA29IKr7EOBhM+vhMVxQbtJHLfseGRlhz7Qf/mAnO?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 892e0c87-95b3-40a1-ffa4-08dbaf62f3f8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 05:26:14.1768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quOXoQSXwwLdYgcbIXm1vbTAvZUDX7zE8bgYL9N6wRvSJO1cMiHnZBnd4kcOoLu+S4Eo/l71f69h1wcTZdXlItux8ysLk3ofb68dy3bKG9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6328
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/guc: Switch to major-only GuC FW
 tracking for MTL
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

On Wed, Sep 06, 2023 at 04:00:10PM -0700, Daniele Ceraolo Spurio wrote:
>Newer HuC binaries for MTL (8.5.1+) require GuC 70.7 or newer, so we
>need to move on from 70.6.4. Given that the MTL GuC uses major-only
>version matching in i915, we can do the same here instead of just
>bumping the version (and having to push the versioned binaries,
>because they're not there already for i915).
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 37ad238148b0..8fc1fbc551c2 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -101,7 +101,7 @@ struct fw_blobs_by_type {
>
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> 	fw_def(LUNARLAKE,	mmp_ver(xe,	guc,	lnl,	70, 6, 8))	\
>-	fw_def(METEORLAKE,	mmp_ver(i915,	guc,	mtl,	70, 6, 4))	\
>+	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7))		\
> 	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 6, 4))	\
> 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
> 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
>-- 
>2.41.0
>
