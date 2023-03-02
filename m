Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FE0C678D4
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 15:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F4C10E107;
	Thu,  2 Mar 2023 15:23:13 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB28510E107
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 15:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677770590; x=1709306590;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PqQ8zZ8Urc04PNZ+w1PgnWC+y9rrbb/Cqs0a/MAz6Q4=;
 b=QaZNCtFBEWr0t4YFzkBtwTkbax6CqLurMuVyL8HlOAmq79pXQp3gtVUb
 IDcAF2G/9uDhX413Z285HncCLFGh7683DaLEUv2Oc0MnEBmKmJIcnoydo
 NEPGkSzfg82l1+4h4uaASm/JeQ1TUDhDPCKfYmlnNX4mkhASKy3jQ9ZhC
 EhR61MZ1lp3cpQ0T3UUvD5KDUOH4nNTWXDExaakiJ+fQ9FfLJC7387EMN
 vaHzQvLoy70dW/Swq09fboMr7l84BNk3vfeQAzBpsjbvyFasRYgYRNwQg
 6UbuBfFvDyGPJ1T5LmC0taTsSu0NVYrqi/sGtUZ3QmhjvqqggdEgYeRRP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="336268589"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="336268589"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 07:23:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="652432054"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="652432054"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 02 Mar 2023 07:23:10 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 07:23:09 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 07:23:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 07:23:09 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Mar 2023 07:23:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9OXCbXJXeRrRwK/nCpKdXT2WtXEdgLE1AuD1VMJX+7W9p71xFwmKqTtn6NwKQqentGOr2oK+5E+IvTsXvZF3jhm85jJ4Cq1NxGpcok5hH6N1zM4Vhjlxnl8pH2q8aiNgZ+PdKgFpc0k8DmVo/ViV4Zf8V9kXTIXTeYKpFeN9C5ZBHHEz9+ENn11ENpAHeD5czbxlikWopmH8sYdvBSXjpw4sEFzXulZBgqFbWcYQ/yjrL3i+Gj4XCYeIQgs3ydJRqNNs/XTu7FrNRmeER0MztX6SXVjG7xG4b4Im3neIBGj3Xh5qZJmLVrc1MDZ3y4ne/d95sP979Y+xFmgi07M5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqQ8zZ8Urc04PNZ+w1PgnWC+y9rrbb/Cqs0a/MAz6Q4=;
 b=KPBsVHhxCk/YbqZYfsCXufVeVZMoVofcYiL9IUmt7fMOLLyaqr9Bg/fhKEjTKD3a982g+IU7gPAGCh5jUUzDii+LFWEpPc+iAZCpVc9Cn74YO4vD0IhEoI7dAApDdW4uGcdsjJseGvWu8lC5voQkYPotDHgpgI4Qk+mZrJ7H4wEiHlFE0NzX1wKJ1i6s8e+L1ZB+q2l6jt4BEmKY+G6frR+6iit0NtaTEtBLHtgx85BVhq3MWlDEnKAgifB0BkusKF90Rn1bLia1x7uapImFowYCb4F/T0NuKh1S9U475qFMi2WKXfX9JzOpiATdjQRNhvK5Vsku0cP2LLhUNLaIog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6662.namprd11.prod.outlook.com (2603:10b6:806:256::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Thu, 2 Mar
 2023 15:23:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%7]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 15:23:07 +0000
Date: Thu, 2 Mar 2023 07:23:04 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20230302152304.oqvvgtvsr5x4d3vk@ldmartin-desk2.lan>
References: <20230302013411.3262608-1-lucas.demarchi@intel.com>
 <20230302013411.3262608-6-lucas.demarchi@intel.com>
 <87y1ofusbs.fsf@intel.com> <87v8jjusb2.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87v8jjusb2.fsf@intel.com>
X-ClientProxiedBy: BYAPR08CA0053.namprd08.prod.outlook.com
 (2603:10b6:a03:117::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ffcd46d-c7cd-48a3-37b6-08db1b32068e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Uu0kfTwPN1VhsNPvTgPQjkgPS7AF8/RLiyLqIRYlwSdCZrnXH322w3XOgKD8K9xK7JG0BB+bpV2V4PMZ3y5KEFOGh2LhhZtd7nuJ6D8nF3Wz2h5js1neJ5DMX+M6WOzfQGJUPIAQ+bTcBz6MtFzg5GG84frv0RImH8pCh8IhwyZ/rr0PvqZ1nQdZIOP3qkgvN79FrZRph76xT1NgskYYHOddbdd7BeMVvPUH6hjgKx0nEDbWOIFUJCzbvhYXuMOPYbZvjINIhBoXtOmPgRuGqmebTJUaMeKP/eAl+Aqh60AJFztNFaQ+OdI2ko3b7YZclg+uGS3IjW1sxITPzUvFq+FuGf2nAtCNPsMXpWNzD/y0R0K4CsTHpVY+DhUnIkTlh/CNldSZgWK/TPZVlYcxVthez5NuyINeRLN6qffEG76y4eFMm70UcE+cgSCgCQVLzbc32pSSke3HhEmRSwjQOxgw9+94Glgi4yCnGIXLvWymh8rGV6RFaxJio8cBO+c3mFzb0VYTcz345VlNRNavdHo+nJk6fWp4oKu4x6WDwYeeBTUGDJevSsd7sR8gCbUQRk/nmJEB3F5ryG+n+Y1y7ZjM49MVMhAPFKsGfvoE4FcPLCjt/0Hk88/BjaPNKalIU5K+03y0mPmoJfJQX5AvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(396003)(136003)(346002)(39860400002)(451199018)(82960400001)(8676002)(38100700002)(66476007)(86362001)(36756003)(41300700001)(66946007)(5660300002)(66556008)(8936002)(4326008)(2906002)(6916009)(6512007)(26005)(9686003)(186003)(1076003)(83380400001)(6506007)(316002)(54906003)(6666004)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wln4uBEODaE+kuC8kAH4soprt9m5yEfFtT3jRQI7CCy4n/+s2BS76ChUw8t5?=
 =?us-ascii?Q?YNZiErXMpZjXH+npBvQKX4rjshaBLkJNGpZDkntKFsOU0YLNAbnmbXelbtXc?=
 =?us-ascii?Q?vFlZ3X57OkWxdxkoTXQ8o8mRp7qud5m4F6fYvqjKVGnxHRFAJLbgdHuy6ks6?=
 =?us-ascii?Q?rZTGOEmtrckNu3CrRz0uXqjf04x9DFUhvHd9YetqX6njuKlk0DM5bEGVJ7Sg?=
 =?us-ascii?Q?CwajEHakiYSxTltc/Bp291WZqpmEJawOiF6OMMolPU+s8GA2Wy4F0FrvmE73?=
 =?us-ascii?Q?9UmJdXJZk1gLcd2aAo2K3PeWFhMyNDYPZIPvfL1ipN8kluprpWCEARS59IEm?=
 =?us-ascii?Q?MP890rCoIULHfUHZAjjzQnvv3X8jYTVhk4eWaZbjpvPo0DA1jvMwDEW2BqyO?=
 =?us-ascii?Q?+vu44/OGmtbSJdkoIDodAFJSPQCtEJhhyMkRi2XAKQefDJ/603GzuA+eOvz/?=
 =?us-ascii?Q?JUumWjwdTUFAKp/eKT5A6chIp8b3w16xHdeen1u5X35NCp3mjLFAK67SNHh3?=
 =?us-ascii?Q?plFUSmAXNO8G5EMMIGQVQ0GtIwVRkHVzbXMiAw9j9Sy4jeiQd4iUvmxWBjXp?=
 =?us-ascii?Q?IN82YOHezvVSjPBxbSmk5dy33/CfIS/r/IOrIAmwTqJ3JFnmtdJrXt7qcrr9?=
 =?us-ascii?Q?X/UH8N5afIG4QswLfIJTKAz/jKotvVfwz6GJe6zbR3uZRYOhaQ/t13O8ka0d?=
 =?us-ascii?Q?qS3hi9T3i/P6pzA1kUyVsFNtwkIYvxlLgmEhDkCuv69FupZu9ddK3J0Ie3BA?=
 =?us-ascii?Q?Sz+UWqZFkSjRjZ2rdPfnHdogsaSYrA6Cyzd45dvAZK28KUJ8ExCJZXA+1/ia?=
 =?us-ascii?Q?jAfuoFdU69MduKJsaBI0R9/NXaSzrGIaLJYwpx7c90QQf9OzgbVDyx2yJTYj?=
 =?us-ascii?Q?Vtsai9k1ngP2+6ECfchxSK0rwbSxry2GfZVBZyCOSiqyhY5AHHra2BSyKz6B?=
 =?us-ascii?Q?R8ghOLn1H/sY2lW4TRCB0XXjF21oKunYVcFXbMb1FuqzNTo2VPpKVSFP6AEm?=
 =?us-ascii?Q?LkqUpNEV8JQH61ZXCFars9q8GtvVVVLrfiiOlSNQvq4AuD+qquGsdvkhbEsa?=
 =?us-ascii?Q?cfTfgSB4SW6gMBt2dya3ZRWHLXlnMoIW3GND+vkP0VqllaWpau1qfoFe0hcu?=
 =?us-ascii?Q?CSxZtYAe7DPWZF+izubhiISugqqviiHTvj4mlu85BDbFjjVzOg5iCywkToog?=
 =?us-ascii?Q?7WFhVcLKnBCyWL0AeIaalXHoqsEABI1lVrWbag7SxpNyW/pSIOLKDEVckR1T?=
 =?us-ascii?Q?MJHbyMk8oxg9GtQ4bF3bZzHgaRBJdUka7IpfEOksE3pbn+HWQkIBG2VbA6BW?=
 =?us-ascii?Q?gR+mgeZgqDCF4RKgNL85Icw8BlWEXtGOD8Teq4zFi9JVrseNXc/wjONub6A7?=
 =?us-ascii?Q?WxO/h4OuoDYu3l50/1/wefeAsm6MZPTJaiGmCxTqbEHVHDw9bWFYE+KBeOFK?=
 =?us-ascii?Q?Me6CRekpIenz/V+Px9Wdq0KSrEjV5k8N2zO1x8CpmL7bOpnsPN3RgH2+OaOZ?=
 =?us-ascii?Q?2oRBhPzrYLv2YSDvF9qmRNDqVi/0iMdUiYURqaR7fz0gieBE0GFr2ZJypKeT?=
 =?us-ascii?Q?oAg9jP0eITIAs1Um/OQEOBZxUjQF5JOBknTDCJs93+PgIy5tFss9uPpHjIMb?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffcd46d-c7cd-48a3-37b6-08db1b32068e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 15:23:07.8011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzk53dW5DI3C5rW7dyfCrGqOIRd1GBI9bjchIOpRfYI++EbGibawxhDFF3KuO/vfomUgFUpUQRsRPFa7Ud6AYaZ7/4jqpz01ZprNoavEohQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6662
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/7] drm/xe/display: Move device info
 initialization to display
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 maarten.lankhorst@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 02, 2023 at 04:44:01PM +0200, Jani Nikula wrote:
>On Thu, 02 Mar 2023, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> On Wed, 01 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> Instead of initializing the display info together with the platform in
>>> xe_pci.c, let the display part initialize it. The small disadvantage is
>>> that the description struct is not automatically mapped from the PCI ID,
>>> but just doing a switch on the platform, that should already be set
>>> during display initialization should be ok.
>>
>> Have we already given up on the idea that device info would be a pointer
>> to rodata?
>>
>> The thing that was always problematic for i915 was that it was all too
>> convenient to go fiddle with the device info runtime, based on some
>> arbitrary needs.
>>
>> ---
>>
>> That said, there's really no requirement that the struct pci_device_id
>> driver_data members in MODULE_DEVICE_TABLE() need to be pointers to some
>> device info structures, at all. The initialization of device info could
>> be done in completely different ways if we dropped that notion. The
>> current macro "inheritance" in both i915 and xe is absolutely horrible.
>>
>> Anyway, going to block the patch, just checking on the direction here.
>
>Sheesh, *NOT* going to. Sorry.

oh, ok. Thanks

Lucas De Marchi
