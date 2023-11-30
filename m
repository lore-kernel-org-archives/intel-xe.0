Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E45AC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 23:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D174110E328;
	Thu, 30 Nov 2023 23:10:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEE110E328
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 23:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701385809; x=1732921809;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SOMnVWbD/gmpgW//qQH5ibEx3TDeLxRiFrPy8tL+/ps=;
 b=h+1f88VYgQkKNCVQ6YIUPT6ccPKinVYgNc9iwN+bzy2QLShG2XseY9mw
 QUIp8AbdGdzax3XXGSTUgOv8CvYEdsng2Too2gjaczjj297ZHxdSM9Rcl
 NZ75G9B2j9saecxL9QOV6gZesc5bDt8/RF95+LS+yEE9f0XOBfejF9bkI
 YfSq9+Yj2DaPKlXyRUmGfsuJBUJ5La6ptIENzlxLGpSUt2vbsTulPasyQ
 tuTiXgkaF3JIXLv2ikLMY1vcwzpa2K2u06s6TJLjLjHPHuU4lWrBVSN2t
 RYM4ZB8Ru+lQzgAc8YbQBcu6NYfQIb9vJvBt2iH/IzixoG6CXXnXISQjJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393140840"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="393140840"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 15:10:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="839960592"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="839960592"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 15:10:08 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 15:10:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 15:10:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 15:10:07 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 15:10:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZM82qv4Fs3R68WzdkK/Hvejji1F/139OnxxARAWJ/4mZgdAn5q2rt1IWDlkL7kswI1K3nV2IkJm4ie/k2pEwoserezWbAnyygORhkbY6RRmPsxk+Jk4O5w8uf9QPMZxMn8I0AtkrBfp/uzewwvSznzNHkgq4qrNiAOw2ojrSCVT/kGvq+nMeDhE4E9k0TfIS0RJG6kXEq8XEVAStD50QEpHPcBJr4F4qYQj8R8WcHdac2cgua5TbABGlhnFmLqTutV43bQPlQTNXZzZCgkkZxVWzXGyMf46WumoTqlUd8fxS2KBbZ8hBx899X7JS5xQNajMjgzUm8A4NBx50Jv84jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNItB3hJR8HTx0KJ8PjIypGnnemUx5vBRKuGjyE6Osw=;
 b=GcAepgZ1S5c6cLyZyIzfO9Z21DE4P/YqdcW3+HaNRpyN0aA/dk5JQgoD3Eu+ruC7pYUzGuLMrHK0S//uF0R9KOmUQkurmhBBXoFv7jdazI6JRLzlLKffRqzzFWgcbohOffru1wAfhY62AwT9DY1lKbR7kjRymUzyVcUUJmrH17QlhLNnzqGhSTWYrx0hbLOeBtwm/TRK6XC4YV2VCCRdCXwmLu/T/0gYDg0KrAFsnRZ9dcQBCXyQvAu8ftIYAHDC43p6HSyNZ3XtWxKXBjo8zG/s5UsnXnEB6g7gnFAkBjujkoS2c5rPzRuLx0BX4mUEh74tVMh7g2A5bkesawJ3eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYXPR11MB8690.namprd11.prod.outlook.com (2603:10b6:930:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 23:10:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.023; Thu, 30 Nov 2023
 23:10:05 +0000
Date: Thu, 30 Nov 2023 17:10:02 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <xqhglc6kukdoq5rf6cwz3ovcreuy7m7z3eixpasmdkitij4t3z@jzhczrrzu7mp>
References: <20231128151333.4068550-1-tejas.upadhyay@intel.com>
 <20231128151333.4068550-3-tejas.upadhyay@intel.com>
 <80cd47a5-f157-4847-8242-df842c2e2aec@intel.com>
 <SJ1PR11MB62045C5257D79A6B5E47CCCF8183A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZWj_dpyE75C_Ippr@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZWj_dpyE75C_Ippr@intel.com>
X-ClientProxiedBy: BY3PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:217::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYXPR11MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: e6da36bb-bc11-4554-170d-08dbf1f97c71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m3PGJvhvgc89waYOv8XVd9yhMBnF+vDoNUmmt7QklCtbdUaW6IbGE8+tVHPa/Up+hSq8Kt8t8pXTPflTweJzxLEkicwAMjj5QnX0/VwtuPPYTfw3n/3tNK0egfxVmdi7hS5K9J/gnXI5GNCdhF3naR4E/oguNgcYGvxdm+DKZcCZz9P7Jw1F2QmYNLGnNIg/4Fo5UlBXUmoiJf2AVri8fajdKUa43NYNOztVT0E4U4fZSSzFfysXoJ72N/dCpIKVBz2gFs8JnJoAPWzoQkwkiy2U7LcR93mMtp3emKp1R3uKbvDGJRKYXQl7Bg395IjNIL2vuTxtkjlL0B8ehvYAnwRnxUjQWE93tSFgAgUHE3u6TdVSmDA+0e8NImZBL4irLbdSkRQAoH+tlPkOkXbfxE3+xcSGPg0+vMKRKFAtWYwERSCr4vJ9FiYEappGxykG4+49SONMJhteHHg+hGIKEFfLpnH1p9OHuR4ZrT3lvj+aOrJV+jRODouR/neOKBTT4m+m+6W7xP5gyN7eKI5UGqaoxKEFjWuatEYxPqcccWE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(346002)(396003)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38100700002)(82960400001)(54906003)(6862004)(6512007)(41300700001)(9686003)(6636002)(83380400001)(316002)(66556008)(6486002)(66946007)(6666004)(478600001)(66476007)(6506007)(53546011)(5660300002)(2906002)(966005)(26005)(4326008)(8676002)(8936002)(33716001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n2eO/6xGophVrjdDTHFTTUh40iAq6dhJTqm5LM061NkD7uIumuPdqGqdKcHC?=
 =?us-ascii?Q?0zC2q6PO4AbmEJg/7/xDAVTN7ojTh/OWJqX1DmB4Demh/MB7gVWLrerPkrhp?=
 =?us-ascii?Q?uOTJdQbUvy1Qxm8bLE0yTLRni5RdtZdpLDpgjFGA3n7pITRwm5Xp4TitK17U?=
 =?us-ascii?Q?71BialR4kWD1rFdsO0FT8dZoUG79Ho5VS8ApA+takw3g0U9qNmHZnkBDOGDu?=
 =?us-ascii?Q?hHPIBkm6oRPT8iM6dXUMUjNE+3JSCODCrtWKRs78A/8IZU5wqltOnqPlMpLd?=
 =?us-ascii?Q?1PSmOHDpRgmvNnI/pCM0r3h9ruIUlOm884y+KO6Z5dR8XdFgdjeDvXlG/Rzv?=
 =?us-ascii?Q?XwSlng++bjfjLhyOfKsjdFK/FS5fb3iODw1q14ukQ3SS8uf+Q6skhkUhPv6N?=
 =?us-ascii?Q?rcJ+ixzJcB4HXC4k22gvb63Fw/5Z9zBecPo0byY1wD8eqK9Crkntn3cLqe+d?=
 =?us-ascii?Q?auEQEhi7glpPe23sb+8YywDrfIuaXEI00XCV2AS+NWKE4BiJitKK+3qnQAoJ?=
 =?us-ascii?Q?4S0NqfXSnXKM7AL6SvWlnquZWFtnRxVro1Sbi0nlJ+J+IGC9Clu0S/BSLKsC?=
 =?us-ascii?Q?uC+zhsGERqEWX8iympG97q3m1QcyQiyJb/9Jy27qKaQ8bSGm4JryhJN/a9v6?=
 =?us-ascii?Q?L3ynlX2HvxOtFOVX4Qx+myd3bHSQsyMSPTR8DOARb2DOBzMqLf7SY4t0AoBX?=
 =?us-ascii?Q?mplg69dhdqI9EbCeN+l9DDonJmg3/T2zc7XW0f4AarD61rdKxqF5AodnGtPO?=
 =?us-ascii?Q?Wp0QNB70bVs4oIrgQPD62oo1qYRhh1Fq2nXmBOmypum6Tek2t02jjDBtfY3c?=
 =?us-ascii?Q?AjTyBcRiVCcd2kR5iQ39yN8/1G4QZFXdnh3AZHI5d1dopabHOnLSMcGBs1ea?=
 =?us-ascii?Q?oGSnwXLnYseneGO9tY7QX53opZys6LcfS4ypAxe/HZsVzCf/Tv91Gq0rcwBh?=
 =?us-ascii?Q?beyDSggIVwlHwdDIWEpbjeFbfLxHnohKJLkBRw/55EtjeLr0OrR+WBbMeFPF?=
 =?us-ascii?Q?98C84Kmo2DtBIfCzn3tvHqeozX++2UVjjZxzQywU5ujQFxb4qVWlzt4CWI+3?=
 =?us-ascii?Q?hnljWZ8mxV4FYSxHxFB53jZHJg1nUE6ThbiCS7sflFOFeRHuuOYH7nIhxYde?=
 =?us-ascii?Q?U1yF2TKoKN7wG1bzbb8MnJp7rRi8PWGfyFd8n0gtq6VtotG9XZ6yv9Qr02CX?=
 =?us-ascii?Q?4FjBaLp8AzmdfjpuAjorxsbklV0y5e53NrmDk38aImpILtiqB2SWiLnd/NYT?=
 =?us-ascii?Q?KNAJQBXTgsB8I+un8sQAAdqorJ2McT/b9BNKPwQuyK8hUGZgMWWergI90ZlG?=
 =?us-ascii?Q?+ClSYzHF59uRL/4EZvPDRPW4nfDANQ5pcfFlxmyo6mn/4Bz9qLZVq6NWmsml?=
 =?us-ascii?Q?r6aFWTjFgjozxaGoJ08ROHNhvECi2GuDQgW/6oJ6knnyPZIQduSOntLirrIR?=
 =?us-ascii?Q?fD1lIvJVi9Ieli991UDUtrc7e/IcNUWkE9TLH43ENN5wvxt1EQl+nf+JTuFW?=
 =?us-ascii?Q?UlxJ8nr8opJvCYkOXMVLMu06Nqk2tpYWnGWoGQ2wdbPUhk0p3NN2Dbl7E/z1?=
 =?us-ascii?Q?pEIJ6fw7YIYk7tXASMgHCpe8BmSZjoSUWq3c29mB+cGCAYxF9q/UHLOJMyUC?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6da36bb-bc11-4554-170d-08dbf1f97c71
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 23:10:04.3640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arF/AIVpeqMeyWM8aToUhpFA7EImIBswyK5sj0X/4uJfxAzSdvuA/YIsZGa4DAwfBf0LTfXCPQPU07AhSBEtPd33aXpvGCuTxfdc7NzBaFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8690
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 2/3] drm/xe/ats-m: Expose uid for ATS-M
 via sysfs
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

On Thu, Nov 30, 2023 at 04:32:38PM -0500, Rodrigo Vivi wrote:
>On Wed, Nov 29, 2023 at 12:00:39AM -0500, Upadhyay, Tejas wrote:
>>
>>
>> > -----Original Message-----
>> > From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
>> > Sent: Tuesday, November 28, 2023 10:31 PM
>> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> > xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> > Subject: Re: [Intel-xe] [PATCH V3 2/3] drm/xe/ats-m: Expose uid for ATS-M via
>> > sysfs
>> >
>> >
>> >
>> > On 28.11.2023 16:13, Tejas Upadhyay wrote:
>> > > On ATS-M CSC firmware calculated unique device id(uid) can be read
>> > > from defined registers. Only ATS-M has this way of reading uid. Also
>> > > ATS-M customer require this solution to locate and name their devices
>> > > effectively.
>> > >
>> > > Consumer of csc uid is level0 sysman and end users using sysman.
>> >
>> > is this generic UID or UID only specific to CSC firmware ?
>> > if former then maybe just name it as "uid" or "uuid" ?
>> >
>> > >
>> > > This patch exports uid to the userspace via sysfs.
>> >
>> > as this defines uabi, shouldn't this series go over dri-devel ?
>> >
>> > + @Rodrigo
>
>The biggest problem that I see here is actually the justification.
>It doesn't matter which wrapper are using our sysfs or not.
>
>A better commit message would be something like:
>
>In case of multiple similar dgfx cards plugged to the same node, the
>user cannot rely on DRM card number nor on PCI address to identify
>which exact part it is operating at since these numbers can change
>upon order enumeration. In the case of FW flashing or other cases

kind of sounds like what we have for network with predictable
network names.

https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/ch-consistent_network_device_naming

This would provide the firmware naming, but I wonder if it can't
be solved today entirely in userspace.

>where the admin might know specifically which device it is accessing,
>it needs to have an unique identifier number. To solve this case,
>CSC FW provides an unique number that can be query. Let's expose this
>number in the sysfs to make the device clearly identifiable.

if this is the justification (like you said, it should be in the commit
message so we know what's the use to give a proper review), then it also
answers the question "why is it ok to wake the device on sysfs access
rather than doing on device probe?" asked elsewhere: because clients
will almost never access it. It's not like a userspace client is reading
this value 10 times per second

Lucas De Marchi

>
>> >
>> > > For example, uid can be read by:
>> > > cat /sys/class/drm/cardX/device/csc_uid
>> >
>> > as this is more Xe driver extension then maybe
>> >
>> > /sys/bus/pci/drivers/xe/<BDF>/uuid
>> >
>> > >
>> > > V2(Michal):
>> > >   - Make separate patch for csc uid capability
>> > >   - Use %#llx for 0x
>> > >   - Dump error value when sysfs creation fails
>> > >   - Have consistency in csc uid name
>> > >
>> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
>> > >  drivers/gpu/drm/xe/xe_device.c       | 11 +++++++++++
>> > >  drivers/gpu/drm/xe/xe_device_sysfs.c | 21 +++++++++++++++++++++
>> > > drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>> > >  4 files changed, 37 insertions(+)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
>> > > b/drivers/gpu/drm/xe/regs/xe_regs.h
>> > > index ec9372aa739f..3599c7b38b61 100644
>> > > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>> > > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> > > @@ -71,6 +71,9 @@
>> > >  #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
>> > >  #define   SGSI_SIDECLK_DIS			REG_BIT(17)
>> > >
>> > > +#define DEVUID_LWORD				XE_REG(0x102008)
>> > > +#define DEVUID_HWORD				XE_REG(0x10200C)
>> >
>> > Bspec uses different names .. and LWORD/HWORD look strange but since it's
>> > for SW use then maybe at least (assuming ATSM is XEHP):
>> >
>> > #define XEHP_DEVUID_LDW				XE_REG(0x102008)
>> > #define XEHP_DEVUID_UDW				XE_REG(0x10200C)
>> >
>> > > +
>> > >  #define GGC					XE_REG(0x108040)
>> > >  #define   GMS_MASK				REG_GENMASK(15, 8)
>> > >  #define   GGMS_MASK				REG_GENMASK(7, 6)
>> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
>> > > b/drivers/gpu/drm/xe/xe_device.c index d60379d844d2..b54635d512d6
>> > > 100644
>> > > --- a/drivers/gpu/drm/xe/xe_device.c
>> > > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > > @@ -355,6 +355,15 @@ static void xe_device_sanitize(struct drm_device
>> > *drm, void *arg)
>> > >  		xe_gt_sanitize(gt);
>> > >  }
>> > >
>> > > +static void xe_read_csc_uid(struct xe_device *xe) {
>> > > +	if (xe->info.has_csc_uid) {
>> > > +		struct xe_gt *mmio = xe_root_mmio_gt(xe);
>> > > +
>> > > +		xe->info.csc_uid  = xe_mmio_read64_2x32(mmio,
>> > DEVUID_LWORD);
>> > > +	}
>> > > +}
>> > > +
>> > >  int xe_device_probe(struct xe_device *xe)  {
>> > >  	struct xe_tile *tile;
>> > > @@ -379,6 +388,8 @@ int xe_device_probe(struct xe_device *xe)
>> > >  	if (err)
>> > >  		return err;
>> > >
>> > > +	xe_read_csc_uid(xe);
>> > > +
>> > >  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
>> > >  	if (err)
>> > >  		return err;
>> > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> > > b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> > > index 99113a5a2b84..4fbf0275d3bf 100644
>> > > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> > > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> > > @@ -65,11 +65,24 @@ vram_d3cold_threshold_store(struct device *dev,
>> > > struct device_attribute *attr,
>> > >
>> > >  static DEVICE_ATTR_RW(vram_d3cold_threshold);
>> > >
>> > > +static ssize_t csc_uid_show(struct device *dev,
>> > > +			    struct device_attribute *attr,
>> > > +			    char *buf)
>> > > +{
>> > > +	struct pci_dev *pdev = to_pci_dev(dev);
>> > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> > > +
>> > > +	return sysfs_emit(buf, "%#llx\n", xe->info.csc_uid);
>> >
>> > if there are no plans to use this value in driver then maybe just read it here as
>> > it was already suggested by Lucas
>>
>> Why to wake GT on every sysfs read and read those registers? Does not look correct in my POV.
>
>Why not to wake? it shouldn't be a query that user is doing every time right?
>
>>
>> Thanks,
>> Tejas
>> >
>> > > +}
>> > > +
>> > > +static DEVICE_ATTR_RO(csc_uid);
>> > > +
>> > >  static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
>> > > {
>> > >  	struct xe_device *xe = arg;
>> > >
>> > >  	sysfs_remove_file(&xe->drm.dev->kobj,
>> > > &dev_attr_vram_d3cold_threshold.attr);
>> > > +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_csc_uid.attr);
>> >
>> > it's sad that we don't have proper groups defines and need to add each
>> > attribute separately (but that's not your fault)
>> >
>> > >  }
>> > >
>> > >  void xe_device_sysfs_init(struct xe_device *xe) @@ -83,6 +96,14 @@
>> > > void xe_device_sysfs_init(struct xe_device *xe)
>> > >  		return;
>> > >  	}
>> > >
>> > > +	if (xe->info.has_csc_uid) {
>> > > +		ret = sysfs_create_file(&dev->kobj, &dev_attr_csc_uid.attr);
>> > > +		if (ret) {
>> > > +			drm_warn(&xe->drm, "UID sysfs setup failed
>> > err=%pe\n", ERR_PTR(ret));
>> > > +			return;
>> >
>> > if you exit here, you will leak dev_attr_vram_d3cold_threshold
>> >
>> > > +		}
>> > > +	}
>> > > +
>> > >  	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini,
>> > xe);
>> > >  	if (ret)
>> > >  		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
>> > diff
>> > > --git a/drivers/gpu/drm/xe/xe_device_types.h
>> > > b/drivers/gpu/drm/xe/xe_device_types.h
>> > > index 268a40639ec5..e88b64cb0eca 100644
>> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
>> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> > > @@ -239,6 +239,8 @@ struct xe_device {
>> > >  		u8 vm_max_level;
>> > >  		/** @va_bits: Maximum bits of a virtual address */
>> > >  		u8 va_bits;
>> > > +		/** @csc_uid: device uid calculated by CSC FW, used for
>> > generating uuid */
>> > > +		u64 csc_uid;
>> > >
>> > >  		/** @is_dgfx: is discrete device */
>> > >  		u8 is_dgfx:1;
