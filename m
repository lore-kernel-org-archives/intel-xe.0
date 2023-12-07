Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B8DC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 21:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F186510E98D;
	Thu,  7 Dec 2023 21:45:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3351710E98D
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 21:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701985532; x=1733521532;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=13I0EchdXId/KF5sr5jRjdR1QH+7jtlvS4zkHpBAOR4=;
 b=A42OOziI85XPwl+BGYScLD4CtrSWcWPgmbZXEIvGTr282kD/9F3CRjvl
 EQmLm2VJu9obcAQV45La1+VvH34KGbM3UV9Wn51DiVtz4fEkjGGYntLaG
 q/PsbWiMzPbgEOI09b/nED3E+2iXPil3aiAQ5EGRLMj7v72epUYl2xws7
 mUo5t/8fU/U+MzJWrfyfS0kPgxfmN0PsFbgI2ADCvHX7+gUZ5snEf/ALY
 rOGLStPx1I1h3YKCrExmRnvRkMltcY2mFFz5jJkmdcWvqyBCsqH8zVcIv
 oCDKf2NiFZSNXGOIeowKLMfs7YZaw80FCXTTReY6zmP2hoC39Rpe2/kXU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1188470"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="1188470"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 13:45:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765255264"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="765255264"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 13:45:30 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 13:45:30 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 13:45:30 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 13:45:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 13:45:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEK5/WtQCtxD9C7ZYa0xbOQhRiiDM+9jzGuIjrNscFHjqBFKQio+pIZGfI1ZQRyar/IX/3oycn/7xoreeH7512KRhpoedGuNPUG8tSBVBa3/w3H+A7urqvcMiNUdNFl52WmIBHqmq1JKtoCNsr9KROper7W3y0Uzekxpg08lDiwJ11uM3brU2NM+tmzOFRo6jYs9cxsT7rKIvCaeUwVJHIU6vUc/EUqiN3aEmUpQGzVW5epyNRigUk2b+jFU5WBN+BCAQBa9ET0X9UeYsEuNtzbFh847Vew+Kh2SL60QQJmAc/b9xW91RPxcmQ2cVHxrRpIh2f3F+X641p+/VN8bNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VpP1flxrSJaBuu8f2RT1G9XJQCcTIiMIDQl6V/6Tnk=;
 b=b8gTod4MJkO7I0v2/n3YgFqXYJIxOgTMTmh/B+31Ap65DLHXxMZc0mtPVmunWIM1AnAdZ1SVcxNmwqnn6F+nMsgJbd0JrgX97UI15oq0UMcTbqDW2Os1Nijh2KVZ3G2Ny8lJpKt+HLO9WmiuftbT6mTcqDcAOmonrHmwHPR1xoojNg306Zncx8IfiSz8u+Ih8b7e9L3gY0jiT6ksWfLDzQ5yCCh+LzZxApQ40BWNCrx+GDJ79mA3rcLLlXC+izQfvbBOzDgw2Wzk8jn07KDg22Ag8MvU9J16V+QZQhIKn3GEWW/EFi5N5ccQiP4VudR0mhYAf9Dbt8OAsBHhccX7IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8083.namprd11.prod.outlook.com (2603:10b6:8:15e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 21:45:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Thu, 7 Dec 2023
 21:45:21 +0000
Date: Thu, 7 Dec 2023 15:45:19 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [Intel-xe] [PATCH v3 1/3] drm/xe: Enable Fixed CCS mode setting
Message-ID: <45n43e2hfpiinnbhucv7xjihvp7f3o4p4guc3ynzmw3im5f5kz@cupbbfu54sqm>
References: <20231204053709.30013-1-niranjana.vishwanathapura@intel.com>
 <20231204053709.30013-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231204053709.30013-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: eff7e608-3692-473d-c8d2-08dbf76dcfd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q43qvt+swhA/ku44WWwv76cgx1Gpx4F+g1/JAUL3w68P9wHTivnhlz43htwPR0zdpsmrPBSoe+DL11zoV1oXbDF4hXNWDYR4dys2ScgE/GoiGvGuzHMzP9j1xncRpW6FOTCcOb6+y8dPH1BLHQ61fGD8WiOzbTF1q68lM85psRDjKufX2aMZ/iQb9ktFlfrRCjhQP1t28yq0ias6rjh6B09vrIKuQn835HULYYYzhTRZa93lQbtpWZrP3GB8Y3pe9PsE5v5qcO6lJiqJsttp1h75g3hcUvfZ2zOTAnqYQ6P2KcyetSy86hy5ExY0aOYJA6emhQHzsemx1ye3+hpjVKseny1h2SRNpw6VEgFoeNUYkEBIYLmd6NT65CEHyiOnRMF23jOBhZf2eOFikN86NdqT7FpLgnmPn+GiXIVWkPEY8QR0X4tJFamHfcy2r4tFY98FA3JYmPe3MqCStiN9g5LqWvaRkcqLPZpIwXmbUcl7g6Y1comFLF23X77IbWLcFVYH0R9oa2m7ZxDPnn3tQO1k33E0AxvYXxnHb+tNLLG5nowvaHui9SVfAt2FMuES
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(366004)(396003)(346002)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(5660300002)(6506007)(26005)(83380400001)(38100700002)(41300700001)(86362001)(33716001)(9686003)(6512007)(2906002)(82960400001)(66946007)(66476007)(8676002)(8936002)(66556008)(316002)(4326008)(6862004)(478600001)(6486002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?a8p0m9007JT/b6qHnvHM03TCXI4FtaMo2WGHnZrSVGA2XfGkPIB9MS5I6O?=
 =?iso-8859-1?Q?k5BCraB6gZjV0HmFR+pRdEV1oQ+HcSUufp5UD/XIvvFcm+7lHSPlVQBQIR?=
 =?iso-8859-1?Q?gyaLngRN0gvLLg2bAZRKwxA6nHzT7AXoJ6ccLbTmGy7+HVR7EmIxG5uAJ/?=
 =?iso-8859-1?Q?6BglBNdGkhIJiTuezE/xfLjX4DOmN32XKm8WHGgeRISELeTd9ENJm3pzYI?=
 =?iso-8859-1?Q?gvXfqiMBt3KjDtdrEpYbDz9JFs1JT4i90QsoEGP3XIyyXaf876dcya7hiF?=
 =?iso-8859-1?Q?XrnYnENIiVXZPUQuDT38nsFZmp15YuPDif5Oq5VNFac1OYBOT0b4/S59OV?=
 =?iso-8859-1?Q?6I8IKlZkQOfOdF0KNRl+LUsLVmraFxh7lCcG63r2GNwxYvH8bDtX4qwyTR?=
 =?iso-8859-1?Q?22imMryU9UNNpOyI6y+4eqRGLeh6yT1xSAjyTzs3xfRkDN5AZZ/GOmbxh8?=
 =?iso-8859-1?Q?ujm63RJ1NrtlvE0ocA/3TvkObZwnp6EcM6Z43g2EM47IB3LunsmmUCJSd+?=
 =?iso-8859-1?Q?xtAWk0dIAGF30rHN/8UZBEEG9Xt2wplGutCjrsylsNakIcf0atwe1qyOzy?=
 =?iso-8859-1?Q?mchMQR3VGrnpVVkhFlh6waeaP2fExkKhQxItauA4VeQG9TpJvJpgJTSVhf?=
 =?iso-8859-1?Q?oaTQUWEZ94wxicLcuAQkWPqRB3G9rp70mTXt5y2fS7ZZ8gkcOv4ryUeTDs?=
 =?iso-8859-1?Q?XmSw3uDoXbmtHuEmVLgmpuHOV76mcu1NPuMK1VH3fg19gre5gH8BV3o+vX?=
 =?iso-8859-1?Q?glW3G0JcG/rRmxXdJQ2qu5UEmUKlERnAmby260O3TnP7+u13T1V9YOHlod?=
 =?iso-8859-1?Q?tkRuUFBGOfA34HAV/Q9ATMXo4amIqhgRgw8644HIQokwSj3vpGqcNUAMun?=
 =?iso-8859-1?Q?/7Z8EuJMFvvqtuc1JHThh9ycdldnVp/a6MWCj7OwapbI8QdsdN2yCNqnum?=
 =?iso-8859-1?Q?6l3CVcbW8zGJW3VDS0Rhx2KcmX4X7nuRQ1Fu3bvjCJ/PIyk8Zmth/EShwr?=
 =?iso-8859-1?Q?l100xANBSkcOoTlq7uFg48yuN1FXfM4yjfGN85Mw8Ntr3uXeekqN0FIoeu?=
 =?iso-8859-1?Q?R7MQ0oGDMEL/uJ+OV49VABTav9Vjtz0RKCO2YQOxOCzH0seB5i8NFCk+1J?=
 =?iso-8859-1?Q?XadmvfA7iZDeZQv1Mh0HxVTb4BFRzHr7oM7u4GQIn5jN5iyEwcIytNCsQy?=
 =?iso-8859-1?Q?VG8lvDqt9O5rBlYZ5+a3EXAwmRBF2pqS/fB1Cp3LDGJF6J5Pr9msmYXQjl?=
 =?iso-8859-1?Q?YVgqgpaL7KNB8SzM1vKZAyOC5qii0oH77Hytc415sV+7Z3gPhbW3d1IGJI?=
 =?iso-8859-1?Q?mJdvCVzMsHvf2ETODWvo+Jxe/d7wqGQOeHTN9L5tXhwtb6Ei5RcM1tnHKZ?=
 =?iso-8859-1?Q?aVZvNmctaF2L+Z8TOu8z5Nc+jfTKGMbeTJ5ThUq1EHM2mRrDTLaEHQxufi?=
 =?iso-8859-1?Q?xkJu45N7T1+FjcXaEtjJBO4cb2K0e+WGBp0nvWK6JeHeI15/xiu7iTPwCN?=
 =?iso-8859-1?Q?tueG0fOJ6rml+2ry4iY/suADiLDnolA203c9rEgOpbpVKkkAT1Id4yhMov?=
 =?iso-8859-1?Q?MLOyzl1uXwC6O/aHe3uzk8InOYkn+yWTgNBeXlqSfl9ELbkeQxjZIUDQub?=
 =?iso-8859-1?Q?uQKcUUH+PVn3ABQ9wiGhpFHIj/fM8ykHZZCQHLbH+Mo/c/nSI6P/+YNw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eff7e608-3692-473d-c8d2-08dbf76dcfd9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 21:45:21.6537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaFqoOdfbA8TwjCmDqjnubDyNmQYfj1hu+dXphLWZlOP31T53zklLtz/yf+HyQl1hwVXaUohPLJv20thQ5Glz4Iv+5kgnPn0ijrC04vyn40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8083
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

I see this is merged, just giving some after-the-fact comments.

On Sun, Dec 03, 2023 at 09:37:07PM -0800, Niranjana Vishwanathapura wrote:
>Disable dynamic HW load balancing of compute resource assignment
>to engines and instead enabled fixed mode of mapping compute
>resources to engines on all platforms with more than one compute
>engine.
>
>By default enable only one CCS engine with all compute slices
>assigned to it. This is the desired configuration for common
>workloads.
>
>PVC platform supports only the fixed CCS mode (workaround 16016805146).
>
>v2: Rebase, make it platform agnostic
>v3: Minor code refactoring
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>---
> drivers/gpu/drm/xe/Makefile          |  1 +
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 +++++
> drivers/gpu/drm/xe/xe_gt.c           | 10 ++++
> drivers/gpu/drm/xe/xe_gt.h           |  2 +
> drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 78 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 23 ++++++++
> drivers/gpu/drm/xe/xe_gt_types.h     |  8 +++
> drivers/gpu/drm/xe/xe_guc_ads.c      |  3 ++
> drivers/gpu/drm/xe/xe_hw_engine.c    | 20 +++++++
> 9 files changed, 159 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 87f3fca0c0ee..86691f3b9077 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -70,6 +70,7 @@ xe-y += xe_bb.o \
> 	xe_gsc.o \
> 	xe_gsc_submit.o \
> 	xe_gt.o \
>+	xe_gt_ccs_mode.o \
> 	xe_gt_clock.o \
> 	xe_gt_debugfs.o \
> 	xe_gt_idle.o \
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index d318ec0efd7d..f4f2cf8d9022 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -401,8 +401,22 @@
> #define   COMP_CKN_IN				REG_GENMASK(30, 29)
>
> #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
>+#define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
> #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>
>+/*
>+ * Total of 4 cslices, where each cslice is in the form:
>+ *   [0-3]     CCS ID
>+ *   [4-6]     RSVD
>+ *   [7]       Disabled
>+ */

we don't document fields like this. This should come verbatim from the
bspec. Eventually we want to autogen this header.

>+#define CCS_MODE				XE_REG(0x14804)
>+#define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
>+#define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */

these names are odd... aren't then inverted? I.e., should be

+#define   CCS_MODE_CSLICE_MASK			REG_GENMASK(11, 0)
+#define   CCS_MODE_CSLICE_0_3_MASK		0x7

>+#define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
>+#define   CCS_MODE_CSLICE(cslice, ccs) \
>+	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))

I don't think we need these calculations here. Prefer using the REG_FIELD
macros instead

>+
> #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
> #define   FORCEWAKE_KERNEL			BIT(0)
> #define   FORCEWAKE_USER			BIT(1)
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 8a6fb9641cd6..dc05c7780848 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -22,6 +22,7 @@
> #include "xe_force_wake.h"
> #include "xe_ggtt.h"
> #include "xe_gsc.h"
>+#include "xe_gt_ccs_mode.h"
> #include "xe_gt_clock.h"
> #include "xe_gt_idle.h"
> #include "xe_gt_mcr.h"
>@@ -452,6 +453,12 @@ static int all_fw_domain_init(struct xe_gt *gt)
> 	if (err)
> 		goto err_force_wake;
>
>+	/* Configure default CCS mode of 1 engine with all resources */
>+	if (xe_gt_ccs_mode_enabled(gt)) {
>+		gt->ccs_mode = 1;

mode? or count? 

>+		xe_gt_apply_ccs_mode(gt);
>+	}
>+
> 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> 	XE_WARN_ON(err);
> 	xe_device_mem_access_put(gt_to_xe(gt));
>@@ -558,6 +565,9 @@ static int do_gt_restart(struct xe_gt *gt)
> 		xe_reg_sr_apply_whitelist(hwe);
> 	}
>
>+	/* Get CCS mode in sync between sw/hw */
>+	xe_gt_apply_ccs_mode(gt);
>+
> 	return 0;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index caded203a8a0..a818cc9c8fd0 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -17,6 +17,8 @@
> 		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
> 			  xe_hw_engine_is_valid((hwe__)))
>
>+#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)

this define seems out of place in this header

>+
> #ifdef CONFIG_FAULT_INJECTION
> extern struct fault_attr gt_reset_failure;
> static inline bool xe_fault_inject_gt_reset(void)
>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>new file mode 100644
>index 000000000000..541c44c70a84
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>@@ -0,0 +1,78 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#include "regs/xe_gt_regs.h"
>+#include "xe_assert.h"
>+#include "xe_gt.h"
>+#include "xe_gt_ccs_mode.h"
>+#include "xe_mmio.h"
>+
>+static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>+{
>+	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
>+	int num_slices = hweight32(CCS_MASK(gt));
>+	struct xe_device *xe = gt_to_xe(gt);
>+	int width, cslice = 0;
>+	u32 config = 0;
>+
>+	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
>+
>+	xe_assert(xe, num_engines && num_engines <= num_slices);
>+	xe_assert(xe, !(num_slices % num_engines));
>+
>+	/*
>+	 * Loop over all available slices and assign each a user engine.
>+	 * For example, if there are four compute slices available, the
>+	 * assignment of compute slices to compute engines would be,
>+	 *
>+	 * With 1 engine (ccs0):
>+	 *   slice 0, 1, 2, 3: ccs0
>+	 *
>+	 * With 2 engines (ccs0, ccs1):
>+	 *   slice 0, 2: ccs0
>+	 *   slice 1, 3: ccs1
>+	 *
>+	 * With 4 engines (ccs0, ccs1, ccs2, ccs3):
>+	 *   slice 0: ccs0
>+	 *   slice 1: ccs1
>+	 *   slice 2: ccs2
>+	 *   slice 3: ccs3
>+	 */
>+	for (width = num_slices / num_engines; width; width--) {
>+		struct xe_hw_engine *hwe;
>+		enum xe_hw_engine_id id;
>+
>+		for_each_hw_engine(hwe, gt, id) {
>+			if (hwe->class != XE_ENGINE_CLASS_COMPUTE)
>+				continue;
>+
>+			if (hwe->logical_instance >= num_engines)
>+				break;
>+
>+			config |= BIT(hwe->instance) << XE_HW_ENGINE_CCS0;
>+
>+			/* If a slice is fused off, leave disabled */
>+			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
>+				cslice++;
>+
>+			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
>+			mode |= CCS_MODE_CSLICE(cslice, hwe->instance);

REG_FIELD_SET() would be more appropriate.

>+			cslice++;
>+		}
>+	}
>+
>+	xe_mmio_write32(gt, CCS_MODE, mode);
>+
>+	xe_gt_info(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
>+		   mode, config, num_engines, num_slices);
>+}
>+
>+void xe_gt_apply_ccs_mode(struct xe_gt *gt)

in xe we try to keep things into namespaces defined by the header, so
this should had been xe_gt_ccs_mode_apply()

>+{
>+	if (!gt->ccs_mode)
>+		return;
>+
>+	__xe_gt_apply_ccs_mode(gt, gt->ccs_mode);

what's the point of the split between xe_gt_apply_ccs_mode() and
__xe_gt_apply_ccs_mode()? At most it would have been called
apply_ccs_mode() rather than __xe_gt_apply_ccs_mode(). But it could as
well just had been 1 function as there are no other callers and no
clear role split between one and the other. Bothw of them operate on "gt"


>+}
>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>new file mode 100644
>index 000000000000..e8766879f6ec
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>@@ -0,0 +1,23 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_GT_CCS_MODE_H_
>+#define _XE_GT_CCS_MODE_H_
>+
>+#include "xe_device_types.h"
>+#include "xe_gt.h"
>+#include "xe_gt_types.h"
>+#include "xe_platform_types.h"

why do you need all these headers?

Lucas De Marchi
