Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFF5CD11BF
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 19:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2EF10FF18;
	Wed, 20 Mar 2024 19:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTa8jntF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6918810FF18
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 19:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710963111; x=1742499111;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SaEF93m1gtuMuk7KXYahWKF5DGmDqkNzXoY+PRn+He0=;
 b=iTa8jntFSQ4U9KnX2yBm1QtW2vK6u2gUF16VgxEchbM2hhrgJtNsE1bh
 RoRME4L9hQlovdm4ouuhc2MugAlLF2L3ocDVAWsGKgS+MCEogfEdYN25K
 sjE1YNhcOHXT9wNGaIwCn+S/FahvfrQ8DIAp7sZwafaC19Ui/AiI/h6EV
 TG9J44eEpgQsy1csdy0K9rxgTGBIN2gkRBsC3fuzZl/1lMZ4COUJf3HrQ
 VTJl6/hbvjnFDOLXAbIzhmSrhtWKtYU3xiWXu1VXLbWYMhcYGpyhFP5kS
 6Mr0sL62xHlkKBAS9bIC/51Jc7YFnFpt/76hnlFDXjDu7yi17XoOIjCql A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5762508"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="5762508"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:31:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="18841524"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 12:31:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 12:31:50 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 12:31:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 12:31:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 12:31:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdvG0nWmZOUvqhqWrPSFbvqrUx+kYiYBp0Fn2lzn0YeDbQsjisGtG3Zb32ooDMH4SU6I4QomgA4LCdgBNByf/QEn7fnCUMtHKcWLwThk77ACk/w/hDqTHX0nXEOATxYo78ytf6jvQRrl32hsMX10u9YGEhI2hty3mgnbE5POovK+LGwl+o5fsI4gj0Jii+nrZrRxlojlLwgC61W+2ueN8S7nHKcbBZ3IT3lUJJRIcstO9nvWjb1VY67ftnM3HM4zAdKKZ9P0X1VzzVmNCm8hf412M4PS6TgmqeHe0gR/jUvO3neWIZMZ0x7laXBqK6IX1kqjLql9a3uhhy7wfDvKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yonwQncg6BoJYIWlCggdXPMRiXxL11RvWtU4TRqkM2U=;
 b=Nl+89EYsT/XUmux+MqiysCSOEww9KWL0VjFr0yrbqGeM883XmTMyy4heLCkp4bxuvhEFWuazlQ1nvZvpaowqPs5By1jFkAT2JYVxYBhMQUwXV8sWzM/erEXSgN9u5ZqD1kFcQpmg0/EnzR9VbDWTfQE9G9vKlxAXBQH+u8Ph+uT/CLvJURFgA5/9hu41ooldOdidLUD+qesEaQ3xWSDx39n7tM1OgNWxpUm+fFRJ8eLb7sjzC338UyeeEIOAbd6IOnO2AwGdPtaJ4vp7lQMIDjUkF4x/cdX6FUVPR0/5BUtNBvlH3Jhe0aZG2Tuudx4MfnGV4JnJe7QxLBAIGiE0YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7569.namprd11.prod.outlook.com (2603:10b6:510:273::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 19:31:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 19:31:44 +0000
Date: Wed, 20 Mar 2024 12:31:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVA==?= =?utf-8?Q?=3A?= success for
 drm/xe/xelpg: Add Wa_14020495402 (rev2)
Message-ID: <20240320193142.GN2837363@mdroper-desk1.amr.corp.intel.com>
References: <20240318210120.564692-1-radhakrishna.sripada@intel.com>
 <171082102821.900422.7270107617918743556@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171082102821.900422.7270107617918743556@8e613ede5ea5>
X-ClientProxiedBy: BYAPR01CA0072.prod.exchangelabs.com (2603:10b6:a03:94::49)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: cba3a935-4113-4cfc-6f64-08dc4914606b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j9+a/mskMJOZEmYW/mmwItOgze0ARxfQL72+jG1oceKXkFlGtQgaPx34CDEJ1sm0cq9IVjZ95wCwpLBKFeVOL1b4RoYxfQenNjy5W97T/i1ZG4F+g75g2VDs25IrA3kd+DiHR/N5rryRLIQvVlXu0tDK0qGwe/28lt1jq3wJ4BDkzcVZJUHFzhldu8DlWuktGEq5+pAIwgwAT4+bfFeigXhbIkFaHmRHGfbjM5P7WIozHAnEHOlapE3Zfw2icM4aLWBXPuhaQLqHNazi/S2sd3lQhIyQVHNsgdu0hqV+BBgQ+wApmLX4xZm/UlKzvcpSvctWC8jzasUIgaGwk6j0sVVPZQHg0Mch8mMksRAH/hJGOzDcJPQta4FyuFEP4wQp/3+pMDyGv55mE48u+hOfHKMUhim7VCscjmT1/HaZFQHvv8qbENkMlfFaZs6ZXhYKW46iuymfYyyvAs34L5RHvkEYdfdWT4AhleBtBg92wxyRNECuVIYQ+/WtJ/5kJi39NPD/yIP3/y3q/58CjEh8Nhtu0ApaLuykB+KCh9jG64c6A/TSQKaYXcVv9hi28aM+Frd1sJ7+xgX4BerexxOaGV67pWt/KBT494zOGWcyFgsDoEvJU//iYsO2jFpBsFDC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mfV7Zwa3JPzZX6AGRr9Xae1wQzaLEhwcjv0fgcjEYf90Y8/jY5/9rodHbTOT?=
 =?us-ascii?Q?iy9/fYcjfolpaV+F2nN66+NlND9OT36YWHyB8dGFUpnVjn5J1PsfidF1uSYr?=
 =?us-ascii?Q?scr9ZKD+RdQs9T5P4Ktd8N4HbZi0xARJ2T+bhvHBQHBJYBfM/ZPSabwpBIVE?=
 =?us-ascii?Q?XHXvRTXtOjwAozbI8guj749mChH9hVlDbFPrb5MJ/OzgWsZA+xyluvzsg+qO?=
 =?us-ascii?Q?tgAL8iYcLHhlNtBDtBD8OSUkmeKYn4YYO5isrGGlVdkqyV8xCDHO9/eE3v9H?=
 =?us-ascii?Q?ygsMEJ+c0MEpPkY/hziFUxMqTvqzgNJJKhZpbsIG9EqD8LE5Y8NwUtLHClkG?=
 =?us-ascii?Q?3bn/yxRIjR3VYZmu+sfBp0gqc3F4ZfLtStK6LhQ7p6dTsBKvQ9TP3UrputQe?=
 =?us-ascii?Q?IMwHgLAbIxO65JmFjO0fk7FAsn7e5SOCCR16d36khVnzM3dyHiRv+wEbeQNf?=
 =?us-ascii?Q?Ri+f7sLvFU9QBZKMZWvEhfeOg6ICTbqOr+DcHsd0Y8kkaAxV46QUHjhQgTNg?=
 =?us-ascii?Q?+hXhdRfSIjDIjfkIwfpvQHCY5n76UNsD5zBdtrlZNvx7HT0daM0x4uYKeeUK?=
 =?us-ascii?Q?OHtshk/oW+HWvdwUilpuTUe51hKYQOFUJ2YwAQ+Y368v4jJz9Thf5nH57AfZ?=
 =?us-ascii?Q?6t7sv/ZQTAunACL2q4iRgXxIGA1HpZMJZUxW13toQ7r+l4PTCbCSF4GHnSvE?=
 =?us-ascii?Q?mp0fmIjG3fQ+cXAWo+EMRmMd7EgMQpsW5Uv+P7LdYGKk1JvVcuQnDEoXdffx?=
 =?us-ascii?Q?hEphsPOjzjj5Qy/ioA7T7xL57rFqkKL72pEMT39lEIJTaKjXdGuGOfDmRmWT?=
 =?us-ascii?Q?RpMO211Oek5++foWHZlkAs18dtduNAVeS/v6gkWxqvw3lwfMhafeSIMRgy5h?=
 =?us-ascii?Q?d0iKGncLLwdQ/pQXT8Dt1rUYaRTCpC7bX2b5wFlCHbPVJ3cKDuJGXyR1+jjZ?=
 =?us-ascii?Q?Npqz72AKyMXBUNT4JNishdldna8/8JtLyfSl30Wc4g5qc8acGrz+lQJcrMR+?=
 =?us-ascii?Q?3IeV5GOIjtT/itNDg+rXS+q3Pgr9oalexRTGVZsGl+cVqET2Dtzn3xFW9ofk?=
 =?us-ascii?Q?fH8BAm7jKntMJQOJc5GJTwvAfVBnHCDqi299kIx77oDtAJzNqinK3yKFVlH4?=
 =?us-ascii?Q?AK8lCQ12UOYfH/zDhMFtrqxA1BBkKJ02jtNyhfMF8i761AiUs/AZOEpfEIrB?=
 =?us-ascii?Q?Vfn8JUuUk4UXXEJQg8f2CnFZ23J3SWg4DyndHYuQt3rXXpbjmeLNMltUX5Z+?=
 =?us-ascii?Q?3uDEtGL8mXdimENLTqf1KS8/rFXbWty3ZbyQ6WzauIqIMc24MEz2YcIBE+BT?=
 =?us-ascii?Q?z4WbJK+se0Dqfo5AqnoQd/BEC1y2ZW9zF/rNeNcw5nivJ4Kwz1FDqiJPZbgy?=
 =?us-ascii?Q?QdfxvW4hcBxqImWiDbX4xcQw80o8cXXPNVngjF2BLl16LNHY89l4JtRNTR8A?=
 =?us-ascii?Q?MGEMlontkXRreN6jPncprxl7t1up4i6UIxr0vEdHcnEEXCKogCYoJ1zKxBG2?=
 =?us-ascii?Q?hRrrerBcda+MfTxTNF/mpN4gdB/zDSiVRz9zRm9MO+79rm+1DgrPyxKDQEcP?=
 =?us-ascii?Q?GhrmOIbl3/dph6rv2VjCUllkZPLz99Zd0+BGEhWPWqLpPJp8rywk868SFnnS?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cba3a935-4113-4cfc-6f64-08dc4914606b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 19:31:44.7254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33iU8FGPRV7XT18acc9UFeNpeAe8qhlbT9WslkA1NjslIfNzHzteUUpmX//dc0KWQOcud3W6mIBEd07TbL52QwWA6UM1Z3iKJE9te2ymlao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7569
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

On Tue, Mar 19, 2024 at 04:03:48AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xelpg: Add Wa_14020495402 (rev2)
> URL   : https://patchwork.freedesktop.org/series/131285/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9_BAT -> xe-pw-131285v2_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-131285v2_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] ([Intel XE#1136])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131285v2/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@kms_addfb_basic@bad-pitch-128:
>     - bat-dg2-oem2:       [PASS][3] -> [SKIP][4] ([i915#2575]) +50 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131285v2/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-dg2-oem2:       [PASS][5] -> [SKIP][6] ([Intel XE#1134])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131285v2/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@xe_intel_bb@create-in-region:
>     - bat-dg2-oem2:       [PASS][7] -> [SKIP][8] ([Intel XE#1130]) +155 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131285v2/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
> 
>   * igt@xe_module_load@load:
>     - bat-dg2-oem2:       [PASS][9] -> [FAIL][10] ([Intel XE#1132])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-dg2-oem2/igt@xe_module_load@load.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131285v2/bat-dg2-oem2/igt@xe_module_load@load.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-dg2-oem2:       [SKIP][11] ([Intel XE#623]) -> [SKIP][12] ([i915#2575])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131285v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-dg2-oem2:       [SKIP][13] ([Intel XE#455]) -> [SKIP][14] ([Intel XE#1134])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131285v2/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-dg2-oem2:       [SKIP][15] ([i915#5274]) -> [SKIP][16] ([i915#2575])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131285v2/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_psr@psr-cursor-plane-move:
>     - bat-dg2-oem2:       [SKIP][17] ([Intel XE#929]) -> [SKIP][18] ([Intel XE#1134]) +2 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131285v2/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
>     - bat-dg2-oem2:       [SKIP][19] ([Intel XE#288]) -> [SKIP][20] ([Intel XE#1130]) +22 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131285v2/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - bat-dg2-oem2:       [SKIP][21] ([Intel XE#255]) -> [SKIP][22] ([Intel XE#1130])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131285v2/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - bat-dg2-oem2:       [SKIP][23] ([Intel XE#977]) -> [SKIP][24] ([Intel XE#1130])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131285v2/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - bat-dg2-oem2:       [SKIP][25] ([Intel XE#979]) -> [SKIP][26] ([Intel XE#1130]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131285v2/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
> 
>   
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1132
>   [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
>   [Intel XE#1136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1136
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9 -> xe-pw-131285v2
> 
>   IGT_7769: 7769
>   xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9: e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9
>   xe-pw-131285v2: 131285v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131285v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
