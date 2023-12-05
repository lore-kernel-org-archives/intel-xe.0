Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1B5C07E97
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 14:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C1910E54F;
	Tue,  5 Dec 2023 14:45:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4753A10E55D
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 14:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701787529; x=1733323529;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W1D0jdxJv3UmOGBM0X9lEBdiidePvrSd9QDyOUKrByo=;
 b=Duv0+E0nZ/MQlI7RtxCSMsL2PUaQF4opBXNzQgo6O0ooQ0uo6LwZnw1d
 5JcVx0mT4I00z7MSS4DCtoikp+E7OYdzpqheCZ3xi8/lRng17m3xl6gog
 tUEhZ70u8SM7HYVcaFbOK8QiCIwlZPqwoGQ6aurSQJ7vqq3lCjOYF75oI
 uI0Sbb9oZLbKvZde4fwhvWXUhr2VZXgP2IdzOhnt9T6jzLRlw1O+Y7oNK
 WHRhQueHMT/uD2e4PqGIdLhJX6VnGbX+vauWo1Nq5OnrExqyPQokeYFG9
 GjJd7c93y2OCcS/oX2tuclDHJvaoxHfjj1l1qtowKLjF28EgpCyKyT4MJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="7248281"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="7248281"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 06:45:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="944280078"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="944280078"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 06:45:28 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 06:45:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 06:45:28 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 06:45:28 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 06:45:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YncOyLdhRj/LMjzGa1NNNlhdg9ROHyLUhYN6HvOcX2E+FZRGJw7KtKbI8lSQ8IloLd7jOWRBJjR79E8XWbg0Du6bq7F7UmBjHQj/5AzxN9rdoDrgsermjaXZSNjGTKYySMnQyglZ0s53yRkyn5VKLZ4Dv+BCvgNwMzv+rMv4P2P44vXqjD2U8RgHm31mcQdG0cKW/LNJpMHQgzMnCkN/9lJHxvUmAkVknM/6CtZqCLY39NNZMogrw6Md7n2OG5WX7gtNLhgyxWCmpsRC9zLrqt6G/A5qU3HM1fa2Pg6QPVQLGnXByz7EFvkn0lxLbPKKk9kUf8y5SIzntD/6d/gD4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aS31HeI7C1ayc5vAznbo0z7lhc6LwifnHo5BCnp5M4=;
 b=h4NLVSP6/7RXeAZ1r+sIb/PELzV5E9IebOw1kNz8MJfIO/89NSCeHy6etruEK7+lhgAjZAqoOUPjEvyAAo1lrjCq/C1Rot8KYntmEwSC9dXTDdapyYClyQV5x23rQDJYW9n/YVvIejW2hoi/3SNyOQWj1i4Dp/98Cuj15KYuLIrZZBcHmbXr/OGE/16kI8HL5WoM56evP+y5jEZ86GwArDvdl99n5SC+2QUmisg4I08G+T7hUvMI8cHmlbN9lbqmlr/3C6BZsCabLFjigfCM2rg8Gm2IEvYwy44sSeWRzplUSNAKd+ml9OkSEN1/CgGn3LC1mFCPt4wHO3nP3Zi/lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4769.namprd11.prod.outlook.com (2603:10b6:303:95::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 14:45:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 14:45:26 +0000
Date: Tue, 5 Dec 2023 08:45:23 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <khxyqt6grryjkho7mjdugw5l65523ptf5pdkmw2xiwif3kleqt@vwd6ku53krko>
References: <20231204114525.791141-1-tejas.upadhyay@intel.com>
 <w4zznqo5xdko2gpx7sfhcmkncxgmqk5ewtopzpof6z6vvry3je@pla64iszsa3p>
 <DS7PR11MB619749FCAA441D9E8430493C8185A@DS7PR11MB6197.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <DS7PR11MB619749FCAA441D9E8430493C8185A@DS7PR11MB6197.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR06CA0069.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::46) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4769:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed52cff-eef0-496b-2c33-08dbf5a0d162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HCX2Cn5C1ogExYTZbf4m5b67ZOuJvrgqMFlIDgILbH1AkVlP2kHjf7wcoIVW0aicPo6O4jRxzXgp+A7dNwvyjtanp+H8JOBOK1ytsZr4nmDzn5BPVZ4PeXChG5BEIb+GDPbuJKcAAblDDzPNc3AFFnwbwYa8XfFbWyd5XI4dndvIPZZ6jqiQEv6jc2U4eBxQ9zDpp8X/b4MDLLvaZwUb1nUPlRSKA7uxy/fGhtfGl0nMZ48fTzwbaNDzP5GxW9ihm3p4cbKpAk6wePwajEK/aVMiWYE3aPdlWZoZzxY34lcn7bnhRZ5Pd4JpnUyifhFcFPubXDeecn3eIqWhTIkRhoACv0rnlWY3rsj1TBwdHlcoMIdiygNt30MHJQr/5B6qLHOtQ3Hn90JlP/kTwAPRWym0braH3LvQZpdK472WsaFsuoBNk/IA2pFTvI9kPSRviL/lGnvn3Qsq/lCjJdlmhHD/bVSIU3bukptZvK7/ikFUnKQcpwhzzzdcRZJZNmN5KSHf/tsWRfmo3DI+Z8/HHrluss03NjT4hq9PaoX3/EHXfZ4hX4sHTri+2Qw8wf0f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(376002)(136003)(366004)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(8676002)(8936002)(86362001)(83380400001)(6506007)(38100700002)(53546011)(9686003)(6512007)(26005)(82960400001)(6666004)(478600001)(6486002)(66556008)(6636002)(316002)(66476007)(66946007)(2906002)(33716001)(41300700001)(6862004)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ETxrBCoKqlub57TaUs7V/LekbcFDc5L6V1pmBVeR6Y/WxZZwChSQQtGc3p3/?=
 =?us-ascii?Q?eQb5EN0GAAjAdO9//RSmmpcWDrasf7OsApwa02JQhLmseOiCd500hKIyDhu+?=
 =?us-ascii?Q?46+S8+327kPu5uKhgdQcDICYmy9FSpCgJ8U/jvincn0PSaIJTtfW8+biMosa?=
 =?us-ascii?Q?zZmQQ40xaZ345GLUwnsv/QXnL9HpeMzIZKey5xcywfUctDy+C/tdRGVst1ow?=
 =?us-ascii?Q?V6BELmXvGPNfLubIiKCaFqe9c5bqbC5EO8ozSICcr8nXwwuUCArHF4g0tZE3?=
 =?us-ascii?Q?UTU7AGgASUexgC/L7q3/jdPgLyG3LgOJZKgcJtB0HlmzFGvZ047o/9zVdVnW?=
 =?us-ascii?Q?THfMoD6Uq4UxWSN+62fOpTNGhz49nfZeRt3iX1+DDJJHe0QJsozWiye9bw01?=
 =?us-ascii?Q?sWD+54RzQ/zNuUEqy0lDcYvtTO+ht9uwB85Ld0qmZ9UqwAOXtoZKEldudOmu?=
 =?us-ascii?Q?Otpt87fs/sjgTOItBxCUKIARNpEA770ATrmKDBu+ox6fWo/xUZm9E5oAbfQ6?=
 =?us-ascii?Q?64ycyOGOm5k9trvFHq0Toz0oWFXXUx1/+YPJbEEPhSZltwWBhb4oJ/Bwys3D?=
 =?us-ascii?Q?SlrzgCUGniYYKnoFX79Hx4RVvG3+NsmjYtYERjbhnt0E8D+G9dlaQGB27Plc?=
 =?us-ascii?Q?8+lsUbHInmcttVwBnyDNEJGkvc9KEZXNgextDa3/qF+WsWrlQ3xcTrSG1xF2?=
 =?us-ascii?Q?K6VSWVLMsxX3rlDPLGgw7zv0qrmVOjWNC/NQpLCbOOC5Hi65tsDQIgkF9I1S?=
 =?us-ascii?Q?9UCnThkNRB1HKSj0BsZAtR8+uiOLUif2NovkU+suT4LUXicFi/IPuit4K9/N?=
 =?us-ascii?Q?/qnt7I5Btk87LgaZJFqyKjBZp2o9N8uK1tzA6LdLcT6T6lhBzC0Drx31vg28?=
 =?us-ascii?Q?H4MoE56BVNEoH1RQTkFhViAVISwiwfCWeyatgR8ssHWFQ5vcbVCeRueeaOHH?=
 =?us-ascii?Q?y6pYzhezhb/yzGatcV8L/HyZ99BauCKYEjQYXtV/fuOvdL/Cub2L0+C/Ynf3?=
 =?us-ascii?Q?JMqvP4RLzUspZ2G8DSAnXyOl5i3U0YxNY75ZHkxc7q8DEWo3bidVglPjkJDD?=
 =?us-ascii?Q?y8a80k3KTHwDb1RcP0I31We79Rr3Nb8LIjnWe9mH2KlO9gzoRqr2E6VpLPh6?=
 =?us-ascii?Q?X+e/4kGSKY5WA20L9+ETLo785DfwNoX/b9rUUuVeS2VgTLW3SKcu0z00qiWs?=
 =?us-ascii?Q?rf20rpP+DPAR1kKDkfDthc/09Va6DGDVoJ90IaBn14FjKAPaCDwNVbtusb4/?=
 =?us-ascii?Q?OAF/TXgHdSrNy9xEG/h2odjNzcnVvTw/LRE1oPr7ftvkPbwtVKvryGOureTr?=
 =?us-ascii?Q?/wD7mQ/9BzYliPhyxXx+NcYyz+tq8biOWwfI7tNJQZl2atYw0KM4zr48lFYI?=
 =?us-ascii?Q?EQwKtmb4XW63NIooCaOWTplC0DX+O796CSHZZ6iQHA4cvrNyc62ZGh+F2v/g?=
 =?us-ascii?Q?vpuz1RUDDjjuN5z5sU6VmR3+7TH04TXUzlSo7jCST+93FPIkSTvxZy/CvCuZ?=
 =?us-ascii?Q?DUQCREVxLfEwPlHW5QYEFmxVebS9SRQMLp2qVfIqv/IG5GhISFKT6mEYwSV9?=
 =?us-ascii?Q?kihz4wGP8iAc1UX7h+JMi4GKLn/rZvNktZ7q4f08X5GsFts74nJdbintr9za?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed52cff-eef0-496b-2c33-08dbf5a0d162
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 14:45:26.2225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpfSoNZfXLbcfbyZGoS3S26z8089PheJHvXkGyYbPOkGvyIjfwQi+UT7qaCXkgnJQ0mc8qiLVRrU5igHQfSyRl6MFVNB8VtenA6w2UtNWOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4769
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Apply mask to RING IMR
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

On Tue, Dec 05, 2023 at 02:10:28PM +0000, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Tuesday, December 5, 2023 12:11 AM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Cc: intel-xe@lists.freedesktop.org
>> Subject: Re: [Intel-xe] [PATCH] drm/xe: Apply mask to RING IMR
>>
>> On Mon, Dec 04, 2023 at 05:15:25PM +0530, Tejas Upadhyay wrote:
>> >As per bspec RING interrupt mask register will have lower 16 bit masked
>> >by upper 16 bit.
>> >
>> >Bspec 60352
>>
>> am I reading the wrong spec? 60352 doesn't say this register has masked
>> access, i.e. in order to write any of the 0-15 bits we also need to set the upper
>> bits.
>>
>> Compare that to e.g. 60279 where we do have a masked register
>> BCS_SWCTRL.
>>
>> In this register it seems the upper bits are just another field to be set rather
>> than considering this a masked register.
>
>"If an interrupt is unmasked. On occurrence of an interrupt and if the interrupt is enabled, will result in generating an interrupt message to the host."
>By above sentence I could understand that this mask for all interrupt bits mentioned in lower bits.

it's an overloaded meaning of "mask". A "masked register" in bspec
(and the option you are trying to set in xe) has a very specific
meaning: The upper bits select the corresponding bits in the lower
part that will be set when you write to the register.

For those register if you try to write 0x00000001, it won't have any
effect as the hardware will ignore it. You have to write 0x00010001 for
the write to go through. This allows writes to different fields in the
register to simply not care what the other bits are, avoiding a rmw
cycle. 

Those registers in bspec are marked as "Access: masked" below the symbol
name, besides the bitfield documentation.

In this register here, the mask doesn't have that meaning. It's a normal
"interrupt masking/unmasking" field.

Lucas De Marchi

>
>Thanks,
>Tejas
>
>>
>>
>> Lucas De Marchi
>>
>>
>> >
>> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> >---
>> > drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 +-
>> > 1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> >diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> >b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> >index 444ff9b83bb1..d9013c698710 100644
>> >--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> >+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> >@@ -39,7 +39,7 @@
>> > #define RING_MI_MODE(base)			XE_REG((base) +
>> 0x9c)
>> > #define RING_NOPID(base)			XE_REG((base) + 0x94)
>> >
>> >-#define RING_IMR(base)				XE_REG((base) +
>> 0xa8)
>> >+#define RING_IMR(base)				XE_REG((base) + 0xa8,
>> XE_REG_OPTION_MASKED)
>> > #define   RING_MAX_NONPRIV_SLOTS  12
>> >
>> > #define RING_EIR(base)				XE_REG((base) +
>> 0xb0)
>> >--
>> >2.25.1
>> >
