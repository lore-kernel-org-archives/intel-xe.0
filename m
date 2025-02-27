Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7D5C021BE
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 04:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D31D10EA26;
	Thu, 27 Feb 2025 04:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zwpm0AOa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0AA10EA26
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 04:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740631721; x=1772167721;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=81fPfVeLWMbU7RvSsodfdZUlFpFxKq4LAgkWJJkUpQE=;
 b=Zwpm0AOa0TXBXckCq+aYbGb2n1vCC2SbsG+6DYQCLFdkNxQ/cBYrO7mA
 UF7WpYf/F6Fy1Vy9eP/OBGTVZphkC/1S6Huh6nV4IoyiAvgrNkMDyv9RY
 pGtPctTKdP6RsiLt9kWEIA9Cg2zAIbSl/HXFL8FNlz1ksJpkkb0fhWEkK
 xssarO2pGrYQ+YDzMFjkaPHi17XIH/zhjk99UvXKJEgUgN6A7TWnZYcw1
 73zrD0cKAG6w2JNdyypZT1+d4NluKzG53bUgh1BdYo/blj2JfeKbiA+pm
 T1CGK2/Tg7hiJxTEv+2tTJe2EhrR7yY53ANoYrNC0J912co++GHbYvnZT w==;
X-CSE-ConnectionGUID: ov9nZ/lcSIGqI24sBWbmIA==
X-CSE-MsgGUID: fTMdcjJ3SCagH8p80jVjNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41389548"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="41389548"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 20:48:32 -0800
X-CSE-ConnectionGUID: lt9HwOJbTIyh1/mgYelUBA==
X-CSE-MsgGUID: xBnhhPRZQ/6A9AQFTc1Wag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="121924083"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2025 20:48:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Feb 2025 20:48:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 20:48:31 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 20:48:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jd3mPOyEHcJqbiNxPFuafQcsaXlYn37kDpyM+gblFLn/hBBdxV62gGMiPzphQA/vwG6KIlWc6SdHE2B/ZfecW/kMYmBskQpkMEddeoDvQ+obAtFrRLICqtVrzuKmyv55tS0zYrr5L3TW3QYpnN0yygRc3WPuiq0Gol9U1DYuC23pg9FerMW+3xS48S6qAgTA/7mDEg9LZFF2xO6ktbjp8QjSeW0bRWtzZMwCOfOygwx1moMohWzXFP64w6llyXeHDCDSCobm+PNCTx68jke9LiFEpCNu5F7O6EBJf2Gs0PaYhY/tCNiyC7ftaqAMHlhHQzB665GROwudELeR4knHGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1Gp0TGhZ0EiH0gMpo8mQz19aPDQ85Jt7KSKdoAccuI=;
 b=v4ze3tIMgvLRIszajD3dyZW3LcrtWn6dsjOtWBO1KOXYB/L8TewmY65M0yz84b6tMBn2Rk3mNmWJMC6ZvD55t+9unTaYak5Ky4hWMsIplcdYObZ5A5lVyRDuTSfC1nfrvalwqLigh4R0lavDQb4/M5WfiMOL38avW2jhEpI+myl3Uvok9zao7DDmKkxhgRQO8rHYucP8+5hIcuSyVl284pKJXZ6kVMItKQ72QX9TAs/Wm3mDIpYuRKIEBhac5hRryfI0LIfaWZAnr/ZBaYd0qpjHWLOXvI6NN5fQzTBjogSGcyJ3T1n6NZ4+Api39qwmDYUY5ls7eajch/N5TuJRIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6762.namprd11.prod.outlook.com (2603:10b6:303:20c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Thu, 27 Feb
 2025 04:47:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 04:47:57 +0000
Date: Wed, 26 Feb 2025 22:47:52 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 1/4] drm/xe: Fix GT "for each engine" workarounds
Message-ID: <j2cqfbthxacfqelnons5m7ltaaqkdqdrzkbuhvx6wpdexpvpt6@hmlr7ey7otv6>
References: <20250226112106.28173-1-tvrtko.ursulin@igalia.com>
 <20250226112106.28173-2-tvrtko.ursulin@igalia.com>
 <sok4xz6pvdkm2ru63xy2lqv2vj2ogcemvpaygqz364nqqlxxgw@6gqxlzjilaij>
 <20250226215944.GF5109@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250226215944.GF5109@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0324.namprd04.prod.outlook.com
 (2603:10b6:303:82::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6762:EE_
X-MS-Office365-Filtering-Correlation-Id: f4534184-c53c-4e59-fc50-08dd56e9e786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UcpGBhCtlCq2dA4N+7yaYu1rjOX+Ggd+iUzqR9qZH7Ns3wXqCnxWAfv12sQZ?=
 =?us-ascii?Q?1Fv4qtQKUBHGdbS//3NBWFKz3IQM/eDGlliSbWLLmNTWBP+XaRFredo//6gb?=
 =?us-ascii?Q?qrOx1dYVlEr249s6cPbMr2uxZ4L9Ogf0yStBFxg5so8NaJhEX2rJutuk33jk?=
 =?us-ascii?Q?RBUQsDyvdA1He5ReRHelB2lEwEAS/SrR9ixx8MMNyLzdUvCcjdMpxVqkYiPI?=
 =?us-ascii?Q?viuSd3BH1RaxQiQOxstBleNnwHEAlcEDFPMixM+RQMkz9yHM98WWm+XQC7xg?=
 =?us-ascii?Q?WE95yQldXXIlSmkrmCUGNtAxmtiQFbrzhxHDpy5jYSGZXvgA+D6GM8EgCdGE?=
 =?us-ascii?Q?s1gAGxxLmKP1qqiUrrFT5xxLRVimJOc2R+MRXoLkiaeVqkyNHDLMO38FF1a1?=
 =?us-ascii?Q?EeZ05hHKpnzDz7yK39pWlhxQ05Ydg/prYJ4Ir7k1Vg0LmnO9QXutwbHxioOK?=
 =?us-ascii?Q?wfz5cRgD1fbYZEFYJ7k5M8MSukVvQbJQrZJdJAINWVRf/tV+rj685FK6enFN?=
 =?us-ascii?Q?U8zmlqfeqXX400WwNo1ggCVyNndYVt8/GkLsh9IxbTw/AzKWGVq9mBJfM+tX?=
 =?us-ascii?Q?PSw9xRm9LO8gljwccjCSL7+afKeEsgzehXTSRdM4YHFmqs7IH3/GZLrfYHS5?=
 =?us-ascii?Q?/qKgIkGoR5tISl+EAD5nhkx3UDLTE6WUWIA3yrKXveW2tQ+1bSXllC0K9hXj?=
 =?us-ascii?Q?91z57lYhLH2xKDhEXi1zUt+d+CiB51be7eADZpBRZf1AEgOc6YN5hG2cVoFB?=
 =?us-ascii?Q?aSwCX4Egm4N8lzHS1aJfOltNG0wU/lVuQfvmRS29xcJwGvV7yTDHMrZFlpqz?=
 =?us-ascii?Q?YaO7dhGUNe8xzcF/9ZBvIjZVFzbteH4FOhdH6cIg01GYzSEkS2LLH+/uv8Uh?=
 =?us-ascii?Q?krQsEwd3yj0z70dZrVcDNKK1DsHbsH4FyZKT3PDlr7MNglkygRnVJfMiYp7k?=
 =?us-ascii?Q?VrOIzwQJukis5bCmYzyuLLB5P3plw12Yc31DuXERY+bk4IVRj7oii1gUkiUK?=
 =?us-ascii?Q?m7i+iWyek6uJQWe5ThE3SukODlf1re/TdXSr8BWO0iGXwIcVHQG142MXSZ5h?=
 =?us-ascii?Q?rBSBloL4xkGy8nMG1cqjabeIxUfwK+wra6dIQ/PKFJgKs6G2ONtjhxAAZoIy?=
 =?us-ascii?Q?1mVcI4uAGoHlfd2EtIVL4CgxjBvLi7vnQ2uyqRSPj0w3CZYzfnB4cqMC7e4W?=
 =?us-ascii?Q?nXQalJJjRo8cByuUrsLHw3D4dlLpCWE53UjlJ6ys90ReHDPY1/2dnNdg7uWf?=
 =?us-ascii?Q?DeBd7tNhPuO0jVjBviAdH8FSuCA2M2xjmkojAtMBbNtWN6AUDcNJXIga+P40?=
 =?us-ascii?Q?eTKoMXTG76yZ8K3WEPzpNufdp7l13gP23LwFQyjLm4lou7pi2S1wosX/zkeA?=
 =?us-ascii?Q?C4fF+7HWlE1h4tJ5lQ7xzXNQXb06?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wNtEjNXsc4zfj/WnXXw8nrxQDNEeettpiErZA/wSACaq2/wSOWdiBXsOI5Q8?=
 =?us-ascii?Q?yPDqRzO/PKvGiDAyJDJU3EJRflUqFOCKrfLx/EwFmgunhFG7Y5nqhwkvz3Vp?=
 =?us-ascii?Q?kXJ3YVdyx24PnN8PIdBq11zHrS8GovxandBbyZc+IqklHzoh3OdXff7vEm2F?=
 =?us-ascii?Q?ZTKijqP1rHW50eRxYmqFPWOc2R+O26RtoqFC/TJNsXttGSnAxXgPr1CKymBO?=
 =?us-ascii?Q?LVIxjvfPGpMp/BP8fYFPffhz4swbONnv33DWRrNHBu+Y/Dv5IDmwVv96kGlO?=
 =?us-ascii?Q?cV4M/MnwyWUCPxsQBF1qtuiA0UbfT80dlNT7RLjKY2tPYSbBXa7tdPAPp+qa?=
 =?us-ascii?Q?+CkNJKR+aMzf0WAC/DeSiNXLFpQ2Auxw0ncL3PXPabCgOQ+HaxJQ3EUQ8oTS?=
 =?us-ascii?Q?Q7ERvWR0xw7CxVhjM7p1kR+HyltiP2VB8mqB/Dggybxa3H8tCZ1OWbFnM5tN?=
 =?us-ascii?Q?JuP3f9VF77gWh/Je6Y9oMthO5nw5jICQiN5/SPulVFsEYmU/eEDF0Z+mywwf?=
 =?us-ascii?Q?DmIHZ0+qpllXojlkr71rTPDWKYAs1Zfkce7+6fDmFgkqKil/SPGRnP60pLOT?=
 =?us-ascii?Q?ybLZ4VSoF8zWkkXMkAFMr4WneVoT+AnJ5L34SCAIvsS0jua2r8baKiBCGQgo?=
 =?us-ascii?Q?ZTUcIB/uZjmJaP1WgCxgPZOSArBAWqKpv1qqmgajB9GONkdqilAU1uBLGHM7?=
 =?us-ascii?Q?oZHzVJdcc0D3jRk5tw3h00V4Ks9CPUc8VAGYFKxT6LiE33F26TXK89oYfauk?=
 =?us-ascii?Q?zwe/AKCoeZyCOCMxmU3t6EqtmJ/o6OUQQ9j0/NE/FWQL3UYJ7nqM8iGTCMYi?=
 =?us-ascii?Q?bHZ7N+D1BrYJdyPf4Hxi5DOhb8UphmYaH7d3NpRSLHnQn2L1l1buJUTPNm+E?=
 =?us-ascii?Q?PkIwIyZahJE8uWTKaN6ziIh49pENWhi0EppvZmfDW1Fp/FDcdjBsj6aQdIYV?=
 =?us-ascii?Q?dP9l3SHFiJBKnYNFZTVEbi3YwwzPHt23LR9rweorqDF1L8FX99b/gnpfg3fw?=
 =?us-ascii?Q?jtvLeADrgMWqCAaCrVKH1K/BYFMzWCLcc4trS0EMVW4k5OmNRfWrV8vQZ/r6?=
 =?us-ascii?Q?7MY2jg5PYXCNNb/fhGxz6vAn3gyRZvvKppAVk7JA0Nz4hR9LIO6ZXLQjVEuh?=
 =?us-ascii?Q?95qCvDzqfJDWCVsGddJY8DgMeJR2OtYvWRQ8nMh5KutLFdwYmpbOOui4dwD8?=
 =?us-ascii?Q?868UNAXW2Y8isBva4eCVmWMizVTxplO839wrwibbPiMfswFgew6u2ed786Nb?=
 =?us-ascii?Q?0qQn02qwzDSQaSRYKO1udSnK/TyiY1GnF7ng72p5AVPRRZPO9CLb4O0s5kb8?=
 =?us-ascii?Q?0aqJhJyVi3+re6MDBZYLemDjVgHPmw+R3vnNAV1p3weSYx8Iph1UpJS6WBrn?=
 =?us-ascii?Q?ymtdi+978P5heKFaTn+c9pIWntIqTQ0bQhVV6xlk7mZzNB8zxzJ8jvggQO3y?=
 =?us-ascii?Q?x4J4CGKHjvE+9rYg3is1Qdl69Q32yfH1+SvRdEYxq63lBPpqRtHVO++DBg50?=
 =?us-ascii?Q?cpelmIlTgZyOGEMGDzztS5YAcfis796CZUJRlLYhC42SiIwTptZecItP0OMG?=
 =?us-ascii?Q?qFMMW30fXYxBNv4UqXJdlM/NQd3sWVE0k9JLTGNHWoKXwr3pQFsPkJ+wt2Od?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4534184-c53c-4e59-fc50-08dd56e9e786
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 04:47:56.9937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvGFKBNx6CqVKnJywREAhlQXZwzZoPc7yF9lR2Ht6XWYiwPTODjzrRtxo4Nq9VWUoqGwkokumkv5rPzTe1eJ6aDJqWSHnVh+PBahpLFN1vU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6762
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

On Wed, Feb 26, 2025 at 01:59:44PM -0800, Matt Roper wrote:
>On Wed, Feb 26, 2025 at 11:20:16AM -0600, Lucas De Marchi wrote:
>> On Wed, Feb 26, 2025 at 11:21:03AM +0000, Tvrtko Ursulin wrote:
>> > Any rules using engine matching are currently broken due RTP processing
>> > happening too in early init, before the list of hardware engines has been
>> > initialised.
>> >
>> > Fix this by moving workaround processing to later in the driver probe
>> > sequence, to just before the processed list is used for the first time.
>> >
>> > Looking at the debugfs gt0/workarounds on ADL-P we notice 14011060649
>> > should be present while we see, before:
>> >
>> > GT Workarounds
>> >     14011059788
>> >     14015795083
>> >
>> > And with the patch:
>> >
>> > GT Workarounds
>> >     14011060649
>> >     14011059788
>> >     14015795083
>> >
>> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Cc: Matt Roper <matthew.d.roper@intel.com>
>>
>> Cc: <stable@vger.kernel.org> # v6.11+
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> The version in Cc stable is because it's what matters for officially
>> supported HW by xe.
>>
>> We've been using the reset domain to decide if a WA is an engine vs gt
>> workaround. Although I'm thinking if it wouldn't be better to simply
>> drop the FOREACH_ENGINE processing and move those workarounds to be
>> engine workarounds. Matt, any thoughts?
>
>That's a common mistake we've made in the past --- it doesn't work.  If
>you try to put a bunch of these registers onto the GuC's save/restore
>list as happens with engine workarounds, the GuC will throw an assertion
>and fail to load because it considers them to be outside the very narrow
>set of register ranges it's allowed to work with.

but that's a GuC issue that we would try to fix? at least for new
platforms. if the register is in the mmio space for
that engine, why would GuC do that?

Lucas De Marchi

>
>So no, unfortunately these do need to remain "GT" workarounds, even
>though they need to be applied to registers that have per-engine
>instances.  :-(
>
>
>Matt
>
>>
>> thanks
>> Lucas De Marchi
>>
>> > ---
>> > drivers/gpu/drm/xe/xe_gt.c | 4 ++--
>> > 1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> > index 650a0ee56e97..d59c03bc05b7 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt.c
>> > @@ -361,9 +361,7 @@ int xe_gt_init_early(struct xe_gt *gt)
>> > 	if (err)
>> > 		return err;
>> >
>> > -	xe_wa_process_gt(gt);
>> > 	xe_wa_process_oob(gt);
>> > -	xe_tuning_process_gt(gt);
>> >
>> > 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
>> > 	spin_lock_init(&gt->global_invl_lock);
>> > @@ -450,6 +448,8 @@ static int all_fw_domain_init(struct xe_gt *gt)
>> > 	}
>> >
>> > 	xe_gt_mcr_set_implicit_defaults(gt);
>> > +	xe_wa_process_gt(gt);
>> > +	xe_tuning_process_gt(gt);
>> > 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
>> >
>> > 	err = xe_gt_clock_init(gt);
>> > --
>> > 2.48.0
>> >
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
