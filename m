Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D35C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 17:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216E210E2A0;
	Fri, 26 Jul 2024 17:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZf+Ddzw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B18110E2A0
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 17:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722014030; x=1753550030;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2TULWH1oL/uhfy93fdCsfqLiq1jYbWSXoujW8ru8VLw=;
 b=mZf+Ddzw7HLcFk0F/h8m0uHEnQmgMs3qDxeSATAgeNPblz4hX92xWuDl
 vndiGKREAcvitUjAmfy4dYoTfZuLK5dCY/3G0bL1KIOrE+EGyzDOIq79G
 CQemy+GZhmhkGeyVqvOmRtwWl29SrtNtXDne/I+UOi4Ubx+clfVplCS7u
 r5Hhf7Tmz0A+vGnO9E3FMWAgVelSvwN9JlpAEqv7NbP9iPmMWx2dp9hfm
 YTx4Br3AgjWtZNVO6gseFeQxHwMnQvxfa83CWpcLiYk6yJo9Nbji/ow4a
 +Mr8qA5lFB6D/tkM7D0zs3Q66F3ouM5lqFdcv49FO29VGfwmf2tUUh32H g==;
X-CSE-ConnectionGUID: +mUPGq6YS2ygqJoFA3gshQ==
X-CSE-MsgGUID: luec2FQkSW2eXHrm3bJZWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23617212"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="23617212"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 10:13:50 -0700
X-CSE-ConnectionGUID: KshOB6ZqQUW032vBcucfMQ==
X-CSE-MsgGUID: FJ2uZuBlSvOEkxXtsbCQEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="58110406"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 10:13:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 10:13:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 10:13:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 10:13:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 10:13:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STmzUbEo3kjYyFUFF0zwIWcp2cnQsQMpDZDIpBKO1gfPWBPOU4zLAYDwMXW0QjzARsGiaSycfSjBhfGhYQnpFOghyiwBKn/OwfK+XXGyUNjF0LNr/R2UwPfyG1RL5HwVwPX7ffL3LPhxU7plZghbRXpSOrTs62hKz4YBuIgcf/lYaYd07L/BRo8WhgIFjcSaHnCkRLG9wd4StlimxmzKjOgRb2mDQxbzxJbB/by5TqUmeeTiW8TQPVnuSR5uL8f5GSnS526sv7CbakQKLlIp1hYEBXk4fgrO4xlE89Uwqqt2lwGxgzP+y8mFw2aIUY07/1x/IFcWS/PoseUWk7m32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBwk5CUHRl3SmjCRjZ3Z6XTxptw4yAweBbH2gG58Aww=;
 b=jqtrk8xYMG6FXuTzvWjf4EHbSnuVR+REKfN9gpDmlKlP2qsTck5C+zLweza1MsbgRQ35eE0IS+GaT+S5XVeq5JhmHeEsCeMGbxeOX7vnpi2/aTWcCw1GA6z8ivmG/yPSmp0N0wfgZ+xpd3K3SwoiHIQZHl59XoupPAiFhmAlOmD4Hf54WFP6x4BGppoNSJ0CBKuubwJe5Aw9LgUHGeNZkcwoZUNS/naSjeNGGjGEaGLXzgo50nUf2am7eSv8TYNvlJFYbEz+o2sYe4unHLOu2OfYblEDwVZEZiCQ/DabyLAAZssmg6yzzXEDcJVSsJ2e48vseSdTJg6fxJttP5hqIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6015.namprd11.prod.outlook.com (2603:10b6:8:74::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.32; Fri, 26 Jul
 2024 17:13:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 17:13:46 +0000
Date: Fri, 26 Jul 2024 12:13:43 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix opregion leak
Message-ID: <zhbhammic33oz5yfwdlahxupaugoq5k44hmuzvcp2ptpgocmgn@lpqx2pdogzpm>
References: <20240724215309.644423-1-lucas.demarchi@intel.com>
 <ZqKHxVQFF96uNdfi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZqKHxVQFF96uNdfi@intel.com>
X-ClientProxiedBy: MW2PR2101CA0025.namprd21.prod.outlook.com
 (2603:10b6:302:1::38) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6015:EE_
X-MS-Office365-Filtering-Correlation-Id: ad19b7c5-0ba1-4a37-e5ec-08dcad964f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GzDbyWsWTGNv0jxnvHQJYRprxnuf5F4lMw04aEC7I2wOxdzOs3FZkm5TJmxq?=
 =?us-ascii?Q?8tYvL2ceo/qJHs2qQYBt0O5hD4CGk0llFIf+NECXgot6xUMrrBlYwSdgRpqe?=
 =?us-ascii?Q?j60+rb6GZdIKeO5+Cb+mBmq+cmTYbmGOKS1odtBX7CztWjsmJnaAqi2d9K6b?=
 =?us-ascii?Q?mzOdwZLgO4oiLPuN294XOIs4TQ30b7tr7/fSxs1atyPOPjtxUQ7xoL4WChj7?=
 =?us-ascii?Q?T5ykK+ifyI+egVUqeK13DE8BKunwOd1XL6X3USlxrHlGHSoftTI4p9XL7Wo6?=
 =?us-ascii?Q?nC0VFKw5AKOP6SizLxIEhs1kgO9HE4Tsf5hvwOhMfcjXl2cMYZtm1bkvaYAO?=
 =?us-ascii?Q?bIuuyrbUw769ohUOv3amrEZ8tgxDIP/3ZC3ZszDKJ4/7ZVPlmP/1LPmblLNQ?=
 =?us-ascii?Q?JXdWv+EBI5r+5EJb4tWJ9hP0HuH89ZGQH+wwINXT1sxoS23lVXWd1P8JAHdw?=
 =?us-ascii?Q?DkoPrs6SqUYS8gFzWYc4uLrcF8M7s8mv6Y02QGRQuJgLhpDEv/FqUxTfshDG?=
 =?us-ascii?Q?cEcSHYh/kDgG8/bBXUXs5oHypihRfRR/JZR0eWau96xEhsJ34GX87jSAn6jU?=
 =?us-ascii?Q?QhefLEsV9Oab2ts3pRMKKS5c35xQodv7IWgbiuo8w9hNeDvOnZ4yUgm1ZnJm?=
 =?us-ascii?Q?UYLqyrWU8+KAjtVI2qh7LWCLj8ZONWM6TDlRkVMX7huxNrxmCOJQe5cmKbeQ?=
 =?us-ascii?Q?NHl+y8qb+rd+q2yy0GUKiggpMlTAZGSzSlMlQ8e6Fbv3+FdQngCAP4yS9swh?=
 =?us-ascii?Q?0uLhOwQYb2fKErFrO3UL2hfxHCj64Fi66VkrOtQOYxYVatHrRmFQV4w0vZN6?=
 =?us-ascii?Q?l8MVNsRuwfJjNvshULFj+rO3XdildAOQ+FhTIoI/j+pmAGr3vWnPYSOvBNZR?=
 =?us-ascii?Q?EUgKz1/6mENx0skAS4fdVXTxRK1Og4qWHbSIIOHxV0nsunjoMr1c3XrEJqdE?=
 =?us-ascii?Q?5lGFKn3LqDpSBy4Za4pKkr9ngMiNNiWkYR3Dr2jgxSDdjESLxWF80naoUB5o?=
 =?us-ascii?Q?bP8TbuOphIMT/4dYB1ouZTe4xqkB9jGl4/TDrA61wiQICWDCKwTCVkYg/69C?=
 =?us-ascii?Q?CxGowrYm7NNFE3Up0dJLo9AShrry3/Xw2hHkS0YHUM0QsZbWVM517JC4wyzL?=
 =?us-ascii?Q?LO2Cs2t0tVvePkP0Pa7AQT0CaKwRUHRI3ohyiqasBhISB78RoyKOUNfLWZkx?=
 =?us-ascii?Q?bmJjBLn+D95hnclrbFPgK1btEsxwfcIcMWeieu65VYpW25hEZUdZ2g/DF5Ey?=
 =?us-ascii?Q?RDgKYCBND2xEKelj84MQ2h0uK475fl8CWSgGhJKZaaBIzfF2zBmhxJCKlv8H?=
 =?us-ascii?Q?NTZknXbFUHxlGcHLxAMxQ2WUmeQBeS5clQ9/xBzdLx90uA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kL28ZqkXqKZxgg+MHBqJvErrTzysZRNcODbhxnQecz0jrY3cH6c+MpzFV80c?=
 =?us-ascii?Q?c+28llQpSyG+SAXepjfi85sHkKOGFVVBjkh2oT4amE6fW/Yp1kn0/9NeY7+f?=
 =?us-ascii?Q?KiIxV/JPr1za0wypBqg/9aYuMozKE7Fl+RZYAVeCAFD0VqdNFUygpTwRLYct?=
 =?us-ascii?Q?/so+RUt49FTlC3AlIjIrbn592qFC8+DoFWGielZpplqHpnZSRi/IYmq7bUeE?=
 =?us-ascii?Q?bJjI7h+wPBNiVKmX8fkcd1TEqd2Cm9L8u8L+cY/8ZaB08QOtBmc8Zr9OefXH?=
 =?us-ascii?Q?ZTZZVYfDNFT8SobCPdxPQDT/smOUj1/GGEemnetX7SxtDZH4NyGY7OqEoM79?=
 =?us-ascii?Q?T6lUgpabC0bqxlCuxCBCKAKCqKKVehAOEIyU17OS1Zhx4C8J+FzGXB2BDAxI?=
 =?us-ascii?Q?4nJ67QfDima9uCIvXwWaIPYZyilSljCwJA1S7fKknT9+ynhKrA7vPK8rdXQH?=
 =?us-ascii?Q?XILgL6eCG6bFhzz+nFMeNus907Ao7ZMXZ2ZlWzSbBzQTyBcRWhHp91wQsUyh?=
 =?us-ascii?Q?x5Cgg0fQPQNJFrn4C5tl8lzN10ZxELY3MzFF+oevRLAdN2dWPUIPI1P/W8Rx?=
 =?us-ascii?Q?CZ7mGs9G+gdjIp73wuJSG+VmOiarbwZV1p/piN0ro+Rd+nne0l6xtWJcgCb1?=
 =?us-ascii?Q?vnAJJKk0sO92YQFll5Z+UM+evMd10CHcVlFwSRUhvFk/CGR36DMC7djeCV20?=
 =?us-ascii?Q?hb/OdxGg2kq2FMzS0cF62kkMVaMXvE2LWltbyG7sztfr8omn9d7JrSmbyF7V?=
 =?us-ascii?Q?I6MJiWtXfuNv7NFg9tPfk8diRvTH3nfkuOTUUA5ZZ0OPt7r7M7gy2Xo4jjBJ?=
 =?us-ascii?Q?Quxv0wo/uXpkjWZTlqLoIF2cjHpBdCmtwu3uJ1SPYkweIjrmhk9dwJMetHdO?=
 =?us-ascii?Q?M4UCOigv4h1WPOGBacEICLyNdM7LsnQeE/CuBHGKcylsOhCXRFWTIKe8moJj?=
 =?us-ascii?Q?43bvxnpfwRQiuItm+7KEQQC4xYz2GeFrjDdyRtoPJJm6LSM2gL3EmAux8BIh?=
 =?us-ascii?Q?gA99ttOlQ+BDR54zQGIoM7jyP0yTSeLss4oGj1uZ2hgLLtwn+pkpeHFA3qiy?=
 =?us-ascii?Q?l0KabNi10JxgSN+TRJ9S6UyoSgILqrBvv42ilrZhTqPHxzOd11FO2bw02P9Z?=
 =?us-ascii?Q?lwN484i+zgHg9JZPgquANJZ3NYkGSNxjLxtapwxhzi+KoCrzcZjOuBkSmyUG?=
 =?us-ascii?Q?U1GysS+Xs+gvqb6a+tyoLhwR51w1nPXh44qh3rfhsP1+YON6i/4lpxmNcuYi?=
 =?us-ascii?Q?KV6IXB3CB3k6c/AAV+N2hRNvOy27jVu1j4RhiJMErwmTDjQrb9ncKnWyd4zM?=
 =?us-ascii?Q?mdAht+St82mRZFkMszz7davw6Ade0iebA0gGtcwxpHQst9xovCWjkEt9p9aR?=
 =?us-ascii?Q?ShPZDiwZCP7lxPABGimbLW3ntPzFVkjk+CijCWGcYeGc3TJ25h/F2doI8a9Y?=
 =?us-ascii?Q?xCniFtC1XyuCxM4Ake4Ldxuz4ntC4P/h5oVz5sjqE13i78vyFA2tjrH1Y1Ni?=
 =?us-ascii?Q?XsfSEBrb6uoBJPdl6NGCWcnJIrfvBssE7gtzvExXmApmOvMPJ4okQTPSPIWS?=
 =?us-ascii?Q?yofiaSa2H/9kVVa8QZFNR2JsEo13LSdESdR5gjwQNBvxSaekXDlx3q5aBgsp?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad19b7c5-0ba1-4a37-e5ec-08dcad964f1f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 17:13:46.6029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h99OF2HS5MPnepb1TgqOC7ERN/qUNQhhGLRPqZRVfAo5hShIJOXNBiMryWCnIikWBHlSwtkdQiAYqTFK7JtWVhNQkjy8gYKJLpu/jtnjXe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6015
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

On Thu, Jul 25, 2024 at 01:13:41PM GMT, Rodrigo Vivi wrote:
>On Wed, Jul 24, 2024 at 02:53:09PM -0700, Lucas De Marchi wrote:
>> Being part o the display, ideally the setup and cleanup would be done by
>> display itself. However this is a bigger refactor that needs to be done
>> on both i915 and xe. For now, just fix the leak:
>>
>> unreferenced object 0xffff8881a0300008 (size 192):
>>   comm "modprobe", pid 4354, jiffies 4295647021
>>   hex dump (first 32 bytes):
>>     00 00 87 27 81 88 ff ff 18 80 9b 00 00 c9 ff ff  ...'............
>>     18 81 9b 00 00 c9 ff ff 00 00 00 00 00 00 00 00  ................
>>   backtrace (crc 99260e31):
>>     [<ffffffff823ce65b>] kmemleak_alloc+0x4b/0x80
>>     [<ffffffff81493be2>] kmalloc_trace_noprof+0x312/0x3d0
>>     [<ffffffffa1345679>] intel_opregion_setup+0x89/0x700 [xe]
>>     [<ffffffffa125bfaf>] xe_display_init_noirq+0x2f/0x90 [xe]
>>     [<ffffffffa1199ec3>] xe_device_probe+0x7a3/0xbf0 [xe]
>>     [<ffffffffa11f3713>] xe_pci_probe+0x333/0x5b0 [xe]
>>     [<ffffffff81af6be8>] local_pci_probe+0x48/0xb0
>>     [<ffffffff81af8778>] pci_device_probe+0xc8/0x280
>>     [<ffffffff81d09048>] really_probe+0xf8/0x390
>>     [<ffffffff81d0937a>] __driver_probe_device+0x8a/0x170
>>     [<ffffffff81d09503>] driver_probe_device+0x23/0xb0
>>     [<ffffffff81d097b7>] __driver_attach+0xc7/0x190
>>     [<ffffffff81d0628d>] bus_for_each_dev+0x7d/0xd0
>>     [<ffffffff81d0851e>] driver_attach+0x1e/0x30
>>     [<ffffffff81d07ac7>] bus_add_driver+0x117/0x250
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I was thinking this not to be important enough for a Fixes, but better
to be safe...

Fixes: 44e694958b95 ("drm/xe/display: Implement display support")

and merging through drm-intel, right?

thanks
Lucas De Marchi
