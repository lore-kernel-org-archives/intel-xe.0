Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE2FCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 14:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EC810E629;
	Tue, 14 Oct 2025 14:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZClHRSPk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E5510E629
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 14:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760452900; x=1791988900;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=p0KoV7hH1UeLS24UfLJ0a7H+bTZve0iXm01KNkxj4GU=;
 b=ZClHRSPk5lf29WYXkNnt0N19xGl8+I6stV8dL3I+ecmcDjn0T/tTDo3r
 E9FptQdR5Zk/pzq+ECnl77x5Z13LA8BeUVLmDqFtMOHS/hDAnIJNXNpI/
 fgdpbsIFvplo8okCwBx0+Hu5EGl6pzs2kIWHnJ1tuTtZoTVW+xundR2Ea
 lkdsAtCyczAylyPXn9CbgdbqO87Jn9xgIigDCEB7lPW81YEqK8Zlzb6+T
 cSsrS1Mz49X3n8LELj9lll+Q6jJwBNWBfJwkvTkk54OAxSMsL7gY93cWK
 klKj9Xr2dBQA3mfffRrqqhsu1duVuihNNnrHHhFde/HkQ+m7Maj2K7sK5 Q==;
X-CSE-ConnectionGUID: Bu1iwcVbTBiPad2zQhn57g==
X-CSE-MsgGUID: FlNASTLJSUyVcR+qr7t3fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62709586"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="62709586"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 07:41:40 -0700
X-CSE-ConnectionGUID: 8MAZ6C7zSM2Ixe2uIswxyw==
X-CSE-MsgGUID: zzvGeRKoRVevwITz+ju2FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181453529"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 07:41:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 07:41:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 07:41:39 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.20)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 07:41:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEHTVRG7Q2M0sWTw11z+ML9F3nVzikZdWGqPyQayjf0sB2xSflj5+TKxBxjJ+5pVkl66KYo1hcb/lkZaj/RqjT8tHLF+4blH3/pubgonJYMgLbULZ75asL+jtSf2U6dCH/l7L/y2/NLlgLgYercYYe8V0rF5WKAV08HE1ITguQSzoqWDctCR27izLYB6zkBNS+D6FPbqVVVxUa85yO4/wCGrRONf+BhDgknos+bz3wzFICC6/9H3kdFyOKxfoUlXDcEXIk3w8zQcWMjG7Fym8rsot+OU9oO/xj6z3v3z4rgIYzRdJZGB9+iZ7Y9q+XyX+1IZFd2513zT8DPJlrCcHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtmaYGcuuIYSu6Thvdn/FNnXa5MFC/F3yTZNgG3ZFPg=;
 b=o3dOsOwGwcZ3gj6zdRJ552z6ywMgBq9ZskoyQf5akiuvj3BXMhR6vTjVSFMJ8O+eFoH6lDoFIUdrRkZ0ghW+vN3+7ufYdlvq4tAWsMLteGJLhqpsEjoqnFZsGr/uI59vZMxxvBp5mmP1CPbKLTcXZgwUzoL8oft/qLmhxeoQqY3u58aNbfqQFk/76bDqo0GSjeU8YWFCvs9J8xAQdA1UzkF8hHKReb9M+sYRLVU6Sdvp7tRhifSom4BIyJAip3qBvrjgQs9ez9TK19azw3VRAWOafIe1zIPiI+ixNvw6Z9KH/Pg/XSHOnSS+/RxAw4tH9QiuCWBKMO/r5rKJtLU4uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 14:41:35 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 14:41:35 +0000
Date: Tue, 14 Oct 2025 07:41:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 drm/xe/kunit: Fix kerneldoc for parameterized tests
Message-ID: <20251014144132.GK5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013153014.2362879-2-matthew.d.roper@intel.com>
 <176039039545.7102.1461991349081827222@97596180aaec>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176039039545.7102.1461991349081827222@97596180aaec>
X-ClientProxiedBy: SJ0PR03CA0381.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d18ac0-d34d-4a83-6890-08de0b2fc617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tGUlfozwWEHBCS4zJg04THGJwdh9XZ/GYvJTYUQz7gJELbdu/l3M/LFnhP5a?=
 =?us-ascii?Q?1s+NYk0R4nqgbGrS+gxke9SqKN//KWqFuzC8fEVXVBC+4L0PdBYwP1LtVbaK?=
 =?us-ascii?Q?oult5PuFsVkYD24ybkUphBFd58m3ZsuzTKWFmKZq8zgo5SrNhcNukRo3bVY3?=
 =?us-ascii?Q?hItjJHUaQOPHPO9c/PbuimJysitQLjc+deERUqjaLjt15Ia5MYYTGfKpmpm9?=
 =?us-ascii?Q?00PB0vBK0/KsX6nIRS1z5G2AgAiIy0B8vxaR8lJRFRHXPkTw71gBhDqL5z22?=
 =?us-ascii?Q?q6KVymS0FpKLV/bnsFWkcUa8XB/mxHKRpQiG5hIXLitfdot4SMXzq67LcYB8?=
 =?us-ascii?Q?M+gw1P57qwX3LgiicGZpmuVyRFgtVLHKKWM6zRwvV/Rym42R5mlcipX0SQKi?=
 =?us-ascii?Q?PdBDdGEGCDQFsCPAeztLb4LKCJBuBYfclDK0CsQdyz25/5995Y8iQCyNMnyD?=
 =?us-ascii?Q?/eY8Qyh4M6B9G+NkctWGotNwpx1heZ3k1os21O59Dn3RLAHDTFoGbALuI5l8?=
 =?us-ascii?Q?hlAeomD6T2k/+1hJvo2e6ayRX6ZXd/nos3o5sE6P0rEaTmPTaA81DtJ9DNcZ?=
 =?us-ascii?Q?BZVR3ZmAaqVDg5pVHszHs98MJItvnUNIlg51qHimUIc0DlxRtnDppXnvGjwa?=
 =?us-ascii?Q?piuvKQqG5n/IC5FhcYfBcSMv4xS4H8iJxge13m2GJW05FdSNJznrEo+Zvxmp?=
 =?us-ascii?Q?QjLsmLJmhes3+mgxpuEx0t4sof8+1tfg+E6FNO993I5TqGsjP7QSMGXYZP5O?=
 =?us-ascii?Q?XJ0jwAJGfKIVD/pYBTYnScAC3YA33ZBMFi/6N8rXyZXq7gAjqg59OsnRAruj?=
 =?us-ascii?Q?xp0bllLDCSJW9sdE5L79MVLQ24v3i5hKyxtUrLGVJcZJ5sqt2vCYqraTvuMn?=
 =?us-ascii?Q?M9T/JF1r8xckhG5KLlhCpfMReGrARtzMCthBmS5acE2Fp8aUuVeuyTp1zKY8?=
 =?us-ascii?Q?NzAcA0rnPSF2/ah9KcHu1KfimdmIyaqHX3WcXCQbmk5hBMKbfgCQCfPD0Ibt?=
 =?us-ascii?Q?8qmwff5v4byHlmB2qqV5x7hlSVfIlxy7UhLT0JqMUUT7s9rSMgyr2P0ghYiV?=
 =?us-ascii?Q?bXbe9kY5k0tXuHoWk3Eh6J5lxWrU22n1CH90tAF/kDWi4NDORPC7WLf30U7O?=
 =?us-ascii?Q?VqfJzAg2g4yF45z3QSSocr3dv7gEh1PK468HDPzw4qAWooh+gM8o1NgrgEyC?=
 =?us-ascii?Q?kn6DuGa1Dt1xlhcm9TjkR6UKN/tey1NSRbn+CVLAXnJn+g/1ijmZLR9Yme2k?=
 =?us-ascii?Q?OIuwjuK4Gwi+81KKlzR9kTGfinuQ0Oxd6D0T+hUraz7g1UKPKR9NEXhfA6lN?=
 =?us-ascii?Q?m3SC1HIywdjyqrMaHqm3cjm8oLpP4fkFm74YzEm8njNyi1b3Xppp9Ysnrapa?=
 =?us-ascii?Q?lkENi5nIr5YcChfCJMnulHHdR4w/NsC7+Bx8reen1ka2vUxDOA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gvqImylTI4YO4Apv2qcOcwRn5COqK3WQTdxiaClyBmNbEo4c+zF5UlGY4i8t?=
 =?us-ascii?Q?F7ipvlfLppBSi8pmBeRvO40yc9dNglPji0GX4vJGyOAl59iC1A3WFrkVHt3Z?=
 =?us-ascii?Q?cGqzb7pLE54I05m0j7wweYpWJoPpnotTOdl+XbBv1+Jt+mE5thrNruHfMv/a?=
 =?us-ascii?Q?bmZUYeyNOl8ykEtVYAUyoWwiF7EcQRUBhdvqbhSedS3oO5joYhEtBq4KG3YI?=
 =?us-ascii?Q?QHRQ9PgzVvAnw0Jyab9IzzSf5bqM6WLowAvnJzOFzbMcJt4v9m+SjqS7T6FV?=
 =?us-ascii?Q?Mh1lTjVBuZGICWtaZMik4p3d0Vg4869iDrJqNbNnY2+fI0GAdDokefO+PRD+?=
 =?us-ascii?Q?0MYjBTYPZGhUKZeSa7vOPl9mVTkemWE7CUj8/Uqvvdb5xe4kq5h3UAN0BecV?=
 =?us-ascii?Q?uI0tLnmNeUWvY9mv6sBw2mstpkSDtQT6npTwoeUTeubHC6ta2mQLo9FXS1me?=
 =?us-ascii?Q?8pI6iq2KCMJ5Bsiu1Ur9xTVqI/crnFkcP63oLWRCJQMTY1p6CeAt3xYVMeRN?=
 =?us-ascii?Q?SRjcKN9+MT+0QIGurdzezn+xBohf72HMI6TG3qVat4JWun6tGrTDt5fusgPo?=
 =?us-ascii?Q?yXDB1onRUaJB054ugEYKjgCPMB3barhPS9l7lhseUdGmxNvJhmG2ruebdpud?=
 =?us-ascii?Q?n4gYS0o/37tclE6JDuykm37uXxRZOOU/qUrVOFH9NnIt7vCyP7woyOcbzl6Z?=
 =?us-ascii?Q?9ZeNfUqHkgH9dfSZPV7HAdxq/i57IWnLp26t03LSPEN4gqOKmkIL7LauO5P5?=
 =?us-ascii?Q?RnZZACPwVxlUzwKzu48aHBeDp6kWRsYivrKJ7oJRYwuCnDg1uiY5rGiv9X/S?=
 =?us-ascii?Q?LIn6q5oQm0VXeNg/wVGjSwv8yLyluZgcAxbtQQxXEQC43Yih9xYbThOZE2dv?=
 =?us-ascii?Q?B/Qb9YIDtADEKUq4KThGY8sbm7MdfULyXITQE9cnz7K2bm49NwUts6T9ZnR6?=
 =?us-ascii?Q?uKGQBg/Ki0V4oIdq2It3ZJYUYSCTf+JoOQqI79Lhnib+hyG34LeyKQ1ZUY7P?=
 =?us-ascii?Q?coDUltzbF7MPKtbHstvTEWLVjQJl5KHRTfrNUfVjrC80Mzx9q+MOVeViCpLG?=
 =?us-ascii?Q?R7X7HOHJLlcVJqnSWqpxGYYCui76ox8LHIKSIAhGUbbg7xAl0JQjscExO+C+?=
 =?us-ascii?Q?ZOcGrotJie+Cy7V1LRESv4kwsTVP36+9KG6YedIljaoi/pDiZcAUQi+M31NV?=
 =?us-ascii?Q?3IcxThNv5eDnx76LRMPmr7q940iKNL/7d/zc84c9+zGF3z2FO1XwsiJ28Vb/?=
 =?us-ascii?Q?eS1otHZmQhjfKZ3qPIkQlP+xavr6NDKrIqppTEtm1Vc/H/vnfm6rbYMYelVF?=
 =?us-ascii?Q?Z2kynlAVPZewEZSYJm2eE7ZgikHm2IH4Rn0xgG4FPRszTCGug2HmBYh6PVCA?=
 =?us-ascii?Q?vw9Pgv/3DK4eLjHz5YRTwsYRRN9kdVJtM2tdpaon0Ek4IFHinywxMKbyCjDc?=
 =?us-ascii?Q?TxkHw33/e9OBKyrx+ClYZDnGU/0+tUTqyQpwLj3jfOLqrxDOx1sPm0kyqv6Y?=
 =?us-ascii?Q?uq23wa0Ek0V3reCrdqz3dNSw4OIaqmIypeJ2eV/E4pqAu4RZN3nRfC3SgnnD?=
 =?us-ascii?Q?zB0sx/oVhgOPQNhkdTpxNFDp2w0Mh7/LyuIgp1O+PT1ofnBEjTQm/HWvW+Lp?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d18ac0-d34d-4a83-6890-08de0b2fc617
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:41:35.1049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hk6DixfIPnnMHI2sRGpi9yAxoYuWoapI1AhWKBXg7exhCSim97eiPxvYa1OI7kk1eTJbGLUVbEhQmlcW1uYG+PgpHJ4UBWRVoCA8Qi9BWcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6779
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

On Mon, Oct 13, 2025 at 09:19:55PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/kunit: Fix kerneldoc for parameterized tests
> URL   : https://patchwork.freedesktop.org/series/155840/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626_FULL -> xe-pw-155840v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-155840v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-155840v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-155840v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 

This is a kerneldoc-only patch, so no functional change.  The incomplete
result here is unrelated.

Applied to drm-xe-next.  Thanks Shuicheng for the review.


Matt

>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-155840v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-adlp:         NOTRUN -> [SKIP][2] ([Intel XE#1125] / [Intel XE#5574])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2370])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-adlp:         [PASS][4] -> [FAIL][5] ([Intel XE#3908]) +1 other test fail
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#619])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#316]) +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-9/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2328])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#619])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][11] ([Intel XE#4543]) +5 other tests dmesg-fail
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1124]) +8 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +2 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1124]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#2191])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#2191])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-9/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#367]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#367])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#367])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#787]) +20 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +33 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#2907])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [PASS][27] -> [DMESG-WARN][28] ([Intel XE#3428]) +1 other test dmesg-warn
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][29] ([Intel XE#3428])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [PASS][30] -> [INCOMPLETE][31] ([Intel XE#3862]) +1 other test incomplete
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#3432])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#787]) +50 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#2907])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][35] -> [INCOMPLETE][36] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) +1 other test incomplete
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][37] -> [INCOMPLETE][38] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#4212])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-edid:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#373]) +9 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_chamelium_audio@hdmi-audio-edid.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#306])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-9/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2252]) +2 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#373]) +2 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][43] ([Intel XE#1178])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#307]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][45] ([Intel XE#1178]) +1 other test fail
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x10:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2320]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#455]) +17 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#308])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>     - shard-adlp:         [PASS][49] -> [DMESG-WARN][50] ([Intel XE#2953] / [Intel XE#4173])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2321])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#308]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-9/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2291])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#309]) +2 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>     - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#2291]) +3 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#323])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#1340])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#4494] / [i915#3804])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#4354])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_dp_link_training@non-uhbr-sst.html
>     - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#4354])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2244])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-6/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#455]) +5 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#4422])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
> 
>   * igt@kms_fbcon_fbt@fbc:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#5425])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2373])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-6/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1138])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-9/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>     - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#2316]) +3 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][71] -> [INCOMPLETE][72] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-nonexisting-fb-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#310]) +5 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-9/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2316]) +1 other test skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
>     - shard-adlp:         [PASS][75] -> [DMESG-WARN][76] ([Intel XE#4543]) +3 other tests dmesg-warn
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-1/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-1/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [PASS][77] -> [FAIL][78] ([Intel XE#301]) +1 other test fail
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
>     - shard-dg2-set2:     [PASS][79] -> [FAIL][80] ([Intel XE#301]) +1 other test fail
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][81] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][82] ([Intel XE#4543]) +15 other tests dmesg-warn
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][83] ([Intel XE#2953] / [Intel XE#4173])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2293] / [Intel XE#2380])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2293])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#5390]) +3 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#656]) +32 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
>     - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2312]) +14 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2311]) +6 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#651]) +7 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#651]) +8 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1158])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#653]) +9 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
>     - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2313]) +3 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#653]) +5 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-bmg:          [PASS][96] -> [SKIP][97] ([Intel XE#1503])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-3/igt@kms_hdr@static-toggle.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#2925])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2934])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2486])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-6/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
>     - shard-adlp:         NOTRUN -> [FAIL][101] ([Intel XE#5195]) +4 other tests fail
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-9/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#870])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@kms_pm_backlight@fade.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#870])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#3309])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2392])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1129])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#2007])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-9/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1406] / [Intel XE#1489]) +8 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +7 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_psr@pr-primary-page-flip.html
> 
>   * igt@kms_psr@psr-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-6/igt@kms_psr@psr-basic.html
> 
>   * igt@kms_psr@psr2-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +3 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@kms_psr@psr2-basic.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1406] / [Intel XE#2939] / [Intel XE#5585])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1127])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#3414]) +1 other test skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#3414] / [Intel XE#3904])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-bmg:          [PASS][118] -> [SKIP][119] ([Intel XE#1435]) +1 other test skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][120] -> [FAIL][121] ([Intel XE#4459]) +1 other test fail
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@xe_ccs@ctrl-surf-copy-new-ctx:
>     - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1447] / [Intel XE#5596])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1123])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#1126])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_eu_stall@non-blocking-re-enable:
>     - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#5626])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-9/igt@xe_eu_stall@non-blocking-re-enable.html
> 
>   * igt@xe_eudebug@discovery-empty:
>     - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#4837]) +4 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@xe_eudebug@discovery-empty.html
> 
>   * igt@xe_eudebug@vm-bind-clear-faultable:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#4837]) +2 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@xe_eudebug@vm-bind-clear-faultable.html
> 
>   * igt@xe_eudebug_online@single-step:
>     - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#4837] / [Intel XE#5565]) +12 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@xe_eudebug_online@single-step.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [PASS][130] -> [INCOMPLETE][131] ([Intel XE#6321])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-large-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#261] / [Intel XE#5564]) +3 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@xe_evict@evict-large-cm.html
> 
>   * igt@xe_evict@evict-mixed-threads-large-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#261]) +1 other test skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-9/igt@xe_evict@evict-mixed-threads-large-multi-vm.html
> 
>   * igt@xe_evict@evict-threads-small:
>     - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#261] / [Intel XE#688])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@xe_evict@evict-threads-small.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#688])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
>     - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#1392] / [Intel XE#5575]) +9 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2322]) +4 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#288] / [Intel XE#5561]) +21 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-9/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html
> 
>   * igt@xe_exec_fault_mode@once-rebind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#288]) +6 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind-prefetch.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
>     - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#2360])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
> 
>   * igt@xe_exec_system_allocator@processes-evict-malloc:
>     - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#4915]) +224 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@xe_exec_system_allocator@processes-evict-malloc.html
> 
>   * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#4915]) +70 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#4943]) +8 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2833])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html
>     - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#455] / [Intel XE#5712])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#586])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_oa@invalid-oa-exponent:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#3573])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@xe_oa@invalid-oa-exponent.html
> 
>   * igt@xe_oa@mmio-triggered-reports:
>     - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#3573]) +5 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@xe_oa@mmio-triggered-reports.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#2838] / [Intel XE#979])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#979])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3hot-i2c:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#5742])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@xe_pm@d3hot-i2c.html
>     - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#5742])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@xe_pm@d3hot-i2c.html
> 
>   * igt@xe_pm@s4-d3cold-basic-exec:
>     - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@xe_pm@s4-d3cold-basic-exec.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze@gt0:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][154] ([Intel XE#2953] / [Intel XE#3088] / [Intel XE#4173]) +1 other test dmesg-warn
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html
> 
>   * igt@xe_pmu@all-fn-engine-activity-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#4650])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#4733] / [Intel XE#5594]) +2 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-rpm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#4733])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#944]) +1 other test skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#944])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_render_copy@render-stress-4-copies:
>     - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#4814] / [Intel XE#5614])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-2/igt@xe_render_copy@render-stress-4-copies.html
> 
>   * igt@xe_spin_batch@spin-mem-copy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#4821])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-464/igt@xe_spin_batch@spin-mem-copy.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-adlp:         [FAIL][162] ([Intel XE#3908]) -> [PASS][163] +1 other test pass
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_color@deep-color:
>     - shard-bmg:          [SKIP][164] ([Intel XE#4879]) -> [PASS][165]
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@kms_color@deep-color.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-2/igt@kms_color@deep-color.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-bmg:          [SKIP][166] ([Intel XE#2291]) -> [PASS][167] +3 other tests pass
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [FAIL][168] ([Intel XE#5299]) -> [PASS][169]
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-b:
>     - shard-dg2-set2:     [DMESG-WARN][170] -> [PASS][171] +1 other test pass
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-432/igt@kms_cursor_legacy@torture-move@pipe-b.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-436/igt@kms_cursor_legacy@torture-move@pipe-b.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-bmg:          [SKIP][172] ([Intel XE#4302]) -> [PASS][173]
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-bmg:          [SKIP][174] ([Intel XE#2373]) -> [PASS][175]
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-5/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          [SKIP][176] ([Intel XE#2316]) -> [PASS][177] +10 other tests pass
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][178] ([Intel XE#4543]) -> [PASS][179]
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [INCOMPLETE][180] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][181] +1 other test pass
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * {igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc}:
>     - shard-adlp:         [DMESG-WARN][182] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][183]
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_invalid_mode@clock-too-high:
>     - shard-bmg:          [DMESG-WARN][184] ([Intel XE#3428]) -> [PASS][185]
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@kms_invalid_mode@clock-too-high.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_invalid_mode@clock-too-high.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-bmg:          [SKIP][186] ([Intel XE#3012]) -> [PASS][187]
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-bmg:          [SKIP][188] ([Intel XE#4596]) -> [PASS][189] +1 other test pass
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][190] ([Intel XE#6321]) -> [PASS][191]
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@twice-null-rebind:
>     - shard-bmg:          [DMESG-WARN][192] ([Intel XE#3876]) -> [PASS][193]
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_basic@twice-null-rebind.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@xe_exec_basic@twice-null-rebind.html
> 
>   * igt@xe_exec_compute_mode@many-userptr-rebind:
>     - shard-bmg:          [FAIL][194] ([Intel XE#5625]) -> [PASS][195]
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_compute_mode@many-userptr-rebind.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@xe_exec_compute_mode@many-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm:
>     - shard-bmg:          [FAIL][196] ([Intel XE#6050]) -> [PASS][197]
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html
> 
>   * igt@xe_exec_reset@cm-gt-reset:
>     - shard-bmg:          [FAIL][198] ([Intel XE#6325]) -> [PASS][199]
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_reset@cm-gt-reset.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@xe_exec_reset@cm-gt-reset.html
> 
>   * {igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:
>     - shard-bmg:          [WARN][200] ([Intel XE#5786]) -> [PASS][201]
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
> 
>   * igt@xe_exec_system_allocator@process-many-malloc-bo-unmap:
>     - shard-bmg:          [FAIL][202] ([Intel XE#4937] / [Intel XE#5625]) -> [PASS][203] +27 other tests pass
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap.html
> 
>   * igt@xe_exec_threads@threads-bal-shared-vm-basic:
>     - shard-bmg:          [DMESG-FAIL][204] ([Intel XE#3876]) -> [PASS][205]
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_threads@threads-bal-shared-vm-basic.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@xe_exec_threads@threads-bal-shared-vm-basic.html
> 
>   * igt@xe_gt_freq@freq_range_exec:
>     - shard-bmg:          [TIMEOUT][206] ([Intel XE#3876]) -> [PASS][207] +1 other test pass
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_gt_freq@freq_range_exec.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@xe_gt_freq@freq_range_exec.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [INCOMPLETE][208] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [INCOMPLETE][209] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-bmg:          [SKIP][210] ([Intel XE#2341]) -> [FAIL][211] ([Intel XE#1178])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_flip@flip-vs-rmfb-interruptible:
>     - shard-adlp:         [DMESG-WARN][212] ([Intel XE#5208]) -> [DMESG-WARN][213] ([Intel XE#4543] / [Intel XE#5208])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][214] ([Intel XE#2312]) -> [SKIP][215] ([Intel XE#2311]) +11 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][216] ([Intel XE#5390]) -> [SKIP][217] ([Intel XE#2312]) +3 other tests skip
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [SKIP][218] ([Intel XE#2312]) -> [SKIP][219] ([Intel XE#5390]) +9 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
>     - shard-bmg:          [SKIP][220] ([Intel XE#2311]) -> [SKIP][221] ([Intel XE#2312]) +7 other tests skip
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][222] ([Intel XE#2312]) -> [SKIP][223] ([Intel XE#2313]) +13 other tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][224] ([Intel XE#2313]) -> [SKIP][225] ([Intel XE#2312]) +7 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          [SKIP][226] ([Intel XE#4596]) -> [SKIP][227] ([Intel XE#5021])
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][228] ([Intel XE#2426]) -> [FAIL][229] ([Intel XE#1729])
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-bmg:          [ABORT][230] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530]) -> [ABORT][231] ([Intel XE#5466] / [Intel XE#5530])
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   * igt@xe_module_load@load:
>     - shard-bmg:          ([PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [SKIP][245], [PASS][246], [PASS][247], [PASS][248], [DMESG-WARN][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257]) ([Intel XE#2457] / [Intel XE#3428]) -> ([PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [SKIP][283]) ([Intel XE#2457])
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-2/igt@xe_module_load@load.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-7/igt@xe_module_load@load.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-7/igt@xe_module_load@load.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@xe_module_load@load.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@xe_module_load@load.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@xe_module_load@load.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@xe_module_load@load.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-7/igt@xe_module_load@load.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@xe_module_load@load.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-3/igt@xe_module_load@load.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-8/igt@xe_module_load@load.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-8/igt@xe_module_load@load.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_module_load@load.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@xe_module_load@load.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@xe_module_load@load.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_module_load@load.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@xe_module_load@load.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@xe_module_load@load.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@xe_module_load@load.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-3/igt@xe_module_load@load.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-3/igt@xe_module_load@load.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-2/igt@xe_module_load@load.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-2/igt@xe_module_load@load.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-8/igt@xe_module_load@load.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@xe_module_load@load.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@xe_module_load@load.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@xe_module_load@load.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@xe_module_load@load.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@xe_module_load@load.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-3/igt@xe_module_load@load.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-5/igt@xe_module_load@load.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-2/igt@xe_module_load@load.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-2/igt@xe_module_load@load.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-2/igt@xe_module_load@load.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-6/igt@xe_module_load@load.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-4/igt@xe_module_load@load.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-7/igt@xe_module_load@load.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-5/igt@xe_module_load@load.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-7/igt@xe_module_load@load.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-7/igt@xe_module_load@load.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-8/igt@xe_module_load@load.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-8/igt@xe_module_load@load.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-5/igt@xe_module_load@load.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-5/igt@xe_module_load@load.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-8/igt@xe_module_load@load.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@xe_module_load@load.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@xe_module_load@load.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@xe_module_load@load.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-6/igt@xe_module_load@load.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-3/igt@xe_module_load@load.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-3/igt@xe_module_load@load.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/shard-bmg-1/igt@xe_module_load@load.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>   [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
>   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>   [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4879]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4879
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
>   [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
>   [Intel XE#5195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195
>   [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
>   [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
>   [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
>   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>   [Intel XE#5503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5503
>   [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
>   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
>   [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
>   [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
>   [Intel XE#5574]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5574
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5585]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585
>   [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
>   [Intel XE#5596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5596
>   [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
>   [Intel XE#5614]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5614
>   [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#5712]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5712
>   [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
>   [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
>   [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
>   [Intel XE#6050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6050
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6320
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6325
>   [Intel XE#6326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6326
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626 -> xe-pw-155840v1
> 
>   IGT_8582: 8582
>   xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626: 61b16793c3bbb8e740cf9afb36258dee61346626
>   xe-pw-155840v1: 155840v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155840v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
