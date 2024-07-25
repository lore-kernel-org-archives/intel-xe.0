Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6C2C3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 04:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E2C10E2D6;
	Thu, 25 Jul 2024 04:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzDxSmbU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D16910E2D6
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 04:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721882915; x=1753418915;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BaBgyU871AwyglKN0CRgYHC/vft4/pgk4SRzfYt5SJI=;
 b=fzDxSmbUD+3ijaYAbzWMpx+7DIZlh8pbpwnHCf5LVQYIXAcR3vZCqnM7
 0ZiF5HvMGXI5q/hpYAp3C18FpdEqFkbBwWWlHIe4HHC1osyMjFaRaSUCf
 hkjRJzXiQ/NH4Tt+Yf5kn+MZqI6j/IMeSIU8Tr2qjTqXcRgHjkx3PeONd
 +/nimVhnxmTpHDKMNMbRUk35jv2bPdKv2F66GECNY/OLhO8awh4gfUSaF
 r3ZIAblincr2L66CZZpGh/6eSRxBxDXAbpwboIsd+zAze1lklO41PlT2R
 jwJMAAjddkG9dnYRkBbfpLcmPM6/GBBFwEgYDxsS4VJvvS8NiNSwBtX0i g==;
X-CSE-ConnectionGUID: pgQn8v9qT3OYdvDwnEGl8w==
X-CSE-MsgGUID: I6iyVFr+SfWsmNmzbk9kcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="37117366"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="37117366"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 21:48:34 -0700
X-CSE-ConnectionGUID: OZcbs+jhTf6wCKSSyWEEKQ==
X-CSE-MsgGUID: 6zEazsPBSs6XayvJbfOV+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="52875322"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 21:48:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 21:48:34 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 21:48:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 21:48:33 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 21:48:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzpVb34o4e6ycRv/k7ix3Ks+Ik5q/scBbfeuGNvqYHjsg4u41HHeOefdslULrIOeUhRrR/L5w1bVN2aMSfedvpnZPdGSy/NDkw8p0OHLERm6WrZI05LGiSo4ALZ2hapg+SR48nwsHQEC1KM0scF3ecfYDSnHF0kDamYGWx6NaovnBSdW/+8Ve3BJZ3Yt4bsW33RtFqlkO3moSFPC/9mkHAyje9C9fFrlaO/LFMDsR5tskoQ8F1Jrc/PxW4GHjoLi0qSoCUxzrM3kgwL1IbIFxn55twTo/txcqXbVaEXR7T6Mp7ENSFqlGi8pMj/byQwQSkeh6xWuFoSxh2C4zXyTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VollO+fkt+PkukdyuQXvKud5rpL2lTA0tpWW5hIw1jg=;
 b=QW+EmnTaIVclUMZ9ysxsOmria85aksvdOrQVOG973/+FzPqts8u3CXiE7CVX1azlvwz/H7iNxyuCFuHphJEYXE1Ys91bq1UKPxgAJ2veLlIQHjJA6PKgy3q/CDUrT2z+9aLP2aeup8H2VMwv7oNTxtXZGmnxT7S49oeNhb5+CaNunliCdC1qYS9A0kojC8R+IS8W/QybqY1JJLSMtAP8JT+CZNzHEEAowcmK8iiU4TXXl173FBbl8GAmpEkyDthcQo+u0y6GSJLmfeD4CxYSRjSlC2l+1RKZGydzKVXv7s6tS3ScFoK7zuq1zvFTn5gJ8D56d8nxDOUmnna2rl2qiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4855.namprd11.prod.outlook.com (2603:10b6:510:41::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 25 Jul
 2024 04:48:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 04:48:30 +0000
Date: Wed, 24 Jul 2024 23:48:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH 0/6] Move HuC and GSC FW defs for LNL and BMG to
 drm-xe-next
Message-ID: <tqx4jfnjgkzq3opvcdtsjcr3ivqvsw3qs3upptne37fr7afzuu@2y2ath6vpri4>
References: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: MW4PR04CA0224.namprd04.prod.outlook.com
 (2603:10b6:303:87::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4855:EE_
X-MS-Office365-Filtering-Correlation-Id: c4d5379e-b408-4288-e9ce-08dcac6507b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cujfa2k2wRBj+w1xhm76MPhW/QrVbeWg4A+U09zBJREEjL69zO6YX05LS3jr?=
 =?us-ascii?Q?/tsJiBLGYFzNHv0vFb2oh6MAqjil7TbMagHw3nhRgj56zXnrjD0w4QckxoM2?=
 =?us-ascii?Q?3xh1iNV/hS3ZTsCqlXkB5A5jjlgr2ImaGF/daJMyjc2e2z/ktHiYFaohoWBZ?=
 =?us-ascii?Q?71zRakn0TFuSiQ53Ur3thjhOqappJ3ThacsA/+j9a87hWCabnWUARkc2RZOH?=
 =?us-ascii?Q?7d/ewPJPL6Qe1Ss44vLqyAAMh2bcREHkc7k07CWEqFyV5eCDRrrZMAyTVg2a?=
 =?us-ascii?Q?jGI6mEHENa1jWqDWlOUuux/4fM917tN9dFAOC85YsS3cz8QlOfdujVEB5YMN?=
 =?us-ascii?Q?QMlRnX4YbrIOE8cocEXKZ1suTS1Ol1w4ycG81x9b2xyHml6iHS5O2Tf0KSw7?=
 =?us-ascii?Q?gY3ZOYmq8QZNfjwSgFxuhCGQ5t42QXRyPQ7iUE0jJK8pMswAxNdApfm7PvKM?=
 =?us-ascii?Q?wlFUYmhWWCnlPtCuHlT5XxXHNhUkmm+wDaL58+B69YPZIZIQTCKFl3DzZjsn?=
 =?us-ascii?Q?wi06CRfHjKoA9HiHFACAsikcNXRtMhh6qurNUMY8KnheKYfL+k8xvCKdo5rC?=
 =?us-ascii?Q?EnVvv00WPGGUdwFPVCic4hwlcCi/nhxbxGgLi8o0eNR09I9JQehQQK6knsI/?=
 =?us-ascii?Q?+PclPsgY8Ix4Es8663lSA7B6Zjs9zZYGsZyZ5WA2+hHlQ3SUsxmxmjMq8ios?=
 =?us-ascii?Q?yrghEZKJP8l/1DD8blohJXkz/H4HhR3BQxcua1cCSbhYrBzvVmEaZA46w6sK?=
 =?us-ascii?Q?hNjJjGukNAmRah/+lZDtqZliM0SBV9V/ulCppVM2woOt/aa6xExXTKqEjhSF?=
 =?us-ascii?Q?Toxim6BuCjKA0RWZdW1C1MBL6dq65vbturfS9ULDhEohdXcxpaRbl9BZN444?=
 =?us-ascii?Q?ZFZrRXWR1EPnROjaAnuEdo7AMqPhfVscyTbjYJqKaIWcykz1wyKNXajvnxAV?=
 =?us-ascii?Q?rPpm6bSN3dah86LGH+Cup5gV2wrhh6+9q5XPY8vQ6WBnr6UaZpg5aHBcxomT?=
 =?us-ascii?Q?9KixZtatbghAIRAa2FXzSazwoQQumW2qkpRH3aL/uj7CVUhStY6ZhY4Q49Br?=
 =?us-ascii?Q?O0DHZNnMvcnzS+O/Gq5OfiO+7/TUa0fw3g8KSEgMe1nt+4hVqwdzp6kf5zbs?=
 =?us-ascii?Q?suF2s3XKMrmS7aBQH0Xx/lCh3JaIF48zAYVnbE0oWr7f9vVIDRmAAnrtLYwo?=
 =?us-ascii?Q?lt3WIoKHiXSTLPpcrf0ODDxyYPyvl3tZ1h9iJJstjpUK+q8yK1uvGHk4vWmY?=
 =?us-ascii?Q?6ythbAMX8tdlv0dInWDI28NXGERjK7mCla6OztawCPzx6SON3j2W6UcGlJvi?=
 =?us-ascii?Q?Td0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/53LTKef2XTYmoVHl0AXDXIa7NhsRfGlFzM5wTRfCPqF0RQgVQRDiYFYliHa?=
 =?us-ascii?Q?ZsCOa/MwEc1OudaOonoJPzsai25k06OnGCpIVk4X9lc2FJ85GTmB48UHvIfM?=
 =?us-ascii?Q?wQv3XUolHuIsq/XuiXM5sJLLby1j6Wo4jMgZ0cYHBS7w4KM8DE1bfIhsZbFv?=
 =?us-ascii?Q?M6PR1l7TRC8sfgf8jOrXj8PGNDO0KCxMVcbDXKj9R4/6PtqNwSNiuw6kn8gW?=
 =?us-ascii?Q?pbhXS3pH6nCCkhWaALRQwIOWuFLUVH3szj7///tYk83TVpgpVdx1WhTTEtYR?=
 =?us-ascii?Q?45y52fgm4VA4Ap7naOjYm6MxZbSVsdM2gmWetoH/r1ZHPu6ztYrQ6mKtOlQ0?=
 =?us-ascii?Q?66cZKewJgQxEZS/62cHHr5rN6+aHSVnidS8c42gMi4kyn38B2hKbMEzMxxXK?=
 =?us-ascii?Q?qHx8x6RhZGwvg7RHWyQ2liBzLVGxm3EVqRR4b3Y6i9oTbATdtHRyWH8pr1t6?=
 =?us-ascii?Q?ynL0OLTfHwAbuL0hQy17Q7OvbTbQCtsPtUiE9iVjhJPj9hPWBvLWc7T7MjyV?=
 =?us-ascii?Q?P43beJXVcUNaPeJ/8lQ05D2sq+4PDc1tgSOBn5ddJewDCmRaJB4gFSnYEFLK?=
 =?us-ascii?Q?M1VrRwyFQwS8c/k2hWGE4ap2MjBeHpk779X5l5iffd+CDFff/hAUNx95huuw?=
 =?us-ascii?Q?pOQtqlaMcbaioFLtwes7v/zqmo9bMWlty2lGmdBfeSIF7WgpnIuKwHX6gdzh?=
 =?us-ascii?Q?OT2RoC6O1YLK9sWYzosViO4WVaSZE+Eh7DfSRyaoBMdCBk6LEn2nrWMSB7AX?=
 =?us-ascii?Q?De/f9Eg8LtRonZvKkHOayMg6rhuJDoJPGDicGzpSrCalHrbvS3Y9IPtit3F4?=
 =?us-ascii?Q?sktltkvrOGFTYxPpIW7Rvcf1VaC9tXHd81bv8slVC26Oe9CL8COafNixpIsK?=
 =?us-ascii?Q?FiIF4P9tbP/Pm3qtaR+MGMHvHt52oqh8h0iVvsOlOaBmASYYwXbSPTEuTWBu?=
 =?us-ascii?Q?FGiDHxmt8u+TOg5rpzzi4gdpC6SU450oELxWghuW7/an7m2674198TjTs1/8?=
 =?us-ascii?Q?9dn4i1H0p51k5fS198guzlfSOP95fIEX+6YYJFM8fP/SOzmcKdDL2Z0dG3x6?=
 =?us-ascii?Q?GsppCPIRRm4aw7XxkaMbQQY3bvi18AldyS6fF5o4SnQsSImCu2X9EiQCGVWD?=
 =?us-ascii?Q?YdqY5Xejqc5gIz9Jf3zt3Jh6GU0YB8K0FRSssVtHQpWum2pEfd4oWhfsMChA?=
 =?us-ascii?Q?9y84xO8tbaXOZj/c5aQUSt/CwyWZNMhwIbTWRWPG6ObZ+GYFTZrrHmllS7lG?=
 =?us-ascii?Q?FpBvg7dXkhTYBd0uaLBaEyHgQxVJ+zFPz0mXWcVMMl5Mrx9lRPcPpymuZAXH?=
 =?us-ascii?Q?o3hg2YftX9itQ1Gr0TUXL5U1MrSndMqi3cxV+U3arG2miAW7AnBXDD2GU5yb?=
 =?us-ascii?Q?XCnFcN/aL2ftgwpkjLyNkFxJzcFVriZo86YSsUIIeaAimRt3Hm53rblSfRIn?=
 =?us-ascii?Q?02GbLQpAJYS3Ty/HViXpzLqkqVukMPuUPsQlEKzfXYZDz7aZpHzueQb2Qxuz?=
 =?us-ascii?Q?nMIrPIb7ZS9l4h+ofsZ+2VnQJ6+5QWGAuVFURPj/SkWiV8i4Drkd1nFhvz2n?=
 =?us-ascii?Q?ye3y9DBjUbgXLlI5Ft1W/PYMDjaIQ8lqv95tF22FRLgBYGVZGyWQ8zEoclTn?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d5379e-b408-4288-e9ce-08dcac6507b8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 04:48:30.2402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CnUDnJ6OhlrSYHvQcEQMMzDuvIH0RtWO/X2Lvjw4ls3BVoRM8YVqdkgmsjIQpkBJlbwAlpWPhC63uJpIu6hPpP5tzoVZuE0rvxvH8DQLmBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4855
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

On Wed, Jul 24, 2024 at 05:32:17PM GMT, Daniele Ceraolo Spurio wrote:
>The FW defines are currently in the for-ci branch because the FW blobs
>weren't ready to be officially published. Now that we have updated HuC
>and GSC blobs that are ready to be sent to linux-firmware, we can remove
>the defines from the for-ci branch and add them to drm-xe-next.
>
>Note that the 3 reverts are not meant to be merged, they're there to
>indicate the removal of those patches from the for-ci branch. Only the
>latter 3 patches are meant to be merged.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>

not a huge fan of UFC, but the first thing that came to mind when I saw
this was the catchphrase "iiiiiiiit's tiiime" :) Although I still miss
GuC in the series, hopefully we can get it soon.

If CI is happy, I'm happy with this.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

It would be good to note, in the cover letter, where the firmware blobs
currently are (the commit in drm/firmware containing them) and the
status for sending this to upstream linux-firmware.

AFAICS https://gitlab.freedesktop.org/drm/firmware/-/commits/intel-staging?ref_type=heads
up to commit 0690b69dc20da6d096450faa0c256f6896ff8365 has these 3 blobs.
Can you share the plan to send them to linux-firmware? Is this going to
happen just after having the CI results?


thanks
Lucas De Marchi

>
>Daniele Ceraolo Spurio (6):
>  Revert "drm/xe/huc: Define BMG HuC"
>  Revert "drm/xe/gsc: define GSC FW for LNL"
>  Revert "drm/xe/huc: Define LNL HuC"
>  drm/xe/huc: Define HuC binary for LNL
>  drm/xe/gsc: Define GSC binary for LNL
>  drm/xe/huc: Define HuC binary for BMG
>
> drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>-- 
>2.43.0
>
