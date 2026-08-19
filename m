Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C926C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 03:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD75D10E0B8;
	Wed, 19 Aug 2026 03:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZMZGp8EL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B1110E082
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 03:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787111490; x=1818647490;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/W5//zpaXMOC/IYzs69Mc1UOcK3cjalEaHHUVvOs9UI=;
 b=ZMZGp8ELdXQm4b64Xmso8cejA//X2uIcHuZwpMCOoaU75tOIlR22e6Zl
 l3nWbBs3GPgXVJXcSTSly52Vz3acJFAyuzYoiX9MWgbq5cmUUIBO/+0eC
 dXGvTkUj28MPZmWrvcAPW3h34KH2ziXP5Ka1PU5E65NZHpu+hczZL8N58
 CDh78KEf9aHqzV+QjSG2RbmvnIDI1gMqYYo34WNyYjhyM4LXOLg5cDpzN
 GSzbjGK0NTVwljWtfpzYdJwWEVNP6z3aMl6bEhgUhp8hq6RuZdDjCmziZ
 T1abWJ4DmHYIhcbi3ZEKpo53Zqma/wCLL5bcMrnm4IHgqRqDZfvJ2qnqF Q==;
X-CSE-ConnectionGUID: Yl9uMam1T6aDKwDHHvF1fg==
X-CSE-MsgGUID: zEcmtz8wQVGkMZTMTuZEIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="113158751"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="113158751"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 20:51:29 -0700
X-CSE-ConnectionGUID: GODhXKZKTUusRRLW4NbjPg==
X-CSE-MsgGUID: /S6x4O2TTs6sMuX7iQvx0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="266039733"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 20:51:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 20:51:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 20:51:28 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.70)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 20:51:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=in+4MODW5jmKCOWtRrzUfBcWqFHRH+LBeRyRlPgu+hGSRvTBeRpWWa7wFxued8vpTfgT2Ts5HeLLwcyGRT02sRR2zQ4ujJLV2NvrNQ6r4ptWbziQ2ckW3tU3XojEQwNcO1wtQApjPTi2K3EVjiBd1iZLao2MDOoht+yM62xp1PXBLdXeyuW/EHvyGfkHVuWhfYDxtbQ1CTIo3LiXLTAL4oE0K/VjBJpGgF+4ZCW2E61eIRAn/TMDsEfo4exk5WXM21F/MJmGkzsqdSP2Lg8BzWJtSgYf0i7c/RiXkbatA8T24cUu1s0Wnoi5O9stTLL0qx8XcN/YteQsPCq8IQbH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8N6aYHj1HvsOkWQe63VLTXmjagH1E1ycm+w18cxjppA=;
 b=eJo38ibDeC5l5WqGJvGmUwWf9dEo9Qj3YlAGJ8g7ySvJ4jPmc2ZKgUHTgF/g0oAsqrUbkXSMV7qSNikVWWkiSkaxMDu7oKg6ZLQ6NsbWtn4F5ZwYEQtyyZ69moBLU7yuj3X8Jo4KVTHHXYLFgqyR/yPCFmjDjfxsf5o323JOJFZck83Gztl92VTs1NE92IYFJVUKX6hKPZ/w5oaAN+9rEzyNTl/i8vf9es/zysES1dgQ1JRygMd4rOZZvN7NaalGpZwk558LnoEPh11KDNN9tdSxW0HrC5R98TCb62hSra+gZxn97HXR/QHrf3NXvYu3u8BB0Qotg/xD9Phlr7CBgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH8PR11MB6926.namprd11.prod.outlook.com (2603:10b6:510:226::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 03:51:25 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0315.014; Wed, 19 Aug 2026
 03:51:24 +0000
Date: Tue, 18 Aug 2026 20:51:21 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/guc: Fix race around q->guc->suspend_pending
 access
Message-ID: <aoUoOdNmsUHLt1p9@nvishwa1-desk>
References: <20260818183838.273486-2-jagmeet.randhawa@intel.com>
 <aoTJBly70vnRnrwK@gsse-cloud1.jf.intel.com>
 <aoTqUiIq8DMoT1dK@nvishwa1-desk>
 <aoUAYKkua2E065zU@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aoUAYKkua2E065zU@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: SJ0PR05CA0140.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::25) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH8PR11MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a76b80f-81a4-45c4-b795-08defda523ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|10067099003|5023799004|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: BwfcleYJUT3SWnFgJSfexsubLpSFrh3/BLivj3UsIxV4Y9PQ1jLuYsTTwNkYM36jsGQRkG2R2C/xdq+bdOy6n91y8n5V/ji/8cQOyrhvLcNC25GBw8ze2gVtCmqxCEHi28CLCN8Yn9zham8b6OQKncZiHSeHap/QsGs5PcEaW0FuPrGbDxYPTZeJ+xg4PxIJj728T4Ekol/wE/uCQhOsdTopnVEV0p7ahY4cihfYBTijO7BzPOkoyeUaYMhzVfVYw1+O2CVByWweoGkSviVi/IKLsdHqvkFvLoqp89MzZKKMEHw15cKPewnrSIM2Adpx8pDlyJgWk//zJqbGAlkJdT12fc32lw4wBFDBoLtdvgoV+6DRQlM95LGSJzv3/ajO8krooCmhKepOCHWAWU8jdauj8w7duaLZLLvwBqt5aO8h6u6s9gLV5/RBr5Xq3vuT0EKHToOUGZ3oveP7O3b28aGDf09AaAxJ3xuQ/uHHp1j4G/s/dE+ozqPJTvSriVogKXISEGhePTo2bn0tQHPl5uuUstlhcSgGEObIRcVzIp9SOOZrQHKO/UykG9F2hXJQpnqBr/Vkn9S0mfppfKu6z7hPmHbfpscJhavDHWH1poA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(10067099003)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yF8e1fpHK0oIzPJahqQnMIAHdfn1ktRCu6kDvNm3WwnwOhJWUoxG1X+nZdFk?=
 =?us-ascii?Q?gpR+GVE4Em7NVndVE5ucytBGWyUEmtu9ZFHqoVRMQtqyr5DevjZTlfaj472B?=
 =?us-ascii?Q?W5VKmNQmqoagaRqZGAyTgE0Iv5urJc5C6lyHZVnzwFE6ayOpUn3B6GYIrsRK?=
 =?us-ascii?Q?/mSlkb2LR6NP6nNGC3SU7wjT4YXb4puewv8b/w+NJbofevlUe/TDo3iV9kbW?=
 =?us-ascii?Q?A9QwL3cDYNGnthY3ZCfZQ7rOGYUA3eBqkntXdsiRfujJ/EdV2rT1AyS+2iJG?=
 =?us-ascii?Q?Y96/hGr41SLNy781L1zemg3NovmwXBEkhP/PyTOdmEQryB7uMZac7mPJbk0u?=
 =?us-ascii?Q?6RYlTKrea6nRKPphwOd6GVuZmyc4vO5d6idsZ0KbWS8YCbs4yY3Q2NgCvjq8?=
 =?us-ascii?Q?H1DnF5HQu587SCmUvfQTGOP8VEE6ouBZBANFX7CtVcKCf1h1VcrcIFCHaNyb?=
 =?us-ascii?Q?0e6cKv0dmKWMasmWApNByuBpPxo4XRErlpPtOaffsQqXIEyY4+SWccRv5jdh?=
 =?us-ascii?Q?bWoKMKn9+tLus0AFVks0a0XXPYPb8M5xxE94AJZ6Z/qTeP/KgXxCZurG9s0p?=
 =?us-ascii?Q?rCTRmDmdERqa9F7w/Z5Ds4vqhIfMBKqnigvUDw+L8ZaKls3azlggHMN36+CN?=
 =?us-ascii?Q?wnVpKLllGQ7sg2MuOGfygUAYN981I5oaG0tBWm3ivaxbiNDiufG/OAOGxNv+?=
 =?us-ascii?Q?IUPL73RCpSxywCJcHJVQshn7bw3UOUQfrFiNHmEeKHy8z8CtvE6FC8PHO1Kn?=
 =?us-ascii?Q?+sfvlGqTP7n6MCycb64kW97iGDka7I30gMCr1YmExYU3PiQIyCA5mL2TrKRQ?=
 =?us-ascii?Q?FSbDRzAdhDYjuKn1Twvi3n0x150hVcays+inj064Pen6glb9s34HM/+KU6LZ?=
 =?us-ascii?Q?mmpKSaZtMlCqEYSiEz6Fl+x1nzpvmyxyjyCBEbJeBmSq6jUUv/JL/BqqpC7D?=
 =?us-ascii?Q?xTJrhxb8uIWsoAv5HvruA9FYr5QQ9mf1UsbzNPUc5J8bitRQKUSBpsN1sPie?=
 =?us-ascii?Q?afDJRgdL3LyW3kfZ7iRyDXo2MyZIY9sUbMa6SnQQZZgMF8xi4+oDinb743qb?=
 =?us-ascii?Q?EzmSlH5+wMbxvLdJHAU4rElwBtE3KEoxzxRDnM+AGr3Pau4PBUaPw9qlwqXh?=
 =?us-ascii?Q?03OhDuSYsaPcUXiUNMG3uT6yaw8uflMuSCsTzFlIjRgqw74asGofyUoauMMS?=
 =?us-ascii?Q?5ApVIEvWgQka8h+sd+gk6tEh46y/j4dqmaDK98KOatod/UFeDpbWDmvjpX9H?=
 =?us-ascii?Q?HZc2gIpXbNuhST/De7Jjn5Mig1sbpKiyqFUfqhMjyIGT1aizewsXn9GPZDq+?=
 =?us-ascii?Q?kPuJkB1Y1D2/f7VXX05smMy9EtEiKQTkDmvt4C5YuehpPeqe/hUd83gG9jw/?=
 =?us-ascii?Q?fDqR5D2slijW7U7X1Z/lSmqzt7I+xHX/GBQ2/VsKlxU0lGNeyZfaspk/juNc?=
 =?us-ascii?Q?4RkbPpFllAZJGBLKsueDWBfsZZsZrtXLaD0SERqDvuJWVlY+bzK4ZkTwmlpB?=
 =?us-ascii?Q?HTdWFfNTwx9eZQ+hUFEL2cqQ02jjvXgCAqN02dF0PqKkt7Y2I+U9fkcJ1yVq?=
 =?us-ascii?Q?19eGNLJ/NUrfZHmxxxt6AMUCmwHQkmEeGaJVeovdlznpPW7bcXCDPK3QxsUU?=
 =?us-ascii?Q?b5LuC140iPEvZ5iiDW2/zrBHTwtzXRbErOsubrIfJBuJZY2OIJKL+9VQXrGm?=
 =?us-ascii?Q?l0zfXwp/DDTskNkE6VwTXC4nCo2DConsNYGQLPdT838f9/GQnSR2B/zanEuU?=
 =?us-ascii?Q?TJOQsB56cLIGkjRCtEXHMt7SdzPQ+MnaJ5qWnKv5XlwNWvPrU5ma?=
X-Exchange-RoutingPolicyChecked: fdLz1yh6z7Aj70Jj4Ni9lbb3Nm9YUmJe5Ji3hFQqAXLvpcds5DW3l0o2lkzLAMP7vSAWx9UddDX0nkXcE7sObN9PwaBOpagHvUFhRSpZkqLTRpCLENc5sU83kHMQGhkvB0cWd3FeUpE1iPM7ycm2yeo7a0cecvU5m7fxFISA2ljwHmBOCTGnwH4CeOGPy6YA/SYGn8zHWOPYbsZITSGwDWq1tk0xe8I8W8qEUZwyNjNe+ZKfy7QE7SMpeB65hjKwpHwdyBpdGA1ujjjgeZOoBtZ3n6GttxwCPD+3EYogOYSuOgp2cW5E3nNlHsdGLYSLwAOSfw0KQh/xXoNLue/kuw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a76b80f-81a4-45c4-b795-08defda523ac
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:51:24.6064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwnh/lNq1PUBNQ92YoCNjHok5wkaYn3quK+9oP9JDNXRp3cI6Sw/WUYh9WoCintH40k+nbqIjjvgQ70fcLqTCQQEAR6/52luREnQbTWwv7Hr4DNgA3h+tbW75AOdRZKu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6926
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

On Tue, Aug 18, 2026 at 06:01:20PM -0700, Matthew Brost wrote:
>On Tue, Aug 18, 2026 at 04:27:14PM -0700, Niranjana Vishwanathapura wrote:
>> On Tue, Aug 18, 2026 at 02:05:10PM -0700, Matthew Brost wrote:
>> > On Wed, Aug 19, 2026 at 02:38:39AM +0800, Jagmeet Randhawa wrote:
>> >
>> > This is designed to be lockless.
>> >
>> > > q->guc->suspend_pending is accessed without any common lock.
>> > > __suspend_fence_signal(), called from guc_exec_queue_kill() and the
>> >
>> > This is actually the problem. __suspend_fence_signal shouldn't be called
>> > from guc_exec_queue_kill(). This can prematurely signal a suspend fence
>> > while the hardware is still executing.
>> >
>> > __suspend_fence_signal should be called in two possible places:
>> >
>> > - Naturally in G2H handler (handle_sched_done)
>> > - Or in global event that takes down the GuC firmware
>> >  (guc_exec_queue_stop)
>> >
>> > With that, a lock isn't need because the state machine / firmware
>> > interaction ensures everything is race free.
>> >
>> > So I think the solution is ensure __suspend_fence_signal is called in
>> > the correct places rather than adding protection via a lock.
>> >
>>
>> Matt,
>>
>> I think it is probably not as trivial as dropping __suspend_fence_signal()
>> from guc_exec_queue_kill() for following reasons.
>
>Let's take a step back, has existing code been linked to any bugs?
>

Below Sashiko report brought it up as a pre-existing issue.
https://sashiko.dev/#/patchset/20260713202317.2187787-8-niranjana.vishwanathapura%40intel.com

>>
>> 1. __suspend_fence_signal() is also called from
>>    guc_exec_queue_suspend_timeout_ban() if suspend_wait times out.
>>
>
>Yes, this is another example of where this should not be called.
>

If we do not call it, then it will leave queue as suspended forever, which
can result in some other asserts down the line. Clearing it is part of the
error handling recovery it looks like. As I mentioned, it will likely hit
the !suspend_pending assert in guc_exec_queue_resume() under current code.

>> 2. Calling __suspend_fence_signal() wakes up any suspend_wait(),
>>    which otherwise will have to wait 5 seconds before timing out.
>>    If in guc_exec_queue_kill(), if we just try to wake up suspend_wait,
>>    without clearing suspend_pending, then a resume() might run before
>>    TDR kicks in and hits the !suspend_pending assert.
>>
>
>Don't do a wake here.
>

If we do not wake here, then every kill happended during a suspend can
leave the suspend_wait() wait for 5 seconds to see the queue has been killed.

>> 3. Even if we drop __suspend_pending_signal() from guc_exec_queue_kill()
>>    and guc_exec_queue_suspend_timeout_ban(), we still have
>>    handle_sched_done() and guc_exec_queue_stop() which can race against
>>    each other in accessing suspend_pending and clearing it.
>
>I don't think this part can race.
>
> - __guc_exec_queue_process_msg_suspend, this is only there for GT
>   resets racing (I think). This should be executed before or after
>   guc_exec_queue_stop() but not in parallel.
> - guc_exec_queue_wait_suspend_done(), this on wait queue and we don't
>   have lock upon reading, at least in this patch. So if justification
>   is all readers need a lock, then this is missing in this patch.

The locking in this patch is more of a write side serialization lock
(where supend_pending is written and where test-and-clear cases). So,
I don't think we need locking here for reading suspend_pending.

> - guc_exec_queue_stop() touch this but this code is only reachable
>   when GuC exec queue is stopped and CTs are down. I guess a new
>   suspend could come in and race, so maybe in a lock is needed here.
>
>>
>> So, probably this locking extention patch here might be simpler and
>> effective.
>
>I'm thinking this need a bit more rework and would like to get this
>right in single patch. I'm fine with a lock, but let's at least make
>guc_exec_queue_wait_suspend_done() consistent in using a lock and remove
>the two places we should not be calling __suspend_pending_signal().
>

Dropping __suspend_fence_signal() in those places will lead to above
mentioned issues with current state of the driver. I am worried that
fixing those might be beyond the scope of this patch. What do you suggest?

Niranjana

>Matt
>
>>
>> Niranjana
>>
>> > Matt
>> >
>> > > suspend-timeout ban path, clears the flag asynchronously. Meanwhile
>> > > handle_sched_done(), guc_exec_queue_stop() and
>> > > __guc_exec_queue_process_msg_suspend() check the flag and then call
>> > > suspend_fence_signal(), which asserts that it is still set.
>> > >
>> > > As the check and suspend_fence_signal() are not atomic, the clear can
>> > > land in between and trip the xe_gt_assert(q->guc->suspend_pending).
>> > >
>> > > The flag is already set and read under the per-queue msg_lock
>> > > (xe_sched_msg_lock()) on the suspend and resume paths. Extend that same
>> > > lock to the clear paths (kill and ban) and to the three check-then-act
>> > > sites so the check and the signal are atomic with respect to the clear.
>> > > In __guc_exec_queue_process_msg_suspend() only the non-sleeping branch is
>> > > wrapped, since the other branch waits. In handle_sched_done() the flag is
>> > > snapshotted under the lock and deregister_exec_queue() is kept outside it.
>> > >
>> > > v2: Document that sched->msg_lock also protects
>> > >     guc->suspend_pending, which indicates a suspend message is in
>> > >     flight, in addition to the sched->msgs list (Niranjana)
>> > >
>> > > Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  5 +++-
>> > >  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  5 +++-
>> > >  drivers/gpu/drm/xe/xe_guc_submit.c           | 29 ++++++++++++++++----
>> > >  3 files changed, 32 insertions(+), 7 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>> > > index 63d9bf92583c..78ef2e8ded4f 100644
>> > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>> > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>> > > @@ -47,7 +47,10 @@ struct xe_gpu_scheduler {
>> > >  	const struct xe_sched_backend_ops	*ops;
>> > >  	/** @msgs: list of messages to be processed in @work_process_msg */
>> > >  	struct list_head			msgs;
>> > > -	/** @msg_lock: Message lock */
>> > > +	/**
>> > > +	 * @msg_lock: Protects @msgs and guc->suspend_pending (indicates a
>> > > +	 * suspend message is in flight) of exec queues on this scheduler.
>> > > +	 */
>> > >  	spinlock_t				msg_lock;
>> > >  	/** @work_process_msg: processes messages */
>> > >  	struct work_struct		work_process_msg;
>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> > > index d27826b36649..74b711abe257 100644
>> > > --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> > > +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> > > @@ -52,7 +52,10 @@ struct xe_guc_exec_queue {
>> > >  	u16 id;
>> > >  	/** @suspend_wait: wait queue used to wait on pending suspends */
>> > >  	wait_queue_head_t suspend_wait;
>> > > -	/** @suspend_pending: a suspend of the exec_queue is pending */
>> > > +	/**
>> > > +	 * @suspend_pending: a suspend of the exec_queue is pending.
>> > > +	 * Protected by @sched.msg_lock.
>> > > +	 */
>> > >  	bool suspend_pending;
>> > >  	/**
>> > >  	 * @suspend_count: Reference count of active suspend requests. The
>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > index 9036f89dff7d..c565c1d32d3a 100644
>> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > @@ -1928,9 +1928,13 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>> > >  			set_exec_queue_suspended(q);
>> > >  			disable_scheduling(q, false);
>> > >  		}
>> > > -	} else if (q->guc->suspend_pending) {
>> > > -		set_exec_queue_suspended(q);
>> > > -		suspend_fence_signal(q);
>> > > +	} else {
>> > > +		xe_sched_msg_lock(&q->guc->sched);
>> > > +		if (q->guc->suspend_pending) {
>> > > +			set_exec_queue_suspended(q);
>> > > +			suspend_fence_signal(q);
>> > > +		}
>> > > +		xe_sched_msg_unlock(&q->guc->sched);
>> > >  	}
>> > >  }
>> > >
>> > > @@ -2130,7 +2134,9 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
>> > >  {
>> > >  	trace_xe_exec_queue_kill(q);
>> > >  	set_exec_queue_killed(q);
>> > > +	xe_sched_msg_lock(&q->guc->sched);
>> > >  	__suspend_fence_signal(q);
>> > > +	xe_sched_msg_unlock(&q->guc->sched);
>> > >  	xe_guc_exec_queue_trigger_cleanup(q);
>> > >  }
>> > >
>> > > @@ -2392,11 +2398,15 @@ static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
>> > >  	 */
>> > >  	if (xe_exec_queue_is_multi_queue(q)) {
>> > >  		set_exec_queue_group_banned(q);
>> > > +		xe_sched_msg_lock(&q->guc->sched);
>> > >  		__suspend_fence_signal(q);
>> > > +		xe_sched_msg_unlock(&q->guc->sched);
>> > >  		xe_guc_exec_queue_group_trigger_cleanup(q);
>> > >  	} else {
>> > >  		set_exec_queue_banned(q);
>> > > +		xe_sched_msg_lock(&q->guc->sched);
>> > >  		__suspend_fence_signal(q);
>> > > +		xe_sched_msg_unlock(&q->guc->sched);
>> > >  		xe_guc_exec_queue_trigger_cleanup(q);
>> > >  	}
>> > >  }
>> > > @@ -2614,10 +2624,12 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>> > >  		if (exec_queue_destroyed(q))
>> > >  			do_destroy = true;
>> > >  	}
>> > > +	xe_sched_msg_lock(sched);
>> > >  	if (q->guc->suspend_pending) {
>> > >  		set_exec_queue_suspended(q);
>> > >  		suspend_fence_signal(q);
>> > >  	}
>> > > +	xe_sched_msg_unlock(sched);
>> > >  	atomic_and(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_BANNED |
>> > >  		   EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_DESTROYED |
>> > >  		   EXEC_QUEUE_STATE_SUSPENDED,
>> > > @@ -3222,13 +3234,20 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>> > >  		smp_wmb();
>> > >  		wake_up_all(&guc->ct.wq);
>> > >  	} else {
>> > > +		bool was_pending;
>> > > +
>> > >  		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
>> > >  		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
>> > >
>> > > -		if (q->guc->suspend_pending) {
>> > > +		xe_sched_msg_lock(&q->guc->sched);
>> > > +		was_pending = q->guc->suspend_pending;
>> > > +		if (was_pending) {
>> > >  			clear_exec_queue_pending_disable(q);
>> > >  			suspend_fence_signal(q);
>> > > -		} else {
>> > > +		}
>> > > +		xe_sched_msg_unlock(&q->guc->sched);
>> > > +
>> > > +		if (!was_pending) {
>> > >  			if (exec_queue_banned(q)) {
>> > >  				smp_wmb();
>> > >  				wake_up_all(&guc->ct.wq);
>> > > --
>> > > 2.53.0
>> > >
