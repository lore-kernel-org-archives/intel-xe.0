Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E558FC77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 18:50:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B154F10EA8E;
	Wed, 19 Apr 2023 18:50:04 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E4F10EA8E
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 18:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681930203; x=1713466203;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fRHQcD09/r5NvgPtrM9AtrSsBopIMiaj+NZHdmLCvQw=;
 b=IcQoIg4c3x7ly/LB4scmtIYbiiLt/U0dVpm9D7WO0rpQoGVvYYtUmmnc
 MlykBtvQppaGO8sl5FjOWU1grnYITCyMCMjHJpFy6RZHmaXxEkwc6dVgK
 p/3u/+QrCDIG4v2kkU5hOtnxIQ8EY8Yf8ilkkoIa7tdXjZqVl2/1EVyLP
 ZIFCxGFC6myyj0b+dNg3iKOiWUcvQl4r56scJMDI8zm31B03MhQnkRzXY
 Gje+1CMYGIZWtssSDhRq4WT5r547Lkap+16TOXWWciITQvaTxeG/d5oja
 KgP1ZWEbgkR6MPk5EkHuV+VrIXB3vHCD6qATSVZ2P10U6gQprqGlL4Rzw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347386565"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="347386565"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 11:50:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="865946865"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="865946865"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 19 Apr 2023 11:50:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 11:50:02 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 11:50:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 11:50:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 11:50:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+vVqeKO/AX8Hvwn4ejNPKBpKFzLwOkV3y02yL5s92Oc2dYMVRMIQKkMXdGGwfNV17BSVjaYZOVNxE/+xjDmjPCiZx4mjtHOlIz/FXCAiw8ASi+Lk5evP2XbHkpu9OnHW2DJR+wMhrzcqg4IoL6GNwQkytKR6fVHG0Pe9dDy79f+hDIerjP6YKXak1d4VqXsR+cqkt2wVv2LPn+tVD/pvFLok/2GAAUphd+0CklhOGf9D6GY39Kp2DdPBU0VjUo5S6o2pIEl7v8TTEVOpDoIP33MZYVal5KeT3MvHDoBhReWg1RA3EgnHk8VbQDvYoLMWb2eN3kTt9+ALYw3H3KVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crX2t5oLJxvkdNHyuSg1PBU7MjodH9OqKGHgV+9A9ic=;
 b=jumaFUkAmlebJaRWbkDJbfS/5sBQXomIRSK9vaSlagwnhK5Rlsy9T4+sbdaCV5c+hs1g+W4F2J3iqBTOnT1+aqYRmnNsiiG5dB5RDesMJL/0+tyTz5nsMieXZUMHfP6td6NKdOuXqM2Rod2M5Zs9tvzKT6B2G5FCNK5aON3ZwlmREP++w4XNqGfP+6rMIfJH4XPhFQg5nEMVXRp0dYRvVaqceinATBF2Lgj3iTLiTzjaH5TMJUnR2jdLrfkz+uvaMitWV8wHnYDglzZ/0nTrbeL64FoqMLhS7apaDZRyGtME1nXpgL0FbYeJUPQ0g3AtKOcBbEGb+OMrLruciSpjog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4538.namprd11.prod.outlook.com (2603:10b6:303:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 18:49:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 18:49:59 +0000
Date: Wed, 19 Apr 2023 11:49:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <stwod2pi444nbt4isgkexorrgvtd6tixn62xezymbydjwdpd6b@z2obzqwxeh2x>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
 <20230419074440.4006398-12-lucas.demarchi@intel.com>
 <20230419173345.GJ2825255@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230419173345.GJ2825255@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4538:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a71c589-5511-4fa4-d091-08db4106dfe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L7+5zFyJA97FAgl33s9A375JlPbitUzkPCT1xjjy/Sm+6UCqpD7O8yNhJSlz2bNKneMPU1cqzyh6etwwHzvnwCHnV6jidqe9eUq0LBYVu55yRWzmTqYXmnl6krJcs3wVtzF+oJYZUjKOwWyk2m4ztG74z8HwKA7wziIqWA3dDOpz4CzUofoH/la0+9ATmHZpw3X7fZnNnjDeat864mlBRcIgeC7mFJ/dHz024LPKqcDO06xHLq4TvE4+/5dWNTHBSDGheRhYgex54+55QQ6hrl5srIywJttFJeZRV25HbN93DLFodnjAkQnt41FP7lnvrEGt3kuuszKJWKw3SOInZSdsrH97kJGnV0EE8WXWUB084OJTLIOaZiVlRdwN7Cz2oAC84d2AHeY9a0Z4/L7uz2p7UfK7lGROYrOdNO3Mf+rS2xoycZ9N3Lj1VlanbMTM6pEfHOxaGuR4qkt8eSslzAJ6g76pGlf8OrObvR1U3IympMbAw+uPorUpBgyc1IcZs7l98uWm/hvZ3+tu68zFHgr3JGEl7EHj/7HtaybEzDICnqYQ2JETiTSEKhXkk+96
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199021)(6636002)(4326008)(316002)(66946007)(66556008)(66476007)(6486002)(41300700001)(6666004)(478600001)(33716001)(6862004)(5660300002)(8676002)(8936002)(2906002)(86362001)(38100700002)(6506007)(9686003)(107886003)(26005)(83380400001)(82960400001)(186003)(6512007)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1CSszvF6GBkgjHOSZxMDmwDMSK1D6fG+PW6O7i+7wIYGoKx5pnP/I0FWP/rc?=
 =?us-ascii?Q?c/1Gb3XYOe2BT4VsuN/dbM1706r9ZKKyxKk40dw2H/N9qCOTOBmtEvd9Nadt?=
 =?us-ascii?Q?9LC4juleaKKR70F9kLaXuzC3DwonEK5b8gDV4wM5Tt/Ofjejl8uP/Evi+FbH?=
 =?us-ascii?Q?UI7Ezzqa4GRCrT5lHT0QH1VSDp4mfu78q+bCXsSgAfQEbU6rDO1vGQGgRDA0?=
 =?us-ascii?Q?97f/aDUykQGauA7crjsJSng70ShMwAn8Pc+PZUu59vtY4afrrkEp/4Uz6PQY?=
 =?us-ascii?Q?yu/UoEDFoNDb81aq+KSd+Sg9ENbaf/pGEJQayZYfzXBp0QZmh/sZ7aPXHxcp?=
 =?us-ascii?Q?dqmXTgJk3ezuzSO05KHuanmpIGMO4SOyjNrxhU0n+A/wE7Ee80dDdNxMEtZe?=
 =?us-ascii?Q?Qa1Fgz8hvlOj04cN0PGRlhgwmfE+hiZozOddCKzjDWJJG/7GTwzRzaGEDK2I?=
 =?us-ascii?Q?jbYJcU/KJrEGjGzTsAMWY2nkL4BeqkkM09OzlzmSzurVyKW7JEqPedB0cGww?=
 =?us-ascii?Q?A+Je9WMpzgMW60wnjgwYxOm0ntu9ZSXZ2EmNncVUHAM4sFzN/TWikZkmx4jQ?=
 =?us-ascii?Q?Jg/5QaKS8fSHdP2xs57z0xSHR+W/6qDlW3nFD9l4b03r9piGq/ndCzHTx6Tw?=
 =?us-ascii?Q?YW71QssUQuapvFCn+y8/Fjb/0QqR8Rz/JXd4ab3S1CG5EyV1YedRbTUluRys?=
 =?us-ascii?Q?TdkOeA8KJWHRyjrFAV3mnjlZR5rb6lurjw0HqyaRsE/Lo2nwGopPSl1xrLJy?=
 =?us-ascii?Q?FHfw5FGpU+j4SkgZx4/FPmV1heKvBLI0Et/eepLRWOPEhYTLGrkBF0LjogKM?=
 =?us-ascii?Q?hfcY/ALfbe3UXClORNG8H8Lt1qwSgVN7KEnoqFJYfBWUMRWyPhvH+I4XuPMS?=
 =?us-ascii?Q?WYgSWA2xfcAqVyspRX4o6Nl1Eg0xg5HuzHG9d1TwxxcPVc9r7iMdfA9cB7N4?=
 =?us-ascii?Q?/FH8d4+baz/TTV2RXBrTAyTysM2EX8b8OQzNhrO2iWbxoB7418naGaoij7rl?=
 =?us-ascii?Q?INQdn7BWbXf1o4+jwde/VZe0QoiRBTSow519PVxl+LeEvlQ/23O9FE4ZYRVc?=
 =?us-ascii?Q?ggQrtljRo6AdjkJzzmW77ZQFdtG48rcq3f3b/yr3RSHqFno7kxjmBL+lMhmV?=
 =?us-ascii?Q?zaZEzyQUmbjGUNwnUwuGwkxBpSAbfNiywSZrkcLGhMdrU8dVDEpZyOr7Uq41?=
 =?us-ascii?Q?EP8RxNvgOXX0Q4MKp5pu8a2OFvcBRdGbNWm2DuUXHY284uZG/GOE4JIIEFn2?=
 =?us-ascii?Q?MZ7Sx7Qyqlw8/0CACanCTOYmOmcYSMvPvOsHS0TC77QPaidOcHCBTJCYEqgl?=
 =?us-ascii?Q?XNefwlZCHLFhWRV7OPVMosxvo74aSZ4d4NHSeNS8rthalXGL7oznU3Qo+v9p?=
 =?us-ascii?Q?EhNzauYwOktPKOnOzBoppauIJHpZE/vgualmfxzwDUZ1yCJ0THVSgHqlNr0Q?=
 =?us-ascii?Q?xfyR9SKtIChNI1boC22n4CqXvAu3ybBe7jKNx9U5BW7fjr5L2Nq56XZP3NQk?=
 =?us-ascii?Q?c8Fu0zb5Wr3VQbqgvash/KEYqiPLlHHe9VLQijTro9/UN+g4fU3Wk+in1ZRd?=
 =?us-ascii?Q?dyq6QXnBmENrZHfCk2kls8qlseVLgGOP3SgrrU1lZKQRhsH555c3Ipxh2YTS?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a71c589-5511-4fa4-d091-08db4106dfe8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 18:49:58.7820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zx3rqakQQk0mcoelpVBKKx7VKcggz61Aa23LKs1F4bNivQlamXq+TSu8tKInOAcCOhFUgi3FVVwN3lWdvmgwyecLN2JdX6pdG+mxJYBDGjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4538
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/17] drm/xe: Introduce xe_reg_t
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 10:33:45AM -0700, Matt Roper wrote:
>On Wed, Apr 19, 2023 at 12:44:34AM -0700, Lucas De Marchi wrote:
>> Stop using i915 types for register our own xe_reg_t. Differently from
>> i915, this will keep under this will keep under the register definition
>> the knowledge for the different types of registers. For now, the "flags"
>> are mcr and masked, although only the former is being used.
>>
>> Most of the driver is agnostic to the register differences. Convert the
>> few places that care about that, namely xe_gt_mcr.c, to take the generic
>> type and warn if the wrong register is used.
>
>The disadvantage of this approach is that we don't get the nice
>type-checking that we have in i915 to catch register misuse at build
>time.  Instead we wind up with a bunch of run-time checks that only tell
>you that you used the wrong register semantics after the fact.  Wouldn't
>it be better to keep the strict types and let the compiler find mistakes
>for us at build time?
>
>The only real problem with using strict types is that there are a few
>places where the driver is just trying to refer to registers/offsets
>without actually accessing them (e.g., whitelists, OA register groups,

that is not true.

>etc.) and the strict typing makes it harder to provide a heterogeneous
>list of those registers.  But I still feel the benefits of compile-time
>checking outweighs the extra complexity we wind up with in a handful of
>places.

I disagree here because the strict type checking is only checking for
"regular vs mcr". Add "masked" in the mix (that has been a huge source
of mistakes in i915) and you already have 4 types(?) to deal with.

There are also places in the code where we want that "this is an
mcr/regular/masked register" info to be used later. See how the reg-sr is
handling that.

In the end I believe having this info encoded in the regs/*.h is
sufficient to avoid the mistakes we had in the past.

Any change in the code triggering these warnings has a very easy an
actionable fix.

If for some reason we want to only differentiate mcr/normal as strict
type checks,  then I think we need to provide a better struct for the
places that don't care about that. Something like below maybe

	typedef {
		xe_reg_t reg;
	} xe_reg_mcr_t;

but reg.mcr still being there. Or going the other way around:

	typedef union {
		xe_reg_normal_t normal;
		xe_reg_mcr_t	mcr;
	} xe_reg_t;

but xe_reg_normal_t and xe_reg_mcr_t actually having the same defintion.

Lucas De Marchi
