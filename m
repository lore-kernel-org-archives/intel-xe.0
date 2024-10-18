Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69D1D3F29E
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 21:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8BC10E240;
	Fri, 18 Oct 2024 21:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBGMSbfX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE19810E240
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 21:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729286079; x=1760822079;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dRqGm8HbgyG/tj0abNkc4E9mRk/pWdoYg7+YyZ9MfH0=;
 b=aBGMSbfXr7wQX8lHAduB7A7nnrpZ46Q6t8FTaaMAPHigi/54A7b28VCf
 ScQGnxiUd9TE9lhB7ByJ4FlT4c3pOHy0dKvaIFWtcWHxAiyqJ5zrdN41V
 pMWJhCwfMbuUAVfxRKfAFisFWlxfpgtgmLm3BAVe3dsJr26FSlB19vlDF
 hmt17KNuP5jZiRGclqgCu1i66UzQJeeRYYeg02zU2Xe28lHb777eR4g+l
 dLWxmlKMQ75ggGUznuIryo7xwwS25MZsixmTIM6ByGIIP5JHW3TeScP5q
 BkipxlaS6pxb/nq9exJ7VnfZ2cXzTRqxisOq+1/UiVxha1z2naIlqBs0i Q==;
X-CSE-ConnectionGUID: t2RtSm2pRZug61wYjsgUgA==
X-CSE-MsgGUID: k3MN8S4VR5a8apo7cVhLKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="54242195"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="54242195"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 14:14:38 -0700
X-CSE-ConnectionGUID: w5rrintRSE2NyzEQmpCUuQ==
X-CSE-MsgGUID: O5wIwMS/SeW+Hqw76F16JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="79312499"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 14:14:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 14:14:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 14:14:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 14:14:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 14:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uk2x3vWzVbYZEAvNpaPsyeEYABBKhpu/3vhL6P0+j54Lk1pqVIeJzWqNek67ISpWfJA1gKmjTsB/YBhCDHROlf/5ZGvijD+K/xlrNXUY94zPeBoRS9LBv5Vj0bWAr+VAFJk3TON1Or7rD9bEy7tKyAMTO1AXWuWj8hhMgE+Pjcl4ZSWxvhdjnkPTQaEhxWA5kf+tDq1zI2DeIC0iFzoYyjiie/cH/LhMzFsHIlNux1O4br0Qhw/Zb3Fy7FT80cB3IUA9q9FYoJLU0vzN5e2cvwOPQqJUtzauOogeEOyLPMFOWfIHRUZZhMUO5aTuccbGptVe6qB3tKYqr53RbVs4gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3RI6E0767d9ouS8wE8tlXXHZup/Iih8/MPO4/zyM+Y=;
 b=Th8LA3y3xjucnJMpoDYtLb7RjWLeznUr1s/xPXrL9htwcLc78aSmvKWtJfrvksPciRLWkhVO6cwLFgDKFtUj2SgdiP69PX/BzQbqY7EQd66MVLp0RA2L4qToIC5AezGTmwjXmaURwSiZXFxYpLH3IUsrQ9JV6tX9WEe62TMKhgK1KzECexp6P6qMKicROSn3TRxDU5WQovGQGEjMRKzpuPYv4ZutgImoTVOP4W8ZbUBqW+xTVx+xe+Mt7k12kal4cLDlQimjrynRaoxJrD4oa0W2ovvUoOPTYEHKKNHZYmJixLNGs9dC8+3BhiWi7YiHEIVyhtbg+TF3sRh1IqVR0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6958.namprd11.prod.outlook.com (2603:10b6:303:229::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 21:14:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 21:14:25 +0000
Date: Fri, 18 Oct 2024 16:14:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Clint Taylor
 <clinton.a.taylor@intel.com>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH topic/xe-for-ci] drm/xe/ptl: Add GuC firmware definition
Message-ID: <mdiqjtjfw64fh3pysmc5ndpegzepnglusg7xmvsqbbmpyw36hq@uvlmwdtzqef4>
References: <20241011163920.7926-1-matthew.s.atwood@intel.com>
 <ctp36giso2dqutyhnqwsr6im2lwyvgh3jvzel7p7fh6pmw4x27@z3xnizpxofcf>
 <yebatc632t6a3qysnopru43iz7tnzct2h6vrsxywouvq2icb77@cfhrk4kgjl6v>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <yebatc632t6a3qysnopru43iz7tnzct2h6vrsxywouvq2icb77@cfhrk4kgjl6v>
X-ClientProxiedBy: MW4PR03CA0305.namprd03.prod.outlook.com
 (2603:10b6:303:dd::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 928ce596-74cf-4144-ccd4-08dcefb9d83d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oJpdv5BdHxeYyLETaqGqmhay2ha68GicON/ZLkWZIdRRXLvSVUhNIKiXEOkl?=
 =?us-ascii?Q?tKLMWOGxna9P2UbLpcahHwJlbis56HACuPdhVjFeWSzMdQLeqplFfca3PtbB?=
 =?us-ascii?Q?6EAPV3qHgZ0ZwWl0rKgrOQdoV0luhhnJETEr1H1XvsFCgjg4DUeZ0k3qE5Z6?=
 =?us-ascii?Q?d2o7Grcbd7cTwsHeoo8bNRT2i2+YRSImNGop3rGm39pLAudbky91MR+BCaE8?=
 =?us-ascii?Q?fqvw7J7lBYO08veiB2egCYopzsLVgN4wSWIJdlLo5pcniDum8DgxXFyzOi0Q?=
 =?us-ascii?Q?3qf0w23YwTBSCboz+E1+L9Gj93FU+PcbvsqqpfLSFhZPaoVW3P4EcV3DGMPy?=
 =?us-ascii?Q?gqvA6syV1jp4/FMrqWCw8+uMwZuwCd4wnTIAU+jjuCjUKkRXGqph/67vEQN3?=
 =?us-ascii?Q?1wobX0h6U7tpOo7H3rQfQ3bzNI/N/owHegXqVTouc8WZMeog+Oi3Ry+x+6dJ?=
 =?us-ascii?Q?TBg2TBcUx6o1yhld8qpabdJZ6zqD/3BbugTjTywf/k1bRw1nMG2b/1QN+rdX?=
 =?us-ascii?Q?5vizEDbYlqPIgmNuHG3gqe+gSkGqVPngzh5jam8SLgEtiawq/3iECwu0qowR?=
 =?us-ascii?Q?PQ7E4yfMXneDnVmJO7BagQey3HPzQmu2D8nQIxnCNncx6nctSo01grvRWprA?=
 =?us-ascii?Q?q90qFuJKNcApGEINxA2wmjLp0yqMsCGiQ7MxZKzOPaxFUoxYXh0qpwtDfKJS?=
 =?us-ascii?Q?djAZrtlCPsvLP77kz0tkk5jVN+RFX5bBg1sgy+nlIBMKOd++jjacHuHvFyLZ?=
 =?us-ascii?Q?3tku9QfXqcPsBN/4Nt+aHQRJHqSMh1PLPYNA4SNzYikJFYor9+80pmuG4hIX?=
 =?us-ascii?Q?8qgpQ5FWwubAjrHeQTO/XgsLK7Nmv9vGl0DP/SEEPzLZ0RoARIsN2aYZgO3W?=
 =?us-ascii?Q?gGSWS7tANhmjTcJxGZz5L9ipWTEnHVhuUhUMRstCiovfvf4vEVYQZ4pwrC/R?=
 =?us-ascii?Q?jrYylm9//7UzYEjBosGDxis8v3aOBTeg9aTY15VGj4dE1f7bx6c+Ztr/LCzW?=
 =?us-ascii?Q?6eA/yqiOWukLqrk87oBvYjF9r/pEV5YGRq7UR0NXdF7f2kWUf4Eqms+hnG6y?=
 =?us-ascii?Q?qUvoKs8Elc/Xvh8NqGOIZClXHOWFHQlpFWIj5uy/3spB1Slo0Tzb8+6c/5vx?=
 =?us-ascii?Q?tRt+Zbmr0/Rv87J5FcxVm6CkdfmhzMnxF4gVMQQ1V/Gaf9cmBgjlcbzT25Sz?=
 =?us-ascii?Q?kJbJNd68prz2/ivZEXpKTmUmS7QR3ifenQ8Ve7OKb3IBH6VujlSepc02eI1L?=
 =?us-ascii?Q?t7YF6+i4g7b6vuPBZ9xJXuZ2vlHuxybrXATXEpOvSZyOHOZaO67fO2/GuoU8?=
 =?us-ascii?Q?WWBAh53ux+wZgtzR1IdAfpfk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8anBXy+xfTEUPl8XIR1EYNQcawcoiaF6FLwBouY2HETL2dlSlHafGBZNkDBy?=
 =?us-ascii?Q?n6WWL2s4XtQxRO5laXwHu+vrkNFN60ZATHu1z13CqRyR3O4vHsL4TEBz1qdK?=
 =?us-ascii?Q?hhfovtQJDcvlqu5Knh9KITa+pBaTVE1TCPvaD/YG4vtrwWcvdxJC3PzhR1K9?=
 =?us-ascii?Q?AZVK+gqRDw4YWJRNFit0nT86sUUDJl8wBUjTQaAS+Qj36w/uhA83UlkDbKbK?=
 =?us-ascii?Q?P7khB7l8ke985vgCYIXgZuz4mDSk8JfMdjOWrVM1WJsi4Q6WZ2y+O6wH1DEP?=
 =?us-ascii?Q?JX/HN3BINBMBKSCMpo7HGBIeKc6XHWDBH50yo+SBnfMFBq4KJEAIWWBaS9yO?=
 =?us-ascii?Q?0AGu36UiRqEOLMxdEpTlBOjRbgZtIDnzCj4Q5MPYx6L1eFBO2ivoFJXHE8Fm?=
 =?us-ascii?Q?CFaChKeEf4Kg32ZMucbJYAzkXStEG1QH875WzSvTsPfIiDwlc5gyQTJljWgD?=
 =?us-ascii?Q?fv8oCDLb8pwu9WDlkwVsavP9x3Wq1Y1TzeiSSsUV/5RhT+RV6LVSLm5jUWAs?=
 =?us-ascii?Q?1QbX35Rqi8N2lqGszDWgicvHlKGo7eHc6HE43nMjfSwCuQoVx8fm6O7Q3Ch4?=
 =?us-ascii?Q?SUWK+IJ9ym+75LURFmmazZVzcnxh6mCoVJakD31S8Wvbve8/EdaYV3uuJ9Ac?=
 =?us-ascii?Q?rlkyNWWMjXnc08HnSEjoV9ZjEiO9KaQM+NWn2Ma4CI3zYfAhKEJvILK3GBm+?=
 =?us-ascii?Q?4WLRASILIcL6l3+lGnhxbKD1JkuDEXayBEB1LE74dA04s57EI8QbLJGAxbVu?=
 =?us-ascii?Q?gAdNlEJIeejIbFe5LNzlGPf2vdMHjZJ6jFHuYkflpzwMbt67l5CiTH3MosY3?=
 =?us-ascii?Q?P7/icoNaspfpS0ZTah1+wVS3QEX+tUav/lEprTYqyP15zHNRQ2fGccupcmJk?=
 =?us-ascii?Q?li5g6K7xCOL8rvhDa8BXfzrxj8UYsP9MXmGUavc8YjYmDkXpx7b6o8uSSiwK?=
 =?us-ascii?Q?RBxTePxfue4/+9TIeVkv0d1502dBGKbJh011L4h8+5zWOZayjfABOJrxWbRO?=
 =?us-ascii?Q?xzNu2UyGVSHMBHCDA+Jb8GZOuAWbrSUtl2kIyEkJ89paRUtyyxSiGj72AoZI?=
 =?us-ascii?Q?7C0Ck5p/o+OwqpPljevsCGXIxlMTprVK+ZQJupYGT6tb9j8sAmukpN9qnopm?=
 =?us-ascii?Q?a/DyXkVV3ybQ+jXu0FS6lGRteQbP8u7KKOOf3bCiJ4tSQ1sQC7KA+8XuFVJL?=
 =?us-ascii?Q?D2aYsWPCbEB8AA8FmHWK7mtf8ixSBuSBwIOPE/dNjKJqLm2jadyzoVicme1Z?=
 =?us-ascii?Q?QBwRHFGzMRzRuPW/pPZ8n5qmKtLuV1zEJtsb/pecQPUs6n6arzeCozfhijUE?=
 =?us-ascii?Q?uV4txf8NZDhkCAgKj/ESJPR/UmwPKxYMmPJ0+tZFSglXwykQvG9TfdCrviEv?=
 =?us-ascii?Q?hdq8LFOHZISAxCQ3nF/8aEWxiWg6d4VNjSRpPJveY7V24nVxrmhesdiAqD4d?=
 =?us-ascii?Q?n40f+r63aLbKuARKa5fl3Vx8hQNs7boWh/vDDAN2nmyv8J++QwMkFqAGI3rs?=
 =?us-ascii?Q?E8lisBy/2CirqlLAccEMyM+z+mArjdUu97c/zSRaemaDI9f0ml9Nfi7JT6us?=
 =?us-ascii?Q?STR2DVWA2A85IycA96iev0A0pTHcz9zojVkY1jt+5b0yH4YI6pwVXDGFPHKV?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 928ce596-74cf-4144-ccd4-08dcefb9d83d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 21:14:25.7640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBNqpaJRYhn2d1XacVzIO6cJaz0pJKmXBDF9bjQ+e+PGJjrax2lDmAlhRxqAReG8VkGCS4DF7Kj904j3g2OydsydU+FHJfniwtSF7qjDTVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6958
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

On Fri, Oct 11, 2024 at 10:01:41PM -0500, Lucas De Marchi wrote:
>and actually Cc John.
>
>Lucas De Marchi
>
>On Fri, Oct 11, 2024 at 09:58:15PM -0500, Lucas De Marchi wrote:
>>On Fri, Oct 11, 2024 at 09:39:20AM -0700, Matt Atwood wrote:
>>>From: Clint Taylor <clinton.a.taylor@intel.com>
>>>
>>>Define the GuC firmware to load on the platform.
>>>
>>>Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
>>>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>>
>>+John
>>
>>We can't apply this until the firmware is available at
>>https://gitlab.com/kernel-firmware/drm-firmware/-/tree/intel-staging?ref_type=heads

so, after some back and forth on the best approach here: let's apply
this patch as is.

I have a patch that allows adding entries in the table behind a build
config, that we can set on CI config. That config would hopefully not be
set by any distros packaging drm-tip, so they wouldn't see any warning
during initramfs creation. However in practice this isn't of much
value:  the warning is non-fatal and anyone looking at drm-tip could
deal with it.  I very much doubt any package is actually following
https://gitlab.com/kernel-firmware/drm-firmware/ for those staging
firmware. First of all because we recently moved it from another repo
and nobody noticed.

On the other hand, adding a config needed by developers means that when
they forget to set it, we will get  a bug report that PTL is not loading
due to missing firmware entry in the table.

So... let's try to keep things simple and fallback to a more complex one
if things don't go as planned.

Applying (soon) to topic/xe-for-ci.

Lucas De Marchi

>>
>>Lucas De Marchi
>>
>>>---
>>>drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>>>1 file changed, 1 insertion(+)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>index 087fb96f707e..555ba12e0304 100644
>>>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>@@ -107,6 +107,7 @@ struct fw_blobs_by_type {
>>>};
>>>
>>>#define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>>>+	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 33, 2))	\
>>>	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
>>>	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
>>>	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
>>>-- 
>>>2.45.0
>>>
