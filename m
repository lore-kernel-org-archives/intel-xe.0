Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C7DC47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 18:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0415E10E660;
	Thu, 16 Nov 2023 18:38:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C02510E660
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 18:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700159936; x=1731695936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WtGe4P1Wofq/CCxqex9G8u0IlbOm2jBBdXr4EjjUW2k=;
 b=QibUqCLsaAV6shZ78kIME03gxftsddfoDUfTaYG7F4AGKVoRmaZhKzdq
 G138vYEiJRe5+VnyIfhU0atkjgttpZLZjx29J/fZmqIqNSiadEVMPPUcD
 QXzNedyuJqg3EbVYAT1HTq8/sW70pEEg27j+NC06Vi8aybLgKvQO4g4NL
 STEylnxt/e0id731I+lrEHBapRWtxHkV6umi5Hx6OB1iPQrjQd9fZ3uKB
 vAt0lB7M2n3amdWRYZwHN1lVSAfwVrSnOp8R5S+/1nUeAHsXi/alytsUp
 P79MzZ6oWh0RMTUxRvV9+XR91Oa+WT/nvgbKCoH7FC60IWcEGYfu9KANw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="457649901"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="457649901"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 10:38:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1012695397"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="1012695397"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 10:38:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 10:38:55 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 10:38:55 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 10:38:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUo2vcTkOAYv+vLY/9gZvEml8CTEjtBVtwHMhuo6pua6eMLEQiyDMcUZNfwHzjtr7a3nCfApTosyw9THYqeIuTscgNCq2tu83gQyTLyJLvreMjsrNdHAthNj557rybYcC96NVGEPw6gXv1CvGxVbTP5oZKCZr0QJKtB8nXxwo+gxOeS34lIZg6qhV44wcifDCjjwx0sPEy8Elo7OmeX3VPquo40pg/uP9LjHefUskedQ9wghRBpDAoZ83O4EbV1StIVPCWokzVNjysX+qWsn4MGgU8l6gUNcoyExtfxjljx8O47vmE4PceSBeSzr42g33Jca8HWrBqmxIhcymu6p0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnsAFechbhW/bx3L5teB20WEdwpn5YHeYCPNlOWZfoY=;
 b=GtpQLV4X2kwo2b3Ikfm4h2AJCpLng2QMJh3Q39HyA4cqQ9wzYIzSGeO9wJkZETP5JSqcoBxmDsrA8Ui9GeLwW5YYv6g0v38GFkJCLTyFEedLUFtB/0ulQCorqxcDh56mbo7kPQeVOKD0cQiE7xBJtMhQoesxjbMp7MOs/FnY/ti27LhnZDqZGHgENPkedlXrkuNJ6kMAiId44JLp+caCrExqfHcpL1DQ2nXRbEgfAc4dltUx7sKRLg8wDGQuBIRLe7KVkgGdX4w1l95arDK0R9Czk9YBZwjXKvoDXLnrOcRFC7qhpeP1S7py2Tbd2n1YmUHSv6zidjwggWjbIYx4uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.34; Thu, 16 Nov
 2023 18:38:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 18:38:50 +0000
Date: Thu, 16 Nov 2023 10:38:47 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231116183847.GY5757@mdroper-desk1.amr.corp.intel.com>
References: <20231108135418.3049168-1-tejas.upadhyay@intel.com>
 <20231108135418.3049168-2-tejas.upadhyay@intel.com>
 <a4701efa-eab1-4a65-94ce-2c08107db9d1@intel.com>
 <vnyr2nbirfddf5yh4q7lskbwrq4hk7v3ngosrazuwiioaufsml@qckippjlrtvb>
 <SJ1PR11MB62048CEAD7DA514798ACC56081B0A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <hncyh7w7yxikk6572pzgsdb432jc3sxzq5wvjxqi5ujqhoa772@jlp3v3air7oy>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <hncyh7w7yxikk6572pzgsdb432jc3sxzq5wvjxqi5ujqhoa772@jlp3v3air7oy>
X-ClientProxiedBy: BY5PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: c7464391-d0c1-42e3-67fa-08dbe6d3468f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gdfj1M70SJx1RzoIDey7VtqeLfAEFuFsErPu3a7cZdEbd3mzilvkcaXA1L7IIas09wwPEbYY2o5L1SkyqULV626eUD7rxArngOsJLkHF8kyCNvutFDRqWLCQsaMaU4bJBtH44CEL+BPW9hO9Ay3NA7kG4VvisNkEcPybl8JP1waXaYmCAupQxOy8duM8jcRy2YaK9PSo6lY/wOL6m9l/y0wwfrcEuMbGGg5CJr7M2HaiEgmNI2gQxkl1rnZhKWqaPA7TBKDaIMvALTpIB22BsZ4nijxL62SEwlQVO3q8ZulCjTDu2J1HOcCn8G5O6llCk0kpxx5KnGicSHlc/Lh2yyGZlQx9T+diFi8uKj9nKa44Bdf27v0zUCT3ebdjII/vRb17ilYWTRV6CPo6iqTlSQ6REfgTfZuK8fIPG185lJtK5UyAGNPe4cQ5aIKNDBrrgPNKxPjUsQsLrNl1nBNDMnlfVTkt3Fq9SxXxLWhHp0kXRfsigy0yVyq4QBYGtTbkgYK1l0gfSh1ga/Ef8xHdYmNZ1TvmPv63s7GUISOBWV7jo83H9iV8nn8VZOdOY7cf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(39860400002)(346002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(4326008)(8936002)(66946007)(66556008)(2906002)(6862004)(8676002)(41300700001)(5660300002)(82960400001)(316002)(66476007)(54906003)(6636002)(38100700002)(33656002)(478600001)(83380400001)(6486002)(6512007)(66899024)(1076003)(26005)(6666004)(6506007)(86362001)(53546011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RzQlQgkoovc7atg/0kk+MvSXc9+ATHPK9fXsk2mfSLW8L1JpLFHmMNde6H/5?=
 =?us-ascii?Q?cC+bpPvkcoU5KVudSnLymJ++zv4htFPr/q8ZcLeviHxaG/NF5Z+c9HpknGyF?=
 =?us-ascii?Q?Sg0osrRvGQoxZedcAZvcO1dZ4kaTKexM27QhkOJGGuHWbBzCa1Bi3QVnIs4y?=
 =?us-ascii?Q?qlkU8CPCUc8g4IPF0hgA0DW1reSmx/PtHIEwgEAxMh9vD1BAd95bwBbJRwMe?=
 =?us-ascii?Q?dEf/LB8+ajeUzTLmgnn9nz6YaVIH8jQYr1S7hmf4g/fhbyPbQ8ToAmkjH82k?=
 =?us-ascii?Q?0kyb503VRerkMvZNyq95WnQ0D+83Isa2XZmstpt2ynU0/0MKCP0P0vCx0Vby?=
 =?us-ascii?Q?EzFwU+lvoM1a/N7CMWsHtnMcT5DHTDcMl/xYuhwSoThX2Z7UNaddbMD9RlS0?=
 =?us-ascii?Q?VVqFIZSLxS3ppkIgrVMAFWmy0OnnvBtnxWNJuQFP/oHUKg7iyP//y0eP18gz?=
 =?us-ascii?Q?MK+3kidTkc9oxqpzg+sTWaFkjks6Mi/hvO3i6oC726oAc04s1VmI0T8kgjZL?=
 =?us-ascii?Q?PtLxGrNjWKr6VUe2u8iRI/wO/Qdy0j3V1G5ZwHSCjDJcJPm/Pq6Ov1tYk0T2?=
 =?us-ascii?Q?nJ9+QNA8H/XbCuqWcOP93187oabUJwdvR0ETK9PmO5tHSPmaN3qDf1HiBFAX?=
 =?us-ascii?Q?opxH3jb+n/F0wiaOUH1I/wRmOquwt7YchSNBbQmr06mkHqEZoa0VXdBDUYfa?=
 =?us-ascii?Q?Bbs3Zsrik3SrhOBIzRkq5L2KEi1WrQxtQTkjvHH2su7FFZECh7o5sg6l2ufb?=
 =?us-ascii?Q?Fg6kBYl732JEpFz+cRBXrmOIkowiKstyvIL3HD/gIGScIdoWKSUn1YUDchRF?=
 =?us-ascii?Q?YNS+g0YYMiNkohXyjUCd9J34hEwR9zNKVG1iMiUM5YkYS8yWzK5vuLWueRql?=
 =?us-ascii?Q?EJZXklldQta9kI0rVvim5P38Rahq3S/R5cXkvLbA+lpBabnrlzCo+NvzDYrL?=
 =?us-ascii?Q?WRfKk2Iml37vnpl+QN45WT/+h2/Nv6WNan7nLec2OfFVfcZ+uxJUaZQ7MVSn?=
 =?us-ascii?Q?B7IZvG/C5yxlCEFqwgKBWVUe5MMtqioK9OGUozYM218BJnIsEsb0O84Ziwwr?=
 =?us-ascii?Q?Diokkw5i3lwNoedc9hGUed+qmPPMKmBaCabuu4D3khIJ39FiB+4i3JAf3nt1?=
 =?us-ascii?Q?sWxVaRNbFPdu7smaEnDDKIfVquSHL0cLprnM6zdoH6a1xD3F+2Ap9GxvXZdf?=
 =?us-ascii?Q?Gk1U8NiT6y9n5/Zkb3052MT926FtUxvy3irpH9FjRCwzLT5zT3SgL3aAlzXU?=
 =?us-ascii?Q?P3TZIqk8TX/jNns5fm7iXowj16wJhMGoWLdpfqsExP9KCrOebaDC7nl9mO+e?=
 =?us-ascii?Q?fgCakgAM4nrYi7l/52OvoxGud6/HzhESYOeiKqqknrSjMdEfX7yPdzUbuAsZ?=
 =?us-ascii?Q?5QNJxGPslx8Cf3u43aTmxhxlaXWljcZn2j3LP0CxI6XLj66XwbPGT35Qqblq?=
 =?us-ascii?Q?HkBc+wtSAogkYvClg1eYR3YDbpLBKb2M8DKkTph72daEaaG1TZ1a1ofVzl+v?=
 =?us-ascii?Q?uLjjMPwAoKqMn4a+SPMDYmbJ+waAJF6xAnR3Pw3xZTHfrqEgmet0mOw79w39?=
 =?us-ascii?Q?HtlmpKyZPJJqoL+uJGIeMJh5V7S8GEnMC5XOkZck24LyyE9B7uNWZR5hdmtS?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7464391-d0c1-42e3-67fa-08dbe6d3468f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 18:38:50.1033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PypeGJTQRJIsjQ9BiS3opmnh2aiQfF69nsldevOnjHE8LZ49Ukuf9c2qiH+COVaH0d7+YOFfwmz0Jeqx+gl2x6k8rpsg6MhT0j9mHe1HdCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
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

On Thu, Nov 16, 2023 at 12:25:37PM -0600, Lucas De Marchi wrote:
> On Thu, Nov 16, 2023 at 05:59:56PM +0000, Upadhyay, Tejas wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: De Marchi, Lucas <lucas.demarchi@intel.com>
> > > Sent: Wednesday, November 8, 2023 9:26 PM
> > > To: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > xe@lists.freedesktop.org
> > > Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/ats-m: Expose uid for ATS-M via
> > > sysfs
> > > 
> > > On Wed, Nov 08, 2023 at 03:07:45PM +0100, Michal Wajdeczko wrote:
> > > >
> > > >
> > > >On 08.11.2023 14:54, Tejas Upadhyay wrote:
> > > >> This patch exports uid to the userspace via sysfs.
> > > >> For example, uid can be read by:
> > > >> cat /sys/class/drm/cardX/device/csc_unique_id
> > > >>
> > > >> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > >> ---
> > > >>  drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
> > > >>  drivers/gpu/drm/xe/xe_device.c       | 11 +++++++++++
> > > >>  drivers/gpu/drm/xe/xe_device_sysfs.c | 21 +++++++++++++++++++++
> > > >> drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
> > > >>  drivers/gpu/drm/xe/xe_pci.c          |  3 +++
> > > >>  5 files changed, 42 insertions(+)
> > > >>
> > > >> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> > > >> b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > >> index a646d13af03a..1b8de9b8daf1 100644
> > > >> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > > >> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > >> @@ -70,6 +70,9 @@
> > > >>  #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
> > > >>  #define   SGSI_SIDECLK_DIS			REG_BIT(17)
> > > >>
> > > >> +#define DEVUID_LWORD				XE_REG(0x102008)
> > > >> +#define DEVUID_HWORD				XE_REG(0x10200C)
> > > >> +
> > > >>  #define GGC					XE_REG(0x108040)
> > > >>  #define   GMS_MASK				REG_GENMASK(15, 8)
> > > >>  #define   GGMS_MASK				REG_GENMASK(7, 6)
> > > >> diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > >> b/drivers/gpu/drm/xe/xe_device.c index 515cdf599fab..266e0d5d7159
> > > >> 100644
> > > >> --- a/drivers/gpu/drm/xe/xe_device.c
> > > >> +++ b/drivers/gpu/drm/xe/xe_device.c
> > > >> @@ -344,6 +344,15 @@ static void xe_device_sanitize(struct drm_device
> > > *drm, void *arg)
> > > >>  		xe_gt_sanitize(gt);
> > > >>  }
> > > >>
> > > >> +static void xe_read_dev_uid(struct xe_device *xe) {
> > > >> +	if (xe->info.has_uid) {
> > > >> +		struct xe_gt *mmio = xe_root_mmio_gt(xe);
> > > >> +
> > > >> +		xe->info.uid  = xe_mmio_read64_2x32(mmio,
> > > DEVUID_LWORD);
> > > >> +	}
> > > >> +}
> > > >> +
> > > >>  int xe_device_probe(struct xe_device *xe)  {
> > > >>  	struct xe_tile *tile;
> > > >> @@ -368,6 +377,8 @@ int xe_device_probe(struct xe_device *xe)
> > > >>  	if (err)
> > > >>  		return err;
> > > >>
> > > >> +	xe_read_dev_uid(xe);
> > > >
> > > >as this function updates xe->info then maybe it should be a part of
> > > >xe_info_init() ?
> > > 
> > > or not update info at all
> > 
> > We need mmio init before we access those regs, thus it needs to be in xe_device_probe() where mmio init is done.
> > 
> > @De Marchi, Lucas not update info at all? Do you mean read the reg everytime sysfs asks? That would require GT to be awake everytime we need to read which does not look good.
> 
> that goes back to the other point that there wasn't a proper commit
> message explaining the use. How often will userspace read it? Why does
> it need that?

Is this something that we even want random, unprivileged userspace to
have access to?  From the name, it sounds like this provides some kind
of unique ID (like a serial number?) that could be used to uniquely
identify a specific GPU.  In some settings that could raise privacy
concerns and may not be desirable.

We definitely need a better explanation of exactly what this is and what
the goal of making it available is.


Matt

> 
> I was actually meaning that stashing this inside the info and thus
> requiring the specific initialization order may not be the best
> approach.
> 
> AFAICS this is only used to cache the value of that register and expose
> on sysfs. From the kernel side we don't really need that value for any
> initialization, so you could just read it very late and stash directly
> on xe.
> 
> That said, there's a series from Michal Winiarski splitting the xe_info_init(),
> and it would already have mmio init done.
> 
> Lucas De Marchi
> 
> > 
> > Thanks,
> > Tejas
> > > 
> > > >
> > > >> +
> > > >>  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> > > >>  	if (err)
> > > >>  		return err;
> > > >> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > >> b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > >> index 99113a5a2b84..66f69eada76f 100644
> > > >> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > >> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > >> @@ -65,11 +65,24 @@ vram_d3cold_threshold_store(struct device *dev,
> > > >> struct device_attribute *attr,
> > > >>
> > > >>  static DEVICE_ATTR_RW(vram_d3cold_threshold);
> > > >>
> > > >> +static ssize_t csc_unique_id_show(struct device *dev,
> > > >> +				  struct device_attribute *attr,
> > > >> +				  char *buf)
> > > >> +{
> > > >> +	struct pci_dev *pdev = to_pci_dev(dev);
> > > >> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > >> +
> > > >> +	return sysfs_emit(buf, "%llx\n", xe->info.uid);
> > > >
> > > >%#llx
> > > >
> > > >otherwise there will be no 0x prefix so could be treated as decimal
> > > >
> > > >> +}
> > > >> +
> > > >> +static DEVICE_ATTR_RO(csc_unique_id);
> > > >
> > > >what's "csc" ?
> > > >
> > > >in patch you use different names:
> > > > - csc_unique_id
> > > > - UID
> > > > - devuid
> > > 
> > > Agreed. Besides that, the documentation and commit message need to
> > > answer the *why*, not only how.
> > > 
> > > Why is this being exported, and what's userspace supposed to do with it.
> > > Btw, what's the accompanying userspace to use it.
> > > 
> > > Why is this in sysfs rather than a query? Is this something to be used by a
> > > sysadmin for something rather than the app using the device?
> > > 
> > > Why is this special to ats-m? Bspec shows nothing for the register you are
> > > adding.
> > > 
> > > Lucas De Marchi
> > > 
> > > >
> > > >
> > > >> +
> > > >>  static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
> > > >> {
> > > >>  	struct xe_device *xe = arg;
> > > >>
> > > >>  	sysfs_remove_file(&xe->drm.dev->kobj,
> > > >> &dev_attr_vram_d3cold_threshold.attr);
> > > >> +	sysfs_remove_file(&xe->drm.dev->kobj,
> > > >> +&dev_attr_csc_unique_id.attr);
> > > >>  }
> > > >>
> > > >>  void xe_device_sysfs_init(struct xe_device *xe) @@ -83,6 +96,14 @@
> > > >> void xe_device_sysfs_init(struct xe_device *xe)
> > > >>  		return;
> > > >>  	}
> > > >>
> > > >> +	if (xe->info.has_uid) {
> > > >> +		ret = sysfs_create_file(&dev->kobj,
> > > &dev_attr_csc_unique_id.attr);
> > > >> +		if (ret) {
> > > >> +			drm_warn(&xe->drm, "UID sysfs setup failed\n");
> > > >
> > > >if you really want to print warn then maybe also include %pe to help
> > > >diagnose why it failed
> > > >
> > > >> +			return;
> > > >> +		}
> > > >> +	}
> > > >> +
> > > >>  	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini,
> > > xe);
> > > >>  	if (ret)
> > > >>  		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
> > > diff
> > > >> --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > >> b/drivers/gpu/drm/xe/xe_device_types.h
> > > >> index 4119ef03fb7e..1cc8488f8c86 100644
> > > >> --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > >> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > >> @@ -238,6 +238,8 @@ struct xe_device {
> > > >>  		u8 vm_max_level;
> > > >>  		/** @va_bits: Maximum bits of a virtual address */
> > > >>  		u8 va_bits;
> > > >> +		/** @uid: device uid, used for generating uuid */
> > > >> +		u64 uid;
> > > >>
> > > >>  		/** @is_dgfx: is discrete device */
> > > >>  		u8 is_dgfx:1;
> > > >> @@ -261,6 +263,8 @@ struct xe_device {
> > > >>  		u8 supports_mmio_ext:1;
> > > >>  		/** @has_heci_gscfi: device has heci gscfi */
> > > >>  		u8 has_heci_gscfi:1;
> > > >> +		/** @has_uid: device has uid, used for generating uuid */
> > > >> +		u8 has_uid:1;
> > > >
> > > >IMO introduction of has_uid capability flag should be done in separate
> > > >patch than sysfs and uid changes
> > > >
> > > >>
> > > >>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > > >>  		struct {
> > > >> diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > > >> b/drivers/gpu/drm/xe/xe_pci.c index 2fae45b9d88e..4d91ad049e59
> > > 100644
> > > >> --- a/drivers/gpu/drm/xe/xe_pci.c
> > > >> +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > >> @@ -60,6 +60,7 @@ struct xe_device_desc {
> > > >>  	u8 has_heci_gscfi:1;
> > > >>
> > > >>  	u8 has_llc:1;
> > > >> +	u8 has_uid;
> > > >>  	u8 bypass_mtcfg:1;
> > > >>  	u8 supports_mmio_ext:1;
> > > >>  };
> > > >> @@ -298,6 +299,7 @@ static const struct xe_device_desc ats_m_desc = {
> > > >>
> > > >>  	DG2_FEATURES,
> > > >>  	.has_display = false,
> > > >> +	.has_uid = true,
> > > >>  };
> > > >>
> > > >>  static const struct xe_device_desc dg2_desc = { @@ -577,6 +579,7 @@
> > > >> static int xe_info_init(struct xe_device *xe,
> > > >>  	xe->info.graphics_name = graphics_desc->name;
> > > >>  	xe->info.media_name = media_desc ? media_desc->name : "none";
> > > >>  	xe->info.has_llc = desc->has_llc;
> > > >> +	xe->info.has_uid = desc->has_uid;
> > > >>  	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
> > > >>  	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
> > > >>  	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
