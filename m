Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61F6C25B67
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 15:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579CF10E82D;
	Thu, 26 Oct 2023 15:56:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD0610E82D
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 15:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698335766; x=1729871766;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wJaw3GPuMNLzjR/vpPJDw+5ils6k2S9Wa48a+UGBPOc=;
 b=SgT7H7N07lmiugkgwNFdxvYrcYknB900g4W8nMYjFVS8Mc+EvUQqDz0y
 pP1K5jswF7aOXxQHsQHsvxD01ai4s7se+skXBOX9cEyzwULqi5fc/22ln
 rLSOozgDvRDviUdBmsZYN4fPdMkbcJeUDHPrcha9TKXi9JpYmhIRmk9na
 0dvy3RSfZE/ihX3lPQaK42pIWHOaDwl2lN7yNIGlUE6p4cuT5O7FkChxG
 aTvFbsW1dnDXZuu6b459NpE+bNTA6HfK1TYrTfckG38RPXtd6KTZRO3U9
 EPdGA7fKOsujeEAKdUXNqPIO4dE2GEIQM7044FzATHksV+my9KPJ60M8A w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="366931326"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="366931326"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 08:56:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="548808"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Oct 2023 08:55:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 08:56:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 08:56:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 08:56:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 26 Oct 2023 08:56:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZ6mMrVkCEaX+GjPZOFtJegCm37MDgNZJA5c4TVa1TCwDr2ayEuaVSwa+v0FX5eyCklRl5qRmPbsAz8o/G+gWgVmcqH9DG40epHz7lkDm3AR3ibP6MklmfUF3GES+DunsC089SulRog54tLk8609bTUtvKfERf4MDkObfkuyvECRu0bABhD19Xh+876SMJ21pBS/ARypoofAkytF2bLWoUtVuQYTDxwHP7Af0CsVhdVo8/GS+9Sdz9ahHvJkkagDnWzusQkulDQBOEPXA1Xb1sLrLzETT/4QJTUReLpe4LCxfLQst94DBFP4saVSrCg1gBguOqVF1nY5TGU2Y7M0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVHPRxFHVHJOkrHdgNy6LjoLu1Yv8GFGyGf2Me9vhMg=;
 b=kGMsJ6WGkQ/et0tGKU8bkisL2/Ar7/QKbpwDS5Kw+t+cf3i7GKKivUjwbiXBOvMvbTeD+t9cidO1LSTOJkpgDvVXMYOeeuIGPRooxLBoQXLSIvMmH5XDhiWH4nhtjsyCnZXgLR5tPrk1F8Gd57NjsFY1CqJLK2r6iJ00fW//r0AW66yIt9EU+09R7NMOuAzLHhKgUmxhrsdwsuy1hpLI/k0zkkLbM2sqsAdQdcd5JNU2GakZ0bYP3zve2furKlMHDZ2Ef1WimryiqeR2r+lTUzecScc4DlJYh/tKtnRYeuf3voa2QeRYjLnynY1GT81KIcGS+G49CYv1AfW/xFiSbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7280.namprd11.prod.outlook.com (2603:10b6:8:108::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.29; Thu, 26 Oct
 2023 15:56:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6907.030; Thu, 26 Oct 2023
 15:56:00 +0000
Date: Thu, 26 Oct 2023 10:55:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <eec67sgsxnplq3iitluucvdimypi5u5ubwsgbwxxffmpf6r42w@a6dpzcontrzf>
References: <20231024220739.224251-1-lucas.demarchi@intel.com>
 <20231024220739.224251-3-lucas.demarchi@intel.com>
 <169832941486.1500.12082880042818649394@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <169832941486.1500.12082880042818649394@gjsousa-mobl2>
X-ClientProxiedBy: SJ0PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ac8614-33bb-4130-a3ce-08dbd63c0cdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mzwuwL/seYTLd2le35+Bw0r5RjIsXEJkv1MNeg6Bn3rBxG+h3fY+cjjUwG5NUoI3ye6pCVMnp5tzrCQre9mSCEhLyuQzpvBHI2xb+bpCLRQfrVaDugQ3JXB3QnvCiWWh08iJNLp3JDC4lQXMLk0D9fUnXNQYICBa/C6cq4VBG3kwCu02aiSbF3y99DVRKHGcPUtGZMvOQwpqDfo3zY6tfQYeZavW+R2LBPKPST1XIVL6Y6r5TPeEzVI4nqYP4/sAnr7ogStgPUlRPkV0JtTZ3po+CeB9xkswDpS3j1bhgG5nW2xy7GB7MKI2JYmGiDIDAac+CtTrnZopgB+Nd7TmwTvPiyG+lkrFI8efqN2Q2Fccce9WZW+BzYyJ6MfLrmE7KABu+QDwv5+dsrS/AEhXyijQhvWGouGkuRC3EPH8rHNSoLxFGdaTziEMBaVNPF3VU1iAmyeydCDWDUxxngeA6E+5P7zljytlqqH/J05ezLcRAQ7jTYejRXWG6PqrkrHGHl/ZIwuEnnr59si1xAbCemKfsIOQ2lP9Z1Sk2mS77ig20BbKH4JYnL16Gl8LUFO7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(346002)(366004)(376002)(39860400002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(2906002)(38100700002)(66476007)(66556008)(316002)(82960400001)(6506007)(66946007)(478600001)(6636002)(9686003)(6512007)(6666004)(6486002)(83380400001)(5660300002)(86362001)(41300700001)(4326008)(8676002)(6862004)(8936002)(107886003)(33716001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ktDtl/BXV+WIopRaX3UsFg89PYFQmPXM8gckdb9vCs/iZaTRyJHMTabRMJxL?=
 =?us-ascii?Q?4jiv+aHTIF3bAvvxvSgKUEy5YZgG8clVFXevNZFXOp+umr9xiycs3LbGge0D?=
 =?us-ascii?Q?6yFs4kJWwZD55hMFfrK5/L2VNYZnAa0feD8RitDugkBqwCJUJmrGNCx09wus?=
 =?us-ascii?Q?TcRQdwrG7ol796gy6JUhGtn7ziCZcp8Fs1hcYpMLju5lQXPnwAYOTi/tkzJo?=
 =?us-ascii?Q?RSlh9zcvFk1beT41sw7cuW7uQq0OyaxkQp1Uq9ZkbrN0+Hm5CvQcwpYmm/8M?=
 =?us-ascii?Q?zzB4xIQ99KG/af6rBEknwgFG8qfUNZGaMdrxWPQbsVxlT3DZS4DeadaGFUdj?=
 =?us-ascii?Q?JTXVf/MlO6pkJEOBDzAMx9ijKEdPWj96C8gxxmsCg9bguj4Bd0y4r7MEmnLZ?=
 =?us-ascii?Q?R8Nccs28aY3iqvIooZWtrzDdMVabIDmftrlu4tgo4ORIvi1os5LdL8plCuGj?=
 =?us-ascii?Q?R41bzWjAMB2EHp9xBDvrAKgAyhZa4pt8iaW6HJernOh7LyjgQXA8bHtONlyj?=
 =?us-ascii?Q?N61OJv3o/o4zBryv250T8SyJLh684wNq6XldMaE18KYClhFooFHd2YSS0LlJ?=
 =?us-ascii?Q?tMY/dlvT0ucumhwhTwY2iU6BUfKduRgwwlg3wNWSsfPrFG+hR2BQ1wlD7fHk?=
 =?us-ascii?Q?7Nrhyqoh9ZI1aTVU483UzCJ11oFuIlSjJP3jxCT3XEX82qI7zha4JcBCq+vc?=
 =?us-ascii?Q?n5cGvKJy//2K51saO565e60sXMG0pPUT1PjueJboqhmVZkyao8kHRPsN7gVx?=
 =?us-ascii?Q?2ioZDasU+tsozE2wL2AC2SEGfzQDaMRNYWVMNHEhSz/BiNXyVLfRWqPlfJfV?=
 =?us-ascii?Q?f6awtaR6ez5AXam65xewMCsqcSvc1BHgNVl7/wLJtkgS0lGf/7D/fGa+iu/0?=
 =?us-ascii?Q?nrJvnLKr1B0f2mNIcESzOhkoN93tbI6yS49cblUU83sWmZ9L5q9imYKs6NA4?=
 =?us-ascii?Q?eEaZzx9qPfeJmd8AfBeAfram3XWXTvRBKaooDpLR582Ny85ppBMbFYbSmpil?=
 =?us-ascii?Q?Ajko0qDyLy/DmM28AvXfPOWgJ2kAGdLWyIqbe2oTc9HuF1zPzdSkxmQbSZ/g?=
 =?us-ascii?Q?/Hcw3WkbDOJPOMg5UDw5T7yx/XZFlgw3TS2n5/rtnp7C3HY4Hc4a0iyLHD2v?=
 =?us-ascii?Q?C43enCFZjV/14stC4tWUsJBG53M5HglrkR+3npnEXg0SxTd6rfsiq5k9lDHc?=
 =?us-ascii?Q?wvCQ0XwEtPuIgOVTHewioKGcwcU2ye02YonvBdNnVWvqhBg6QOcx1aD//u9M?=
 =?us-ascii?Q?fFZpngCK0xrCEjmb8drJh81OTwCXYHl7DOzOogcR8Lf5ZHCOHoHVw7qMimnv?=
 =?us-ascii?Q?knj0/1lF9Ynh8oTz29SMkmOt7J19ZhjCq51NT1eIHpxFCLOAOqsTR08nRJx2?=
 =?us-ascii?Q?jo3wIhOD2BZt6ZRnf5U9aFjHthQa43BbsIWPXiBrHnWpddjKM22JrpU+wGKH?=
 =?us-ascii?Q?LmNPbBv608vlkRf9r5ACnvsb0T9k5XsdEnloz2eNpKgGy6UX+vWfiwYFDPYV?=
 =?us-ascii?Q?HeYcXI1Qf95zHwbI6Yv+IXF+wwXOG6NczRO1fOzpLV3JLeP6TqO77dZdmi5B?=
 =?us-ascii?Q?kSmT/RV5elWXoGGe40DOcSefGHGVYtqoSPhi+cMhI+Y/uNdu3phA/lboZtg4?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ac8614-33bb-4130-a3ce-08dbd63c0cdc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 15:56:00.6429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2VTOh3LG3hqvG5OTpEKm4avdJNjYeyNeoP5GfdFEffzqgx8lOAzlE0AXyigszpCwSIvxyp4hFODO888H8UC8n5xpYa7Xwsugp8gp3+wwCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7280
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe: Add Wa_14019821291
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

On Thu, Oct 26, 2023 at 11:10:14AM -0300, Gustavo Sousa wrote:
>>@@ -37,7 +37,7 @@ quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
>> $(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
>>         $(call cmd,wa_oob)
>>
>>-$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $(obj)/xe_wa.o: $(generated_oob)
>>+$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $(obj)/xe_wa.o $(obj)/xe_ttm_stolen_mgr.o: $(generated_oob)
>
>Nitpick: It seems the list of targets is sorted. Maybe we should keep it
>that way.
>
>On an unrelated note, I wonder if there is a way to have the dependency
>on the header automatically detected.

I tried a few times, but I was always hitting some issues and builds
failing as I increased the concurrency level. Just tried again with the
simplest possible solution:

	%.o: $(generated_oob)

It passes on incremental builds when I touch xe_wa_oob.rules, but fails
on a clean build.  I hope to get this removed soon, but I don't want to
block any patch just adding new files here.

Lucas De Marchi
