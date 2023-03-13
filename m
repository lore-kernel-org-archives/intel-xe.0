Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E613C61DA4
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 23:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E5B10E08D;
	Mon, 13 Mar 2023 23:25:27 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6284A10E08D
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 23:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678749925; x=1710285925;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6zxvM+r1B9jwlK/niZcUFRbuKl5I4FrPN+9mKpG2zjo=;
 b=gBPUrR4+JcAj1M7OroEjSIRy6VAJREJsUajNvtrHn6dD/prRrT7uYEmU
 dcssla6x4HiD5EPeRTLuHuGpkAFCdgbIcFESwTkQ8WjAStH+xyky2d4hp
 RD+dQkvRe4a72ah7KACmzjgSkA5/9Yce4StUy8ThBBGN0X5tLFbpCU7y+
 32PACBHxn6QHor/HOHdlED6CJ2k2e7B08La8oFRXRpmPU7ItWRuBA5Na/
 ZaUww1gXRvqDoeBCEClc8qYeQquwga91A07r6GoqSUk18rGvrVDa+E25E
 HHddT4PwxCZYcRsXO6wx4wAagE1gdeeXs+kD9equqTpRXmG2dV9Z8eLFq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="338830462"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="338830462"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 16:25:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="681205471"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="681205471"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 13 Mar 2023 16:25:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 16:25:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 13 Mar 2023 16:25:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 13 Mar 2023 16:25:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxc9kB91/IFOTVbsemaTeTXYZLGza4LTZiad4GxgPJZ1c3bgb7vYHQUDASWIR3r60inPJOdvDjFBIsE0LwqBjHzC1lHb2BoCXmPFq22jwKV08yjl7ShMGXvBKM64g0KkF/GL0ER8Z4FKwOMr3cGZqQ4Nww2slgDRZTOY+sYPNcTKWtbxFFEeVJaZhc3j1AWaspiNeU9r/B6Z1oq9k1M7roGAoFQjdzHJHWrsXWbGzH/QKwrCMx4+brJYliQQYmVU+Paklc4JrEsKvEkhK6JE0tsAdxChMz4avcgItHKBjlCQPCCD3OkJYu0NHu6fLhXkekHw1rHgA98BT21YDVkfPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH7i7O7VVXUxdRNht8Ui/MhcA8y1iR/abbVL+/izlOw=;
 b=c/bcPo5B54PsZJfkLaDjPaIVYUf5r/Zj6WcEpLo4DSCxWWDHQ49fFNso9XBsu1jecoq7HkhLwTaoypLkmKrtRlleLqAJ2XK3sk7XFRmgfOphoI8Urn38ZItklXVqHKCHL6zpItHFcA13BcRnIZ4HV0zpmQ1hmgMWUNOxd99QGVA58rRbdfovmkggXVdUDpkab7Pijxr4WaH55qi5CjuRvF+Ftb/Oidzww5BwGSQ/kaqPE82uXt+Q58sQ+kZxz7mVPwk5ZEk/zHSvXc1W53EW4bs/X4D66HmJwg/NnaqcEtFaKzimYry8HWZ92qqtD92xNhcm8INSfoYQExSgBdrsTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6157.namprd11.prod.outlook.com (2603:10b6:208:3cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 23:25:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Mon, 13 Mar 2023
 23:25:21 +0000
Date: Mon, 13 Mar 2023 16:25:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20230313232519.6opj5hyujaokhpcc@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230313231120.319346-1-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230313231120.319346-1-anusha.srivatsa@intel.com>
X-ClientProxiedBy: BYAPR07CA0091.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc9a2f7-dabc-4e07-4216-08db241a36ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9oMEBqTXvZHCoY1DR0dx+ww9+plA70ArAsIrxJO4j9wxMBc90fOcoUbaCrbk6YFnl5dQ+i+6tUiu+JHorFYoaedXi3FHxM4cliAW6XXQ+jrCnhkcsyyxqVDolfs+lOtk9np5Mj49SBCaD4F3CugKbPmtsiVMQ50vrQuDa6c9NMLx1tAqMwlgyPgzDJg1S0vLnocHMBZtNFbN1+2H1B4GPtm7ioRmjxvQGuaC2PsKcjedRL0csb9wPh3lZX8RXxaVh3XdG0aZo97S/LzjTmoTZpUYba82WvYVG+JpuEsMUWwP/1lVdx6jcDaiHR2UaIWJrEWtWVIjaVixcLSB/K2Arwej3HbHbCv5Sws7wNNyNSKCXcUYQICZNy9g92eJexdcTeIPmytMLW1obK6rHEq4H/GQhPWnN5RuLmt8019lNp43yqN3wfzpbp/SI9dCjpWt773az6SrU+S5u3edUoWEo2NrKf6OdXb+RHq5LwDk0cfYqhh6DYjjDPBGb/9s7PDo1Al5K6ZrMsHA5SzJ84NWJE+r6m4I1MJIGR4BOVmEWnZWd1lqf9N7BVGPn2D1FsWErZH1/wQ6+SU75Xr67sSwjy/grOGk4Mm40Dd3dk9egS+iZPObOr0BrHmaKgUMHLNnX7jjKZPdPyEBbkTs5F9LyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199018)(82960400001)(2906002)(41300700001)(66476007)(4326008)(66556008)(8676002)(478600001)(86362001)(6636002)(36756003)(66946007)(316002)(38100700002)(6486002)(5660300002)(6506007)(6512007)(186003)(26005)(9686003)(1076003)(8936002)(83380400001)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wqkNk1iHdF66vogQio7Vv3OqHfQiQ17l6J3tXkI4Mga1/0ylHFB/loryvRCX?=
 =?us-ascii?Q?g5sEL9srqGoEJJeuWnYgIdQ5eIRjiKRKOu1fGXtPliZC+T/eFS7rvy+Fx4ds?=
 =?us-ascii?Q?nLI0Njjt1uP6XS1WchrveFgUdTqVtDH74+K/9FG8eB03EszoY0ZIO7VlgwhS?=
 =?us-ascii?Q?6jPy76YZPyUO6DVDDFrl75Qf2XmH1jsVv0D04tm0c11ckt3Zjkyls3eseHNA?=
 =?us-ascii?Q?0ajfE74vPXmaVO3/Z3luMHLGj7eMeMy3qFfVVhohgAMi8LPTBwssCwH15S+p?=
 =?us-ascii?Q?tkVTYHSMCkbQF8un89tGqkP+w1vNj61AC8DyAA6GauQPVlyFdZlc/4rek6YC?=
 =?us-ascii?Q?k2esjMuEu5F79KAevg02NaLayS0RCI7rna8jNTA9fDxZ6KcALpkhS+lr7/d4?=
 =?us-ascii?Q?T0paGeF5npU+9e9RSnwetkIIM69Bql0NOQZuc7mVcOUlvBCCIn5P7VQ2U3Ib?=
 =?us-ascii?Q?XRi05pdBTOFSbsSuCbcpTYBu7iZoH/v1dLt5FffkRawtG+xHaMtZZZ/elNNl?=
 =?us-ascii?Q?iYxfUTUA/+p1SfMwtj17B/VyieAIj2PXmXtojXBYsaYg2nOHM0iBOInGXZlm?=
 =?us-ascii?Q?eROcflO3irVSp299qUS9L+guyTmhlCuZerufQ5qmQWH37R87JhC3zYuegjha?=
 =?us-ascii?Q?PO3F5lc4nYAFhNt7dzguWilpSYpW6nWG+c1LPw4tIo1L64SwEs3nfF+rKJO3?=
 =?us-ascii?Q?YUtYHPL7/aU9wYdK1rqxv6dk+5OVWchvEwAiw6YKkgqtxuNt9qePUTF/93Tj?=
 =?us-ascii?Q?42g+GzTOySOw6eCuDYydCpgyaWsm+f7BenZ8lEUKDBV30zCFawRDK44RPfnI?=
 =?us-ascii?Q?UPt9v7t4POSXlAucbofUF2s0qaoZdRFB7V5vFTdfLric43BBF95ihD2DJdoB?=
 =?us-ascii?Q?x8Lhbma6o/v9HyGynYheHuyxJCqoS5mohr8LnLcrGXjb7hdMfrxwqUZkJH2O?=
 =?us-ascii?Q?iDYMyCKFjcfGem4xrSroRCy+Phn3fC3Gkat+nVcE0pNoGhWTiwZ9i3aWjRzS?=
 =?us-ascii?Q?boi9vcOxQgN2RiLA5Np84KeHkIlfy3cAby+5NBPMTLKE+dprkDbDEjkkzNSq?=
 =?us-ascii?Q?IHlxBsyeZiNqAVGPLocE69sgIz0ads6GJef9mv7m59RukkZiLMs4kteM7Goi?=
 =?us-ascii?Q?NeypTz/BxVk06yOYLRrflJvSnHd6fdHhe6uJ+lAiW3rqOiDhYKIW3CHod8fF?=
 =?us-ascii?Q?u2Rkh6+g3cjyIVjWnme/+8DcrfBipZXSTqSvhdYbjA24E9f5wrrG2mj5LlMH?=
 =?us-ascii?Q?kPgQ367p/UmcbICxP7sMeRpiL896Zd9uR84SNW8K06WIMeHcenO5H7+Gkceu?=
 =?us-ascii?Q?nQfV1tr619/ScTakREmVDazsDBtz5KYKCeGmJEnfOQ3uRO+YiT/YTAyZLXsh?=
 =?us-ascii?Q?7GcigPRgfK6en3Aatw1ihUWmDws+2gc5nTUfbUGmyMU+keUIyFpYCXIOr3mf?=
 =?us-ascii?Q?xy8/RbK8dBuaodzEdj6hhe52w6kN4r6jAmPQf1YORBfNUmgJIuSAOdGxEsbf?=
 =?us-ascii?Q?mS0Sh/kpXu2YZiKnixwOPqmAjL9MyWEH9VKc0uL+QiPrAPE9jlmHN8y3sUKD?=
 =?us-ascii?Q?yB32JT9eL/+fVp4cwbTLSahwwtiTH7wYDlEtg3pH0QnbG/vZMgCvT4eoZYbi?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc9a2f7-dabc-4e07-4216-08db241a36ec
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 23:25:21.4616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdCzkty9DBCkuGBa+kP/sEHwZEb743lAnQJxWs2TllJzD8RgSZYXNvWzL7Qs5Aqh7eTn8plB6TIl4F6uVt2I7uC4hcavzvEGE96JKdvE2E0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6157
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/huc: Load HuC on Alderlake P and
 Alderlake S
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

On Mon, Mar 13, 2023 at 04:11:20PM -0700, Anusha Srivatsa wrote:
>Extending HUC loading support on more platforms.

need to mention here that ADL-S and ADL-P are reusing the TGL firmware
blob.


>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index ff94eec9cafe..5a28ec79fb9d 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -51,8 +51,10 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
> 	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 5, 2))
>
> #define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
>-	fw_def(DG1,          0, huc_def(dg1,  7, 9, 3)) \
>-	fw_def(TIGERLAKE,    0, huc_def(tgl,  7, 9, 3))
>+	fw_def(DG1,            0, huc_def(dg1,  7, 9, 3)) \
>+	fw_def(TIGERLAKE,      0, huc_def(tgl,  7, 9, 3)) \
>+	fw_def(ALDERLAKE_P,    0, huc_def(tgl,  7, 9, 3)) \
>+	fw_def(ALDERLAKE_S,    0, huc_def(tgl,  7, 9, 3))

Looking at upstream firmware repo, we already have
i915/tgl_huc.bin and i915/dg1_huc.bin. Let's follow the upstream
guideline here and strip out the version.

Contrary to i915, as we don't have any baggage about previously
supported firmware version, I don't think we need any fallback
mechanism.

Were you able to test this patch on ADL?

With the additional commit message,

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>
> #define __MAKE_UC_FW_PATH_MAJOR(prefix_, name_, major_) \
> 	"xe/" \
>-- 
>2.25.1
>
