Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F8FC021B3
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 21:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B9410E082;
	Thu, 20 Feb 2025 21:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNc6XNt5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B3010E082
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 21:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740088049; x=1771624049;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MNEKV0tY/Z++smVJr1dsbrglerQO9GGNVz7UR+BI8HQ=;
 b=jNc6XNt5YPaVGVuItFmquo4hHXbXT5569oNo2Gdd7d4P6KY/AVLBxJ7T
 Sj3GbAUet96L0E8OoFZjy28Q8UHEuFWvPl4M5GEckpjaFCAptkUelHY1U
 rztqG0fsl6os0KwHVatdOzuaTWGA/URqm+TkgnCD7BM+fY7gSs8UjM13D
 3QBI9Ut7rOM3/DxmP2N2aKd7hHFRI5q1f3ZSjwxXOAvtO6gJttfTTgaCo
 0fQ1wjStzX2w1m+LwVwQ2Jd2P07oT6oT1SdiuvXcHKyG7DN7WZYC+HSt6
 cQkBpGPeMJoWaJnhsjO65APVkFdbg6qsIDsiVCCN5SvOjZaf103mU5Cne g==;
X-CSE-ConnectionGUID: QgWbIs5VTCmroWCcFc0BIA==
X-CSE-MsgGUID: AS0XCc9FTkOi3sU/Hesm3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40078535"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="40078535"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 13:47:29 -0800
X-CSE-ConnectionGUID: d7+UfMwEQrKBp6C9ckwcYQ==
X-CSE-MsgGUID: 5eztJRXlRAioS5T8Hqkj6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="115115601"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2025 13:47:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 13:47:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 13:47:28 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 13:47:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOSbFrbQOh+i1kvU9vhno3Wa2B5OH1CWpgYpWVJdIsNd+uE8xfBpNP5WP/USiyBWPWsBwMIxPUcnL6ayDTGCk0SZvs8030G4V8bJ7s7rW0KnDZbFQuJ4VFX7AC9ufSGt/0Jr9djo0ghu6woyQUU+AnO+P3Lh8D9xPkOFupsU8XWAMmeO3ja07NjvV6NKg2LYajUjqY86QGq/W5k2TpbKc3RXQzXJW/LHCcOL2PrA8tU9xny6bD42YiHIzNYXnIsOqja7j+JeOYMZWuMlTdg6Jvy4EkHBmyurB3AOxbF4zAGVYacxkcpD+J54jZxd8aNhykKPbkZgdYZPEPGlobdZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGD20Z1ySdtIxT5//WiiNqt9wGMkorUhxQeHw/3hfVs=;
 b=r/yWoyUsNYjxCHghAkScG1Ts2IwUkIJ23T0Wnrp39yNCfo2kopJ3gTOkmcVj8PWe46wKjbFn711OL0QiNIaAjyzcpgKHmrr33UD/uUx6TMWhAgaVZICtkduzqw2t3vK7dpAG2WMC4jjjLJklvkj3MfwP/fBbu42Pwr8tIqKNFFzWw6gyYmVrcaiMnk4NkLpcb+K2NkmcHGh3EHgwSshWqC6fTcK+ko3JTgBGixOckt6l4NFnRvB/odAFWTRS6px0ibKPieqAjPMJPEE/KwHkEmTf1ZZk2DP6dpliWbP2AM/kVQhUkT2gHzzJhSLzKQSA4dWKJ5JpNYcNZiv+TZQf1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6849.namprd11.prod.outlook.com (2603:10b6:806:2a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 21:46:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 21:46:58 +0000
Date: Thu, 20 Feb 2025 15:46:55 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v7 5/5] drm/xe/xe_pmu: Acquire forcewake on event init
 for engine events
Message-ID: <tkee4kttili63cqcpreoc6wqz3r6depkmixt34ctilypa5rb46@ddqsv44zsvi3>
References: <20250214100819.798544-1-riana.tauro@intel.com>
 <20250214100819.798544-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250214100819.798544-6-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0131.namprd04.prod.outlook.com
 (2603:10b6:303:84::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: ef73a1de-747a-4a17-f581-08dd51f819fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tnKQ6b0UdcSaguY3cyvj6DOhFygs643I2XJclx2SX162gQEAyWxSyRJbR74J?=
 =?us-ascii?Q?JPd/kjst0k9786AQL/v6wcq07MleFhQRznE0I1kBfLrA/kf7fNEgtu6XnzVM?=
 =?us-ascii?Q?6IyRRs/juSuUWyiGckbVdcxwSVf+Pt9egqszwZxiKGBgljZMOOIRSEcz60e2?=
 =?us-ascii?Q?8zzYYhP2JmVdh7ob7tft/e6aklq/Bf9uq42GsatCSU777w6t6zJPNDE4tWmC?=
 =?us-ascii?Q?jZBlTfEcB63uIYYdHCNuFfKnkZVyeOevoU20hK+21H0Vvf1EZHFYCNLGsPP9?=
 =?us-ascii?Q?hLbKmsEGUEJoANLZXdV9W6kMijIJlFBH6yGwKqa+UC5Rnc3+2UW0Fad95Gvf?=
 =?us-ascii?Q?5wWG5McfjI4qEre5v/sX6+wkDTo54ikp3o/T7XP0xTKwNUPA9wrnms6IEigg?=
 =?us-ascii?Q?RsLAN/0IUv2jZvpwso/zcTOxQ0BfsSOF07uXAciOLSMwIiza1aD+YWHKEkeb?=
 =?us-ascii?Q?lh97cW5Xaq9vd/aENOnE5NuUlaGp+dyHeX2zUuOfOHHMx0zflTqTe3B+iA6t?=
 =?us-ascii?Q?XltA5Xa4YTPlMmVwri3/v27KvblkK5bcI0OeqLqguhhKTVSWmwJ5SwA3qhz/?=
 =?us-ascii?Q?KjQ1uKJQ0KvPL98/b2rcOu8pa/KebTuf26FFIqTsJlhUFRUqWg+jbRdhBRtJ?=
 =?us-ascii?Q?1+Q+Sm8iynA9yR5mdqpY9Tavz51jnfKweFAFq8Qp16HMwwqEyvn+Zc8D3dQM?=
 =?us-ascii?Q?4UTE98OTM1OIVkXLu/kSnd4Cmao4PeLWXVG5T7RLtjMABiwSh5Q4vfjVmgwb?=
 =?us-ascii?Q?6oiMhA1gPegOt9TBHS7axTfEf6N6Qa6A6YhqNojC79K/MNo/cFzOK4s+D/g4?=
 =?us-ascii?Q?Q/ljsg2a96HScLdIXj1WmnPS1JaR8KG1Vip5bTSmjWgQjScRWKqgLjIXl+Wo?=
 =?us-ascii?Q?TsKCxy39rFpINVVT4LCq7+ikj2L3ViAfC18PJCsqXyEI4MZ/11MbvtRm8lVR?=
 =?us-ascii?Q?KSe52jkV15dOzlvUPxLYYUZnBiKsjoCRRHy8ARAXvcDY+fWUGHd15RuGm5k6?=
 =?us-ascii?Q?oOYVJ7SEugJ5vrrICVRdx0UAsQLFMmtZcZnbcrY+ZRa7pVA/zr4Lau3GnQ65?=
 =?us-ascii?Q?/6yHvz5BPyr08tMe0aRpmsti3g3/Hct9PzB79TsR3QJ6eQNuxBiKe3G4VVWb?=
 =?us-ascii?Q?dgeRZd8OaHhK7bmgMaiqM8v7+GHYhuL7S//Oasd1bvw9r1F3e159291xYpIg?=
 =?us-ascii?Q?AD2glCre79VwEZqBn/HF6o/avUZK8KOVd3qqEcJKIyIzIK2GpsQqGu1RuNhI?=
 =?us-ascii?Q?KUBg35jCMerw3nFx/qJrk7NkpSM32IGKiLz/hd/JtZUJQ2NOuTcqygk9Qqdx?=
 =?us-ascii?Q?yfiYnDt4DUbKYB7yZ3YM6JfUD2FFQjwBwRoyzXMI60Di57+lAyQT/9am1RZ/?=
 =?us-ascii?Q?GONYtGerBl6i4+FBu+d6NwuQfWmr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gOyqvDmZGD78J/L/nDs0dzUvsrf6a/j/Xfxo4iAzE3aVinR7LAvwsC5+BPmn?=
 =?us-ascii?Q?hEpr2jfsJMeqLcFuvV04Qwq//JwuZ0/xTbh4gfNh/bYNkqJsKRI+iC8u/CaV?=
 =?us-ascii?Q?/wF1XEHVZE2ouppz4c8hNf06xlI7qsuLMRkQtvGzFehLz/Myp/ySkaFG742j?=
 =?us-ascii?Q?bDCsZjqmCkEo6B4M8R9mfSt1Y6XxbGuPTVCFkFrLPMWpLJ33M2QYDGL+pCzj?=
 =?us-ascii?Q?HmUhPmiDAus4wNnOxg1ArjPVRbh5EkD+8kh1kw5xpEygdQI0n8qxfV3XFuTt?=
 =?us-ascii?Q?/dqf2gqp9QDQD1M3aYir8AxTH9i3jAVRR4vUJfFqLayqMrwEGr2yMafICKCm?=
 =?us-ascii?Q?63yy5o3sWUp5ppVZESsQTsTNpggZzLaFDDkywJZWxvI83rciIACx6+e0colG?=
 =?us-ascii?Q?NGxLb6fjLoAlPvuCrua4o6tQdscOy3Jpp9bX0L31K8qMZtib2QQaXY/g11g0?=
 =?us-ascii?Q?k8EPB8e311hIzhaNvermgry2C7ewd+yVnOBfEmucHAA8giJM+Kc9CSZDM5Uz?=
 =?us-ascii?Q?L6fqkfjqBnSHqo/aNkEH8IUmnKAXk1+kXJ5pmriiN0uzhnHyYTryGur8uOLy?=
 =?us-ascii?Q?m/GemGDDOdN4fARPsb9Tbg3KgKWLsE6PrO/cFm2+MjJAcQsdFVJYSGG4E91i?=
 =?us-ascii?Q?mNbNJbAf6/4SQ1NUW59THGu7R+GX9aBmQa3seeZVl0xF965N5H5dpkv1jhVf?=
 =?us-ascii?Q?+xFrNdJBbiOA9UoKQwK1bLX4f3telnRJKcDPyfHgCrPARgpFG6fs2d7qUS9B?=
 =?us-ascii?Q?jFw9jwNhQl8/WCG0TZh4a1NokqIy9jZKX5JT8yZe4nIrknk0IcqNm/2ykltW?=
 =?us-ascii?Q?ANbFNMtxV7urqBMyQEJrc5fPI1HgsD16rwTBUe6vYFgFzeo3rWZy5rHImRMh?=
 =?us-ascii?Q?w7191AZoBkjndtg8yOi0h40qjW1+Y87zAJQBXnvUkjBNQSyZRaEY1pEbTWLE?=
 =?us-ascii?Q?z8B8vQoG46pY6+8lFrpQZipyCLbu8geeA6qF7klJph7C3xBM7JznAdLomQFf?=
 =?us-ascii?Q?WSYGqIRKi/Xx92wM3uzextlxGTd1zQoU7ZPT0dkeHtta9hGA6319WM2u8Ujy?=
 =?us-ascii?Q?s0seB3o4FPqN6wKB5a7X/SH2it5zG3TtG0J0p5Ti7hwMtccEgj71fy9pzxeQ?=
 =?us-ascii?Q?qq/SICXkvoFQAyyLdrtFxi2shOhVJi2OzSbJkM+G0NKgIsttKd5dSlJ5fsTI?=
 =?us-ascii?Q?fzDgomhgU/2LWeAS9L+zS9ebC9oDM2+iaLb+GPwBq3Y4oAEhvgYiVjmRDkHT?=
 =?us-ascii?Q?xoteXwDYXVEN65kLU63tQf85281nqmyOpwAc8AVfcWVyYLdmOKI9iTIC2YVo?=
 =?us-ascii?Q?17mycj7Qtw4F20V3vJbNS/1KSxtjbHnHibnnHHQ0jgb0CIJFR9yj7BGJSnzR?=
 =?us-ascii?Q?v4ppCYhxpKfe+ScoIW0M3zgdaI0XXrRRB2bGWL680VtUUKDqLukqNbC8v8Qr?=
 =?us-ascii?Q?V1ge1CKbQxHIbkkYJ5PGYMSxAIzdWjBGvqOOEIlu/C/B1kvfqwALkzVr1Z9v?=
 =?us-ascii?Q?KSS6y9RD1L+LNeCPqLIX2I3JRXr3NL5sOZU64Eukb+2dJ+vKhuVKOe1sZJ9I?=
 =?us-ascii?Q?Vrqv/YvQ4f+OMQWJDD8Gga+FwkdGY13DvjiI9M13fTrLPJ7NjimysxhNlJQo?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef73a1de-747a-4a17-f581-08dd51f819fb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 21:46:58.8348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nsHpj7juTR+6deDDz4z0GnBghzytJf7bw84HHPDoQ4NjS+AAE+0R4gXBwkDfg2RQZYxzHC0Qz+26WmYGDD8rF4RJISMJsFHp+FG9/aFs90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6849
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2025 at 03:38:13PM +0530, Riana Tauro wrote:
>When the engine events are created, acquire GT forcewake to read gpm
>timestamp required for the events and release on event destroy. This
>cannot be done during read due to the raw spinlock held my pmu.
>
>v2: remove forcewake counting (Umesh)
>v3: remove extra space (Umesh)
>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/xe_pmu.c       | 52 +++++++++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_pmu_types.h |  4 +++
> 2 files changed, 54 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index dc89fa6d0ec5..67693d642f5a 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -7,6 +7,7 @@
> #include <linux/device.h>
>
> #include "xe_device.h"
>+#include "xe_force_wake.h"
> #include "xe_gt_idle.h"
> #include "xe_guc_engine_activity.h"
> #include "xe_hw_engine.h"
>@@ -102,6 +103,37 @@ static struct xe_hw_engine *event_to_hwe(struct perf_event *event)
> 	return hwe;
> }
>
>+static bool is_engine_event(u64 config)
>+{
>+	unsigned int event_id = config_to_event_id(config);
>+
>+	return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
>+		event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>+}
>+
>+static bool event_gt_forcewake(struct perf_event *event)
>+{
>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	u64 config = event->attr.config;
>+	struct xe_pmu *pmu = &xe->pmu;
>+	struct xe_gt *gt;
>+	unsigned int fw_ref;
>+
>+	if (!is_engine_event(config))
>+		return true;
>+
>+	gt = xe_device_get_gt(xe, config_to_gt_id(config));
>+
>+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>+	if (!fw_ref)
>+		return false;
>+
>+	if (!pmu->fw_ref)
>+		pmu->fw_ref = fw_ref;

how this shared fw_ref is supposed to work for multiple
perf_event_open()?

fd1 = perf_event_open( ... gt=0 ...);

	event_get_forcewake()
		pmu->fw_ref = xe_force_wake_get()

fd2 = perf_event_open( ... gt=1 ...);

	event_get_forcewake()
		// get the forcewake, but don't save the ref

forcewake for gt1 is never put.


Or even multiple perf_event_open() for the same gt: we will not handle
the count correctly.

In summary I think this fw ref needs to be per event... an easy way to do
that is to use the event->pmu_private field, to be populated on init...

>+
>+	return true;
>+}
>+
> static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
> 			    unsigned int id)
> {
>@@ -144,6 +176,13 @@ static bool event_param_valid(struct perf_event *event)
> static void xe_pmu_event_destroy(struct perf_event *event)
> {
> 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_pmu *pmu = &xe->pmu;
>+	struct xe_gt *gt;
>+
>+	if (pmu->fw_ref) {
>+		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
>+		xe_force_wake_put(gt_to_fw(gt), pmu->fw_ref);
>+	}
>
> 	drm_WARN_ON(&xe->drm, event->parent);
> 	xe_pm_runtime_put(xe);
>@@ -183,18 +222,27 @@ static int xe_pmu_event_init(struct perf_event *event)
> 	if (!event->parent) {
> 		drm_dev_get(&xe->drm);
> 		xe_pm_runtime_get(xe);
>+		if (!event_gt_forcewake(event)) {

if you group an engine vs non-engine counter, this won't work I think.
Can we test it?

Lucas De Marchi

>+			xe_pm_runtime_put(xe);
>+			drm_dev_put(&xe->drm);
>+			return -EINVAL;
>+		}
> 		event->destroy = xe_pmu_event_destroy;
> 	}
>
> 	return 0;
> }
>
>-static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
>+static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event, u64 prev)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
>+	struct xe_pmu *pmu = &xe->pmu;
> 	struct xe_hw_engine *hwe;
> 	u64 val = 0;
>
>+	if (!pmu->fw_ref)
>+		return prev;
>+
> 	hwe = event_to_hwe(event);
> 	if (!hwe)
> 		drm_warn(&xe->drm, "unknown engine\n");
>@@ -218,7 +266,7 @@ static u64 __xe_pmu_event_read(struct perf_event *event, u64 prev)
> 		return xe_gt_idle_residency_msec(&gt->gtidle);
> 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
> 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>-		return read_engine_events(gt, event);
>+		return read_engine_events(gt, event, prev);
> 	}
>
> 	return 0;
>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>index f5ba4d56622c..07c4e592106e 100644
>--- a/drivers/gpu/drm/xe/xe_pmu_types.h
>+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>@@ -30,6 +30,10 @@ struct xe_pmu {
> 	 * @name: Name as registered with perf core.
> 	 */
> 	const char *name;
>+	/**
>+	 * @fw_ref: force_wake ref
>+	 */
>+	unsigned int fw_ref;
> 	/**
> 	 * @supported_events: Bitmap of supported events, indexed by event id
> 	 */
>-- 
>2.47.1
>
