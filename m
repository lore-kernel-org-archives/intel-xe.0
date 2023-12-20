Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D48C41535
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 02:31:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9912C10E30C;
	Wed, 20 Dec 2023 02:31:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8754010E30C
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 02:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703039515; x=1734575515;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CAl4ZyVG3H1wJlxMfQuwApClQMtt2h9nBn+kR2TmgT8=;
 b=eKhofW9PZimjKbdsW6f/6RVoSVSnlx+p+muaHQZIRdoQLSBHwdfWR8e+
 Vlw1LAlv/UQ+rn5ur3IVuanPunRbrvIlh7fQevIG3NuCqluoKV7TLjbwA
 SY6eRSsdq71kMTa3RBvKyCT42gWx1tpp1iEACWAmWSmeyR+nRnOLEhEQV
 b9mvDnZGakugjr5V5T/nw/hwwBUS4lWNiP8y498yxjC1s580eCXJSOnxd
 +vWg15o7LgIxu8ebmJZFOrvHS7mPXuNv5OPlQyUeU4HlMjDyhfEWES0Gr
 /QzW82X6vVlW0IEJIGmBW9Pwayqb7PVkiMHcY53C18Nu5dgKrlpAfr+HC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2970820"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="2970820"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 18:31:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="779692440"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="779692440"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 18:31:54 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 18:31:54 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 18:31:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 18:31:53 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 18:31:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWevjZCcyMHY29icj8vZHOuvSzeH9bxiGFP8s3M3/aTG/iYYs50rGtAt2laoL8H/Hcdi4fYRk+6voC3JtxjlncxHaSaNoFNbUiyUNBxsRh/QvywvUK1sDr7PppAyZpwYgTHLOuT0l4tH0xY0AyFHXC8Nc34ZMe9EZuClzXPX7CIHbBoa6r6C/j/gp4obIqN0wpFyjYklMuNygB3gZuExwWqSaQd9GGg0QtUFGjdXBeIw9gKpXGV4LHsj/T4KVsd+a6Qaw6Uhbc7QEuKoMb8UAOeCFPW99nxknGJPCS+svmdgV5PDIRit1c51kRrdZE6rhdz6PtGUXzW7qsDZJuim/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=no3r+C1E9fUL80tVVq+M19QGYsTcyz5aQe6MWxvaqWU=;
 b=jA+fY5o+huFGpO9tb4VcGXpow1Vy4Snm8oQaHTKptmZI2mYjl853Lp4dCt0n15rabiAVFVjr1+77WpMRK922sZTCCip5cHlj6PXOaq8g5YaQ36NncWFRNhsPgtaJkb28B2gbL8o54SJ5Tf+QZxYdRl/Fa+SVdqslNYc4VRWeDeZXguikbiaS907cmD8yhofqO45VRHSW2FdvY7BUj0BWdmSOZByMW9a6jBEOpNWwZR9VqAl3p7pBqgGAnSepQdfah9WZsbgCAlDU/bSPyJezcPkW/0LuseWKBwQDPF/j5jgZvOcoXuKJB3vXCmD64fAYCFd47P2tbBzYw3nYkAIn5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Wed, 20 Dec
 2023 02:31:51 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 02:31:51 +0000
Date: Tue, 19 Dec 2023 18:31:45 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 08/17] drm/xe/oa: OA stream initialization (OAG)
Message-ID: <ZYJSEb52c5Jwx1Wq@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-9-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231208064329.2387604-9-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR06CA0024.namprd06.prod.outlook.com
 (2603:10b6:303:2a::29) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|PH8PR11MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: aeaab91f-2154-4141-c0b9-08dc0103d284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nRmjm9JgwnhTPJ9XFBldDKeNIuogguA9RRw1dpBNKqR87/CumAWWtg1vMCwD5hpt95hJsdTS7sa+thk3AgTOGnbl00QvOvqlhuevYYPpcXXYOKmTBuPtn1dj7wZM/TtyyiBh0zODJYkDlBixcoF8f7HhE35hqNim1uBnK2QsA5YzNeXrE6Kkon9OPPmKFoi1eRTd9W8+ulzOzjYYU5A8KBpPCbzC7UPprE3d3+ZnvfVop0mVePgPaO/FpvOxXjSf4wipBfJJp+odr4PPKuBjaHbIUW6OwHDhofNu78Dos355Tk+U5soNqmnYuRIh6k932H7OYvHtLsDb41sqN5NCV0+Y1iajNJINhDWsi628fW2mnuKKecnfDhz23yU9q0zd+PbbBGpCkIZRHzpOsUQMV8Lb5UD3FoWqrKx6KMRls8Su5wsL4Skc7S1aY+Cc611wzJlprbwJQVkxadZ/E2rNbcQBhsmZQvN0IxRy3PLTOaeB5xQ9cKZZko8B2kpVCupwO9ksi1I050P3wElXto9BLWjbeTPhGm5b1ZYJNuxz831w5JXkX1K1BHTuucvK8j6+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(136003)(346002)(39860400002)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(33716001)(82960400001)(38100700002)(9686003)(66476007)(6636002)(66946007)(66556008)(316002)(8676002)(6486002)(6512007)(6862004)(8936002)(83380400001)(2906002)(4326008)(6506007)(478600001)(6666004)(5660300002)(26005)(86362001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1B5SXMwdmJQUFRUbnhTRHdoNlYwNkVFei9ja3h1MWFpVm1DbEtTbU1zNkxx?=
 =?utf-8?B?UFU2bDgyK0FTMTEvRStaV09BSWxCK1Jaem1pN1VZUE1qcmlLM1RGdkZieU5u?=
 =?utf-8?B?V2dmZTc5TWhiWDU1RjFPbWVZZXlkd1JONEJkUUNuMExDazlRUGtQcUlaRWpM?=
 =?utf-8?B?SDIzVkZNaGNPYWRpSjhlQTVmSExuQUhhdmNNc0twcU1VSFVjOCtpbDdLOWFl?=
 =?utf-8?B?TDA4WDVUWEhxVmF4ZDJqSDErN0dzUnd3MkMvY1JOODU2TmZWWDR5NnQ3ZFBz?=
 =?utf-8?B?MUN4RVh2NVB0TmhEcmlnN0luOXpER0tYSmxLRG9sVG9sQVVVYXR2d2NyWW8z?=
 =?utf-8?B?UFFJZUwrZXIzaFE0MjYwemhkREdGcG1INEwvWVVUK2lHMjRzRVN0elg2ZWUx?=
 =?utf-8?B?R3owaFphekdwbnhzNXlLeDd5YVd5eVZLTVpwZU13eDdkeFBmQTlnU2tGTkJJ?=
 =?utf-8?B?cTBCdzRzOS9VbUFoZGFtczZ4bTdaZjJhN3BTZmJQMlc4S0s0Tnl5TmZNZmsy?=
 =?utf-8?B?K2Z3M1R2RHpPNURBLzFGQlA3M2FMRTEwZndyQ0VCeHV2Rys3QjVUa2JhTHQ4?=
 =?utf-8?B?N3l1bldnZ2lvU0szSitCVnkrL0NkOUhSOFFhZ0JSQy9lSUVPRDEraWc4SFFX?=
 =?utf-8?B?RFh5SzhQemRiVE5kblFCWlhpT0xnblJId01rTDJ5SzNVd2FoRU5Ic0pQWFBR?=
 =?utf-8?B?VTVpTGtsWHJINWhQSTFEVFpUbWEwOGNkdC9oU013UktOdkV5WkNja1BKWlJK?=
 =?utf-8?B?ZmJBVUpqZVBoRmZEOTdWNUwxVnZ5ZFVNQThoaU1rL2wyVWxLc3piOC9PYWp3?=
 =?utf-8?B?KzVlUUtSMlJXamhnc1JhU3hmVTBHeGpwZENPaGF0cmRVN0dkUExYczZEUGlr?=
 =?utf-8?B?bUc5TG91Y3o0em4zRmpUUUZJeXUrUVFOSUo4aU1JbTRlN2pSL3dCMW1MRFBx?=
 =?utf-8?B?a05oYkpiczlkRHBqclJEcDBQWG9OMVBRdklzME9FUGZSRmZoQmkwaUJIUUM4?=
 =?utf-8?B?U1NrSlI4SlRieXhxeE1kclkrSW1sOG1Kb1RrYkRxTG9ZR0dtTnNUSm1lRUg0?=
 =?utf-8?B?SWRRdlorSTg5a0lJNnh6bmh1bDV2NGF5ZmgweWlnYStXMGR3SzI3UExqZ0hK?=
 =?utf-8?B?UzNxZFdjZ2EweE5hWDBYQ2VERUVmODZMT1ZPZHhNK1pvZVZ2TWxWN1ExUUVj?=
 =?utf-8?B?OHZ4VU1MMktadGs2Q25CUi84bVMxMmYrSnFRSTB4dmpDOUtuRkxZV3R6UzdY?=
 =?utf-8?B?RDZTY01mMWFEYVpPUGZtcU9oNWtmREVFT3Z1T0Joc1VlRFhZeldyaVUzMjhz?=
 =?utf-8?B?K0I3ZEVDS3lHNU9kWlRLM2xJTmhTOFFaVFBOUU9Oc3I2YkhsZW5jNktyVTM5?=
 =?utf-8?B?M1M0TmtwU3J2ZnRjNlF6R2VkZm1FbWRldE9VM3JSbDRod2pwdFh4NGZVNUtw?=
 =?utf-8?B?RzRYWTRwT0lpMDJEWWJmQkg2QjRVbExFdmNLZGtxekxMRXBpVE9rd3k5anVh?=
 =?utf-8?B?TkU0Wis2eU9lcXozdmE3OEFSQnkvQjFFS0d0NUpTWU03aWovVHM4dCtpZXMy?=
 =?utf-8?B?cG41ZTBTbjA2SWdNL1VOd1BZRzZmUitiMmpiOGpxeGNJZXUwYWJ3cEtLdzFU?=
 =?utf-8?B?VXdmaVZURnMyMmVWd2dlajVYcklHRng2WWJSdGIxMnFyY3BlSGFPcU15WnJK?=
 =?utf-8?B?Y3VqTDVWSDdQbnIwYkFubnYxMVA5Y0Eydit0U0xTUVFSRHNpSEJ6emFQZGpk?=
 =?utf-8?B?TmJzZ0xuUnZLU1FqYXhkUTZSZndLeDducEs2c2w4N2h2ZVBjS2xHdGhRVDY2?=
 =?utf-8?B?Q2t3REI4RTJTSjZpYytIeE9OUWE5ZTlKOS9NWDZuQzZyM0FmdXluK2ZDVzQ1?=
 =?utf-8?B?eHVzMll0YytLZmxkdHNxQ3h1SmR2ZGFPa3FBL3hlRVlqT3Y2ZlRSQVZqaDVu?=
 =?utf-8?B?QkkyV21XMkNLQ2RjUWtibklQeUlHa0sxaVNhRUV0WUtsQkpxOFdPQUFpQnEr?=
 =?utf-8?B?OVVIMFVCcmRCdkptOXd3M1FWaXNkbmZWNHdHOTZoVzZSaUZ6ZmNkYk9KZHRa?=
 =?utf-8?B?SGFibk5ZaUY5SmtkbHF5UDYrSXFHSmM5K2xsaUo1bk5adVdxVnJYVW9aOG1l?=
 =?utf-8?B?bGY1a01Vbnk1M2c4MzZ5VjdEZVZzakh5Zm8xKytHdVl6RjkyVHZPaXA2TzBT?=
 =?utf-8?Q?VaLU5ZeMyTG8JJs0+jqOznk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aeaab91f-2154-4141-c0b9-08dc0103d284
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 02:31:51.5376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Z5tcjMwhW3/r3hep8Hrv9/yNAXHaFBsOuJKC9Zeo4iOl61pnDyV+XoRiwjcVenqGktl9CIHxhFD+1eln4cV67jLdzEa2OaXpeuR4RHHhRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
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

On Thu, Dec 07, 2023 at 10:43:20PM -0800, Ashutosh Dixit wrote:
>Implement majority of OA stream initialization (as part of OA stream open)
>ioctl). OAG buffer is allocated for receiving perf counter samples from
>HW. OAG unit is initialized and the selected OA metric configuration is
>programmed into OAG unit HW using a command/batch buffer.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h |   3 +
> drivers/gpu/drm/xe/xe_oa.c           | 397 +++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_oa_types.h     |  82 ++++++
> 3 files changed, 482 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index d318ec0efd7db..1b98b609f7fda 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -156,6 +156,8 @@
>
> #define SQCNT1					XE_REG_MCR(0x8718)
> #define XELPMP_SQCNT1				XE_REG(0x8718)
>+#define   SQCNT1_PMON_ENABLE			REG_BIT(30)
>+#define   SQCNT1_OABPC				REG_BIT(29)
> #define   ENFORCE_RAR				REG_BIT(23)

REG_BIT(29) indentation seems to be off

>
> #define XEHP_SQCM				XE_REG_MCR(0x8724)
>@@ -365,6 +367,7 @@
> #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
> #define   UGM_BACKUP_MODE			REG_BIT(13)
> #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
>+#define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
> #define   EARLY_EOT_DIS				REG_BIT(1)
>
> #define ROW_CHICKEN2				XE_REG_MCR(0xe4f4, XE_REG_OPTION_MASKED)
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 9b0bd58fcbc06..d898610322d50 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -6,15 +6,26 @@
> #include <linux/nospec.h>
> #include <linux/sysctl.h>
>
>+#include <drm/drm_drv.h>
>+#include <drm/xe_drm.h>
>+
>+#include "instructions/xe_mi_commands.h"
> #include "regs/xe_gt_regs.h"
> #include "regs/xe_oa_regs.h"
> #include "xe_device.h"
> #include "xe_exec_queue.h"
>+#include "xe_bb.h"
>+#include "xe_bo.h"
> #include "xe_gt.h"
>+#include "xe_gt_mcr.h"
> #include "xe_mmio.h"
> #include "xe_oa.h"
>+#include "xe_sched_job.h"
> #include "xe_perf.h"
>
>+#define DEFAULT_POLL_FREQUENCY_HZ 200
>+#define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
>+
> static int xe_oa_sample_rate_hard_limit;
> static u32 xe_oa_max_sample_rate = 100000;
>
>@@ -63,6 +74,13 @@ struct xe_oa_open_param {
> 	struct xe_hw_engine *hwe;
> };
>
>+struct xe_oa_config_bo {
>+	struct llist_node node;
>+
>+	struct xe_oa_config *oa_config;
>+	struct xe_bb *bb;
>+};
>+
> #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
>
> static const struct xe_oa_format oa_formats[] = {
>@@ -105,6 +123,381 @@ static void xe_oa_config_put(struct xe_oa_config *oa_config)
> 	kref_put(&oa_config->ref, xe_oa_config_release);
> }
>
>+static struct xe_oa_config *xe_oa_config_get(struct xe_oa_config *oa_config)
>+{
>+	return kref_get_unless_zero(&oa_config->ref) ? oa_config : NULL;
>+}
>+
>+static struct xe_oa_config *xe_oa_get_oa_config(struct xe_oa *oa, int metrics_set)
>+{
>+	struct xe_oa_config *oa_config;
>+
>+	rcu_read_lock();
>+	oa_config = idr_find(&oa->metrics_idr, metrics_set);
>+	if (oa_config)
>+		oa_config = xe_oa_config_get(oa_config);
>+	rcu_read_unlock();
>+
>+	return oa_config;
>+}
>+
>+static void free_oa_config_bo(struct xe_oa_config_bo *oa_bo)
>+{
>+	xe_oa_config_put(oa_bo->oa_config);
>+	xe_bb_free(oa_bo->bb, NULL);
>+	kfree(oa_bo);
>+}
>+
>+static const struct xe_oa_regs *__oa_regs(struct xe_oa_stream *stream)
>+{
>+	return &stream->hwe->oa_unit->regs;
>+}
>+
>+static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
>+{
>+	struct xe_sched_job *job;
>+	struct dma_fence *fence;
>+	long timeout;
>+	int err = 0;
>+
>+	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec_q */
>+	job = xe_bb_create_job(stream->k_exec_q, bb);
>+	if (IS_ERR(job)) {
>+		err = PTR_ERR(job);
>+		goto exit;
>+	}
>+
>+	xe_sched_job_arm(job);
>+	fence = dma_fence_get(&job->drm.s_fence->finished);
>+	xe_sched_job_push(job);
>+
>+	timeout = dma_fence_wait_timeout(fence, false, HZ);
>+	dma_fence_put(fence);
>+	if (timeout < 0)
>+		err = timeout;
>+	else if (!timeout)
>+		err = -ETIME;
>+exit:
>+	return err;
>+}
>+
>+static void xe_oa_free_oa_buffer(struct xe_oa_stream *stream)
>+{
>+	xe_bo_unpin_map_no_vm(stream->oa_buffer.bo);
>+}
>+
>+static void xe_oa_free_configs(struct xe_oa_stream *stream)
>+{
>+	struct xe_oa_config_bo *oa_bo, *tmp;
>+
>+	xe_oa_config_put(stream->oa_config);
>+	llist_for_each_entry_safe(oa_bo, tmp, stream->oa_config_bos.first, node)
>+		free_oa_config_bo(oa_bo);
>+}
>+
>+#define HAS_OA_BPC_REPORTING(xe) (GRAPHICS_VERx100(xe) >= 1255)
>+
>+static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
>+{
>+	u32 sqcnt1;
>+
>+	/*
>+	 * Wa_1508761755:xehpsdv, dg2
>+	 * Enable thread stall DOP gating and EU DOP gating.
>+	 */
>+	if (stream->oa->xe->info.platform == XE_DG2) {
>+		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN,
>+					  _MASKED_BIT_DISABLE(STALL_DOP_GATING_DISABLE));
>+		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN2,
>+					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
>+	}
>+
>+	/* Make sure we disable noa to save power. */
>+	xe_mmio_rmw32(stream->gt, RPM_CONFIG1, GT_NOA_ENABLE, 0);
>+
>+	sqcnt1 = SQCNT1_PMON_ENABLE |
>+		 (HAS_OA_BPC_REPORTING(stream->oa->xe) ? SQCNT1_OABPC : 0);
>+
>+	/* Reset PMON Enable to save power. */
>+	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, sqcnt1, 0);
>+}
>+
>+static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
>+{
>+	struct xe_bo *bo;
>+
>+	BUILD_BUG_ON_NOT_POWER_OF_2(XE_OA_BUFFER_SIZE);
>+	BUILD_BUG_ON(XE_OA_BUFFER_SIZE < SZ_128K || XE_OA_BUFFER_SIZE > SZ_16M);
>+
>+	bo = xe_bo_create_pin_map(stream->oa->xe, stream->gt->tile, NULL,
>+				  XE_OA_BUFFER_SIZE, ttm_bo_type_kernel,
>+				  XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
>+	if (IS_ERR(bo))
>+		return PTR_ERR(bo);
>+
>+	stream->oa_buffer.bo = bo;
>+	stream->oa_buffer.vaddr = bo->vmap.vaddr;
>+	return 0;
>+}
>+
>+static void write_cs_mi_lri(struct xe_bb *bb, const struct xe_oa_reg *reg_data, u32 n_regs)
>+{
>+	u32 i;
>+
>+#define MI_LOAD_REGISTER_IMM_MAX_REGS (126)
>+
>+	for (i = 0; i < n_regs; i++) {
>+		if ((i % MI_LOAD_REGISTER_IMM_MAX_REGS) == 0) {
>+			u32 n_lri = min_t(u32, n_regs - i,
>+					  MI_LOAD_REGISTER_IMM_MAX_REGS);
>+
>+			bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(n_lri);
>+		}
>+		bb->cs[bb->len++] = reg_data[i].addr.addr;
>+		bb->cs[bb->len++] = reg_data[i].value;
>+	}
>+}
>+
>+static int num_lri_dwords(int num_regs)
>+{
>+	int count = 0;
>+
>+	if (num_regs > 0) {
>+		count += DIV_ROUND_UP(num_regs, MI_LOAD_REGISTER_IMM_MAX_REGS);
>+		count += num_regs * 2;
>+	}
>+
>+	return count;
>+}
>+
>+static struct xe_oa_config_bo *
>+__xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_config)
>+{
>+	struct xe_oa_config_bo *oa_bo;
>+	size_t config_length;
>+	struct xe_bb *bb;
>+
>+	oa_bo = kzalloc(sizeof(*oa_bo), GFP_KERNEL);
>+	if (!oa_bo)
>+		return ERR_PTR(-ENOMEM);
>+
>+	config_length = num_lri_dwords(oa_config->regs_len);
>+	config_length = ALIGN(sizeof(u32) * config_length, XE_PAGE_SIZE) / sizeof(u32);
>+
>+	bb = xe_bb_new(stream->gt, config_length, false);
>+	if (IS_ERR(bb))
>+		goto err_free;
>+
>+	write_cs_mi_lri(bb, oa_config->regs, oa_config->regs_len);
>+
>+	oa_bo->bb = bb;
>+	oa_bo->oa_config = xe_oa_config_get(oa_config);
>+	llist_add(&oa_bo->node, &stream->oa_config_bos);
>+
>+	return oa_bo;
>+err_free:
>+	kfree(oa_bo);
>+	return ERR_CAST(bb);
>+}
>+
>+static struct xe_oa_config_bo *xe_oa_alloc_config_buffer(struct xe_oa_stream *stream)
>+{
>+	struct xe_oa_config *oa_config = stream->oa_config;
>+	struct xe_oa_config_bo *oa_bo;
>+
>+	/* Look for the buffer in the already allocated BOs attached to the stream */
>+	llist_for_each_entry(oa_bo, stream->oa_config_bos.first, node) {
>+		if (oa_bo->oa_config == oa_config &&
>+		    memcmp(oa_bo->oa_config->uuid, oa_config->uuid,
>+			   sizeof(oa_config->uuid)) == 0)
>+			goto out;
>+	}
>+
>+	oa_bo = __xe_oa_alloc_config_buffer(stream, oa_config);
>+out:
>+	return oa_bo;
>+}
>+
>+static int xe_oa_emit_oa_config(struct xe_oa_stream *stream)
>+{
>+#define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
>+	struct xe_oa_config_bo *oa_bo;
>+	int err, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
>+
>+	oa_bo = xe_oa_alloc_config_buffer(stream);
>+	if (IS_ERR(oa_bo)) {
>+		err = PTR_ERR(oa_bo);
>+		goto exit;
>+	}
>+
>+	err = xe_oa_submit_bb(stream, oa_bo->bb);
>+
>+	/* Additional empirical delay needed for NOA programming after registers are written */
>+	usleep_range(us, 2 * us);

Are we planning to signal user fence or something to indicate 
completion? I haven't tracked that aspect much.

The reset is familiar and lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
