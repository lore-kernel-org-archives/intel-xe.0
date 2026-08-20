Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035F2C5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 04:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A233310E5C2;
	Thu, 20 Aug 2026 04:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d59MWlB0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F96310E5C2
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 04:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787199236; x=1818735236;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jxcT3ygnsDjEz/Sc7c0xQ12fXj6OWna/tPJDufkFJ0E=;
 b=d59MWlB06q7syv1cDargVzlJ/SZNjgtGxif7SBZGLv9zNBgVBA5YVG+X
 XP6oOAslpX7klIlvv28GpTrHIox7l1Z3F+5feRPpX8r3K0/eOGw3FcC9q
 u1PWqLlxRp3coo/hH9T4XlxFqBqnVG6rUiNI9xzH6NL5Ea0h0dUph3o6l
 KW74MYGWYGEdz/g13IfqIjZnz/QOHmI+J6M6ujTDSpVhLmMQw9LLDRMfB
 GE/KVkiLQfaS4/E8tPB04w44lj3YHBRWhcT2pzRlZGd2AE5dcKleMNLeq
 HvFgo1CE2U6G9JXAppU+JK8vrNjcJQFKMovUH99DN6ehYCBr1yrUBit/d g==;
X-CSE-ConnectionGUID: C+cMcUl2RtuswywJ4+43ZA==
X-CSE-MsgGUID: DBIeKrjLRtSjMFoHT3tdyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="99082022"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="99082022"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 21:13:56 -0700
X-CSE-ConnectionGUID: RICO7S63R+Ocx4DDqMMcgw==
X-CSE-MsgGUID: ++xbg5dKQo+SqBbX8Ld1gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="269317587"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 21:13:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 21:13:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 21:13:54 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 21:13:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCAXpLaAXVJkkpgCnszPYCIM2K9V+t+xjPwAfIj7a6W+IYkz0oQXSrBU10rPqvogWeyS1hZ6X90acvrK+Ot625aESt+OZrgN1StK8JIptqfbNOZuhlYwE9RavvS1c81lR9MmLFob9CDad7M4Jxz+wrjNiIQwqPr8bo9wFO/prNmk9tNz2fJ/dx3G1moFACYmpqcLyGLUihzdJQO02AKwr9IYqAjBpx2dZpb0M+e0IeW1AsUalekow5fgaurdwEdWcj7wN5bYOh2AMB6yxNWbDp7bjJEhB8uh6ZNoRV2G5JSLOF9vxxxwAqGFB2DcEp8UO+I+ax6gFcAz0tgma9FWnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXCPbdFWkLQZfSCZh15Yx5qmVWgxPDqMM3v369FIwzA=;
 b=WQ2NfXXtJkrsS+hHEIYzxPWjGaFJTktG+jjmSalphXD37LMS7byZtdm23R/qA8MO8l6hqb/yRPF8xjk3K7Clp5kuxFvLjqRvgyeLirlta8NbX8Cvn28IiGvURGbGagv+cI87F+hLb4hHHLjBGJqwgplp1005QHEhGip0jNCM/0tnbrzgT9Ge5qUYALxt0YSL8pzxYUl8UsR0zVk0InaLUP4mvkkhXmTQrO7KAnZtXLk/tDj/RyUMI2TWXm6BKBGUb78YDcSL0X2gOkrgt4JQwBjIrWdFtGwwSNW02JkrJKS+bgE5xkSDVAuom/ZPD9qhgnYBC5ZWF25r1owWSx1tqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SJ1PR11MB6179.namprd11.prod.outlook.com (2603:10b6:a03:45a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 04:13:40 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 04:13:34 +0000
Date: Wed, 19 Aug 2026 21:13:31 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/guc: Fix race around q->guc->suspend_pending
 access
Message-ID: <aoZ-6-TnzfLo5Vt7@nvishwa1-desk>
References: <20260818183838.273486-2-jagmeet.randhawa@intel.com>
 <aoTJBly70vnRnrwK@gsse-cloud1.jf.intel.com>
 <aoTqUiIq8DMoT1dK@nvishwa1-desk>
 <aoUAYKkua2E065zU@gsse-cloud1.jf.intel.com>
 <aoUoOdNmsUHLt1p9@nvishwa1-desk>
 <aoYFjxHK4fcQ52Xf@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aoYFjxHK4fcQ52Xf@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SJ1PR11MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b55e161-e714-43a6-70fc-08defe7166cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|56012099006|10067099003|4143699003|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7eEyYrEpr8CKmY937o24798wQ+D8F6o3i97b/bIMYX9QPfXAOugOKnwF+mBkeEWL1v11EFXh0aq/bOsX0xfGvZUetCoalM8cPFfrY8+ZkMCDwx92eGhJsyYmJLoYMA7bNtdKMdqD/cARmVPMGMQD0rxiWpV0nHxgLEH56H5sQVM0Gx8Z6bn5Ddj4b7ip8msnrj3U9XDfmR2PiltrdMnlopDhcfhcra4CyX6K88bIM6NZDjpzaWzMWCmBIRq5RcCcZo/b9nOPJ71j2WNWj6dTWZd7qBzMk7ZpaaS8ELixT9q+6t0w/6o8wLS0xem5+GIVyo5LBo0xRibH0D1O7sIyCaK0elkU/q98lnxyU+m8Qk81B6jvpg5Kgr2vZA3GMRzJXIxNitTmejSl0CFH84mXUvPe6VB/5saPYaFkTiZfvG10+cnBTXmCUd16A839t8gAxDVaDc38nGbvaKfwcdm0Tyw65rsjfNS8KTYAFPK4xfeQ3Jfim96ZCrvPdpnzD/CUTKGYxtP9BuGopvef+V9Uc40Weqi5ttIz1LP7e6IBTenx4/4WW6rm690GxnNy3To8Voi1YmklTAmDJDRLpxYfSaoP6QWAcb+tnXzD/A9DLxM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(5023799004)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JdJGq3gjsbEcDh55KMAw7MzKT4cEZgoRL9jtf45nLYD/E/rhgjMBHoaCvmvE?=
 =?us-ascii?Q?nTjiEUuUkVcTEAvIpTeFmwO9t0ljdRWGeHXw0l4WOlSLIZr1IKKx7ERCcfro?=
 =?us-ascii?Q?tLybS0mzg5F0M1OfCqGqy8B2lrAuSqVnStSN+s/oWEMSRMGWvTKFqFhMfCDs?=
 =?us-ascii?Q?hZ/Dhqv8S2LOXULDPvfc58pGIFuaVnmMNEefIx+p6tDSB5JhFvIMZ/w5fEg1?=
 =?us-ascii?Q?dWl2A6udh6YFUeLKpaSZ3Y3kt/7tL9RiUy/3JqXXUvpVSTw/QWuCrvuIHS4D?=
 =?us-ascii?Q?2lR4aCPuG8K9ZQpnXQMDsJxZbvkhkUnDU9o74RGrPhhhxzblYE0QQdjY7W6L?=
 =?us-ascii?Q?Yb2SuMvts+qOmaJWfqKiqA6//GPJey1TQbn08AXgK47u4X3PHOePIQ6+0ikq?=
 =?us-ascii?Q?iToRqyyQhd+9QzaxlV6AgmKFVKCHz6sMHFpIEtwJT0/gkjQooINyOHSrW2eR?=
 =?us-ascii?Q?f/WT64oGW7saxqt+RvNX+ecEdVBK+dWr9qrYQqMvJG2gKdEvCJfYXrPZ6MiM?=
 =?us-ascii?Q?Q5SawLJ6+WVDxwMM8o94xPlV/8o2cg/6ZnXCEChJjEjdox4rNp/9LDb7dgJ+?=
 =?us-ascii?Q?BNWzR8MuVB1/Wvn5P4Q4Ex6Yi4XrpyBzayyAP+oXxySwqieFnef3dNKFPj13?=
 =?us-ascii?Q?eEBXbIs2zHbFXd2Th+aj5CnoARwO+7TxrKZtecHmyEQHuqWYsVs8Tttp8W1t?=
 =?us-ascii?Q?mqQwyeHrPtT2FNMT73MBLHLmPlMPl3CF4tci3fqZZRNJ0c4fTkqr14x6SxDc?=
 =?us-ascii?Q?wqA81uvU23aaipLhmXO9Sg3u6WyNYCjZ7bWPOnHZ4Fk2WH/U+/X5l3QxGpXa?=
 =?us-ascii?Q?NcNvbuDgqkZfn8ECXXHiURIkwwl2nWnyixl1GjiaN3jQZDqlfnZbtiCq7ZOJ?=
 =?us-ascii?Q?/6joybzWneyRJCGKWfLj+4uehUfdP/MbHoV7BRMbSm49ffCa3LVxZaOI7SpA?=
 =?us-ascii?Q?Q7IUn7vAenmmxMWbrMA8OIhCmgPRkHpTXlQAm1u6URNIbLM80Wam5+SD89zR?=
 =?us-ascii?Q?eXBSR2EM+assL4cKL3OJEqioH0QtuQbwlD5CxqfhxxLlShWjh34MiR7/RY9z?=
 =?us-ascii?Q?xIgpS/fe5v6PK9V6za14XdcN+QOGYrRvf0gQLsn50BgyPlOrfmNuIsOrngro?=
 =?us-ascii?Q?q/d6JCO1Owgwqgw0Um6PcxqcFBU5rmGMo78zWn+IeRqY9JwicPR2i0A3oYho?=
 =?us-ascii?Q?0qaaHnFp6uadXsidY4sxffcPnFEHbeaOXkCM0SSAWt8z0AxnRS7o2exaXr4e?=
 =?us-ascii?Q?QMBqEDVxGg64oTZA1tnhRWSm+xcS8Y2DcZYEQH7TTAAwvwrV2Rf7YkP0tQX2?=
 =?us-ascii?Q?9h/VVxYhnK62MFJ+14kaFBG+yvmQI/Kvu5YbbyXTlchQgnCPgfBkVBYjEoZJ?=
 =?us-ascii?Q?EiYp9guulzgxrBatTove+y/QtLaBimrIdRUjJ5rYpKud/MzQSzNCCyb0aaR7?=
 =?us-ascii?Q?f6uWNImbCq1SsWDiXmDMZPzrVkNQkvJmtBa7hnKAmk4ivpU+aFBIEUvsaWWL?=
 =?us-ascii?Q?WCg+xaW/d61judgqu2N1LZWS+I39wsebOHHD59EWXostMva2xSY/5KEmzUO/?=
 =?us-ascii?Q?g9umbFawMFw6Us56oiwNPUXd2/0/vpz5gj+hBphaghvgZMc46NgOslaDi+pu?=
 =?us-ascii?Q?a1Fo20sbrj023Ib2bW67T63cVLU7xjzYakTW+ynvQFV1Tz+u/lX/4m+zVDFb?=
 =?us-ascii?Q?7mBXtHIT6+rOFA5plUSPT4Z4+GyEAAdhrqu11vHOrkv/T2G0Oojb/K9RRbho?=
 =?us-ascii?Q?/3AsgukVbUsR72i9TOfyrHrUBoeEuynIv5sL9rEK+mVrdFb0qOb8?=
X-Exchange-RoutingPolicyChecked: Z42Qngu4QyRp5aoT8rCQxG2+THyR3C8h4t0ULwaoHgb7LjQyGeMo8baae6HFExCNg2ksD3YV5WVI7tesYiqd3OhhfIE+rdIcz9Nptq7vVAyWwZAviehB1JQM5QFADP/Gi31U8kMAIPfMe2EC87KSmXyXd2PYdoBkyv2mXVn8rd5Z+GJjYLy3ZmL1L1ZSpWbWResfGbBYHSPDCsDtS5qb5b/vL0N2YfsCbjQ3arPqIcuU51AxvcUltoUImjqvC2ueWZVq9TaSRvte104t1HuNVfygl8lxrVAc8iJuzFIos5bILob1uEUl7kzj29k4bHnkwW4rvAz8v5UB0ptbrkQlFA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b55e161-e714-43a6-70fc-08defe7166cd
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 04:13:34.4976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xiCalHetpdbkni2Ne8P+eLYIoVJRUlXeiPP9Arh67jhfTjQGlDEYQlyO0ajje6eRPPpoiGrnhpKoURqhZ0hIE1bAeNNA36Tfq0E28xCTJQ1ARO6SBvF5Skqdjx/RdJx8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6179
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

On Wed, Aug 19, 2026 at 12:35:43PM -0700, Matthew Brost wrote:
>On Tue, Aug 18, 2026 at 08:51:21PM -0700, Niranjana Vishwanathapura wrote:
>> On Tue, Aug 18, 2026 at 06:01:20PM -0700, Matthew Brost wrote:
>> > On Tue, Aug 18, 2026 at 04:27:14PM -0700, Niranjana Vishwanathapura wrote:
>> > > On Tue, Aug 18, 2026 at 02:05:10PM -0700, Matthew Brost wrote:
>> > > > On Wed, Aug 19, 2026 at 02:38:39AM +0800, Jagmeet Randhawa wrote:
>> > > >
>> > > > This is designed to be lockless.
>> > > >
>> > > > > q->guc->suspend_pending is accessed without any common lock.
>> > > > > __suspend_fence_signal(), called from guc_exec_queue_kill() and the
>> > > >
>> > > > This is actually the problem. __suspend_fence_signal shouldn't be called
>> > > > from guc_exec_queue_kill(). This can prematurely signal a suspend fence
>> > > > while the hardware is still executing.
>> > > >
>> > > > __suspend_fence_signal should be called in two possible places:
>> > > >
>> > > > - Naturally in G2H handler (handle_sched_done)
>> > > > - Or in global event that takes down the GuC firmware
>> > > >  (guc_exec_queue_stop)
>> > > >
>> > > > With that, a lock isn't need because the state machine / firmware
>> > > > interaction ensures everything is race free.
>> > > >
>> > > > So I think the solution is ensure __suspend_fence_signal is called in
>> > > > the correct places rather than adding protection via a lock.
>> > > >
>> > >
>> > > Matt,
>> > >
>> > > I think it is probably not as trivial as dropping __suspend_fence_signal()
>> > > from guc_exec_queue_kill() for following reasons.
>> >
>> > Let's take a step back, has existing code been linked to any bugs?
>> >
>>
>> Below Sashiko report brought it up as a pre-existing issue.
>> https://sashiko.dev/#/patchset/20260713202317.2187787-8-niranjana.vishwanathapura%40intel.com
>>
>
>Ok.
>
>> > >
>> > > 1. __suspend_fence_signal() is also called from
>> > >    guc_exec_queue_suspend_timeout_ban() if suspend_wait times out.
>> > >
>> >
>> > Yes, this is another example of where this should not be called.
>> >
>>
>> If we do not call it, then it will leave queue as suspended forever, which
>> can result in some other asserts down the line. Clearing it is part of the
>> error handling recovery it looks like. As I mentioned, it will likely hit
>> the !suspend_pending assert in guc_exec_queue_resume() under current code.
>>
>
>But the upper layers shouldn't call resume if suspend_wait fails, hence
>we shouldn't hit that assert.

Looks like there are cases where it does get called but
__guc_exec_queue_process_msg_resume() handles it by checking the
guc_exec_queue_allowed_to_change_state().

I think it should be fine. We can drop the __suspend_fence_signal() here
and avoid the !suspend_pending assert by adding additonal condition that
the queue must not be in a killed/banned/wedged state.

>
>> > > 2. Calling __suspend_fence_signal() wakes up any suspend_wait(),
>> > >    which otherwise will have to wait 5 seconds before timing out.
>> > >    If in guc_exec_queue_kill(), if we just try to wake up suspend_wait,
>> > >    without clearing suspend_pending, then a resume() might run before
>> > >    TDR kicks in and hits the !suspend_pending assert.
>> > >
>> >
>> > Don't do a wake here.
>> >
>>
>> If we do not wake here, then every kill happended during a suspend can
>> leave the suspend_wait() wait for 5 seconds to see the queue has been killed.
>>
>
>The suspend message should either issue a H2G that will result the
>suspend fence signaling in the G2H or signal it directly *after* the
>queue is off the hardware.
>
>But I do see a potenial race. The kill really needs to be ordered behind
>any suspends too.
>
>We probably want a version of this patch which only sets the kill bit
>inside the KILL message:
>
>https://patchwork.freedesktop.org/patch/732703/?series=168398&rev=4
>

I think we should be fine to drop __suspend_fence_pending() here. We can
just do the wakeup part here for now to ensure suspend_wait() gets woken
up properly as we are setting the state to 'killed'.

>> > > 3. Even if we drop __suspend_pending_signal() from guc_exec_queue_kill()
>> > >    and guc_exec_queue_suspend_timeout_ban(), we still have
>> > >    handle_sched_done() and guc_exec_queue_stop() which can race against
>> > >    each other in accessing suspend_pending and clearing it.
>> >
>> > I don't think this part can race.
>> >
>> > - __guc_exec_queue_process_msg_suspend, this is only there for GT
>> >   resets racing (I think). This should be executed before or after
>> >   guc_exec_queue_stop() but not in parallel.
>> > - guc_exec_queue_wait_suspend_done(), this on wait queue and we don't
>> >   have lock upon reading, at least in this patch. So if justification
>> >   is all readers need a lock, then this is missing in this patch.
>>
>> The locking in this patch is more of a write side serialization lock
>> (where supend_pending is written and where test-and-clear cases). So,
>> I don't think we need locking here for reading suspend_pending.
>>
>> > - guc_exec_queue_stop() touch this but this code is only reachable
>> >   when GuC exec queue is stopped and CTs are down. I guess a new
>> >   suspend could come in and race, so maybe in a lock is needed here.
>> >
>> > >
>> > > So, probably this locking extention patch here might be simpler and
>> > > effective.
>> >
>> > I'm thinking this need a bit more rework and would like to get this
>> > right in single patch. I'm fine with a lock, but let's at least make
>> > guc_exec_queue_wait_suspend_done() consistent in using a lock and remove
>> > the two places we should not be calling __suspend_pending_signal().
>> >
>>
>> Dropping __suspend_fence_signal() in those places will lead to above
>> mentioned issues with current state of the driver. I am worried that
>> fixing those might be beyond the scope of this patch. What do you suggest?
>>
>
>My opinion is that this patch is trying to work around broken code in
>the state machine, which we have to fix anyway. I'd rather audit
>everything related to kill and suspend fences and get it right, rather
>than adding locking on top that we'd have to unwind later anyway. If
>this were a band-aid for a reported crash, then maybe. However, this is
>a Sashiko report suggesting a fix for what I see as already broken code.
>

I agree, but by not calling __suspend_signal_fence() we would leave the
suspend_pending to true in those cases until the queue is teared down.
Perhaps it should be ok.

So, does dropping __suspend_fence_signal() from guc_exec_queue_kill() and
guc_exec_queue_suspend_timeout_ban() (with above adjustments) and keeping
the other 2 places under the lock looks ok?

Niranjana

>Matt
>
>> Niranjana
>>
>> > Matt
>> >
>> > >
>> > > Niranjana
>> > >
>> > > > Matt
>> > > >
>> > > > > suspend-timeout ban path, clears the flag asynchronously. Meanwhile
>> > > > > handle_sched_done(), guc_exec_queue_stop() and
>> > > > > __guc_exec_queue_process_msg_suspend() check the flag and then call
>> > > > > suspend_fence_signal(), which asserts that it is still set.
>> > > > >
>> > > > > As the check and suspend_fence_signal() are not atomic, the clear can
>> > > > > land in between and trip the xe_gt_assert(q->guc->suspend_pending).
>> > > > >
>> > > > > The flag is already set and read under the per-queue msg_lock
>> > > > > (xe_sched_msg_lock()) on the suspend and resume paths. Extend that same
>> > > > > lock to the clear paths (kill and ban) and to the three check-then-act
>> > > > > sites so the check and the signal are atomic with respect to the clear.
>> > > > > In __guc_exec_queue_process_msg_suspend() only the non-sleeping branch is
>> > > > > wrapped, since the other branch waits. In handle_sched_done() the flag is
>> > > > > snapshotted under the lock and deregister_exec_queue() is kept outside it.
>> > > > >
>> > > > > v2: Document that sched->msg_lock also protects
>> > > > >     guc->suspend_pending, which indicates a suspend message is in
>> > > > >     flight, in addition to the sched->msgs list (Niranjana)
>> > > > >
>> > > > > Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> > > > > ---
>> > > > >  drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  5 +++-
>> > > > >  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  5 +++-
>> > > > >  drivers/gpu/drm/xe/xe_guc_submit.c           | 29 ++++++++++++++++----
>> > > > >  3 files changed, 32 insertions(+), 7 deletions(-)
>> > > > >
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>> > > > > index 63d9bf92583c..78ef2e8ded4f 100644
>> > > > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>> > > > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>> > > > > @@ -47,7 +47,10 @@ struct xe_gpu_scheduler {
>> > > > >  	const struct xe_sched_backend_ops	*ops;
>> > > > >  	/** @msgs: list of messages to be processed in @work_process_msg */
>> > > > >  	struct list_head			msgs;
>> > > > > -	/** @msg_lock: Message lock */
>> > > > > +	/**
>> > > > > +	 * @msg_lock: Protects @msgs and guc->suspend_pending (indicates a
>> > > > > +	 * suspend message is in flight) of exec queues on this scheduler.
>> > > > > +	 */
>> > > > >  	spinlock_t				msg_lock;
>> > > > >  	/** @work_process_msg: processes messages */
>> > > > >  	struct work_struct		work_process_msg;
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> > > > > index d27826b36649..74b711abe257 100644
>> > > > > --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> > > > > @@ -52,7 +52,10 @@ struct xe_guc_exec_queue {
>> > > > >  	u16 id;
>> > > > >  	/** @suspend_wait: wait queue used to wait on pending suspends */
>> > > > >  	wait_queue_head_t suspend_wait;
>> > > > > -	/** @suspend_pending: a suspend of the exec_queue is pending */
>> > > > > +	/**
>> > > > > +	 * @suspend_pending: a suspend of the exec_queue is pending.
>> > > > > +	 * Protected by @sched.msg_lock.
>> > > > > +	 */
>> > > > >  	bool suspend_pending;
>> > > > >  	/**
>> > > > >  	 * @suspend_count: Reference count of active suspend requests. The
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > > > index 9036f89dff7d..c565c1d32d3a 100644
>> > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > > > @@ -1928,9 +1928,13 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>> > > > >  			set_exec_queue_suspended(q);
>> > > > >  			disable_scheduling(q, false);
>> > > > >  		}
>> > > > > -	} else if (q->guc->suspend_pending) {
>> > > > > -		set_exec_queue_suspended(q);
>> > > > > -		suspend_fence_signal(q);
>> > > > > +	} else {
>> > > > > +		xe_sched_msg_lock(&q->guc->sched);
>> > > > > +		if (q->guc->suspend_pending) {
>> > > > > +			set_exec_queue_suspended(q);
>> > > > > +			suspend_fence_signal(q);
>> > > > > +		}
>> > > > > +		xe_sched_msg_unlock(&q->guc->sched);
>> > > > >  	}
>> > > > >  }
>> > > > >
>> > > > > @@ -2130,7 +2134,9 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
>> > > > >  {
>> > > > >  	trace_xe_exec_queue_kill(q);
>> > > > >  	set_exec_queue_killed(q);
>> > > > > +	xe_sched_msg_lock(&q->guc->sched);
>> > > > >  	__suspend_fence_signal(q);
>> > > > > +	xe_sched_msg_unlock(&q->guc->sched);
>> > > > >  	xe_guc_exec_queue_trigger_cleanup(q);
>> > > > >  }
>> > > > >
>> > > > > @@ -2392,11 +2398,15 @@ static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
>> > > > >  	 */
>> > > > >  	if (xe_exec_queue_is_multi_queue(q)) {
>> > > > >  		set_exec_queue_group_banned(q);
>> > > > > +		xe_sched_msg_lock(&q->guc->sched);
>> > > > >  		__suspend_fence_signal(q);
>> > > > > +		xe_sched_msg_unlock(&q->guc->sched);
>> > > > >  		xe_guc_exec_queue_group_trigger_cleanup(q);
>> > > > >  	} else {
>> > > > >  		set_exec_queue_banned(q);
>> > > > > +		xe_sched_msg_lock(&q->guc->sched);
>> > > > >  		__suspend_fence_signal(q);
>> > > > > +		xe_sched_msg_unlock(&q->guc->sched);
>> > > > >  		xe_guc_exec_queue_trigger_cleanup(q);
>> > > > >  	}
>> > > > >  }
>> > > > > @@ -2614,10 +2624,12 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>> > > > >  		if (exec_queue_destroyed(q))
>> > > > >  			do_destroy = true;
>> > > > >  	}
>> > > > > +	xe_sched_msg_lock(sched);
>> > > > >  	if (q->guc->suspend_pending) {
>> > > > >  		set_exec_queue_suspended(q);
>> > > > >  		suspend_fence_signal(q);
>> > > > >  	}
>> > > > > +	xe_sched_msg_unlock(sched);
>> > > > >  	atomic_and(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_BANNED |
>> > > > >  		   EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_DESTROYED |
>> > > > >  		   EXEC_QUEUE_STATE_SUSPENDED,
>> > > > > @@ -3222,13 +3234,20 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>> > > > >  		smp_wmb();
>> > > > >  		wake_up_all(&guc->ct.wq);
>> > > > >  	} else {
>> > > > > +		bool was_pending;
>> > > > > +
>> > > > >  		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
>> > > > >  		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
>> > > > >
>> > > > > -		if (q->guc->suspend_pending) {
>> > > > > +		xe_sched_msg_lock(&q->guc->sched);
>> > > > > +		was_pending = q->guc->suspend_pending;
>> > > > > +		if (was_pending) {
>> > > > >  			clear_exec_queue_pending_disable(q);
>> > > > >  			suspend_fence_signal(q);
>> > > > > -		} else {
>> > > > > +		}
>> > > > > +		xe_sched_msg_unlock(&q->guc->sched);
>> > > > > +
>> > > > > +		if (!was_pending) {
>> > > > >  			if (exec_queue_banned(q)) {
>> > > > >  				smp_wmb();
>> > > > >  				wake_up_all(&guc->ct.wq);
>> > > > > --
>> > > > > 2.53.0
>> > > > >
