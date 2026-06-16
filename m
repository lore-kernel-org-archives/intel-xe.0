Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E852ACD98E3
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 15:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9463010E595;
	Tue, 16 Jun 2026 15:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FfGcv00V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8005E10E595
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 15:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781623184; x=1813159184;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Vc0KcLx91OB61CEPNrkbV7WpznQVYXQ3gVcJaVyJC8s=;
 b=FfGcv00VTld7AKWL/emOhoBMsK93OD/AHbCgWdJQxhAMWXhmJ6pZN1MQ
 7SNWhoGgkTVTLAKJ5hOdQYJVmLECpY1PWlSrhtPr5od2m1DTV/F0phQhI
 mb1g2jOBKX8C8yMdhd6445HiRaRogPc9SyYpJUh7zLkG/jm6sU+61k2e8
 SgrFVMLJ03omlIJ8mn1ZzwSkeMcYKEXzwjPPFEqcu7yuMsyqI54BPxxKV
 rpgF2QZloAQAdZxd+LE4DxAoHP/ptPafQnpoBniI9HtnPpxfJwvKgpByp
 ZdsXO4xic0e8Rnq9+83hEQLmtFSYbk70nuNpITPIA/sAuOBzW/gvrllIR g==;
X-CSE-ConnectionGUID: job1BhOKQJWf7sD9PvfslQ==
X-CSE-MsgGUID: oTULA86ZTSSxwdgLJly9Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82376938"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82376938"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 08:19:44 -0700
X-CSE-ConnectionGUID: 4vnwpUzLTfaxG5lsxUd6sw==
X-CSE-MsgGUID: doFQbHgISaqjWHwUwI5/fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="252096653"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 08:19:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 08:19:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 08:19:43 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 08:19:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cb3dtR1ARlQUn1VPh3pwP5OHsjhfs+Z/XWJTO+IFaQKFVe7vIGi02juJjeqXcVqTtylc+6L7K4PM89ss7ahbj6DPsPmeV5hsmA8zhVCyFA3/h1IWoEejhVirxUSldTsnddQRRtu+xaddOLYTzWUEyZL2AJOmJZfpI0joiyqTGWzL9HQqBk3JH1mqG4y2v8tt3CAyOiveVzKCHMwCO2QE2/niCnJHWc5J3rjhjQK8zFqhI2cZElogy+TN54gUzBwzz2MSPBMfcTViOH4ztLqXQOubCAFQ8H8pnKAmI+GvBXm1YxsL3LMAEhrqiUSVTMXBn0jNSi6J1bRNrmS8KDX+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbrjqKx6kHH+X0qizxXTcBCHiYbjx1KwbP/L7/7Q46M=;
 b=TcGk2wPzgnLtJqrghEAHrhAgUAGX8DgzoGIWqLyhFkBa6RIvEtwUWC5FQRHX89RWEec5g+BC+K2qkw3/RcYqTj/dfe1tqza+9JQxADprofIQU4Ip21YeY6KYeaHLpa7u1697xtxddn1XytrBMNGFAsgPhw8rKiH166YAS0MfiW8GmjKnbuu0iJvHOh75vR3N4drMwqDpN2ypqTsz0CpIejI/UWW5BaFBKmhSqYtBIg3SurDfFgKL/RbmPRbjZpmjmYZmUviKO/5LmSMHWxWXeuH6ZYT2gU/JPw6Oz6MCJ3vGZE5ewiH2ZMbTD1feZftvIGWuPt9x4R70cD2+XsUjeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM6PR11MB4579.namprd11.prod.outlook.com (2603:10b6:5:2ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 15:19:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 15:19:39 +0000
Date: Tue, 16 Jun 2026 08:19:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Brian Nguyen <brian3.nguyen@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw6IHN1Y2Nl?=
 =?utf-8?Q?ss_for_drm=2Fxe=3A_Ad?= =?utf-8?Q?d?= compact-PT and addr mask
 handling for page reclaim (rev2)
Message-ID: <20260616151937.GL6214@mdroper-desk1.amr.corp.intel.com>
References: <20260605224257.2194194-2-brian3.nguyen@intel.com>
 <178074976146.50632.443369352422210788@6beec6c84f66>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178074976146.50632.443369352422210788@6beec6c84f66>
X-ClientProxiedBy: SJ0PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM6PR11MB4579:EE_
X-MS-Office365-Filtering-Correlation-Id: ed37f38e-5c9f-47c6-35af-08decbbaaf2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: nUHFjesPfDXZixUWuwiHChDAreci77SDVWoEMJ/hdGugy1gj2OJMINU03kKWUpIKfzI8FYME/zZANqxkK4kEVxeXSzxRvR7u9zoCFsO9Oxe6k78i6/2S6zDpj5mExE+6WlrxDOrhy7vzLYlSuMG3n3CM9vSUfkE/ZL4Sm+6gem0UOO6Wf27ZfC801POtc640xNLjGJTep7H0jDtbYW4XY1CNZ/+lGoLme8b7KGQ9o9ekiaRAVft6oun4kOC5Xj4CuHEdnjI/Sg+/MzpfiUkoYwhyOBTdklm1hXDni+vUf2fHQfFPxBx/xeKoHlcNof6QeLwkh4JF/dQk2/hZKpH3HaSkw0G4LfSqV/pA8VfNeGHiAsvxTtjHIO5LvLkxCLn9osdQSdLTETrzgon60Esxm+43zEU/hTOiPSfWxFhSpEP1D0yaoMjYo/tmpnVLQ/iVhh+9CaIDF7v+4y02knOeulRIYOj7D5WgRT8WDquUoHkEVKUgnHf7rYASjx3ZQxYUpQA/wPAEb/8UtYq0YA1nykCbZh1kz2iIPJqFskk1n5J6vUpp9VcO3SM49W/LcgmP6CivKQpko3PTu25JHy2xvNBj+S/9AWNkiSa77yjgjls/YJkX5gvmirSalurgYf3Ja32ZY1EULQTljgYVm2xscA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?36AVa5lRJFD7p04hmZmZL1+idaKPPP9hbrsrKganC2yDkWNn2orcYejtX853?=
 =?us-ascii?Q?upxGOHfLmkNqbCPyCG1gVS5VrhlPwv1ZX7aR3TzTDwi74S2/Eb3abADip0es?=
 =?us-ascii?Q?ugkRVb8tUc1WNeNwb2ekGR1VEQT9IZx6spqU9EH7osH0e5PTWxkd+Q4liFSa?=
 =?us-ascii?Q?8MmLlzR5a0yJmvVwzZcI4DQdXxuulydp7pRv+IlETvV3xp0YSpRQTNTuadwd?=
 =?us-ascii?Q?2fAk4C18GV9KTHIqpmye8Us9K4NdVdJPgSfEf/8bI7RmfEaQxtSN1Wd0jcOb?=
 =?us-ascii?Q?X9UK7HVx/oU19EBh1yui87H+ABFcMhZtVcSixUMZeNiIS0mQ/uDvZ76WwtVQ?=
 =?us-ascii?Q?sr7kGaegktVmmurxSRjrzLefXDvUCheStBH/QmduXXLv14IWsUFYSYZ0rVsP?=
 =?us-ascii?Q?Nt3JQyh5hqssC4LTmkfoWuqrfGI6jWBg769A3dhLf3UwPee/aQc/vvqaKT4y?=
 =?us-ascii?Q?1sdHWio1iif+SUri1AzCHi+JefPzltXV0/R7JxQC6cag/tqapEHnkrsZgCpX?=
 =?us-ascii?Q?GlY0wq5Oohey6DIPFmSuakJR2/MKWS9VLSHGln1o+yftJiJckcmLZPRBU7uq?=
 =?us-ascii?Q?yQ6f1Le9v4Q0nRoRlrLMPlKT7VcW2IFisd20Oq1TW+uco/Y2+sz7HQ5Pt8io?=
 =?us-ascii?Q?Yd5eoXfHzf6fxuoDG914frZ5b+JIOnOcSw0wppmFym/siY35RV7j82Q20P4c?=
 =?us-ascii?Q?GzkPF4lYsyvwFmTNREINH2xFmnC7QaXO1flrYud2zxxmzzEXeqP09fsb+JTB?=
 =?us-ascii?Q?RdXv6sV8gtjR76E+2jK0sNGEx6FMS2VkzpuHZVs4z4yCliVWqoaDUl7QYPr6?=
 =?us-ascii?Q?fhKmuw6s2r1lISDOO8b6nOycKhnAZ15WY8USDqafboHyvloIMK31pdETZOvC?=
 =?us-ascii?Q?wxbuWtRjyZHQKKPADgTyujEqGoq8gOEsBOIwr7dsvTmmZJULOydIWx6ZJFHz?=
 =?us-ascii?Q?oAz4cac5beFDJSVBJZolCX/WxJQFG1SsV3S6XEOoiTtGiyyobcEVB0AF+v4f?=
 =?us-ascii?Q?UHZvS2KO4RqXQShmfQol+8kCpLPYefpZm9qmRniEz8sq2mFBRshXXPRqE5R8?=
 =?us-ascii?Q?MFa7xCk/cb6aN6kFEpdgh4XmRQ7Oq7K+P7LEUqPWttwzvecjZanTxm387AXL?=
 =?us-ascii?Q?k3yc/r9SxfIxujZfnjEYnVdvdlR4slnZvlttb0Z0M7JHqzHtaxDcvW7PCrL7?=
 =?us-ascii?Q?CF/0iabMGDXbR7wxYwPWhBgv7DCiHZRchIdZuZqBsmQg32PoYltUGpT7+1ON?=
 =?us-ascii?Q?8b7incD3j6TTGe6OyCh5qdB+wOMLG63PatjVkrFrf0toaZqET9qlqB14uAxH?=
 =?us-ascii?Q?SIkSExpKFpsDwOHX+X7fMyz5+XgpitHYJIX7LATeGrk/azlXnOIg6SAAAPs/?=
 =?us-ascii?Q?tT5ik0kOpks6LmREfwk2AMxtuVB1sdWOYeExiJv0MwFV5VRv9KxGBOqa0H4V?=
 =?us-ascii?Q?cbyO80phd7KuszOFfEvA1qBuNs8JtMAaXS09pwCAjIH/GSqRlaAj4/j3lpJU?=
 =?us-ascii?Q?nB7MNiewKQ45qPApSp5krOq+ki9dcNhOmEUNmf7UOjg1Z6IbXE4GDlNscWZK?=
 =?us-ascii?Q?qZEIpsac09ytJZD9wCen7bksPKdM2BXF+fQYbp2E+sgdsfvbCXCD+gRA8Cxo?=
 =?us-ascii?Q?rpVoUX3uWjaWVJuZl2prdYnl2DRwCecLUaB+OnBfGlaPQ1GaSE2r0A1+sXnr?=
 =?us-ascii?Q?ZYGTchWjsWvu5oYiVI+/NYCQjSgk4ABgyNP7tmIm2RMcQU8MwuN045abUFJ3?=
 =?us-ascii?Q?vYzli2V4yE8SnNqBhlEzECdYftdXk7Y=3D?=
X-Exchange-RoutingPolicyChecked: pPjkYB9ibULMpwqQFJPN0egRF3Xp4uh9YRCvFfWc3qswJ6HLTlu26viSPbSPcxkuMPN2zHGgjPPBl21ESVWEI57PVZVshwEY1q/6XzO8vEvtMFhi+63dv1AcBBa86OoaBNpnCNm1cZpm7q47XvDBLkEVPEBr6fCz2avkGy5pyyqRtwBp+vf+BQ3lrdy2Gsiv7HwPuEIwP2uaw3TuwlEGjhJMp+uo7zGerHwKMpOCK9wHoUg5EjNgXTvFy8m1bgLtferGVZ6NUEr2Q3ykUiSRfgeVLTzArJ4qIaLFvzz8jOqBhkmYh3b16xneU/BFK9aiIonQipMsscpdZC4ic+AOCQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed37f38e-5c9f-47c6-35af-08decbbaaf2e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 15:19:39.8683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDnnMyyQFU/L1ziktDpqdg6qk/hqi0eJPE2U2qQ1YCLlQpViGcstVONz0cyHIsJGO3PQCkRFrmd7QrOrAhnluyjPP8ufxF/MtNtSySUrOXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4579
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

On Sat, Jun 06, 2026 at 12:42:41PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Add compact-PT and addr mask handling for page reclaim (rev2)
> URL   : https://patchwork.freedesktop.org/series/167701/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52_FULL -> xe-pw-167701v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-167701v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2327]) +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#610] / [Intel XE#7387])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#7679])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2887]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2325] / [Intel XE#7358])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][7] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2321] / [Intel XE#7355])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#7571])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#8265])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
>     - shard-lnl:          [PASS][12] -> [FAIL][13] ([Intel XE#301])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7178] / [Intel XE#7351])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#7179])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2311]) +7 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#4141]) +3 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2313]) +4 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7061])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html
> 
>   * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
>     - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#7915]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52/shard-bmg-4/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#1489]) +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@psr2-primary-page-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_psr@psr2-primary-page-flip.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1499])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@kms_vrr@flip-dpms.html
> 
>   * igt@xe_eudebug@read-metadata:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7636]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@xe_eudebug@read-metadata.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2322] / [Intel XE#7372])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
> 
>   * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#6874]) +2 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7138]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-userptr.html
> 
>   * igt@xe_page_reclaim@binds-null-vma:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7793])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-8/igt@xe_page_reclaim@binds-null-vma.html
> 
>   * igt@xe_survivability@runtime-survivability:
>     - shard-bmg:          [PASS][30] -> [DMESG-WARN][31] ([Intel XE#6627] / [Intel XE#7419])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52/shard-bmg-9/igt@xe_survivability@runtime-survivability.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-9/igt@xe_survivability@runtime-survivability.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-lnl:          [FAIL][32] ([Intel XE#3718] / [Intel XE#7265]) -> [PASS][33] +1 other test pass
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52/shard-lnl-4/igt@kms_async_flips@alternate-sync-async-flip.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [FAIL][34] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][35]
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
>     - shard-bmg:          [SKIP][36] ([Intel XE#7915]) -> [PASS][37] +3 other tests pass
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52/shard-bmg-1/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-5/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][38] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][39] ([Intel XE#301])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][40] ([Intel XE#3544] / [Intel XE#7916]) -> [SKIP][41] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
>     - shard-bmg:          [SKIP][42] ([Intel XE#7916]) -> [SKIP][43] ([Intel XE#7915]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52/shard-bmg-5/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-3/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][44] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][45] ([Intel XE#1729] / [Intel XE#7424])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
>   [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
>   [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
>   [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52 -> xe-pw-167701v2
> 
>   IGT_8950: 8950
>   xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52: 0ecb0a41cb32dfc7620a903629a6951ef1aaea52
>   xe-pw-167701v2: 167701v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167701v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
