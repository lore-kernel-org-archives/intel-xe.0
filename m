Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB465C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 17:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B234010E7FC;
	Wed,  8 Nov 2023 17:24:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0EE10E7FC
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 17:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699464272; x=1731000272;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8S0zWN2VdXuTzV66by5IUD4a1pEhlrsciNs2LxiMhj0=;
 b=e3Otn3Ua1cYFQVSAXMKbwzCP7fH3jn/lG363keQlu6FqTry5F7yHo/4K
 YwuOWMknuWlOor3/yOHlXC8WCtVze7xW/9qxp7D6o2FZdMJ2zbEvyKjEy
 OQG9/ma+maxdw84Hm+PSLO/+ASmLNfKoKf9uLiIGZ+kBmMoh9tFpFXCmo
 I5XT0XPEY7eZCEvXar1wz/IR+qznxHN8fvOV0kMMtbz+A6QtF7LNyh8s6
 Dvl2vpM8uzaru21ZRD3LaMq+aO/5q+rhYShLG2blf97JMnoIKfZF3pd4F
 DhTfl30f+7NVoW8tGEty97pe1P8FW+x7mNO9QPIov9BOFWqwKnlqPwxVW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="454116996"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="454116996"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 09:24:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="4252217"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 09:24:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 09:24:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 09:24:31 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 09:24:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVJ+wh9gsweeObafTN3ZFaeDpP/5JQOXe4WGo7vMZduR6yMn2q3XjK4eufN8wBcuSr7poau5dqWur3J2hp7d3RlMLbND2sqN9HHbHxnAQg9oTL4BXccUr/DLAOI2eUyCtlM65cW0kAze7ZKuuWONV3dc6aVONQLpTFJM9UY/AchcF6u6XZz4hcdOBaPRHlfmLoW1oEtRO5mbLG9OVYi5+enLPQ9xaoKz74RcruIX6dkhCv+euuLkRUJrZnGs2oZ7Ut9z0wVsUTBbgpCS2jHfL8o07WyCt1NL8wl9PRMQGnSFLWUdxEdAflgLVImO2ZCdNR1q/lzs/tKLexmU98R+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DL4OOExysOworp8rmy/8owgJyfc62s3RjUqULBifs8U=;
 b=Ng+8caq4FAKfX/m2jbqLAk1bphMDne09q/NnMtWQQPfu1e2qItQNL1d8NXMpIWrTlttER6NRGnedOOERRDnSQzxDyoqr3tABuL+CScDGDU0vHygit9sMahYYym2BIPGm54+RXFsV5iYmjigWL7VKYZ/DG+TTan4V3+59J/JG3ymQ87ooSGNs9QubvJkTP/eIeF7uw9mO5kt/LPGdowWadnR6MtOlf8vVNeMYOYIUcFuD8pHrixSMfX65UnuH0Hn0HXzr//VbD4qvm29VXiUByL+sHDIoxAvYXclSwfFfIeIH5dX+9SgCcJjwBmFWYkzj/BtppSVvJZdd2z8QmeO3tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7919.namprd11.prod.outlook.com (2603:10b6:208:3fa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 17:24:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 17:24:08 +0000
Date: Wed, 8 Nov 2023 10:23:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZUthmIvhJSyOulN+@DUT025-TGLU.fm.intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-3-michal.winiarski@intel.com>
 <ZUtV9EE+/PzCASVw@DUT025-TGLU.fm.intel.com>
 <bw3l45vnpmgmiepviwsy2fdqfza6cm3aj2h3kn6bdmihavlpzq@4kpk7ertxozd>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bw3l45vnpmgmiepviwsy2fdqfza6cm3aj2h3kn6bdmihavlpzq@4kpk7ertxozd>
X-ClientProxiedBy: BYAPR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::41) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: bb5a2d14-7e4b-4f9f-0752-08dbe07f8426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pCYocXL+HdDmqN6Q1MOh1JR/WMC1YDCM4OO/d9ke21oXBAiMgFAmNzkrWx0qmI1OcBGglwDE2Wwybu2yvS32CQKIHcoGgZYUGr3Cf1/dE8J3O1z6gRHuL+1STcKDNcP1p5w6kLHdZu4NXMQl6ur6MeZ39znPfjBhH8C1Xdlt7LHec/VfqlZVwqFK0ICtZPRQzpx9yWzjxwxTGHlBLpbUDIMG2bXxZ8AYvPgd7oKIBvxScO1tNOvWl+tKDu2mnm5iVWdsx7gPvJsB9ZyXuq6fGzQH583luVzg/jWsfpChJ+/xgAKz5G4ZZBG0be8ZMXumV2rQTVrxiVmLl87K760sNezC7lAma3gEGGFH+TruKeDnKlMpNCab7g359PiJ6kh0HPnebAj6DdRmiuQ0gAwpJnDyKKhe4JxqcgJ2+BanDPimV7SNs/L0VibAADpTOfWFBTeWvHH241t10bbZBPy5adrBHiXA5SEw8a78bk2EwkQ9JI1/C7GlUF0J589+zf+dlTpki820IB9RFKsx4hxWYJvwWBJgYobm8hkyeW0JemozjmuPXQ7i75g0jNC8dAhT8Zxet0LCQmDbFOLs9eO0cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6486002)(478600001)(966005)(86362001)(82960400001)(83380400001)(38100700002)(6506007)(316002)(6512007)(66476007)(66556008)(6636002)(26005)(66946007)(6666004)(2906002)(44832011)(41300700001)(5660300002)(8936002)(6862004)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVkzdVA5SmFmUjlyU2lNTllRcFZiR0ErT2s3czNmb3VnU3NTYUJ5VmNmbVJK?=
 =?utf-8?B?Rll3QmRBZFhaVmpCZm0yaGE0cDRFRWxtd1M3ekp4cWJtUDBySVo0SE9idGJP?=
 =?utf-8?B?SUhLeElGMjFEUGhQd3pJWEpjTnM0Zzh5Nm9jd0U2VW1xN1VmSHk5ZXJHc0l6?=
 =?utf-8?B?ODNUdDNRanlDV2NuZ2dDVDJ5OGYvN253Z1Vha2VqTnFYQmtnM2h5elJZalVt?=
 =?utf-8?B?T3d3eENETUJBVXdhN3Bnc2JmdEdCL1dJRjNUUVRkNkEvVG5raEt3VCt3aktk?=
 =?utf-8?B?K0NPY3lyZjB3Ui9GdEx2Vk43a2llWE9MQ0gwYjVtQjAvdlBSSmkyc2EyclhB?=
 =?utf-8?B?QUVLNW1TNjlZbVQzNWFMSXpsTFJwTXEyQTFzbDJDUVA0WVRGUHFjdHdleDRW?=
 =?utf-8?B?amJSSHRnSUVwR0xhUitHQ1FlUmlReUlaVFVYNzdmT0hUbDZLNDliYWZyVENV?=
 =?utf-8?B?NTV3R29YK3V6MjBRTERYQ2tlQTc3eGVZaG4relljK2JlWG9CaHVCT1FaYVJZ?=
 =?utf-8?B?RnN4K3RrdWtBRjB2SzBlWWcycDBubDZaZVN6R2N3a3ZCL3FCQjFLR3NmTEZl?=
 =?utf-8?B?Q3ZaZ0hMUDdUOExESDhPamJCWGdVSDJ0NVI1UFRYbGxjeVdySm0xWE5QbEdP?=
 =?utf-8?B?M09BZnlBSEwwMTlPUytVaFZQZ0cySUV1dHBGZmVBYWpvS1o1NEVueGxKS1ds?=
 =?utf-8?B?dzZRcU9zbmlWS1o3QVY0bUhTd2lCRkhaeEphV3ovYXpUaXpiZ1dVZXZLWTJv?=
 =?utf-8?B?am56QjVCVWNXTUNpdXF5Y25TajF3QldLVFFaZ1IwNTdYQ3plbmU5b2NqNjA0?=
 =?utf-8?B?V2syZStSR21ldjVEQUk2Y3pmRU83bklZUHQzeW9Rb3FCQkoxZWVmOGZ3NDhy?=
 =?utf-8?B?bXpyWG9hYTdtelZwNGxIQWFzQ1RPRkw4UjZzcjdndEZCVmVLTXNUTUU3UE16?=
 =?utf-8?B?dGhCL2NVNjJrVGM4M2s2cmZNWEROdkFwOUV4dmJCczBadjQ4TmJQeHNoZ1oy?=
 =?utf-8?B?SVkwaTVvUko0c3UzdDZEWnZ3M0k0S0lsQkJMUXIyNlZCczJINXpRYWtpbEJF?=
 =?utf-8?B?WkNSZWNSM0w3S3FKQ3lpQXpMNzFkc2ZtcWFEWnN1bG1wWDczSGlBTFc0SWRt?=
 =?utf-8?B?N0xDRmIzRmdSWVVCWUJRY0tlYzlGV2xqVVdkbzdxYUVZdmdGUFRwQy9EaDll?=
 =?utf-8?B?WjhrRHNBMFo5TFRXZFdvdGhYbUQ1YjVNcU4wYXZVK0xJZ1NVUXM0Q1ZpYWZN?=
 =?utf-8?B?M3d6bGJaY21TeDhKVGVzUDUwTjc2UWpyQVc5bWZjMFFiTnJQcE5EbUc3aEx6?=
 =?utf-8?B?bWhwYXEvVm9VbkJjcFpQZnh5Y0VoQno4Z1J3anltcEpGa3czQmVKbUhiZGJw?=
 =?utf-8?B?U2lMTitxQzJYTkYxMFZLTTdaOFhMU3pLek9sMmJyQjRwdTEzNXVwb292RVQ0?=
 =?utf-8?B?WWx2SDQyRDZ1U2c1cWpKV0xNZ0ZUYWJQTGhHNVBST1JJOFJwTm1nQXhrM1V4?=
 =?utf-8?B?Nmc5SitDS016K0M0ZEFBUHhHS0Y5TThmMTV0YXZVbXlnam5EdUlEWWhyZFlP?=
 =?utf-8?B?d0JWZWZGVHVqNkQ0cG1YL29jL2J4OE1OU3kzZ3o2SnFyR01YM2JEdTREVDgw?=
 =?utf-8?B?UmsxclRhcVNrUzg1SS9Jc1BjbWFObTRhSzRSOHp1TDJ4YjhwQjNlVXE1Z2c4?=
 =?utf-8?B?QkcwTG5xNVk2SENhZC9RaHNYTm5Iazd6SXBqZWJIdE5WVmZPSE1VK0k2eUM3?=
 =?utf-8?B?TmhEejJYN1Q0SVdIZ2NRbW1OQjNTM3FvMW9LYVdNQWRvQ25LaWFOWjhhOWl2?=
 =?utf-8?B?aXBjRTBkTkd0NDE4Q0VoNGNMM01OM3YrakxndDRYUjE3L215bzloenREcE52?=
 =?utf-8?B?RUxCczM0N2JuR0lqRndVU0l6MzB5bnAwcjVNeWU5Wjg3SlNaNVBFWEVkcWlM?=
 =?utf-8?B?bFBJcDFtaHlJS3FjcFpFWWFkTktoOTFkZFg1d3BBZis0R0xOaldEbDQwZ1JJ?=
 =?utf-8?B?SHJEbmxrMy9tS0NyVXVyWUxCd2ZoRWlhaGZmSGJKR3IzOGR5Y3JXbHYyNVFB?=
 =?utf-8?B?TW9yc2Fya0NJVzRnelAxK3ZaUWRTZmJVL0Q2MFZ4Y2FLNHROUXNMbE14YTZx?=
 =?utf-8?B?d2VTL01LZlF0WkxXSEhqNVpQaG84dUhnYVVjL0JyZ0JuQjFWaEtwMzVlR1Vv?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5a2d14-7e4b-4f9f-0752-08dbe07f8426
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 17:24:08.7146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOY7FHV2wX1T5XfUjlwIxaB/Aj+7QpYxXtvLA6REZmEkk2QbakNKkW1ScCdn1yg5nA9xuZOgIP3h82aC2r2e0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7919
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/12] drm/xe: Skip calling drm_dev_put on
 probe error
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

On Wed, Nov 08, 2023 at 06:18:19PM +0100, Michał Winiarski wrote:
> On Wed, Nov 08, 2023 at 09:33:40AM +0000, Matthew Brost wrote:
> > On Wed, Nov 08, 2023 at 01:33:34AM +0100, Michał Winiarski wrote:
> > > DRM device used by Xe is managed, which means that final ref will be
> > > dropped on driver detach.
> > > 
> > 
> > Where is the detach called if xe_pci_probe() fails? I'm struggling to find that.
> 
> By "DRM device used by Xe is managed" I mean that it is allocated using
> devres. In other words - devm_drm_dev_init adds
> devm_drm_dev_init_release to the parent of DRM device devres stack
> (which is the pci device in our case). That's the final ref being
> dropped:
> https://elixir.bootlin.com/linux/v6.6/source/drivers/gpu/drm/drm_drv.c#L708
> 
> Now - on probe in the core device driver model: 
> https://elixir.bootlin.com/linux/v6.6/source/drivers/base/dd.c#L658
> Upon failure, we end up callng device_unbind_cleanup, which then calls
> devres_release_all:
> https://elixir.bootlin.com/linux/v6.6/source/drivers/base/dd.c#L549
> Which then calls all of the "actions" added to the devres stack.
> 
> We can then expect to see something like this on probe failure in dmesg:
> [27215.580902] xe 0000:00:02.0: DEVRES ADD ffff88810ca9c540 devm_drm_dev_init_release (16 bytes)
> (...probe failure happens here...)
> [27215.698659] xe 0000:00:02.0: DEVRES REL ffff88810ca9c540 devm_drm_dev_init_release (16 bytes)
> [27215.707388] xe 0000:00:02.0: [drm:drm_managed_release [drm]] drmres release begin
> (...all DRM-managed resources are released here...)
> 

Thanks for the detailed explaination, makes sense now.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Thanks,
> -Michał
> 
> > 
> > Matt
> > 
