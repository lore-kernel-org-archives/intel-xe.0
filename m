Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5619E936F9
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 04:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8F410E3D0;
	Thu,  5 Oct 2023 04:09:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A56E10E3D0
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 04:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696478946; x=1728014946;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZJL3Yp6lXHBOGA2ksQg7xm30tkFpTV5DnABN9zi3SA8=;
 b=nl0Q59/XWvwLEdHlchTu1o4cTfn10awBuP/ngjU3lw8Zs8AKv3BaEyew
 OAiD+LYzHtfRAfwip+8YBod1viSsgcpyOyRcpk/o4I0+eaC1pIgmApuVs
 Mx5orUdTMkTPKrvtSXUpbs9YfSrym30OhuR2H8N5RafZrhcuFOkXqJlOl
 nMcj8XSLaRsnf3an0zCwnW62PN6Xpac4OZsWVDHI4d9CzYujGRdwI+WLR
 Wb3Ew9mlNhCdEqT4gj63siIlBmDAMbY5OTPWnQP3owf12EX/YkVlL/ufF
 J+beOUpNJR8kYv03e6yZroyyKDp6VOk+63ByMelc+ehlh9Dna8gmK1jJd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="363674059"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="363674059"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 21:09:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="745283739"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="745283739"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 21:09:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 21:09:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 21:09:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 21:08:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmvzyECPtj8MTNKOIFcAXph50p8uJjRZri0JAfJQPtCdJ3kfEttqc/6VydP8zwQtVNY2J+Y1H5WTy2i77TZP8NlqJ6x8C79kpgFl+RscsY/2N1qKcI6W7xeOxXCYXNuamoGpmkOlwW6OoZ+tAJ+p1KQ2TAHrduIghIOoniAnEGQuneGZb3Kqcqr64PjsiYOs+QNUtieUlVkNI0Xf2/L6Z0yW4aDt7K5kCFUBioiBs4bx34OOqOx1Fy3VuoiiHjGtA6ZsR3OZEqa8bcUCBkS4FVJ4yEkPRGF9gL6HTSkORwUo7crXPub7d/MIx/bI4VBLR+y0RJoS+YJGe1fkCBhemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbPd6FSAZItQQ7upGAojpL53djg+PjWTVf1n4XBikbU=;
 b=eonQbNxhW1Xm8qNcywb4I8WNwu8ykfLoM/QCxfr1s6Mv+9gmDSxUaSy20PDaW8G1bUr51xh5uUczMh4uviVXUMZ3+YXhbsb6um1fRFEtNoWDiB3QNx26aTg1RtAQLfwX8GrxsXr8JKcdMEzRuAh0+6HzVVNevUu8/S+KtwRyfjFW8ZXqcUm3bseKa799DIdeGf6uOgH75cv8sRgA1faDR2aL790smj+dEf5bla+l28JPsOlUEJxCSbvDQw5S1HbYPXkZacwyLPWMn6GVfUimIM5UzgAdUsH3OQ13ScbM7PWwB1N80gimwt7UfCYDH+i/IgyqUGvVWkyx7JtJLt+yDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6315.namprd11.prod.outlook.com (2603:10b6:208:3b2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Thu, 5 Oct
 2023 04:08:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 04:08:57 +0000
Date: Wed, 4 Oct 2023 23:07:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <7n3fkocl4bo7cbxxafthle2rakema6lpqinr5rlnexkwbl2d4z@2m6je7565oiv>
References: <20231003125217.3350838-1-lucas.demarchi@intel.com>
 <20231003125217.3350838-7-lucas.demarchi@intel.com>
 <20231005002144.GG53570@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231005002144.GG53570@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:303:b7::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: bf477d3b-2386-4049-17d3-08dbc558cbf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v/EeRjie6A6SkS1pSubIilQyM6z1D6ijRvdshQY+cwLxKUU+u//hsUb0224L16bqKB7yKHO/GPTwqCZ6/kmdN9WH3DpJDyzm+NvlGikA3XahhmsI9pvEJW6MvHZu3NrPxxY0Qdl1a6I62nxGuEmp0unZT+Pwh6JFwjlVED2CCaIQl9BQBqRbJ3JiQHgDrO+bab6x5kl8jGM4dobBiGcP0wgumC1agn0bk3HkG/PC5ZfPhT/ahTNDdm2vqJrvDhun1pkqf2EpHAD92MhWsJN+5Y4db/UhknBK7NAp94l+baRCkxJi8CJeM4+RPokF7g+/IAdul/nPR6Gb0VFclmSSMa0Q5+ITN9UXqMlrqolD4KrFoR8XxGD9gyiGbuTM5ytsQQmz7swhRVCThrhgakOR9L5qLejzk5Gtb1/sxISBGhua/aZm21TmlWwOMZYzfHx1m/2m4iDPM5DxKj3jJdJU5b5p1syvAgf7xMbFBFKCmkJ7WADn7wPmtU+cQK0+LB8KHE37/iiS62rnWZLfHr4TgcyFMHeCuob0dpd6PyujgkZ0S8dWQqaFYtHWnuCphjNi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(5660300002)(6862004)(8676002)(6486002)(8936002)(478600001)(4326008)(6506007)(38100700002)(66476007)(66556008)(66946007)(6636002)(316002)(41300700001)(2906002)(83380400001)(33716001)(30864003)(86362001)(6512007)(9686003)(82960400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nO9pvevm6l8deAAwFQnYvPqFM4k1cgdWOv85MO6BWy8LrDHqW9my7CfHSvO6?=
 =?us-ascii?Q?pVIcKWtHXosxCm+3ppVA6mHNCe5q99IBgh1RT+QJGQ7RZjbMowmpnwBW4kSO?=
 =?us-ascii?Q?gZ5kZTwq4y/XDrK4GWpj/wcgj5cWmlfu2u3Kyt75sTHPMxdKCSBnMEhlGyGR?=
 =?us-ascii?Q?YAU4XTEBXMJXh75DoSNpZzIPQkfTLfGgCKaYZggAvnrpUqBiOeb1Y7mLo9CS?=
 =?us-ascii?Q?iM8e0GvMTf/eMD0XPA/MqWcuOF+YAzJSPoKd43ePG0tbaZeCPlJFDdqIIfVe?=
 =?us-ascii?Q?isi/bbqPqCz+i66f6GLdojHeuLLShH0WQCQhmfBZ9Sjf5eMsF0HgrQw1LVbD?=
 =?us-ascii?Q?tEbGpgAeholcmotirnXftqk5AzuqB/sjwD648FFeMsLraDYZdnaEr1Zz6bVb?=
 =?us-ascii?Q?V6Y6OXhWP9y+E0S+S51cTu/+CEzxQQ+v6jyOgOsZVdURXwI/b9XFgga4Cr6Y?=
 =?us-ascii?Q?aI2+BuVgCeYFFv6J7r/VqGl+ZQR33A+M9+4IJZovnK2cigK/CKsE5yISilhh?=
 =?us-ascii?Q?uM+8r/D2HFbJe8R8jWYS7NNiiEx45NNBAQRLbb+Iz9PQ9Ljtlm6/Ix14UKMH?=
 =?us-ascii?Q?eAKRLZ+n/lI8Bbo5LWy9Cb9qvf1zL5xj6AaFmJ3pio6xbfjaIM6jaHnKomLS?=
 =?us-ascii?Q?nXiuH+HJ/NOrB8YjwCa0yqsBgfMHiDTt37nPuzsdjdJqT1tVoVwhPjeSfybu?=
 =?us-ascii?Q?Us77xXUDhMjvwBao8M2j6Syj7C5mVlByC29QISeaxh5Yf/v4uLk3Tpr6uIUJ?=
 =?us-ascii?Q?MEoSu7vAw7e5Ic6amqQb+pK7fzi4IgbOSesr3xfyNynJLHkE0E+4jOlQUyE+?=
 =?us-ascii?Q?ibh5z78Yje+TcDmqzYroQyomL8SNJi9/KigRC10ng0tznefG0RYKqaQ+z1+7?=
 =?us-ascii?Q?jmlsj/F3K88Nvpi2nhQG4kkdtHVxrGVv+rxJp62qlWnNYr4BBo61urxM4YDK?=
 =?us-ascii?Q?SpRNRvEOAIaRyBWTzDuzKR1H6ex731msATSRk4VK1A9BAyzCBv5FsQPaE/En?=
 =?us-ascii?Q?x6FxiC2fG+PfrmYmsw6yA14K4yvOblLWdCP58uS5XBBWT9vfU1FdZL6f3ivE?=
 =?us-ascii?Q?P3GcXTxRi8Shj9tNjXo/SltoNEuc+zvqafvAJ1+X9t4PzmbJz+yx5HMBTHtG?=
 =?us-ascii?Q?OP6HFgIdjJX09PxYFnTh3YbGR9un5IENKIdAbxx8k2hFYKEhwBeJzSPgpc4I?=
 =?us-ascii?Q?JElBD8KKw0AD/Z4LjX5b24w/VpE48euOaytKUq93p/+BP4Yj5vI8eXWGeuzp?=
 =?us-ascii?Q?HoNhQeMiHHRtJGjdAq+dYKXZThxcOZPQJHpAklixXaZarqMPBFVBHnLJs+RC?=
 =?us-ascii?Q?OakPaxgV+INxV9m1ylbbEjWU36MTn/Ud/mqGUFQFmodPmsherZ2hdjsci2b1?=
 =?us-ascii?Q?bDL9SsONHVooG3jX8WUuc8klE7DDafTAstsjspNuozMhp0yC03fyYnr45SGe?=
 =?us-ascii?Q?6y6e/H7ARMy5QTXKp6uLEmraAN/jsNvNb1pPfqRvKjupowKlUUATNzvFMMlH?=
 =?us-ascii?Q?OH2ojHgHfVlsswLjboy3mgCUyyliiCu9ay0RAN56Z33ZEbIvSgdzFKlvSdrq?=
 =?us-ascii?Q?ys8mkV20bFvSlIxcpXCquk30jyvvcAjM7YWr3i5FbQeg2SDtOE5HlUdF4Mr1?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf477d3b-2386-4049-17d3-08dbc558cbf9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 04:08:57.5520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DqRlEzOzc75Pf+EY7wSoyRfJH9g8IXb10J9zTV8Ld2bIptHRhvQoojjiKK32wuBEqlkdxJQ19h/D3gxIngMJ8vGRDQZ1d+FfZpP1BedEk2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6315
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 6/7] drm/xe/pat: Add debugfs node to dump
 PAT
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

On Wed, Oct 04, 2023 at 05:21:48PM -0700, Matt Roper wrote:
>On Tue, Oct 03, 2023 at 05:52:16AM -0700, Lucas De Marchi wrote:
>> This is useful to debug cache issues, to double check if the PAT
>> indexes match what they were supposed to be set to from spec.
>>
>> v2: Add separate functions for xehp, xehpc and xelpg so it correctly
>>     reads the index based on MCR/REG registers and also decodes the
>>     fields (Matt Roper)
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  12 ++
>>  drivers/gpu/drm/xe/xe_pat.c        | 204 ++++++++++++++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_pat.h        |   8 ++
>>  3 files changed, 223 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index ec1ae00f6bfc..cd6d28c7b923 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -16,6 +16,7 @@
>>  #include "xe_gt_topology.h"
>>  #include "xe_hw_engine.h"
>>  #include "xe_macros.h"
>> +#include "xe_pat.h"
>>  #include "xe_reg_sr.h"
>>  #include "xe_reg_whitelist.h"
>>  #include "xe_uc_debugfs.h"
>> @@ -138,6 +139,16 @@ static int workarounds(struct seq_file *m, void *data)
>>  	return 0;
>>  }
>>
>> +static int pat(struct seq_file *m, void *data)
>> +{
>> +	struct xe_gt *gt = node_to_gt(m->private);
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +
>> +	xe_pat_dump(gt, &p);
>> +
>> +	return 0;
>> +}
>> +
>>  static const struct drm_info_list debugfs_list[] = {
>>  	{"hw_engines", hw_engines, 0},
>>  	{"force_reset", force_reset, 0},
>> @@ -147,6 +158,7 @@ static const struct drm_info_list debugfs_list[] = {
>>  	{"ggtt", ggtt, 0},
>>  	{"register-save-restore", register_save_restore, 0},
>>  	{"workarounds", workarounds, 0},
>> +	{"pat", pat, 0},
>>  };
>>
>>  void xe_gt_debugfs_register(struct xe_gt *gt)
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 296763594370..1c89137fc66b 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -6,6 +6,8 @@
>>  #include "xe_pat.h"
>>
>>  #include "regs/xe_reg_defs.h"
>> +#include "xe_assert.h"
>> +#include "xe_device.h"
>>  #include "xe_gt.h"
>>  #include "xe_gt_mcr.h"
>>  #include "xe_mmio.h"
>> @@ -14,6 +16,7 @@
>>  #define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
>>  								   0x4800, 0x4804, \
>>  								   0x4848, 0x484c)
>> +#define _PAT_PTA				0x4820
>>
>>  #define XE2_NO_PROMOTE				REG_BIT(10)
>>  #define XE2_COMP_EN				REG_BIT(9)
>> @@ -26,10 +29,12 @@
>>  #define XELPG_PAT_3_UC				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 3)
>>  #define XELPG_PAT_1_WT				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 1)
>>  #define XELPG_PAT_0_WB				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 0)
>> +#define XELPG_L4_POLICY_STR_MAP			{ "WB", "WT", "(N/A)", "UC" }
>>  #define XELPG_INDEX_COH_MODE_MASK		REG_GENMASK(1, 0)
>>  #define XELPG_3_COH_2W				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 3)
>>  #define XELPG_2_COH_1W				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 2)
>>  #define XELPG_0_COH_NON				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 0)
>> +#define XELPG_INDEX_COH_MODE_STR_MAP		{ "NO", "(N/A)", "1-WAY", "2-WAY" }
>>
>>  #define XEHPC_CLOS_LEVEL_MASK			REG_GENMASK(3, 2)
>>  #define XEHPC_PAT_CLOS(x)			REG_FIELD_PREP(XEHPC_CLOS_LEVEL_MASK, x)
>> @@ -39,10 +44,12 @@
>>  #define XELP_PAT_WT				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 2)
>>  #define XELP_PAT_WC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 1)
>>  #define XELP_PAT_UC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 0)
>> +#define XELP_MEM_TYPE_STR_MAP			{ "UC", "WC", "WT", "WB" }
>
>Is there a benefit to making a #define that builds three separate tables
>inside different functions rather than just adding one file-scope table
>that can be referenced from each of those functions?

As long as the array is const, it should be equivalent, but I didn't
really check the alternative to see what the compiler is doing.
I thought about this so the define is next to the entries and it's easy
to check it's correct.  I will take a look on the alternative.

>
>>
>>  struct xe_pat_ops {
>>  	void (*program_graphics)(struct xe_gt *gt, const u32 table[], int n_entries);
>>  	void (*program_media)(struct xe_gt *gt, const u32 table[], int n_entries);
>> +	void (*dump)(struct xe_gt *gt, struct drm_printer *p);
>>  };
>>
>>  static const u32 xelp_pat_table[] = {
>> @@ -151,14 +158,143 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
>>  	}
>>  }
>>
>> +void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int i, err;
>> +
>> +	xe_device_mem_access_get(xe);
>> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +	if (err)
>> +		goto err_fw;
>> +
>> +	drm_printf(p, "PAT table:\n");
>> +
>> +	for (i = 0; i < xe->pat.n_entries; i++) {
>> +		const char *mem_type_map[] = XELP_MEM_TYPE_STR_MAP;
>> +		u32 pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
>> +		u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
>> +
>> +		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
>> +			   mem_type_map[mem_type], pat);
>> +	}
>> +
>> +	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +err_fw:
>> +	xe_assert(xe, !err);
>> +	xe_device_mem_access_put(xe);
>> +}
>> +
>>  static const struct xe_pat_ops xelp_pat_ops = {
>>  	.program_graphics = program_pat,
>> +	.dump = xelp_dump,
>>  };
>>
>> +void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int i, err;
>> +
>> +	xe_device_mem_access_get(xe);
>> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +	if (err)
>> +		goto err_fw;
>> +
>> +	drm_printf(p, "PAT table:\n");
>> +
>> +	for (i = 0; i < xe->pat.n_entries; i++) {
>> +		const char *mem_type_map[] = XELP_MEM_TYPE_STR_MAP;
>> +		u32 pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>> +		u8 mem_type;
>> +
>> +		mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
>> +
>> +		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
>> +			   mem_type_map[mem_type], pat);
>> +	}
>> +
>> +	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +err_fw:
>> +	xe_assert(xe, !err);
>> +	xe_device_mem_access_put(xe);
>> +}
>> +
>>  static const struct xe_pat_ops xehp_pat_ops = {
>>  	.program_graphics = program_pat_mcr,
>> +	.dump = xehp_dump,
>> +};
>> +
>> +void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int i, err;
>> +
>> +	xe_device_mem_access_get(xe);
>> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +	if (err)
>> +		goto err_fw;
>> +
>> +	drm_printf(p, "PAT table:\n");
>> +
>> +	for (i = 0; i < xe->pat.n_entries; i++) {
>> +		const char *mem_type_map[] = XELP_MEM_TYPE_STR_MAP;
>> +		u32 pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>> +		u8 mem_type, clos;
>> +
>> +		mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
>> +		clos = REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat);
>> +
>> +		drm_printf(p, "PAT[%2d] = [ %s, clos=%u ] (%#8x)\n", i,
>> +			   mem_type_map[mem_type], clos, pat);
>
>I guess using human-readable strings works, although I was originally
>expecting these to dump in the same format as the Xe2 table below to
>make it really quick/easy to compare against the way these are written
>in the bspec.  E.g.,
>
>    PAT[0] = [ 0, 0 ]  (xxxx)
>    PAT[1] = [ 0, 1 ]  (xxxx)
>    ...
>    PAT[7] = [ 2, 3 ]  (xxxx)
>
>I don't have strong feelings about it though since the pre-Xe2 tables
>are really short and simple.  This approach looks fine too.
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks
Lucas De Marchi

>
>> +	}
>> +
>> +	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +err_fw:
>> +	xe_assert(xe, !err);
>> +	xe_device_mem_access_put(xe);
>> +}
>> +
>> +static const struct xe_pat_ops xehpc_pat_ops = {
>> +	.program_graphics = program_pat_mcr,
>> +	.dump = xehpc_dump,
>>  };
>>
>> +void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int i, err;
>> +
>> +	xe_device_mem_access_get(xe);
>> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +	if (err)
>> +		goto err_fw;
>> +
>> +	drm_printf(p, "PAT table:\n");
>> +
>> +	for (i = 0; i < xe->pat.n_entries; i++) {
>> +		const char *l4_policy_map[] = XELPG_L4_POLICY_STR_MAP;
>> +		const char *coh_map[] = XELPG_INDEX_COH_MODE_STR_MAP;
>> +		u8 l4_policy, coh;
>> +		u32 pat;
>> +
>> +		if (xe_gt_is_media_type(gt))
>> +			pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
>> +		else
>> +			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>> +
>> +		l4_policy = REG_FIELD_GET(XELPG_L4_POLICY_MASK, pat);
>> +		coh = REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat);
>> +
>> +		drm_printf(p, "PAT[%2d] = [ l4_policy=%s, coh=%s ] (%#8x)\n", i,
>> +			   l4_policy_map[l4_policy], coh_map[coh], pat);
>> +	}
>> +
>> +	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +err_fw:
>> +	xe_assert(xe, !err);
>> +	xe_device_mem_access_put(xe);
>> +}
>> +
>>  /*
>>   * SAMedia register offsets are adjusted by the write methods and they target
>>   * registers that are not MCR, while for normal GT they are MCR
>> @@ -166,6 +302,7 @@ static const struct xe_pat_ops xehp_pat_ops = {
>>  static const struct xe_pat_ops xelpg_pat_ops = {
>>  	.program_graphics = program_pat,
>>  	.program_media = program_pat_mcr,
>> +	.dump = xelpg_dump,
>>  };
>>
>>  static void xe2lpg_program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
>> @@ -180,9 +317,64 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const u32 table[], int n_entrie
>>  	xe_mmio_write32(gt, XE_REG(_PAT_ATS), XE2_PAT_ATS);
>>  }
>>
>> +void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int i, err;
>> +	u32 pat;
>> +
>> +	xe_device_mem_access_get(xe);
>> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +	if (err)
>> +		goto err_fw;
>> +
>> +	drm_printf(p, "PAT table:\n");
>> +
>> +	for (i = 0; i < xe->pat.n_entries; i++) {
>> +		if (xe_gt_is_media_type(gt))
>> +			pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
>> +		else
>> +			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>> +
>> +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n", i,
>> +			   !!(pat & XE2_NO_PROMOTE),
>> +			   !!(pat & XE2_COMP_EN),
>> +			   REG_FIELD_GET(XE2_L3_CLOS, pat),
>> +			   REG_FIELD_GET(XE2_L3_POLICY, pat),
>> +			   REG_FIELD_GET(XE2_L4_POLICY, pat),
>> +			   REG_FIELD_GET(XE2_COH_MODE, pat),
>> +			   pat);
>> +	}
>> +
>> +	/*
>> +	 * Also print PTA_MODE, which describes how the hardware accesses
>> +	 * PPGTT entries.
>> +	 */
>> +	if (xe_gt_is_media_type(gt))
>> +		pat = xe_mmio_read32(gt, XE_REG(_PAT_PTA));
>> +	else
>> +		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
>> +
>> +	drm_printf(p, "Page Table Access:\n");
>> +	drm_printf(p, "PTA_MODE= [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n",
>> +		   !!(pat & XE2_NO_PROMOTE),
>> +		   !!(pat & XE2_COMP_EN),
>> +		   REG_FIELD_GET(XE2_L3_CLOS, pat),
>> +		   REG_FIELD_GET(XE2_L3_POLICY, pat),
>> +		   REG_FIELD_GET(XE2_L4_POLICY, pat),
>> +		   REG_FIELD_GET(XE2_COH_MODE, pat),
>> +		   pat);
>> +
>> +	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +err_fw:
>> +	xe_assert(xe, !err);
>> +	xe_device_mem_access_put(xe);
>> +}
>> +
>>  static const struct xe_pat_ops xe2_pat_ops = {
>>  	.program_graphics = xe2lpg_program_pat,
>>  	.program_media = xe2lpm_program_pat,
>> +	.dump = xe2_dump,
>>  };
>>
>>  void xe_pat_init_early(struct xe_device *xe)
>> @@ -202,7 +394,7 @@ void xe_pat_init_early(struct xe_device *xe)
>>  		xe->pat.idx[XE_CACHE_WT] = 1;
>>  		xe->pat.idx[XE_CACHE_WB] = 3;
>>  	} else if (xe->info.platform == XE_PVC) {
>> -		xe->pat.ops = &xehp_pat_ops;
>> +		xe->pat.ops = &xehpc_pat_ops;
>>  		xe->pat.table = xehpc_pat_table;
>>  		xe->pat.n_entries = ARRAY_SIZE(xehpc_pat_table);
>>  		xe->pat.idx[XE_CACHE_NONE] = 0;
>> @@ -252,3 +444,13 @@ void xe_pat_init(struct xe_gt *gt)
>>  	else
>>  		xe->pat.ops->program_graphics(gt, xe->pat.table, xe->pat.n_entries);
>>  }
>> +
>> +void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	if (!xe->pat.ops->dump)
>> +		return;
>> +
>> +	xe->pat.ops->dump(gt, p);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>> index 168e80e63809..09c491ab9f15 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.h
>> +++ b/drivers/gpu/drm/xe/xe_pat.h
>> @@ -6,6 +6,7 @@
>>  #ifndef _XE_PAT_H_
>>  #define _XE_PAT_H_
>>
>> +struct drm_printer;
>>  struct xe_gt;
>>  struct xe_device;
>>
>> @@ -21,4 +22,11 @@ void xe_pat_init_early(struct xe_device *xe);
>>   */
>>  void xe_pat_init(struct xe_gt *gt);
>>
>> +/**
>> + * xe_pat_dump - Dump PAT table
>> + * @gt: GT structure
>> + * @p: Printer to dump info to
>> + */
>> +void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
>> +
>>  #endif
>> --
>> 2.40.1
>>
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
