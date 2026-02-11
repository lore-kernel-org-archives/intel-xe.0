Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B5DEB596B
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 06:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C98910E036;
	Wed, 11 Feb 2026 06:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYhiPig4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D849D10E036
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 06:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770791216; x=1802327216;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4lx0TaQ1WeERMcgNAgR+jqgONE56C1pkqO02zDHRufE=;
 b=IYhiPig4Sz1/xSbDQYz4ZVnWE9VP97lq8M/p8qKqMrgxX1D491OLDiO6
 /tsFMD/r9wIlM7xX3yJBgp8qwMV2wvF1dKe6cBw5H5CJKmw2y00VqPUDR
 PhuzAb0ww2D/5V0PgraEKXxAjmEv/BDQfuQ3Kxk7lOFhDlpdJUuifcT91
 eud0/qacCzIBKFheoTrzgW/6aYVKPlCUOYDOHBu44CTN0cBYP7WW4iTlq
 W+HwCG8u5qTQQx/EwHn1/7R2KtxblkwQxZU/svqrivt89P7EHkl2vTz7W
 WP+VwiVHQjgLREpkBee2nUN7X2J5zLVWWRHUjiZfUN8AuvvCOfmRbrYbR A==;
X-CSE-ConnectionGUID: fphyprpwTG+k6vguZ2BjDw==
X-CSE-MsgGUID: sKJNDMrvS6ib3gnz/uR6Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75558030"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75558030"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 22:26:43 -0800
X-CSE-ConnectionGUID: Y7XaGKynRbOi4w3LxctGRQ==
X-CSE-MsgGUID: XdSB0sbmQ3CobtnlM+t5oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211120696"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 22:26:42 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 22:26:42 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 22:26:42 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 22:26:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GT879JZwpM8Z19sng0zN6wAYuvE3MTPUVE3jzYuBWen+wwPxqATOwkUs1AD3/GuSIy85ExNv6QzYAPPwcca+eEUiA3OQhY4Er1rRgz9qLiz0qOY13uko/eVO8yY7LA5qK/D1x3UCZdQEx8P04enDAX4OqwA4qas7s/bnihb98gSfMg7VD1VupV7Guw8jRGN/AswQWzPaf7C5oAN/thjhkmhSlnMLir++8EguCckQ9EQ/wcvAu6ibDcKg+wItIHC+vm2f8GlInSK6xf7dUMq8gRHLnl7phHB7TTDwngSe0Fg3o80j3oSiTUlm1jTv02xKL5a0cif741/9TbU2s0JLkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVgTs98CKwkz7SqRu1U1jwU7f2NDaEB6QD3A7h1bDT8=;
 b=pX72Jcg69gLwM/oiQhye4oZVCe0UGPUinkr+fshTRreKJGvEgYfEDFUj2MryoQAeyFYl35pVQXhqsBqn/Qlg9oy4FBwp1s2V+ilauDpm/spaVTYV2SErft7dcuyt584returReaMUHlN26Caz1NpDmhdOejQaDO5YLs5Qi/oKpVnwHsT2oheG8cALhIT6Z7Jsk0Yl1AFkXhy2BYAceeueeztUJ0Ue1VlRmdItTXpUoTxmre1yo42yGLAm7Izsic8va6uORLOEeeTsbu7C0TUvGYyDIpWSEQ5Ye4IokeaqEcd4hdvzwMaXG07avRyrzCFLGOOBTBZz14TlYMV6Wx/fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7972.namprd11.prod.outlook.com (2603:10b6:8:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Wed, 11 Feb
 2026 06:26:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 06:26:40 +0000
Date: Tue, 10 Feb 2026 22:26:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH 1/5] drm/xe: Implement VRAM object tracking ability
 using physical address
Message-ID: <aYwhHQIhkm4Fag+d@lstrano-desk.jf.intel.com>
References: <20260211050132.1332599-7-tejas.upadhyay@intel.com>
 <20260211050132.1332599-8-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260211050132.1332599-8-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR03CA0314.namprd03.prod.outlook.com
 (2603:10b6:303:dd::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7d734c-0834-4dd4-387f-08de6936844e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V9odDikSd8poeUyoCStIf+gWyET1PUWHi1LVX06Kp0prtaR9WJ4vujnBfK9J?=
 =?us-ascii?Q?FMxC+ceweuEa3W4lrKsw4l4dU3vs5nqy8MJW5WOPkQd+ZNAZuOpPFURDE9zz?=
 =?us-ascii?Q?Xk52rqNgLO/KO4Y/4auW26UD7SYCtrE7R7sj63I0jgmFyFU+RZMK+e6R0/Vm?=
 =?us-ascii?Q?wbor90Q1oqqbmkGvrjQNTYsxu4k3CtktQUm42Xct5GKzWxtEXeCm0vNMcSOt?=
 =?us-ascii?Q?P9gse4H7/v1K6ukUZMRUZBn8iYsWAP7p7jpA+oS51I4qpHk115paG++itrx9?=
 =?us-ascii?Q?ojWjGofMtI59UJ0YoHTSOW2yT7zD+/9Qd+jP/obH6HKWySHWbH0WtYURa1RZ?=
 =?us-ascii?Q?8VMeFjqFSHpvEE+iKKjRGPLLOAr67SpvWbL6zKzPToRiidNKHQNzpWdO5FKZ?=
 =?us-ascii?Q?4fHU+7Bq0WamT9RZzRPBZWnA4/GUbVn8u9zGQtAWi7DpwoNTc3tKWL7Bk8Jf?=
 =?us-ascii?Q?BD4qraQwmduFA9ABMkTK2fbO0DdxLzUDqe9AdpO3Hc3O0G+DBctlDl0eXK+t?=
 =?us-ascii?Q?ZIRPhsPPml4+dGxiNhpykJfac+7ojPbLNlVTajUPW+GFpURbQuFyMEM4s4pt?=
 =?us-ascii?Q?VaTMDuNyNd43PSygFLc19C2Gc0KB5Eo4PB5dg5IBlqUc/LdDd40r+twDZJ7A?=
 =?us-ascii?Q?nQS6kXUZznJLB44OV+eWDjerocz8BVQynHZqDQV71dZqNUDEtGJySmzZBftY?=
 =?us-ascii?Q?dEmGCJChMD2zmWMrd1HM/ZwvFQa/lgdfrIHKcAmUwaoWZCj+Ish1WHnkgtaE?=
 =?us-ascii?Q?Iy7aMKZaJcWsNQ4RMDCOFm37Z/Dbt4SdiYVwt+vw0HT6tJKfVK7pFr8sND+q?=
 =?us-ascii?Q?Ht9QF+zpWJ/ZiXVG9dU52HyjologSJ9IofXnNy3hcfRMYqIh9T9G2l54OFy3?=
 =?us-ascii?Q?kniiijKbAD1/VLSQBBo8L7778NQfHS8vACJ/Ri72AZuNZoacLiV4mwpD3V3Y?=
 =?us-ascii?Q?uVnNghvLqMgKIl7gQ+DDMu6nLya+tQHHX0B3MMq8AKxD/1vqKSwT7/MfoPiu?=
 =?us-ascii?Q?ajxyrDlR1o5xXb24W9/eEoeOsO01hCr0SZNQHsTDFkLXx+gA/r+ahhK45BS9?=
 =?us-ascii?Q?1XyeeLQtDXGYPP979mJjjH1uFtp5pn5aJMfENA8513cvHbWxzVd/jCzS/h4W?=
 =?us-ascii?Q?AatZa0supm4U4TsJwLeS25pLJhhsHpW7FZYZI0U+TVtgAdw+RuHhaRESoS0K?=
 =?us-ascii?Q?8e8Cui0ONPIPGfdzybfK+fz45l2nng4YwwkKnlz74+6KnM5KCP2Ncb1HUCqm?=
 =?us-ascii?Q?QgzFJ8JQPZJG0Tms1w7q6jpeAxq4xl4LJEkNo9YrXTK2LvTcpiAGMRl7vqEu?=
 =?us-ascii?Q?eHf2QJJpWl7jtJKFT4OFjpVecIQbSsJvovr4NA8GfinjLpCVuJ/7PDFlVnWY?=
 =?us-ascii?Q?g3tufNS9Uf0egCsr3reJbb75QxUdH2At7UyLjrs4KX9j+Sl4LCbeimktvo3G?=
 =?us-ascii?Q?7Ica2CMSli3/lw/HQcbdwEVHiN5sLcmWwOyaWqmfJDunLk+AScj7x8CTWArN?=
 =?us-ascii?Q?uBiyjiKHdAHGUAGTZOkhn5Y5+aszjKZmcync5957gvxGmlOUGfzIM5XPavYB?=
 =?us-ascii?Q?Rml8ObJcc5furq3lhbY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C0xkfOQ4LQqv6Hm88asl6QC9pbln6tfoA2cm222hgHUOXwt877RgBH7ygTF3?=
 =?us-ascii?Q?CcA8aQMQaY0Pzi9slI6kF9kXEOSJhgvmnQYoh5Yh53S+4MSZQoIIvgArISAz?=
 =?us-ascii?Q?22xdMVBtSdo/3DsSaI6McxA07YjqjAe01J0B4RMmfyh+Zi1OZf5mVcGZ7Kyq?=
 =?us-ascii?Q?NWZOWPAAuy4dlPKSs+y2bTdHUM5YmFrIpZJake2WOfmFTyvD+S1Q0H+lAyot?=
 =?us-ascii?Q?/2RPr3oPkxqCO7JIxq/cMEWp8KTnq68zZsuSYaMumDv6ISH0ddFaMcyO48fY?=
 =?us-ascii?Q?CCay8hkMda1Mw4Fh3Ys7JjHKlBUlOCh5dJV+Zv85o5D24mtQj+GmURahofwQ?=
 =?us-ascii?Q?/KfNEk6dgOilQjjo5mh2q4KmHBMI9XMOwu33vo1dRPcpozgIpdFJRxi95ZT0?=
 =?us-ascii?Q?CB4xDQo0R+onR8MOiD5Xyu8D8GdGW7nMqy+RW6CcWL8c6ilo132j/UmI1Mgd?=
 =?us-ascii?Q?zdbm4TJBpUtj1x7gMAQ7hp4ttpriAVaSpEFD6S/cOg+3Kgufjf4lgDo9m7wT?=
 =?us-ascii?Q?J63BSyPhtw9S4QGqkFE+ReaSgp0y81alZpxpPum2io/vCqBtK0elLbxHTF0M?=
 =?us-ascii?Q?EusPjaF+6q3BQmvcOSV9ezqu5mlxs3LHJBcKWUrfY2eA6kEUIbjQj0FbO48L?=
 =?us-ascii?Q?2KNwJfVYBIQwHeB/K+Ox2jaC7Y1KLPbyVpJ8fewqcIYDIwtVaBmPWXl1/ERI?=
 =?us-ascii?Q?DsIAgck6YFjMBajiT2ZvTBRQ/3iHCcARVlFKgxYsYT+u5Fk+QmiEIb3UfTJn?=
 =?us-ascii?Q?sqm1l2dxBgdIQDsq7QchBClylDRUXfZpeRoHvKjVyCjK32VnT7WZ9N8TgSn+?=
 =?us-ascii?Q?OG+9LQ8pW2MU/4Qh6GjO80D3HpL/8bwvofuZYEVo8SU6PznBXMLsqBFf+fj8?=
 =?us-ascii?Q?PpzKbTOVAvQs7MPO+x07/Ta5boAYy01FUk8/GVdfKHuqdeL8VyVJnE3rUg3r?=
 =?us-ascii?Q?z0WhYWh4OBoe8cRRsJNxq7YyWI+H2L5RaNBcGPlfvdwrQDLLpr1HbgDxcaLW?=
 =?us-ascii?Q?HwZWd/i+0Y4NtErwtdjE9w+nuk9Ct+IIYSA6F/Je9wP/WI01y7NFsE8Cp7GO?=
 =?us-ascii?Q?Yojey5ldKE5DPBHzatviaQZvqc6IVj5R2O+xVfPDREMa8yNxIjMwWlTuAEPi?=
 =?us-ascii?Q?p1lxUu8MNFf4+Gl4oyoXShDCEBixgj21ub4p8cICzCfq0nHYhaol/yOlnGXd?=
 =?us-ascii?Q?MLVFo7ESpjN+JCQwM8HBzkk/ROTQED0E+C1I0IzoUpBw7FTw2TeDgJ//wUi4?=
 =?us-ascii?Q?xXsBs8rnmtyC3knFXleUYsX7+cwSemEN3lndM5KV0YjqSdI/AngQQJBjObzY?=
 =?us-ascii?Q?XIs7oZssihdJNW1WM36boLH5KmPQST/W3jRknleB+9ZtxoXHWu++MIXJuwb3?=
 =?us-ascii?Q?S/Uing97baN4b83jN47ggD8F4valOyVC8CkYJ6GO/Iiea5f0kstlroUzFyuM?=
 =?us-ascii?Q?5m1dn4rtP1276xa0owvG1Ayu+f0XPUxu3ynwbXViyoxLXbyURuc2dN9XTQQT?=
 =?us-ascii?Q?T0AiHo9YeS0SdQ+MTWfEqzj8mb/YmvVJSIMh+SYZFU+mjmYYbK5tTXYvzyqR?=
 =?us-ascii?Q?EtVfhVpq6QbDIz/xH1kronJ+OMYxTuVcjTlEpGsk/vZXyCTtHSdXNpeMIA7W?=
 =?us-ascii?Q?4d0kq/bwJntwvzRegxDX2Vct2H3/zkraVBlcwOLi5X2i9VCdt4d36b2kgmxz?=
 =?us-ascii?Q?8AFSXWi6EUKDnwZaa+Pehs26Sjyo3H5HNB2rzK1dGvGlhhh/SbZ8h98vl9pk?=
 =?us-ascii?Q?ohbhtMxpsg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7d734c-0834-4dd4-387f-08de6936844e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 06:26:40.3432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPX2VkzPGH+itF6P9lUsvWl5eGHG55hmu+OjM+1DlcfPanoD68H9Q41DCxNCY60JqZYoI1YlLUj/1zZwTJTDZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7972
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

On Wed, Feb 11, 2026 at 10:31:34AM +0530, Tejas Upadhyay wrote:

It will take a bit of time to get through this but spotted an issue.

> Implement the capability to track and identify TTM buffer objects
> using a specific faulty memory address in VRAM. This functionality
> is critical for supporting the memory page offline feature on CRI,
> where identified faulty pages must be traced back to their
> originating buffer for safe removal.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 75 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  2 +-
>  2 files changed, 76 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index d6aa61e55f4d..4e852eed5170 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -56,6 +56,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  	u64 size, min_page_size;
>  	unsigned long lpfn;
>  	int err;
> +	struct drm_buddy_block *block;
>  
>  	lpfn = place->lpfn;
>  	if (!lpfn || lpfn > man->size >> PAGE_SHIFT)
> @@ -137,6 +138,8 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  	}
>  
>  	mgr->visible_avail -= vres->used_visible_size;
> +	list_for_each_entry(block, &vres->blocks, link)
> +		block->private = tbo;
>  	mutex_unlock(&mgr->lock);
>  
>  	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
> @@ -467,3 +470,75 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
>  
>  	return avail;
>  }
> +
> +static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
> +{
> +	return s1 <= e2 && e1 >= s2;
> +}
> +
> +static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
> +{
> +	return s1 <= s2 && e1 <= e2;
> +}
> +
> +static struct ttm_buffer_object *xe_ttm_vram_addr_to_tbo(struct drm_buddy *mm, u64 start)
> +{
> +	struct drm_buddy_block *block;
> +	u64 end;
> +	LIST_HEAD(dfs);
> +	int i;
> +
> +	end = start + SZ_4K - 1;
> +	for (i = 0; i < mm->n_roots; ++i)
> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
> +
> +	do {
> +		u64 block_start;
> +		u64 block_end;
> +
> +		block = list_first_entry_or_null(&dfs,
> +						 struct drm_buddy_block,
> +						 tmp_link);
> +		if (!block)
> +			break;
> +
> +		list_del(&block->tmp_link);
> +
> +		block_start = drm_buddy_block_offset(block);
> +		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
> +
> +		if (!overlaps(start, end, block_start, block_end))
> +			continue;
> +
> +		if (contains(start, end, block_start, block_end) &&
> +		    !drm_buddy_block_is_split(block)) {
> +			if (drm_buddy_block_is_free(block)) {
> +				return NULL;
> +			} else if (drm_buddy_block_is_allocated(block) && !mm->clear_avail) {
> +				struct ttm_buffer_object *tbo = block->private;

The SVM code sets block->private to 'struct xe_vram_region' but we
definitely don't need too as there are other ways to look this up. Want
to fixup xe_svm.c in an independent patch to setting or looking at
block->private?

Matt

> +
> +				WARN_ON(!tbo);
> +				return tbo;
> +			}
> +		}
> +
> +		if (drm_buddy_block_is_split(block)) {
> +			list_add(&block->right->tmp_link, &dfs);
> +			list_add(&block->left->tmp_link, &dfs);
> +		}
> +	} while (1);
> +
> +	return NULL;
> +}
> +
> +int xe_ttm_tbo_handle_addr_fault(struct xe_tile *tile, unsigned long addr)
> +{
> +	struct xe_ttm_vram_mgr *vram_mgr = &tile->mem.vram->ttm;
> +	struct drm_buddy mm = vram_mgr->mm;
> +	struct ttm_buffer_object *tbo;
> +
> +	tbo = xe_ttm_vram_addr_to_tbo(&mm, addr);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(xe_ttm_tbo_handle_addr_fault);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index 87b7fae5edba..1d6075411ebf 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -30,7 +30,7 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man);
>  u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
>  void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>  			  u64 *used, u64 *used_visible);
> -
> +int xe_ttm_tbo_handle_addr_fault(struct xe_tile *tile, unsigned long addr);
>  static inline struct xe_ttm_vram_mgr_resource *
>  to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>  {
> -- 
> 2.52.0
> 
