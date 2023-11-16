Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32F1C47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 18:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF9310E658;
	Thu, 16 Nov 2023 18:26:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7015B10E657
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 18:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700159176; x=1731695176;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yo3gVWRT1ufL8WXej+dBadf113ZwFRfDHFLfeJuGsrc=;
 b=gCHcg6zpXlBaMELiOfXSqCc/SiChoSe8SwCDsN6+JQPHbzkx8J1n4LDT
 RMGckYdk4DUCX4i/xaOrI5i67zcYGVKfxsPaBabJpmk0rlvnkKbSzga6U
 qfCsRYoHkvKlZyHb0TEBV0TDaZWx/kVvGp5fogWG+4t0HFklCAtjHvojA
 PpOXFEj6z7mwwvdjnrNcxZlVqL8x9uwgq2Y6Bpj5L4oyzEjeAZ/e7IzRe
 H3ofTdEFdwB9rnsJcN1z9ov8Yyot1UdRridYUjAA98OWtMJFPT1BqXd3N
 aPIvIwnspg6blrx+xNvzFLxSVUzCw63t5/Yvq4Bq6uMffWt5dWWIgcs4i Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="370510354"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="370510354"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 10:26:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; 
   d="scan'208";a="6798176"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 10:26:04 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 10:26:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 10:26:02 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 10:26:02 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 10:26:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEeqHx0ZYg4v7L1icfCYsYh4QvTQGB8UBNR31Z7rONj2EgwN0OChSu1aKTaMLSXHvBxXjLmErHHAITNqVvxZrtgKj/xQKTwxZU4u0xGYIgxEZAgfP6PkwuCgm2mj+3v1gIQKmQMef7s2L1/GPyl9XZpuBQGoq29/HppdlMcQro6em75DsnAI1S+QEOMhYChX+IR/UCS8OUf5EoCDNKbnorvQ3O7RVk8P4PbMxqDlDQp+s2IJ1jdIwx9sOMKlLje4VxhBWHTOya1Vj7ozIN+WiIP6zdVOcbffAxaJMzexYU7vLsRtidgTSJNUdNUQvnSM+9u1Z75uQvsL6lNWniXkDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjV2jm9Q11ed97HemzW/XS7v0gKkojKNw7S+VrBgd8c=;
 b=SMIlV0P4f4DbBak62tzbbA9NInRrztCXbWzJPVbahUqrBKL4OspkeXumpVjG/77tdEt4D6xeSfmhYhif2Cr8OiqF6SHDDsPungjXz0U7gWubtyR24K7KJ9KqTC6BhZsY7FMiUSjJqR3R95VpLTFbi3BSslExnI9el0xaSN2fhRCA2WENEp4w2qwzaPt+xAn4wVWifftin4pT0smOWl3k13lj+lBZolMVCdln4Rs9YwkMXAT0vTZAW4XPTdHR/KqnX3lSUWS8hv39SIo9fM409bczJIlEa+sruYidBS6Jy/3CO2wjBdnfdL6CsSsgPgzWnL5rJ6OVkkrcfR23uqiQpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB8152.namprd11.prod.outlook.com (2603:10b6:208:446::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19; Thu, 16 Nov
 2023 18:25:59 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::45c4:a2b8:6411:275e]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::45c4:a2b8:6411:275e%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 18:25:56 +0000
Date: Thu, 16 Nov 2023 12:25:37 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <hncyh7w7yxikk6572pzgsdb432jc3sxzq5wvjxqi5ujqhoa772@jlp3v3air7oy>
References: <20231108135418.3049168-1-tejas.upadhyay@intel.com>
 <20231108135418.3049168-2-tejas.upadhyay@intel.com>
 <a4701efa-eab1-4a65-94ce-2c08107db9d1@intel.com>
 <vnyr2nbirfddf5yh4q7lskbwrq4hk7v3ngosrazuwiioaufsml@qckippjlrtvb>
 <SJ1PR11MB62048CEAD7DA514798ACC56081B0A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB62048CEAD7DA514798ACC56081B0A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0059.namprd04.prod.outlook.com
 (2603:10b6:303:6a::34) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: 18df8aaf-212e-424a-f89b-08dbe6d1790e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gLuj4L17UlJJLesyAgKjoNrNeMIprZTpOiwVGOxcCpZHb7Rw8fDBS7EbtwRli1CQPyiUY8a/EDeJ/KW0GBDtycGnDoT7r41EtqlBfeii5nw2JfxB6rM7MZ+z6QZzR/TauSzjlEfb50ZgedKQFwia/7kJhcdDIHaTDrzbmL9Fxf5SRETUycwnf1UTsnXINDFGV8aJI+WrRc5CcilrbOz87Xqey3pbIzEvRmZDwtS26DwgKBqAF78ji2bsFoji+PKWEEPXjQMANCguPjYUPq+mdsUX3nN5pYVfpUkYZY+reBUupmXSilIi/EuGOn4GbXmb2+Bz6GLSLJLuDKa8MaN2NCfMHxw1BthWeja0K4KS+gRR16qfQeB4Ta2zjIYDwDKuyoXUk9RAyAU1L1bfkyG5IbjoYKEBnllMg9c6U7dnZXqFnbFzMATAOD6zh9PiUd0qVVnWw63dQ7fjUF/FAYF/YobrUGGHAcsq8RkpZ2xxhhdMxi0mu0qRh1wgoG5nhqXJhbKjtk7Oid0pPcgrypuwzICv0Fpw8gxRiaztxHtfLB/vBYIp+jIi015ozQ52ndGc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(26005)(5660300002)(53546011)(9686003)(6512007)(33716001)(38100700002)(6506007)(478600001)(86362001)(6666004)(2906002)(6486002)(4326008)(66946007)(66476007)(6636002)(66556008)(82960400001)(54906003)(83380400001)(8936002)(6862004)(316002)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FmqOVXlnozWg6lWNM4gpC8brTR+/89+4e71K3+gb1NV5GxW9GYBZTX3TwuYf?=
 =?us-ascii?Q?Xs0Sykfen5Lkr5eluBOqJkwVkuFJ1z1Z+5SQkAy7VoOamvSmxeDkPdE3aO1v?=
 =?us-ascii?Q?Wymby6em7J/sMBbPldX0wChzWWzuzkyNFl+Gb8v2f53fRcBT+n6jqeG+e4CP?=
 =?us-ascii?Q?eifRDXkmIwxBPS4USFu7QqgJaAQe711He8MbvOQG4NKzJ2a5RV5LFOWyVqnT?=
 =?us-ascii?Q?LMavJQfwnu4VhrM/gjqrambCrcrHqtK9/2AA/XxT6Cb6ScCUuZp12CiWYXJW?=
 =?us-ascii?Q?Z0T35xHAaaapJaMAOv8gzQHBTob2KIr/+vakt7Veo/axY3ss427Xh4x+udrB?=
 =?us-ascii?Q?hhJ3zChdD//R+MtleeRx6GtWGUwnf1AQJR/FnLB3unP0zj2qK7GioHmdmSRD?=
 =?us-ascii?Q?B4p5pv+MQgaL9/IzgR6Wad4dKZkUNgpO6fDmT1PNQqHF/u5oxG5mkSUDGzya?=
 =?us-ascii?Q?bGgwgKyh5pxG4Y9fD0LVj70sYmZVODhaLtA0yEKHn+LujboZvbTcJIceQs9v?=
 =?us-ascii?Q?QBrQvbAPiKdGZmAo6X6XCUHBWGOo/VzMbUkzFaLbx/lpNviSlX69CHrIl+L9?=
 =?us-ascii?Q?gKkBlhpJkGKW9vdmMqqE/NqyZAQWSLmmLOQt64uXuLq8pnwGUbzC2W3nVC8A?=
 =?us-ascii?Q?gzzPec94Ied30JJ3Y8E2w6Pj3rUAYroezi0/U+ywfQBW4BI333/WjZwQ8tD2?=
 =?us-ascii?Q?VsXWUm9lNFo8lTZjw0QS6UNUy0Bu51EWZL2CmpMC81J0kOqFtAQth7AX3Igz?=
 =?us-ascii?Q?w+sCetoUD1Lm902p4LTwvWL4OiKczb7ULw/ikwQoZ8isLanqXR9sn4m31gR5?=
 =?us-ascii?Q?81VYDMvEI6LV6osGFe+wMrAkWmtktmaZbNanlaSDrVvHJWsYSKuRKFODwz+K?=
 =?us-ascii?Q?jPfXQFZ0aiW7ZHiTjHrAdAokxxhdP26t6/o6eqmfnvxE68O2Hskl9tXOL9Gz?=
 =?us-ascii?Q?1lbXJ8gt3Av/MkjDJpXFY8TVz/IDCUoGtAgXA6/S03+GilKmgWk3yGyNFf2q?=
 =?us-ascii?Q?XuMZDRBhEtdhURW6qTjgbgl+e2/wTkgq5LF0sldeQZay5LYa+z2Gku+ZvFj5?=
 =?us-ascii?Q?ckn5ejB7qyjrbS2cSVd31Pt72/xcTgg1Rd4OdWN9pwLClD3sYUHu30PWYVuD?=
 =?us-ascii?Q?FFXCw0rlvU0vfvWxtErABog8Z2jv7SC6P48ENUg1YyjuMCdzYvKuM7Jrbqcu?=
 =?us-ascii?Q?NSWuKOygT1O3g3UKxCVKL/KDfn/YveZzxQIPCGiOl7Rxij+KfTgmTYTtsj54?=
 =?us-ascii?Q?xOQ/td8wEpOpkcw+Ja2Ic5VWrgVZ1g9yID+OdPpQwvkPN8aS8mH16s9VAEMQ?=
 =?us-ascii?Q?5zBQOt9byElO5RR2O8tihZb+mf0qqR6KRx/d0JxOFaTMPi5xLaUmlKhcXDKN?=
 =?us-ascii?Q?hxQ1a3Ly57htgpRVTZxbkP2lx8hU+DkF7xl3VxcvDbLWSIppDisErAwSeYHo?=
 =?us-ascii?Q?pWNgu/7YtVofDdPpHEVUgCrJHca2WUhEW80FxGsRanMxGdj4NoslEXJOyIbz?=
 =?us-ascii?Q?863mBqMwsUK40q/XoRPzSOG8dMaMafl8wLuM2tyob2P4XdwLjKKL5s6+fr94?=
 =?us-ascii?Q?c16ejaKAn1hNHA4Ax2wUzOA80S0ZipiUOE3xmfLn8+NXsXed0DsqWDYH27i+?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18df8aaf-212e-424a-f89b-08dbe6d1790e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 18:25:55.8342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7Kt8VW+k//13rqItBVQUWPugahZbKWaPLgtwqXPOSz7M0jwCsz0gfPtZPVZtm4O9Ry7HkGb6XayvB7FBo44Ukobq7QeSKH/lmSWqa1h5Lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8152
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/ats-m: Expose uid for ATS-M via
 sysfs
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 05:59:56PM +0000, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Wednesday, November 8, 2023 9:26 PM
>> To: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/ats-m: Expose uid for ATS-M via
>> sysfs
>>
>> On Wed, Nov 08, 2023 at 03:07:45PM +0100, Michal Wajdeczko wrote:
>> >
>> >
>> >On 08.11.2023 14:54, Tejas Upadhyay wrote:
>> >> This patch exports uid to the userspace via sysfs.
>> >> For example, uid can be read by:
>> >> cat /sys/class/drm/cardX/device/csc_unique_id
>> >>
>> >> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> >> ---
>> >>  drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
>> >>  drivers/gpu/drm/xe/xe_device.c       | 11 +++++++++++
>> >>  drivers/gpu/drm/xe/xe_device_sysfs.c | 21 +++++++++++++++++++++
>> >> drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
>> >>  drivers/gpu/drm/xe/xe_pci.c          |  3 +++
>> >>  5 files changed, 42 insertions(+)
>> >>
>> >> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
>> >> b/drivers/gpu/drm/xe/regs/xe_regs.h
>> >> index a646d13af03a..1b8de9b8daf1 100644
>> >> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>> >> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> >> @@ -70,6 +70,9 @@
>> >>  #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
>> >>  #define   SGSI_SIDECLK_DIS			REG_BIT(17)
>> >>
>> >> +#define DEVUID_LWORD				XE_REG(0x102008)
>> >> +#define DEVUID_HWORD				XE_REG(0x10200C)
>> >> +
>> >>  #define GGC					XE_REG(0x108040)
>> >>  #define   GMS_MASK				REG_GENMASK(15, 8)
>> >>  #define   GGMS_MASK				REG_GENMASK(7, 6)
>> >> diff --git a/drivers/gpu/drm/xe/xe_device.c
>> >> b/drivers/gpu/drm/xe/xe_device.c index 515cdf599fab..266e0d5d7159
>> >> 100644
>> >> --- a/drivers/gpu/drm/xe/xe_device.c
>> >> +++ b/drivers/gpu/drm/xe/xe_device.c
>> >> @@ -344,6 +344,15 @@ static void xe_device_sanitize(struct drm_device
>> *drm, void *arg)
>> >>  		xe_gt_sanitize(gt);
>> >>  }
>> >>
>> >> +static void xe_read_dev_uid(struct xe_device *xe) {
>> >> +	if (xe->info.has_uid) {
>> >> +		struct xe_gt *mmio = xe_root_mmio_gt(xe);
>> >> +
>> >> +		xe->info.uid  = xe_mmio_read64_2x32(mmio,
>> DEVUID_LWORD);
>> >> +	}
>> >> +}
>> >> +
>> >>  int xe_device_probe(struct xe_device *xe)  {
>> >>  	struct xe_tile *tile;
>> >> @@ -368,6 +377,8 @@ int xe_device_probe(struct xe_device *xe)
>> >>  	if (err)
>> >>  		return err;
>> >>
>> >> +	xe_read_dev_uid(xe);
>> >
>> >as this function updates xe->info then maybe it should be a part of
>> >xe_info_init() ?
>>
>> or not update info at all
>
>We need mmio init before we access those regs, thus it needs to be in xe_device_probe() where mmio init is done.
>
>@De Marchi, Lucas not update info at all? Do you mean read the reg everytime sysfs asks? That would require GT to be awake everytime we need to read which does not look good.

that goes back to the other point that there wasn't a proper commit
message explaining the use. How often will userspace read it? Why does
it need that?

I was actually meaning that stashing this inside the info and thus
requiring the specific initialization order may not be the best
approach.

AFAICS this is only used to cache the value of that register and expose
on sysfs. From the kernel side we don't really need that value for any
initialization, so you could just read it very late and stash directly
on xe.

That said, there's a series from Michal Winiarski splitting the xe_info_init(),
and it would already have mmio init done.

Lucas De Marchi

>
>Thanks,
>Tejas
>>
>> >
>> >> +
>> >>  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
>> >>  	if (err)
>> >>  		return err;
>> >> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> >> b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> >> index 99113a5a2b84..66f69eada76f 100644
>> >> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> >> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> >> @@ -65,11 +65,24 @@ vram_d3cold_threshold_store(struct device *dev,
>> >> struct device_attribute *attr,
>> >>
>> >>  static DEVICE_ATTR_RW(vram_d3cold_threshold);
>> >>
>> >> +static ssize_t csc_unique_id_show(struct device *dev,
>> >> +				  struct device_attribute *attr,
>> >> +				  char *buf)
>> >> +{
>> >> +	struct pci_dev *pdev = to_pci_dev(dev);
>> >> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> >> +
>> >> +	return sysfs_emit(buf, "%llx\n", xe->info.uid);
>> >
>> >%#llx
>> >
>> >otherwise there will be no 0x prefix so could be treated as decimal
>> >
>> >> +}
>> >> +
>> >> +static DEVICE_ATTR_RO(csc_unique_id);
>> >
>> >what's "csc" ?
>> >
>> >in patch you use different names:
>> > - csc_unique_id
>> > - UID
>> > - devuid
>>
>> Agreed. Besides that, the documentation and commit message need to
>> answer the *why*, not only how.
>>
>> Why is this being exported, and what's userspace supposed to do with it.
>> Btw, what's the accompanying userspace to use it.
>>
>> Why is this in sysfs rather than a query? Is this something to be used by a
>> sysadmin for something rather than the app using the device?
>>
>> Why is this special to ats-m? Bspec shows nothing for the register you are
>> adding.
>>
>> Lucas De Marchi
>>
>> >
>> >
>> >> +
>> >>  static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
>> >> {
>> >>  	struct xe_device *xe = arg;
>> >>
>> >>  	sysfs_remove_file(&xe->drm.dev->kobj,
>> >> &dev_attr_vram_d3cold_threshold.attr);
>> >> +	sysfs_remove_file(&xe->drm.dev->kobj,
>> >> +&dev_attr_csc_unique_id.attr);
>> >>  }
>> >>
>> >>  void xe_device_sysfs_init(struct xe_device *xe) @@ -83,6 +96,14 @@
>> >> void xe_device_sysfs_init(struct xe_device *xe)
>> >>  		return;
>> >>  	}
>> >>
>> >> +	if (xe->info.has_uid) {
>> >> +		ret = sysfs_create_file(&dev->kobj,
>> &dev_attr_csc_unique_id.attr);
>> >> +		if (ret) {
>> >> +			drm_warn(&xe->drm, "UID sysfs setup failed\n");
>> >
>> >if you really want to print warn then maybe also include %pe to help
>> >diagnose why it failed
>> >
>> >> +			return;
>> >> +		}
>> >> +	}
>> >> +
>> >>  	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini,
>> xe);
>> >>  	if (ret)
>> >>  		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
>> diff
>> >> --git a/drivers/gpu/drm/xe/xe_device_types.h
>> >> b/drivers/gpu/drm/xe/xe_device_types.h
>> >> index 4119ef03fb7e..1cc8488f8c86 100644
>> >> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> >> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> >> @@ -238,6 +238,8 @@ struct xe_device {
>> >>  		u8 vm_max_level;
>> >>  		/** @va_bits: Maximum bits of a virtual address */
>> >>  		u8 va_bits;
>> >> +		/** @uid: device uid, used for generating uuid */
>> >> +		u64 uid;
>> >>
>> >>  		/** @is_dgfx: is discrete device */
>> >>  		u8 is_dgfx:1;
>> >> @@ -261,6 +263,8 @@ struct xe_device {
>> >>  		u8 supports_mmio_ext:1;
>> >>  		/** @has_heci_gscfi: device has heci gscfi */
>> >>  		u8 has_heci_gscfi:1;
>> >> +		/** @has_uid: device has uid, used for generating uuid */
>> >> +		u8 has_uid:1;
>> >
>> >IMO introduction of has_uid capability flag should be done in separate
>> >patch than sysfs and uid changes
>> >
>> >>
>> >>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> >>  		struct {
>> >> diff --git a/drivers/gpu/drm/xe/xe_pci.c
>> >> b/drivers/gpu/drm/xe/xe_pci.c index 2fae45b9d88e..4d91ad049e59
>> 100644
>> >> --- a/drivers/gpu/drm/xe/xe_pci.c
>> >> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> >> @@ -60,6 +60,7 @@ struct xe_device_desc {
>> >>  	u8 has_heci_gscfi:1;
>> >>
>> >>  	u8 has_llc:1;
>> >> +	u8 has_uid;
>> >>  	u8 bypass_mtcfg:1;
>> >>  	u8 supports_mmio_ext:1;
>> >>  };
>> >> @@ -298,6 +299,7 @@ static const struct xe_device_desc ats_m_desc = {
>> >>
>> >>  	DG2_FEATURES,
>> >>  	.has_display = false,
>> >> +	.has_uid = true,
>> >>  };
>> >>
>> >>  static const struct xe_device_desc dg2_desc = { @@ -577,6 +579,7 @@
>> >> static int xe_info_init(struct xe_device *xe,
>> >>  	xe->info.graphics_name = graphics_desc->name;
>> >>  	xe->info.media_name = media_desc ? media_desc->name : "none";
>> >>  	xe->info.has_llc = desc->has_llc;
>> >> +	xe->info.has_uid = desc->has_uid;
>> >>  	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
>> >>  	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
>> >>  	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
