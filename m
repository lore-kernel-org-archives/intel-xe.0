Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B285E728CB
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 16:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0522610E15E;
	Fri, 29 Sep 2023 16:20:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7964B10E147
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 16:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696004414; x=1727540414;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G6xX4CxCqi2SVb2Od86qbcip108PyjUug76TmEwDs+U=;
 b=YKsH1KiSw3D7aLkNINUaE6vkVRUJJXLXji/XcgJox6WKD5Q4wxifpTR8
 HctCZDYxy0FIG+TdYRiP3W3ngEP2OXKLmS+7gD3y8DGMdWIFdt3906ZLm
 2hWASng3aIpyMvlVyzyxwT4mVSv2ZOyeCx+jF3797oGMkXjwZCQ8Wczop
 0hVVPjHyLW8frdMp1LOvSQfFzleVKZSn72O4EmQGYpt88So3XJH28ayy1
 s356l/J7KfBUfY7ftQoNHzmveqI15VuUIYpBIaRikK1PRcMVwVAJ0wod3
 Rgi4rSUk1Hn3jTl9PIC/dOiCaskSXQ/rv0iK+ssTnNZfg+k86uDJ+C3Iw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="448824826"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="448824826"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 09:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="785140924"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="785140924"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 09:20:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 09:20:13 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 09:20:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 09:20:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 09:20:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrczYRrXn5ly6DwKC7ZK+lnIKnr5aS4OFt7g/j6cNePMRwGNWtWsbD+9QDMZvP1W1abhoZxaTuphd9Do8/51v9jLxqPfUOe4qRPk16PkNCesvMVaAiHvC+14pUvqNmhmX+tkBhkpuJiOXcfdEUHa+/r9bfqpk6NfRgEH5QjFGwtef4Ud7BXKzthU8CGwpBnimzFnsjGXr5P9Fq7iW3H9DEQJ8DPVbZLR7cjFmmCQRJeivcOfRxeZ0Val2OOIBYW3z8k8xd34ZNL6Z7w2u+aAr3AAhJAMhhYmvCNh3Cm0b6qOhXW+PofcphihBmsLdEuJjzsCZ4CBcUU82RNvIFnluQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzA6zE2tl8Zg291rc6CK7e5dRQz3h27mpvwxl4bR0e4=;
 b=ZoO7vjqih6nNjVYPquleML8wYIzcAvHqSBP1nUYOO+0zlDVhUypEei+9L75YKrExp+SVr6+LZhzb9Z6Jr/UyDQ65D6tCqLCBPHrVAeNYkQTGFaA/kCtsdSN6HWwt/lS/5jGqELEtv+x/8s+lPdigbeHTQhdfpFGC6toOS0KTHbAWI1wE1KuDbfgCymgEs+DXT5iO+5uY/1w6uVPQ8kYiM1d8AeIfwI1UutQNmAv4AZw/2knWdxdw/QoAHjYZcOYzI6KY21n1CR8T38dp0Rp3E9k5yE/vcrKXASbQ4P4+m33TsoFCvK+9fy5oLbIcqfnZgFZLoMVSuT4okAK9acHxVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA3PR11MB8045.namprd11.prod.outlook.com (2603:10b6:806:2fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Fri, 29 Sep
 2023 16:20:11 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 16:20:11 +0000
Date: Fri, 29 Sep 2023 09:20:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230929162007.GI233750@mdroper-desk1.amr.corp.intel.com>
References: <20230929044351.3145468-1-lucas.demarchi@intel.com>
 <20230929044351.3145468-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230929044351.3145468-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::24) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA3PR11MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f45090-2644-41c1-dab1-08dbc107f400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kCTrxdFYI915mVMi1knDQrVfictdR51thq+05EQcUf5vvlYgGA9b8TUo7NnIMwxVYXjGP0yr5gBisMlFucJkHvqdtCeYQLZHcfTz5UADTGSPWsMwKVE4kfBcjVDvJoBRGYGZuBjsh6Mt0wGZBQE3zCAiOTc41bJJyVdV1qIuaJcuDc/FQhKyQGr6dICYTzQiwZg+iyKwii+JTFcJwZUYefjRovpTIPfPzqW4jyIn98Dpi1C+igXwR07unSXQp7LKlKcGeiK8ja4G99w1ZA0DIquLHQzj7fJomptNE/g0+wn1SAxGB87rP+x1QpkBCrMJQmgAzL2a2hkCJDxu0BGzOw19xSaolHrrvSbynP7HnEAFagWFKbhnmrww6ZipfC8euctccabxTl2jWpPmf+wOzToA176xd1FsYV69pJOTZwilkxlNs3cYqP4v0m6ip6tdX+VQ3sxXZzUFmk29SCBpib/MHkxBr6UWeZc14Hgk+k59/KViOD4+0aJ6avMFJWoBexwdcQGQ6qJ2PGI6m6fZxkDy6owUQQkA7ydfXwC2E5dqHSnxIKpynHmCMNK8sIKJDAKrSYmyf/wX/862cIBPVGEQOqm5fHcE/RTiVw8iTNE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(366004)(136003)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(66899024)(6486002)(478600001)(4326008)(5660300002)(66476007)(66556008)(66946007)(316002)(6636002)(6862004)(8676002)(8936002)(41300700001)(26005)(1076003)(107886003)(6666004)(6512007)(83380400001)(6506007)(38100700002)(82960400001)(2906002)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nl8kbK8tKeMse2ocM98EEe58EmGT/pI8HNNkQCwR8u4bzAYav3f/AZJcQ+uT?=
 =?us-ascii?Q?O+s8pEpf32ygDyZE/oCB13xr096mt+Rz8HNH6opQZju6zdpnq44eBDrTNSld?=
 =?us-ascii?Q?je21ni5xTLL3EFg5L8WIn+XzOA7LGf2Ah6Ik8aGebpkxeDQGaI/3WZdrcuo6?=
 =?us-ascii?Q?lRxf/flt/bVrh9fmeZr2P89776GQ9Y+GgxZF60mMbvnJXzJlRhL86lSu4UbJ?=
 =?us-ascii?Q?6cgqid24AYfYMgvl++mN48SA330A3nLbBauosj5UUeGDYZwqK0wRiMhyZMFJ?=
 =?us-ascii?Q?f6lvg8Tx/9jiHmFBFFG3tlJRgxnooykeXmIjiHMh2D/3eJDqGc5UPVtxLdLa?=
 =?us-ascii?Q?xhDbv2WUFlvEvFgEMOk4CzAI7o/24tblBS+/VDx4fSOBHzbGupHx+CWwgMnR?=
 =?us-ascii?Q?4/A7wjlNW7wG2n5mkiQCUzrkKLp/i2TFMYBS0tZZmCrS9M967rjtNxkhLJK2?=
 =?us-ascii?Q?mxZY0edN2WPfzS67IVjKzWuBzPpGM/IO9BhIv9D6sDB+jrJNaNsgdSKhJ/y6?=
 =?us-ascii?Q?aUGyfTftMGIRzpf4b8z/KTAXA8OmU2uD5GMe0YbyqVNPrrXNNg001xe05Z9W?=
 =?us-ascii?Q?W4TdgJ1mCoNLiz0KCOE1rWj6vYVxbkd7srnb0mSBFlqOxcAwWYKjjRMNXu24?=
 =?us-ascii?Q?dt3rmmcJ28hSI2WeCFlcgrGBPjQ+oPGYWLhC1aWpmJeTYuUPVk9qQBPOLkXo?=
 =?us-ascii?Q?tgMtpy0KuiaPipJZHs6aNpbqvQGfRvUTlObr2ldAHtcpeFc0d9iIBjzySRiu?=
 =?us-ascii?Q?P1KBUSrS3LCBnzDwoAJuiNloh+/5FMK0Jb+Awljz0fa8Ie7V1XfKFWnedBPQ?=
 =?us-ascii?Q?/iO9s1ip/XQgMhDm2jvKyPYCNE/90uSWFQx6Y4sP3JvRdqeMy6TRbENmW1J7?=
 =?us-ascii?Q?9BOpLojEJpHqSIhfieT7PpgVBN7QAF8pYwbm0DFsRGwqv3Nt+EBw7zRp6AEc?=
 =?us-ascii?Q?quTnUjCjoSTBmM4yN1fApywsPzhsU389HphgrEUm9x1xGjSbgRrVA/i33Jt9?=
 =?us-ascii?Q?L8Yurxg7AHCM02Nc2etc1B6Nso0SMF0VeRQFSjt4tC8gvbZTmSxWigTDBrBb?=
 =?us-ascii?Q?airt/W41cR9iPszQseaj9Renh8Ll9pXoB/t52BD1X+ZdaDfN4zPUO6QH5o43?=
 =?us-ascii?Q?Wjo3go8OxGS/Y2TSmrOMbySuSWX0yLOPvWYexmoLZwoQndOKazWyIAt4rZTi?=
 =?us-ascii?Q?cGPdQBTV2SiLIamaCJRIxP6XXECJj0XkEKlqaGH4OENT0XMKBTZRWi+G/VCY?=
 =?us-ascii?Q?q1IyKeSil4oMrFkZnV0mp7jUxpKTj5RcyJ+DHZ9q9VZGBrYz1JtsSxyU56B7?=
 =?us-ascii?Q?69cWbqkzZCVx6c/ybqxIHCWoUzsdxvDbivRcksfSk9DAXyNGYrx2ZIosAve4?=
 =?us-ascii?Q?VfEenJ5AyvP0bC1Gcb4+azfCEBUZjtFQW9uJDq94UHZRc17KtlANYws4iDb2?=
 =?us-ascii?Q?VAMRirT1Dyr/A0x2NBB1Za4316jSnMXfUcNsT0CKxDQxPDkFZNB8LXzMqsWD?=
 =?us-ascii?Q?4eQsWA4ID19D3KfIiYZjoqvzlnBq+7wtTRt0N2fL8C7wrmXbGFQWWEH1d4UD?=
 =?us-ascii?Q?ccl6M+1qphsWMVmjmX+Hcik21H9mYJZG/Joae3vfh9zlesskrJZhOLgQTf7c?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f45090-2644-41c1-dab1-08dbc107f400
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 16:20:10.7435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /B/SYF/uuDdCkAqoQkq3Fa3u5o87I3ET2VO6IJd0PsGlAitlMVRLsmEUcenBN7D4UnP4f6cbqU8QM/0BmRFMu0hSzxEPQEnwRA+AJXYwdpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8045
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe/xe2: Update MOCS fields in
 blitter instructions
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

On Thu, Sep 28, 2023 at 09:43:51PM -0700, Lucas De Marchi wrote:
> From: Haridhar Kalvala <haridhar.kalvala@intel.com>
> 
> Xe2 changes or adds bits for mocs in a few BLT instructions:
> XY_CTRL_SURF_COPY_BLT, XY_FAST_COLOR_BLT, XY_FAST_COPY_BLT, and MEM_SET.
> Modify the code to deal with the new location.

We should also mention that unlike Xe1, the documented "MOCS" field is
only the MOCS index and that the PXP bit is now explicitly documented
separately.

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Bspec: 57567,57566,57565,57562
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  4 ++
>  drivers/gpu/drm/xe/xe_migrate.c           | 47 +++++++++++++++--------
>  2 files changed, 34 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> index cc7b56763f10..21738281bdd0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -45,6 +45,7 @@
>  #define   CCS_SIZE_MASK			0x3FF
>  #define   CCS_SIZE_SHIFT		8
>  #define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 26)
> +#define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK	GENMASK(31, 28)
>  #define   NUM_CCS_BYTES_PER_BLOCK	256
>  #define   NUM_BYTES_PER_CCS_BYTE	256
>  #define   NUM_CCS_BLKS_PER_XFER		1024
> @@ -53,12 +54,14 @@
>  #define   XY_FAST_COLOR_BLT_DEPTH_32	(2 << 19)
>  #define   XY_FAST_COLOR_BLT_DW		16
>  #define   XY_FAST_COLOR_BLT_MOCS_MASK	GENMASK(27, 22)
> +#define   XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_MASK	GENMASK(27, 24)
>  #define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
>  
>  #define XY_FAST_COPY_BLT_CMD		(2 << 29 | 0x42 << 22)
>  #define   XY_FAST_COPY_BLT_DEPTH_32	(3<<24)
>  #define   XY_FAST_COPY_BLT_D1_SRC_TILE4	REG_BIT(31)
>  #define   XY_FAST_COPY_BLT_D1_DST_TILE4	REG_BIT(30)
> +#define   XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK	GENMASK(23, 20)
>  
>  #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
>  #define   PVC_MEM_SET_CMD_LEN_DW	7
> @@ -66,6 +69,7 @@
>  #define   PVC_MEM_SET_DATA_FIELD	GENMASK(31, 24)
>  /* Bspec lists field as [6:0], but index alone is from [6:1] */
>  #define   PVC_MEM_SET_MOCS_INDEX_MASK	GENMASK(6, 1)
> +#define   XE2_MEM_SET_MOCS_INDEX_MASK	GENMASK(6, 3)
>  
>  #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index b682d34bc1e5..1b4afa8c0560 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -517,23 +517,28 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  			  u64 src_ofs, bool src_is_indirect,
>  			  u32 size)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
>  	u32 num_ccs_blks;
> -	u32 mocs = gt->mocs.uc_index;
> +	u32 mocs;
>  
>  	num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
>  				    NUM_CCS_BYTES_PER_BLOCK);
>  	xe_gt_assert(gt, num_ccs_blks <= NUM_CCS_BLKS_PER_XFER);
> +
> +	if (GRAPHICS_VERx100(xe) >= 2000)
> +		mocs = FIELD_PREP(XE2_XY_CTRL_SURF_MOCS_INDEX_MASK, gt->mocs.uc_index);
> +	else
> +		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> +
>  	*cs++ = XY_CTRL_SURF_COPY_BLT |
>  		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>  		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>  		((num_ccs_blks - 1) & CCS_SIZE_MASK) << CCS_SIZE_SHIFT;
>  	*cs++ = lower_32_bits(src_ofs);
> -	*cs++ = upper_32_bits(src_ofs) |
> -		FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, mocs);
> +	*cs++ = upper_32_bits(src_ofs) | mocs;
>  	*cs++ = lower_32_bits(dst_ofs);
> -	*cs++ = upper_32_bits(dst_ofs) |
> -		FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, mocs);
> +	*cs++ = upper_32_bits(dst_ofs) | mocs;
>  
>  	bb->len = cs - bb->cs;
>  }
> @@ -544,24 +549,26 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
>  		      unsigned int pitch)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	u32 mocs = 0;
> +	u32 tile_y = 0;
>  
>  	xe_gt_assert(gt, size / pitch <= S16_MAX);
>  	xe_gt_assert(gt, pitch / 4 <= S16_MAX);
>  	xe_gt_assert(gt, pitch <= U16_MAX);
>  
> +	if (GRAPHICS_VERx100(xe) >= 2000) {
> +		mocs = FIELD_PREP(XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK, gt->mocs.uc_index);
> +		tile_y = XY_FAST_COPY_BLT_D1_SRC_TILE4 | XY_FAST_COPY_BLT_D1_DST_TILE4;
> +	}
> +
>  	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
> -	if (GRAPHICS_VER(xe) >= 20)
> -		bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch |
> -				    XY_FAST_COPY_BLT_D1_SRC_TILE4 |
> -				    XY_FAST_COPY_BLT_D1_DST_TILE4;
> -	else
> -		bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch;
> +	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch | tile_y | mocs;
>  	bb->cs[bb->len++] = 0;
>  	bb->cs[bb->len++] = (size / pitch) << 16 | pitch / 4;
>  	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
>  	bb->cs[bb->len++] = upper_32_bits(dst_ofs);
>  	bb->cs[bb->len++] = 0;
> -	bb->cs[bb->len++] = pitch;
> +	bb->cs[bb->len++] = pitch | mocs;
>  	bb->cs[bb->len++] = lower_32_bits(src_ofs);
>  	bb->cs[bb->len++] = upper_32_bits(src_ofs);
>  }
> @@ -812,8 +819,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				 u32 size, u32 pitch)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
> -	u32 mocs = gt->mocs.uc_index;
>  	u32 len = PVC_MEM_SET_CMD_LEN_DW;
>  
>  	*cs++ = PVC_MEM_SET_CMD | PVC_MEM_SET_MATRIX | (len - 2);
> @@ -822,7 +829,10 @@ static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs
>  	*cs++ = pitch - 1;
>  	*cs++ = lower_32_bits(src_ofs);
>  	*cs++ = upper_32_bits(src_ofs);
> -	*cs++ = FIELD_PREP(PVC_MEM_SET_MOCS_INDEX_MASK, mocs);
> +	if (GRAPHICS_VERx100(xe) >= 2000)
> +		*cs++ = FIELD_PREP(XE2_MEM_SET_MOCS_INDEX_MASK, gt->mocs.uc_index);
> +	else
> +		*cs++ = FIELD_PREP(PVC_MEM_SET_MOCS_INDEX_MASK, gt->mocs.uc_index);
>  
>  	xe_gt_assert(gt, cs - bb->cs == len + bb->len);
>  
> @@ -835,15 +845,18 @@ static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
>  	u32 len = XY_FAST_COLOR_BLT_DW;
> -	u32 mocs = gt->mocs.uc_index;
>  
>  	if (GRAPHICS_VERx100(xe) < 1250)
>  		len = 11;
>  
>  	*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
>  		(len - 2);
> -	*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
> -		(pitch - 1);
> +	if (GRAPHICS_VERx100(xe) >= 2000)
> +		*cs++ = FIELD_PREP(XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_MASK, gt->mocs.uc_index) |
> +			(pitch - 1);
> +	else
> +		*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, gt->mocs.uc_index) |
> +			(pitch - 1);
>  	*cs++ = 0;
>  	*cs++ = (size / pitch) << 16 | pitch / 4;
>  	*cs++ = lower_32_bits(src_ofs);
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
