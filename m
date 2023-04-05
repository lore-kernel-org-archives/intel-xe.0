Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDEAC7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 18:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC2A10E34C;
	Wed,  5 Apr 2023 18:30:00 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F3A10E417
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 18:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680719398; x=1712255398;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LIxVryE7Iwv05K6tB6qyx2hTtjb9sNY+YEuh2GC4JqQ=;
 b=ShDNdete2Y7EL5hdSDs6pzpiwOX1w6JlWl1NPuVpy3F8JMPCmx/Z2pxV
 E0B5AxvmYvI8D6lsx0xT9TxS5KEASIVWVKkQiM3KIgVWz29+DSi3NYkYL
 l8sp/sA/NqVZCJa/NMt2iQkqsRmg2WeVScnHzoP69JNOvfhEjbmWERu5A
 0pi7tWVP1ZRgoAU6l6vS/hwr0uI+jvmUeeynRzz1EIFIJc2TIAm+Q/vfp
 RL162ZuNUwzqPeR+/gdqqLcRoOv3BzmE0nFxJ73BghCHYzx3YiXRcVPaO
 gBwfhYt2ya4amWMRKdR3ErbmwxstA2H3qat5ilXFX7Kdc3eAJ5yuAdLIc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="428821382"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="428821382"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 11:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="664138602"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="664138602"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 05 Apr 2023 11:29:57 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 11:29:56 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 11:29:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 11:29:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 11:29:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDP05+BEzG449BzXDlPYF/35RuhMMQb7mIr8IKQ2eDEE5o9mHmyyE+bXIwBTG0kj7thA92VZyK2fLNJ+ikA7zoqTUhScAI1pLCpV6NhjFPOn81EkOnd2Hfv5gb5FSwgQMUvVJrTEtmzw4rdL1ole6APVW8Jlf7XHazkSALL5mEbcwJKpMQVwjjIDE7igs3WQzvuNTj8wb4tEoYbZ05I0YGGweqRg3mEO/9EmsuP7xe1J2bxxacp7mR0w/f/cj8ijd48GL5O3MXEGzFradJYJeGGpSywWc9QLRmuPGR+s785U3Mg+2HevTc9hxiqJ/HcV0Aai82XEeshxdAlNCw8z/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BegOejrbAKYWoLSo1dniAoESWQidEO9XbP69nUt3Bcg=;
 b=FAB9+S4C3bfbWlb08751Kte6DDe8IOpWrX9W004NATdfXP/UlubIq06yXQ+6bVqc0XvK/quvi4zeaujRDe8lD4TGym8x/mWPOoJxBLpizUOQHplOrxFXcXVtWRjk7sUYlRQjajx+cH4bJpGc8Fw/Da3a8Hyj8vMQSHPxeMOfIEAjwnsjqBUSTwqns7PpyQLvU2LQfA5NMXJsPmHIfItSoa/q9rRJvNRAb9CJL6dfl3fmUP00hQfzC5If+rR0FgJ/n2Xc9nKiTccuP0JMlo2vI9xjDbl2RJEkHnz6wOgRqsm6o93B13Acdo36wf9DqZcqUiC+f6BDQ6ChepyfdpRzww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4712.namprd11.prod.outlook.com (2603:10b6:208:264::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 18:29:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Wed, 5 Apr 2023
 18:29:54 +0000
Date: Wed, 5 Apr 2023 11:29:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
Message-ID: <20230405182952.m65hoo6khvprjjzq@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230405170815.524853-1-yu.bruce.chang@intel.com>
 <20230405172857.gf6ubjtrhyjkxztg@ldmartin-desk2.lan>
 <CY8PR11MB6940D86EF2BABB63945DE52BC3909@CY8PR11MB6940.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CY8PR11MB6940D86EF2BABB63945DE52BC3909@CY8PR11MB6940.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW2PR2101CA0012.namprd21.prod.outlook.com
 (2603:10b6:302:1::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4712:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a3f0efe-ff44-42db-812f-08db3603c05e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cJaQ7+Ab0Z94Im5hCgHaN80eJ+E6W4XOq28rt1ukgUUQdJg3n3CpAWHY1WQoAFkqNUUWu69gzIwy3CkjOTEFnim+XjpluCeADionp/8PtIVxoGCHD60cQn0IVTccLXyswSEiNFgcDlhyX9tnc3wiB3tvVA+VpmdwcaBBa4GIXs3KsDp22xez1ECTjI4nDOJrJU6rBa4oADO9z632QlI7uT+xG8kTliFEohq7Q0PdzGD3i6daLhWYl6ezxPdRJr4MAMe8iDmuy/Z35SMRgU97divUuA/b3b/K1mJHJ3iertAtlzo/NnIGo9vtsQWEy9GU+4Sfpba0ZIK8NpnagFj10qQUlIBKJF3qhTLtXk6kQay8YngLRAzfhdvKeKMveY5tb6UrlIsP5iW/s63OxQM2nh5iGX67zne56bI5wuAi0bIam5ewYJ3bsRzH5R1a9cxwMwxFjozuWP7U5xmZXc+yBvLyGEoIlKT3VCkMzl9rGeAdH+T17Fc/pPUceCmxeaCk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199021)(107886003)(966005)(6486002)(83380400001)(36756003)(86362001)(38100700002)(82960400001)(53546011)(1076003)(26005)(9686003)(6512007)(6506007)(2906002)(186003)(54906003)(316002)(6636002)(66556008)(8676002)(4326008)(66946007)(66476007)(6862004)(8936002)(41300700001)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bFx6GclTXWFETWhmwzZu0qv0uz6nNXilMbzfgyyHnl26wm9X4YQ5Xs7MESXG?=
 =?us-ascii?Q?7xm5FO1gyvDuwzLJ1oIg6tput6s8F7Xm2Vnnni7dfmKihlrBlYHhscRreJGd?=
 =?us-ascii?Q?Epcjq7UnqoJOdxI6f1QJ6c32CFFdhJuKh2j1CRRYZpSRWAf/enM2/zfwg6HA?=
 =?us-ascii?Q?cCLYC6lAvPn/f8dmyLNxicj/U5KMxTxDs5geU2j9IMxp3PdICnmynZVQsjTM?=
 =?us-ascii?Q?8G8XTMtB/RH+5D1uk8T7dwJib+GHfb/c/qaSz5fJV6DtZcMp4obEB+5C9/eQ?=
 =?us-ascii?Q?+o97Qn7y4kdTh96H9xUu4iyNNHZhf84Dsl7LGVJkvNkfE6hC9m09Cmu/FIwT?=
 =?us-ascii?Q?/rOrQmkdpZYt44vzS67J2TbyMWcQp/FV0D8IL5HyDUn97gRLdF6HXPxlVolK?=
 =?us-ascii?Q?1vx+rln6AJQX8Namo1VqtbHUwwhXfdG55r47GdPjQPIboMpzOwrLtTVcCOT2?=
 =?us-ascii?Q?/YUHBALpZ4WMd4MdsF3IHCv8yhLIcRDwDnw21tRutnD/btvdgNztXwNMVUVV?=
 =?us-ascii?Q?dgDn17HXf5HZOyIBHhLLSj8QsIcHDPxZMjU/vj03tqBH6tDf9Tgoa38nDLpv?=
 =?us-ascii?Q?GTSJBcKidedGXbVO4E10aw7yhYox9Qw6iuMenOhSPDBD9H1wOLWfG2peCl9A?=
 =?us-ascii?Q?bA/EIwgra5SWM3OxPntd8tDKe2diTFRaSTWNTy8qe1M/bYzJVAjCPqQUMk3R?=
 =?us-ascii?Q?wdw5s7zsHg7kaAdrZaroxxhQNPf04CDTzeppQ1Une1LF1h/RV67wg3u2uHQs?=
 =?us-ascii?Q?EL0LEPXLajz+0Bi82cu+eZwQW+pSSdU5ZgDrPCEDz5XPL1hflKBAWvnP5TiJ?=
 =?us-ascii?Q?oEldW8UBvdAMWUjjxxKLb2qnMHSqG01q1qp7X49rSoe0aqiUNTcqm+7xQ81F?=
 =?us-ascii?Q?vPgOYH6sTfhXPvaGBS12mW1U3MzY8AibxznprVbR8SLwGipomwN22oNdfjqV?=
 =?us-ascii?Q?woVO0ZM2cgIHH6geXuWu0ZfR2GNSjeNUFtt2OkNFDoW5DmNzhJo7kT3aAZdY?=
 =?us-ascii?Q?i6wLPV1wrsXWYD2vOglRJEPCRdeTo8Q1gAOXtWMddiqM1AgqlhUN3MWDSnCt?=
 =?us-ascii?Q?BPVc6khBKi1RFLzTqEBkHIXU8vRnDRmcZeffIQiCZz7/IcRg3BdsU66YwBTi?=
 =?us-ascii?Q?E7vp75Q6r0CY2qrt2mvQOI/JXBT3gnyNlIOulMd/GnCZOgt8h65mId+hvL4W?=
 =?us-ascii?Q?cqJygPJz36udqjOwNlZApv5qlDqC26YEN/B3k1Uds4rpP8wqaUMxuzuqUILI?=
 =?us-ascii?Q?rk57jHmycwsfOLU+0x03IeD+in/ZlUTxbxSzlE9U823rsxulOb5Q3RmxO6lQ?=
 =?us-ascii?Q?DmOCyU/v5j7Boo8TaZFrf1Nq4f5zyjtgLzA66Vtffj9DhrEQ5Dq31YoEyqKc?=
 =?us-ascii?Q?hnfBUNNLKpi9hfTkSPMQxXOmiIUtQg5LazJ6i9kfDmOCh2KaZPXqH+c1equ5?=
 =?us-ascii?Q?bEkNwh83btulvHQIS99GdwpRDa/jjLdaVFXMDURkKp74heF36Obqs5a0M5q0?=
 =?us-ascii?Q?dOZtoSstoDvb9NPBom2Yk/rsAoYMaqpB14HmgZrhhjP46mvknjfRmxYTn9yK?=
 =?us-ascii?Q?tXhTW58HKYKl9MM5dypqhg90kLVPEbPS49faLKTKc+n+DLRpJraPj4stSYAb?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3f0efe-ff44-42db-812f-08db3603c05e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 18:29:54.5125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJnvlkQJWDIh/zz/gF6K1ydzqeNzsNUBvWMUx+gCAJeQOW4KiqIU9JWaHcXwgTK+wOafuu4EjzjVSd2ZlKIhYf6Dnx+Vi4JYWY9Z3v/Lhto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4712
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: follow up on the patch to fix pvc
 unload issue
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 11:14:51AM -0700, Chang, Yu bruce wrote:
>
>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Wednesday, April 5, 2023 10:29 AM
>> To: Chang, Yu bruce <yu.bruce.chang@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Subject: Re: [Intel-xe] [PATCH] drm/xe: follow up on the patch to fix pvc
>> unload issue
>>
>> On Wed, Apr 05, 2023 at 05:08:15PM +0000, Chang, Bruce wrote:
>> >created xe_ttm_sys_mgr.h as suggested by Lucas also fixed a compile
>> >warning found by Lucas
>>
>> Let's rather make this a fixup so we don't keep breaking and fixing the build.
>> We are still rebasing the tree, so let's keep this as part of the original commit.
>> Please commit with --fixup=01362fbe5e53
>>
>Thanks Rodrigo for helping fix this!
>
>> >
>> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> >Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> >Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
>> >---
>> > drivers/gpu/drm/xe/xe_device.c      |  1 +
>> > drivers/gpu/drm/xe/xe_device.h      |  1 -
>> > drivers/gpu/drm/xe/xe_ttm_sys_mgr.c |  1 +
>> >drivers/gpu/drm/xe/xe_ttm_sys_mgr.h | 13 +++++++++++++
>> > 4 files changed, 15 insertions(+), 1 deletion(-)  create mode 100644
>> >drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
>> >
>> >diff --git a/drivers/gpu/drm/xe/xe_device.c
>> >b/drivers/gpu/drm/xe/xe_device.c index 4fb9aff27686..85caf81ae686
>> >100644
>> >--- a/drivers/gpu/drm/xe/xe_device.c
>> >+++ b/drivers/gpu/drm/xe/xe_device.c
>> >@@ -27,6 +27,7 @@
>> > #include "xe_pcode.h"
>> > #include "xe_pm.h"
>> > #include "xe_query.h"
>> >+#include "xe_ttm_sys_mgr.h"
>> > #include "xe_ttm_stolen_mgr.h"
>>
>> needs to be sorted alphabetically. See
>> f4b0bb728995 ("drm/xe: Sort includes")
>>
>What if those headers have dependency? Such as ggtt will depend on
>either vram_mgr or sys_mgr.

headers are always self-contained. If they depend on something they
should either include or fwd declare. We prefer fwd declarations so we
keep header dependencies to a minimum.

>
>> > #include "xe_vm.h"
>> > #include "xe_vm_madvise.h"
>> >diff --git a/drivers/gpu/drm/xe/xe_device.h
>> >b/drivers/gpu/drm/xe/xe_device.h index d9d1b09a8e38..d277f8985f7b
>> >100644
>> >--- a/drivers/gpu/drm/xe/xe_device.h
>> >+++ b/drivers/gpu/drm/xe/xe_device.h
>> >@@ -116,5 +116,4 @@ static inline bool xe_device_has_flat_ccs(struct
>> >xe_device *xe)  }
>> >
>> > u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size); -int
>> >xe_ttm_sys_mgr_init(struct xe_device *xe);
>>
>> there was a blank line here that needs to remain
>>
>So, there needs to be a blank line before #endif
>It seems the original file was missing the blank line already.

I thought it was there already before your patch. It's not a
requirement, but it's better to follow the same style everywhere

>
>I did a quick check, there are about 7 headers violates this.

let's add the newline in them

>
>Is there a way to enforce using a script to help insert a line before
>push/code review?

we are going to have hooks to plug in the CI infra. This can be one of
the checks. See https://gitlab.freedesktop.org/drm/xe/ci/-/merge_requests/10


>
>> > #endif
>> >diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> >b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> >index cf5f4f73d4dc..9c2f7d4936d8 100644
>> >--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> >+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> >@@ -12,6 +12,7 @@
>> >
>> > #include "xe_bo.h"
>> > #include "xe_gt.h"
>> >+#include "xe_ttm_sys_mgr.h"
>>
>> some thing here, this is the header for this specific file. It should follow what
>> we do everywhere else and be the first include.
>> See f4b0bb728995 ("drm/xe: Sort includes")
>>
>This was from the original code as well.

original code? xe_ttm_sys_mgr.c is being added now

>
>I think it would be great to put this requirement in a coding standard so it will be easily to follow.
>Not sure if a script is a better idea instead of relying on developers.

eventually we are going to have that, when the CI hooks mentioned above.
Right now we rely on people following what is around, which is always a
great way to know how to follow the coding style.

>
>> >
>> > struct xe_ttm_sys_node {
>> > 	struct ttm_buffer_object *tbo;
>> >diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
>> >b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
>> >new file mode 100644
>> >index 000000000000..3d70c452a660
>> >--- /dev/null
>> >+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
>> >@@ -0,0 +1,13 @@
>> >+/* SPDX-License-Identifier: MIT */
>> >+/*
>> >+ *  * Copyright (c) 2022 Intel Corporation
>>
>> we are in 2023
>>
>Yes, I also realized this, I assume this needs to be cleaned up for all files. Maybe better to have a
>separate task to clean up all files every year? Some files are still in 2021.

not really. We don't bother updating them even if we could. But when we
add new files, we should put the year we are in.


thanks
Lucas De Marchi

>
>> Lucas De Marchi
>>
>> >+ *   */
>> >+
>> >+#ifndef _XE_TTM_SYS_MGR_H_
>> >+#define _XE_TTM_SYS_MGR_H_
>> >+
>> >+struct xe_device;
>> >+
>> >+int xe_ttm_sys_mgr_init(struct xe_device *xe);
>> >+
>> >+#endif
>> >--
>> >2.25.1
>> >
