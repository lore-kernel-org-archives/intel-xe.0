Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E3CC6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 15:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4FF10E3CD;
	Fri, 17 Mar 2023 15:31:40 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F03210E3CD
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 15:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679067098; x=1710603098;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pT1zsUFX6nQci4igllxMDRVLbv90Rm30WFWlMUxWcks=;
 b=mJcISKc4XEhWk7QnKO+2DS/Bd2F3R5j/FzE58NTtnydwnyM+xel59TEy
 bv6LGhzAjHLOC8tRPdEj6sagfZjPQYcV9yT6AXkZp5oMo6ZzJlbWw0Wwb
 d9uKx8eGGd9rs9v/9LJt6n4sT6o/H0ooPZ5+2ubv1gq58tSNU2oxHO5Pq
 cMGQ06wbcslEV1AaxvxeDwjaEtMPva9DSFAGDitArp30H7qK7vmAyZdWt
 V24cXSItg/7XVE3WGVHg5vRBIlfp4aUcBLZyHUf1Gf/tz2qwi2LfQuprH
 tYdLZ6HgpdVGuWfYc5tP3yR4f+HeRo4QMWE6bzrrq09j4tqOgZ2kXYYJd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="326645946"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="326645946"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 08:31:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="854471399"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="854471399"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 17 Mar 2023 08:31:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 08:31:37 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 08:31:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 17 Mar 2023 08:31:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 17 Mar 2023 08:31:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OW32ovgS6EOQO4jQcGfnTGdCr/FYNnJnM0c4wlpSDqWBDyMgJ/xd+0/M45h/srX/1vz2FTcGTaiQan1MyuqiX7nqaFD3MvQW99UUULTF+iWOhkkEn4SX2p4Awu/1KZRK0ODw6nYC4sk71fQ3V0Yq2dVl97qTW4XUfWJ3fIC184zF/XJiAS0wCI6VdjGIuQgZj3wGLwKNOX5ZlOqWhq7orLaST+j+ldLdxJVXb7TQfGbExqyDAuPYQtFRaq4xiO1QTVHs8igUnBY53q0GdQE9AXw8jfW4Y1tG7PjasJUUdQn0fsNyHxF9Hs1nKM0Dk7BKY2h+ZJFyAM6aNpGPdXjEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STnPWCxcznkTCW5qZMx68HYsyiHu4VE6ccjzvbdN9QE=;
 b=POllFGujeiEM2s8cZlyOuowlChi8waJLosT2iXouRGsJUr5qo19U4GkNgF2ZRwKX19y2Z/c6/I2A05bTSJw0xQcE6+zakGsJ3bilEJUwR5oSH7bWQFf6eXe4leSHqco5aCzgHrfOJe0rGyxjI8vu483CdFlCDPiMNZZKnzDNWMWiFMJrmSq5kQXvWQ7WFfhotfGHSorhPXqdmx5euLPQW9dwQ/Aedj13xlF3G8AgoEiJwwAToscymqNlEveiYZw92eHffAK8emwxPPdnMMc+hE2yLMLfVeOIDTFrI7/r2YJ3vIh/6MaAmM9jsU4qC0fsAzbZ1ILl19+WvYbZ5axM7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 CY5PR11MB6185.namprd11.prod.outlook.com (2603:10b6:930:27::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.35; Fri, 17 Mar 2023 15:31:35 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f%2]) with mapi id 15.20.6178.024; Fri, 17 Mar 2023
 15:31:34 +0000
Date: Fri, 17 Mar 2023 21:01:23 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZBSHywDiNs3eBKis@bvivekan-mobl>
References: <20230315081500.608346-1-balasubramani.vivekanandan@intel.com>
 <20230315081500.608346-2-balasubramani.vivekanandan@intel.com>
 <20230317004721.naedt6yhtjt4zoul@ldmartin-desk2.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230317004721.naedt6yhtjt4zoul@ldmartin-desk2.jf.intel.com>
X-ClientProxiedBy: PN3PR01CA0191.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::15) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|CY5PR11MB6185:EE_
X-MS-Office365-Filtering-Correlation-Id: 391a14bd-1d83-4dbf-8819-08db26fcb0b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6xeaSb5AqIE+8mA1ahP0LqXjURceWQsh3VcwHiLchtEAlR1cjzKtBfV0KViEJ4Ad18ZVTU/k9PAz5rnAxMF+wrgVKaZBczbj3Dvsg4EfggxYbMMDMsu2a35abO5TdFr7jhY5EZatjavng9cp8DC7IZAJYk1Iu8g3VJuv/AvlAWMIAvTyrL6GCoX+FEHtgeQr84flJ7AAYYea6udNGFbCBW/+0RUYJfbigiP3zFdYKNmbbATuCWPRGslZ7K4lx7+4fvZQPXf5NZ29D99cRfbvXeOxvKRCZL6tt8L6BtZ36eLhVB98uXKU0BH5mRXi52cIlBwVV/SwDNSyMDNTNAx7ZW+8Cf62qLhM9SIHg9sx0qgxFjOumIGPI4Bgnu7Maugqhef2LMfycQkKujmW990rsYJSBIv3VVgWZvG6djoQaahSl+zlUq25x6xlMUpCd5wuqS4lX5CFZWWbcxGnBQWr7HKS2RJCBQpOUHfeG6cGpnp1BEssYfEEUEDp5IhlPtMniOB6glUhJFVlLBOdNzDnJrU4jSrdRoAbF86jndWNebIoTUU1hcxJzfLl1F+JZiLhGa2glyxDX37W495l9nq5Se75LDOH/+/ooPjhzBHOKVxOlYdqaDmgVmaxT89t3yowecC51qFtDgQvA0f8k99G5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199018)(186003)(9686003)(38100700002)(316002)(478600001)(83380400001)(66556008)(8676002)(41300700001)(26005)(5660300002)(44832011)(6862004)(66946007)(4326008)(82960400001)(2906002)(8936002)(6506007)(6512007)(6636002)(107886003)(6666004)(66476007)(6486002)(53546011)(33716001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0FKNXhtMUYwSCtKTmFuRitkQnQ3T3BTdVYzWVl2NXJ2Rk5BM3ZvT21RRkp0?=
 =?utf-8?B?ekJnVGdQbUc1UmxQbE04V2tIVHExN0NsZENWZzhhcElGLzRXNmhPQUdobGNo?=
 =?utf-8?B?dG5zLzU4czdJTzBvMzJqeDFVcEFIUHk0VFNKRHZCbDBXWGIvcENWeVVYODJt?=
 =?utf-8?B?M1FvekREZ1dnZ3Y2WjV5U3ZobUsweEVyODV5Qk5Dd3VjQmJkOHo4K0VDclQy?=
 =?utf-8?B?WGY0NjFOdDl2ZC9wNDhrQnpaZmEycnJBakRVdy9tVkZIUTBKM2ZWTzBBQXVC?=
 =?utf-8?B?R0Njemk3VDE2OWVWbk1KMExXbERtVXI0bVFWdURJZSs4WnBkWjdONyszNmtV?=
 =?utf-8?B?MEVjZnZSRjlUVm1HQ0N5bUdsTFJzVGozb0RRN3o1d25HQnVOZ1ZhbE05NnBm?=
 =?utf-8?B?ek1WS0w2RkYydUdNOXBXSFRLUTR2UzAvdnowMTNRWDZ6blpjUktiQjg3c0tW?=
 =?utf-8?B?L1MwT292RTZaa2kzVjZobjZhcC9taVRXOWc5L3NwaWxmdUNMcG1JL1NOcmVj?=
 =?utf-8?B?azBzQXlCUHNXMklYSktvam1Cak1iL2xRTnFxZVhiZ2lYa3BIQkpna3J1UDFH?=
 =?utf-8?B?eTF6YUwzMkVnc3Z4WXZhNXRVR2JYMkdoTjdNYUNYMm1PeUUvUFdJdW1vZlJr?=
 =?utf-8?B?ZjVVbWpPTk5ORTNCNnFRUnFQbXdlTXhVYUdJVGowTkY2dTlQWFFtcmpESG4y?=
 =?utf-8?B?MmUzdThQZWFHa01WdE9vOUpPU2pMWGtGUlJXeTVvbWgzUjNTcVlPT0p3TTZJ?=
 =?utf-8?B?Y3N2QkFXUEdxREZRaFJYZXZ1UnlOQXNDaUFCQkZMRkVUL3Z6WUdkazFhd28y?=
 =?utf-8?B?bW1DZGQwTy9Wa0FnNWwyRC9EaXozV3ZVREVwNFkxZUQ3aHY3a1M3UjBVT0du?=
 =?utf-8?B?c29lNnFON1h5VGFzTWJ4aGg5QkoxSnZTM3dkNWlUMHJKOWcwVzlDd1M2WnVx?=
 =?utf-8?B?SkllZ1JTZ0lOV1ZKV3E1VWVLWHNuU2FLbGhzaVlYVDYvSFdPNHNpK3lIc0Vz?=
 =?utf-8?B?N0lyS0xaQmM5NWRDM2o3cE5DS3crM0E2ZnJGa0R2SVlYaW5nSnNpZzZOWXRj?=
 =?utf-8?B?RElSS3dtS0w1cnRvTnBDYmVXSytwOVhzT3M0bEt1UEk2QWs2Z1BPTlhjdGx3?=
 =?utf-8?B?NjlCMlZyMXIzTytVZVJHeUhBajhCU3M4dHlaVng4bXl2RFdXZ1lSc3E1eldI?=
 =?utf-8?B?MSt5dCszZlY5RHRlVFlRSVdBNWd1NXdvNWduWWFNSHNJaE1ieEN3UEdRbVRP?=
 =?utf-8?B?dGdKSEJWU1ZXNzNOa0RHS0sydFppN24zM0lkYmlNdTEvTHpCa2IrUmNsaFhL?=
 =?utf-8?B?OWcwS2J0c3R3YzJRaWJVNHpSc1drSnRwTTdoZmFYbzRDWDBzVHI4UmxTaS9i?=
 =?utf-8?B?L3Z5bUFuVDY4Z0NET2RwaW1ZYTNqRnlLamhIaytMTW51aDhBNFI3UXlnd2h5?=
 =?utf-8?B?dlhINUNoV0FLUmMwcFUwK2tPcTdvU0pySGtESVpicW05VmlCb2F2cXoyNDhK?=
 =?utf-8?B?SlV1Y0dOUGdoaWVhb0MrUXNrclltWHBVVHBtdTBaWUtFUTk4dEU1LzlOeWtx?=
 =?utf-8?B?SHQzL3BZTXRFT05uMXlKUHpWWWVML2VQUkViWWNhNmt1cEh3WVAxUEZLQlRG?=
 =?utf-8?B?R1ZrRXJra1dqd2tqc1ZjaTBROHh3SmE4VE5EL0NyVTN6YkdBSFB2QWhIYWwv?=
 =?utf-8?B?NjMvRnY0UzVuWVhlVHhlT3F6Ym8vRnNVcnhodGU3WThGTy9lOWlUZHhHbXBN?=
 =?utf-8?B?cnV3K2orbHZXUkkyVGVKeTJPUDdBOTZQS3RwYld6ZjV5dTNQZkRGdE53cUg3?=
 =?utf-8?B?dUJDdTMwZGVITmVnZlpiZUxlRmxsMUx5bENpSTVFNVJOVjVHcmhJYkU4dHRl?=
 =?utf-8?B?aHYralFGL0IzQldURlgwU0ViU3dZNEplbDNxQlE1M3JjZVdWV01taDJmci95?=
 =?utf-8?B?T1pGY2FaTldBOUdEWDZxNGNjWkw0WnpWNmNxTnJZQ1ZWUEFqcDZ2OTNCTmph?=
 =?utf-8?B?MHd5VXN3RWU3a2RrK2MyMnkwU254WVkvdHBDbUNJMkI5ZHpkUGFnMTAzN05y?=
 =?utf-8?B?Z0hmNWUxNk1GT2lVMFBFQmtvOVQ4Mi9oMDY3YTdhajJnWXhCQUtIRVhEMWsz?=
 =?utf-8?B?V2RGMHBaVUpXVERnNkpMQ0hZUk8xcUFOb1RKdVB3MkxOQ1lKKzBDYkdQRTJi?=
 =?utf-8?Q?wfxZEZKPPT6mbCbUsxVUhkm7MZODkHpdTUFIOYACYFbS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 391a14bd-1d83-4dbf-8819-08db26fcb0b3
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 15:31:34.6226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKz7aBc1mD7Oawv6r+bllf7B5/cXSgbchPTGrI7Mz32zdHcAMN9Eflgyw1RyWCWxgRWhJAtqBGY2r8xZOl+C3pQyq1QgS6U1EWb6FJQsjVC/WaKFdyIiKeT0IOvHGLBn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6185
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 1/2] drm/xe: Skip XY_FAST_COLOR
 instruction on link copy engines
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 16.03.2023 17:47, Lucas De Marchi wrote:
> On Wed, Mar 15, 2023 at 01:44:59PM +0530, Balasubramani Vivekanandan wrote:
> > Link copy engines doesn't support the XY_FAST_COLOR instruction.
> > Currently this instruction is used only at one place to clear a ttm
> > resource while migrating a BO.
> > A new device_info member is created to know if a platform has link copy
> > engine. If it supports, then instead of using XY_FAST_COLOR instruction,
> > MEM_SET is used which is available both in main and link copy engines.
> > 
> > Since MEM_SET only supports setting 8-bit value, to keep things simple
> > emit_clear funciton is restricted only to clear memory address range
> > when platform has link copy engine.
> > 
> > BSpec: 68433
> > 
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> > drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  9 ++++
> > drivers/gpu/drm/xe/xe_device_types.h      |  2 +
> > drivers/gpu/drm/xe/xe_migrate.c           | 66 +++++++++++++++++++++--
> > drivers/gpu/drm/xe/xe_pci.c               |  4 ++
> > 4 files changed, 76 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > index 288576035ce3..e60372a82723 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > @@ -6,6 +6,8 @@
> > #ifndef _XE_GPU_COMMANDS_H_
> > #define _XE_GPU_COMMANDS_H_
> > 
> > +#include "regs/xe_reg_defs.h"
> > +
> > #define INSTR_CLIENT_SHIFT      29
> > #define   INSTR_MI_CLIENT       0x0
> > #define __INSTR(client) ((client) << INSTR_CLIENT_SHIFT)
> > @@ -56,6 +58,13 @@
> > #define GEN9_XY_FAST_COPY_BLT_CMD	(2 << 29 | 0x42 << 22)
> > #define   BLT_DEPTH_32			(3<<24)
> > 
> > +#define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
> > +#define   PVC_MEM_SET_CMD_LEN_DW	7
> > +#define   PVC_MS_MATRIX			REG_BIT(17)
> > +#define   PVC_MS_DATA_FIELD		GENMASK(31, 24)
> > +/* Bspec lists field as [6:0], but index alone is from [6:1] */
> > +#define   PVC_MS_MOCS_INDEX_MASK	GENMASK(6, 1)
> > +
> > #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
> > #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
> > #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 034e0956f4ea..46cf37224090 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -95,6 +95,8 @@ struct xe_device {
> > 		bool has_4tile;
> > 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
> > 		bool has_range_tlb_invalidation;
> > +		/** @has_link_copy_engines: Whether the platform has link copy engines */
> > +		bool has_link_copy_engine;
> > 		/** @enable_display: display enabled */
> > 		bool enable_display;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index c0523d8fe944..44a4712f8c83 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -746,14 +746,37 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> > 	return fence;
> > }
> > 
> > -static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> > -		      u32 size, u32 pitch, u32 value, bool is_vram)
> > +static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> > +				 u32 size, u32 pitch)
> > +{
> > +	u32 *cs = bb->cs + bb->len;
> > +	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
> > +	u32 len = PVC_MEM_SET_CMD_LEN_DW;
> > +
> > +	*cs++ = PVC_MEM_SET_CMD | PVC_MS_MATRIX | (len - 2);
> > +	*cs++ = pitch - 1;
> > +	*cs++ = (size / pitch) - 1;
> > +	*cs++ = pitch - 1;
> > +	*cs++ = lower_32_bits(src_ofs);
> > +	*cs++ = upper_32_bits(src_ofs);
> > +	*cs++ = FIELD_PREP(PVC_MS_MOCS_INDEX_MASK, mocs);
> > +
> > +	XE_BUG_ON(cs - bb->cs != len + bb->len);
> > +
> > +	bb->len += len;
> > +}
> > +
> > +static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
> > +				 u64 src_ofs, u32 size, u32 pitch, u32 value,
> > +				 bool is_vram)
> > {
> > 	u32 *cs = bb->cs + bb->len;
> > -	u32 len = XY_FAST_COLOR_BLT_DW;
> > +	u32 len;
> > 	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
> > +	struct xe_device *xe = gt_to_xe(gt);
> > 
> > -	if (GRAPHICS_VERx100(gt->xe) < 1250)
> > +	len = XY_FAST_COLOR_BLT_DW;
> > +	if (GRAPHICS_VERx100(xe) < 1250)
> > 		len = 11;
> > 
> > 	*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
> > @@ -779,7 +802,39 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> > 	}
> > 
> > 	XE_BUG_ON(cs - bb->cs != len + bb->len);
> > +
> > 	bb->len += len;
> > +}
> > +
> > +static u32 emit_clear_cmd_len(struct xe_device *xe)
> > +{
> > +	if (xe->info.has_link_copy_engine)
> > +		return PVC_MEM_SET_CMD_LEN_DW;
> > +	else
> > +		return XY_FAST_COLOR_BLT_DW;
> > +}
> > +
> > +static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> > +		      u32 size, u32 pitch, u32 value, bool is_vram)
> > +{
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +
> > +	if (xe->info.has_link_copy_engine) {
> > +		/* MEM_SET command supports setting only 8-bit value. So it
> > +		 * can't be used to set a 32-bit value. And emit_clear function
> > +		 * is currently used only to clear the address range. Instead
> > +		 * of limiting value argument to a 8-bit range, for platforms
> > +		 * with link copy engines, lets not accept any value to set and
> > +		 * use emit_clear to only clear the memory range.
> > +		 */
> > +		XE_WARN_ON(value);
> 
> since this patch comes first, this would create a warning on
> uses of emit_clear() not changed in this patch.
> 
> Also, this is further exported by xe_migrate_clear(), which received
> value as a paramenter. By doing what you are doing here you basically
> require every caller of that function to know about the limitation.
> 
> Humn... options:
> 
> 1) Would it be possible to make sure the migrate clear is executed on
> the main copy engine?  I'm not sure there will be contention on using
> that engine, but I think in i915 it was a possible option
> 
> 2) Remove the value from xe_migrate_clear() and adjust the callers.
> Document that this is being cleared with 0.
> 
> 	2b) if there is a need outside of test (why would we test
> 	something that we are not making use of?), then add another
> 	function like xe_migrate_clear_with_val() that may be
> 	implemented differently for PVC or that just returns
> 	-ENOTSUPP. In which case it shoudl be documented that not
> 	all platforms support it.

Thanks Lucas. I have reworked the patch as per the option 2. I will send
a new version for review.

Regards,
Bala

> 
> 
> Lucas De Marchi
> 
> > +		emit_clear_link_copy(gt, bb, src_ofs, size, pitch);
> > +
> > +	} else {
> > +		emit_clear_main_copy(gt, bb, src_ofs, size, pitch, value,
> > +				     is_vram);
> > +	}
> > +
> > 
> > 	return 0;
> > }
> > @@ -836,7 +891,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > 		batch_size = 2 +
> > 			pte_update_size(m, clear_vram, &src_it,
> > 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
> > -					XY_FAST_COLOR_BLT_DW, 0, NUM_PT_PER_BLIT);
> > +					emit_clear_cmd_len(xe), 0,
> > +					NUM_PT_PER_BLIT);
> > 		if (xe_device_has_flat_ccs(xe) && clear_vram)
> > 			batch_size += EMIT_COPY_CCS_DW;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index c4d9fd2e7b2b..e555f13395ab 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -72,6 +72,8 @@ struct xe_device_desc {
> > 	bool has_4tile;
> > 	bool has_range_tlb_invalidation;
> > 	bool has_asid;
> > +
> > +	bool has_link_copy_engine;
> > };
> > 
> > __diag_push();
> > @@ -224,6 +226,7 @@ static const struct xe_device_desc pvc_desc = {
> > 	.vm_max_level = 4,
> > 	.supports_usm = true,
> > 	.has_asid = true,
> > +	.has_link_copy_engine = true,
> > };
> > 
> > #define MTL_MEDIA_ENGINES \
> > @@ -413,6 +416,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > 	xe->info.has_flat_ccs = desc->has_flat_ccs;
> > 	xe->info.has_4tile = desc->has_4tile;
> > 	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
> > +	xe->info.has_link_copy_engine = desc->has_link_copy_engine;
> > 
> > 	spd = subplatform_get(xe, desc);
> > 	xe->info.subplatform = spd ? spd->subplatform : XE_SUBPLATFORM_NONE;
> > -- 
> > 2.25.1
> > 
