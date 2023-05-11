Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31C6C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 22:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C08910E601;
	Thu, 11 May 2023 22:24:39 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A34510E601
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 22:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683843878; x=1715379878;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f4C0Z7EGjvyZ8VCh9LD1VdVE/GgxWLfZHuCyyq0aixs=;
 b=EEjWhRT45atK5tZwTZQ4ec7NgzWg2UJcqaFuxYef9AJM0MGccJH+34ro
 tXF/qoSqBvELClJYNVz/+ZCqDEGi38maZycU8W2pWvFTfGQBh0kByFJBB
 hMRGwvBOuzb9cHy7CKEKCZT/udyCD+FCWxju5/H6hb/38wGmTUs6uXh0/
 j4GcOz5B+AwgIinil2vf+VEyCtgzEkYNkESfWMpJsXYD0hDDPN7yQF+Yo
 e8lHsgFUBHOYfvmNGj6FakLUx5WCHITv+Wp1HQZcjbwaAPOC/4TOUarGo
 F104ZdpKtm9VUwJewiTSuBIlNtJwH6KMD4FtrMTE7V17plak8z8VMU4pv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="416268908"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="416268908"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 15:24:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="677431039"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="677431039"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 11 May 2023 15:24:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 15:24:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 15:24:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 15:24:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 15:24:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ye/eSexXl0JqGGLguFwA8g/bE3HPdHJ7CXHf7lcwKU9vglkxgmQ+zZq/DQriLdy336mj8FUljcv9NIiBG1KZxgIx+bmHBBrG0/9DoCZ5BK5NP2Mp+Wml+vs1dQXDlpxL6RlG0DWepA7QInpK1GqVRGNxV5ZkYezO+Q0h96B1Cx1ziGzHQZ3c9Iz6i5VVqLg8lTGMVfn5ti8JczqsLNwIr5YSbMCx47hgdmZEWUmi/vILxv0J0BM0mZYzc4WQVetdDeZAsFJzxGS2yWVUISA+QkKk6XXC2gwNHdQAPeyxpiW1rB6qVywfsUPXjULfPuXJkpLYmtuf4WwSqnWN/gJOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNcOkgwboxp78J8tcDRJCXLWBj2lzktud5asmH7e+r0=;
 b=najjTeUiiiW+9p1aS2ASMhbnB1dMZfTksNEBJYnLQ63EoTc3m/ZVUGlLPNxb5cZSkEidhmfFCjCTPUpsoM7fz8P1AzEdJQfrymQ4Yzj7RUaGF15F3KIbc0Kfuq3SBMR4Q8QXbJR10aq9JrYmh9OAkZrqizSp4t76Hj6CDh2nTBlHQVuIrBExLMwctsq6KnjvNOeYWBuNmJVCyJHajv3lE4QcxHHHP1yvzU9lxmpOft5k31yhJdhQICJmElYfeNXUW+E2OW2zUzSVVl8URaxstVMGeGUY8NGfRpa6GhZrE5dLN/JnaD57CegzoOL2H6nPE8ii8RRONBLgfl0tpToX0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6109.namprd11.prod.outlook.com (2603:10b6:208:3cf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22; Thu, 11 May
 2023 22:24:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 22:24:33 +0000
Date: Thu, 11 May 2023 15:24:30 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <dfrfnnjx4ajibnh6tolujfsmhyupvva3yud6dxrsm2mam43mff@vlgdco453ye5>
References: <20230511122901.872670-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511122901.872670-1-jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR01CA0036.prod.exchangelabs.com (2603:10b6:a02:80::49)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f2d0e6-151d-4e50-a7b9-08db526e7ef1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 32RA3ybCn4NxafLtKfRYFsBBw7y8sHf38AIyLPbW7Mx2uludHFcTsU8FOzBxS67y/girjU36wb6o1iufFp0EBphEI3pnsKlnXesicPQrhkNvWIluyVXABEhpwIRrWbS+hNQyJZEXkNYsp/bpsCLklJ4vrk5kjMyle5rYQ7TTVDgnYo00NGpOTwKKoTOO5QXVxeS0ie7m4qBW38MIy+VQ4Z6ULIHZ4cV243at1nZtBYzaBz77hS0RyjGmfBxPARv7mg/ZGkRjbuUrZ/p1I79p67VVjXe7MNTm44t8aV3jyASHqwJh4a9FJZdZu3/t0qSguRlpgo9/uzXq2xsIDt8TV9bjyICIZSDZn/csFemUB60AAacN9iVtLZT9x/SfQvDX03zEr3k4qaMidUt2yOTOe6v16ZtBg+VmDGjNLYspAmZKQu1oN3wZ1kDtwPKjEy8mdGRpqAlT9Rjva6pNKI7JDzhityPS8Mw6VsmYAppNq3wm2RaO0npKy2fBbTaUMIo+5joT41JGMhzIrDQLxyP6b41FANWvMeAjUGh/NSZMiSD+Rx+OezwA2kfEZdzR24He
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(478600001)(6862004)(5660300002)(8676002)(8936002)(2906002)(33716001)(86362001)(66476007)(6636002)(82960400001)(4326008)(66556008)(66946007)(316002)(38100700002)(41300700001)(186003)(6486002)(9686003)(6512007)(83380400001)(26005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lsCiIKcp0ZznSENm8JOFqzE4ElbQUSPfhNTFypBt5EOw8I8FK0PkASNiBw1r?=
 =?us-ascii?Q?e2PcOvPNBQHSrKJczlg0/QB+Z8L7FypVw2T5/eIyRbKw5G4Fz3A+I7WsTVmp?=
 =?us-ascii?Q?v4f+WLSMisdM89RN5qAI1HPMg9QzXyXEo3loC49TyJ1coGwVmnibzjDl6Ce/?=
 =?us-ascii?Q?GFoLsbBjpXFLQkqL45gIc6HRjxE4mIhkTClUx6eaCYyHeJogxuUjKaOt2D+g?=
 =?us-ascii?Q?94/RduC6H45NtSzR5EC3zCUthZBKJQAFidpUFa4CuSp7AyEZBFNJj+RAVnUI?=
 =?us-ascii?Q?5bIb2P3yJYaeVW29MdItgABWNkahHeAZXov4YAiBiJtOC4B0U7Hj9QoBu+Fx?=
 =?us-ascii?Q?s2gwcl8cBgMY1tWgtXRJZD1wiSRcOhkBtIoY+x9EF0W416QWt5trB9fLJqTp?=
 =?us-ascii?Q?xhzxB10MnGep6W1IOhmgJMNbgprW8vZYJcyecyXvf598KE0Gn9iYovhSJnoh?=
 =?us-ascii?Q?Fd6oYz+zpXYjaaT31NUryXF7dqefjw6yhuQFOPgQv+Ryc1uIczHuS77BdEn7?=
 =?us-ascii?Q?JfypzQKHCm14htsq2GdB2uUEzfF7W8ktXN/qnZOpITKVhKwNf4wQma7jKuzt?=
 =?us-ascii?Q?/J46Ht/F6c+2jf7uc/54/OhzYD4ebT49TvriVfT/V8/sarGz/P6QnITr9Vu2?=
 =?us-ascii?Q?wCBUHF1/TFMFLfyTZ63WrigzyDoS1tPDkfIGGjFcsZsW4lrSpMteK32K8F27?=
 =?us-ascii?Q?kaL1Jp/oI3yXfdlJFnBW2fDyQV2pid4Uj8y977zrPUdlSP7iXOg/xugZmEJz?=
 =?us-ascii?Q?eMtW2Fv2deaqx1Ho5KcDB+UsGC3455mXQJ1UEG19I3S5NV2fAvP4I0sDbkwi?=
 =?us-ascii?Q?iGTLvVxq9Qy2UiG3E1MuPGt8fM+ymB03Uaqxg5uMHxyVJOYSMYN2x8S1joV5?=
 =?us-ascii?Q?deMA7A7llnVBKnR1mEKwj+0aWy5QZZtzSgvCtudtGI1Z++PPZjPO4iN8Hvpv?=
 =?us-ascii?Q?lkqwt/j+LuMWy5ORI9HKwq7EgLxKCBSIlww+wWfaT9Sln5/KaRAc0uOVIoxM?=
 =?us-ascii?Q?/8OY7l/7FhEeprTQeoJZj0sC+kidLFeJ4aWUIIZzwqba5CLnhdW+9QS/a0Cl?=
 =?us-ascii?Q?+6PeBntInB6uLfwR+C7iOkVz74bY8QdfamvCjreVKCd5rmAR7I9xt6qVe0sn?=
 =?us-ascii?Q?A+ZzCmqInBSPku4SJQudjcxMbBd12OKdq9Y4/sId31QCaegzOIK337xXHUSG?=
 =?us-ascii?Q?A0MmxaXCk0/pOp3rDD5hWciFKUslPNGJLWUsAk7HudwnQDjQgGmvjgTAizMB?=
 =?us-ascii?Q?/sllS1DDwZFiBf4VeIGuCEqW0jycCoSBC4OrIvQwFdvp7gAjRqupBBqseymq?=
 =?us-ascii?Q?7e1toz9L7UZvWCLlvKMcnjIY/NoLMze0QG758NJYBAdgwPoPKw3suql0YYT2?=
 =?us-ascii?Q?dDStLo6W3t7aTK/7uKsiFXMwy2V5J7AbW47pQX2jEreSRbJqK7ANX8xLZ/7G?=
 =?us-ascii?Q?uLcpM4rSJpasQ7ve1UyzW/4xs9wjruDNpN6cBJ94TklPx8ZZizQbVufaKfT0?=
 =?us-ascii?Q?2iPzPq07N3cXm+dTKvLstMM9Zl5zxU8SmdGca1s+YtbJKciUoeGv/Yz5VyCp?=
 =?us-ascii?Q?Kd5ichFIJH3ecr0Wy7GYe6euXpbrdOc8kx7a7mL3HWlEogXdT+3wcFlAWe+F?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f2d0e6-151d-4e50-a7b9-08db526e7ef1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 22:24:33.4994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oHT+essr5nfM9nYBGdWTBZvqpt2zZ23F62V3I3SVe9NFQYjQie9Ni88H2YjWhciytgUVMKRIYaLj6DETXqHPCBfr2gxZXAddSlnvulZPXTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6109
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/i915/display: Remaining changes
 to make xe compile
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

On Thu, May 11, 2023 at 03:29:01PM +0300, Jani Nikula wrote:
>I don't think the ifdef is needed anymore.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>

correct, it went away in a squash to drm/xe: Introduce a new DRM driver for Intel GPUs
that removed the define

#define i915_mcr_reg_t i915_reg_t

(and the ifdef here was to workaround a compiler break due to that since
  _Generic() would then be passed 2 identical types )

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> drivers/gpu/drm/i915/i915_reg_defs.h | 4 ----
> 1 file changed, 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
>index eac5a4141bfa..622d603080f9 100644
>--- a/drivers/gpu/drm/i915/i915_reg_defs.h
>+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
>@@ -231,12 +231,8 @@ typedef struct {
>  * simply operations on the register's offset and don't care about the MCR vs
>  * non-MCR nature of the register.
>  */
>-#ifdef I915
> #define i915_mmio_reg_offset(r) \
> 	_Generic((r), i915_reg_t: (r).reg, i915_mcr_reg_t: (r).reg)
>-#else
>-#define i915_mmio_reg_offset(r) ((r).reg)
>-#endif
> #define i915_mmio_reg_equal(a, b) (i915_mmio_reg_offset(a) == i915_mmio_reg_offset(b))
> #define i915_mmio_reg_valid(r) (!i915_mmio_reg_equal(r, INVALID_MMIO_REG))
>
>-- 
>2.39.2
>
