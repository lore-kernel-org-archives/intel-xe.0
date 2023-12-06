Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E136AC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 23:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A95810E060;
	Wed,  6 Dec 2023 23:01:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C21E10E060
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 23:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701903701; x=1733439701;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lZIY1zhljGBc2wN4Wa4QJ08f2DOaFMjWq/LrfWPITqg=;
 b=FhazW6iWaRlY1HHqj8ZPhHa+Sie3MZfpLzTTbKaaWGtrcWooAfzDVX80
 MaWXu089/CrPfdayze1zg4FPl3VUDe5OZK9m4rqqhulLZHgVgcJxNwMQi
 PAHaaqyVr+puiWCzRGGM5xSxUDOIDV6Dsz8PAF552/kTvp6mmzkSRp+HK
 4HQci4hC9fElwK9wiQM5rDDGVL8ZNUUWndh0dklckK2/mPoIvs4s5OWhx
 EIYxcvcjEuohjSZ4bTNbpKvcmPJgcBZIF7JTvCPEMO9v6mycEhap/0omr
 D8n8pBPRHBMuywr3nfVG+F+TYo+Ak2jd9QIo++LMyMeFKOe1A6kaWwQ3U g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="972259"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="972259"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 15:01:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="19479103"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 15:01:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 15:01:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 15:01:39 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 15:01:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hG3aAdy5n7XpZAYwGFGMJCdLytNLvK40VQBFbAkkcWexfnFVUkYJQ6GuJTofEnOERDXP0EFcyUTQmEwegTkbeCW1VcCmfbu7xIBbmXCQBRd1p0z8MGkxbsSb046LMRf2or/B6kDQn51MB5jE/rCw8SUDZBzelxd6u9VSwj6vJe4SD5DN5mNoM4MujmpZttlAF95+qP0ejOT4MtjjPddXjDxjRlg3GwsZV6i1QUZN34AcCWEUlWE7U3KztAzJQlzrMnzTwZ1Fl+NUIhJJyAks1gY8WsMPir9IU9rDy9pXJ9fe+N+xmmb6opxlNOP0VBFCdwuF4/KUvHI5VVpEnUQ4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZIY1zhljGBc2wN4Wa4QJ08f2DOaFMjWq/LrfWPITqg=;
 b=HNs1gTTUugpwNuH/ayzTvkmLzWda1HOUmftThpwBFJ0XLr4evRR3AQZEZoJdAlKFrv4+4aKgK/XZKLwHvoMMsE6vVxRw9Qwt5PGRB2DlQXdez2IV8XyJwEh+UJUmTC1kNlsV7wrHKRvJxgyNFU49M/hCzBim8XGQQLs2QYdegkmrI3USctBixuES/ne9ekLwEdoJY7uunRhNB8iqnmTfuzJbDUQmeN/i2rBbokVL1qg5BK4jNHqxPWZeWolZhQiiM2Eo5ZtwaIqeS3Bi/d8iWe/iG0aiVlUUc+1DTdbSUtKZIeyWpr2Ln9CTmJCOd9Z9tD7lwK3OjoHLlejxDqmbcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5453.namprd11.prod.outlook.com (2603:10b6:5:398::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 23:01:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Wed, 6 Dec 2023
 23:01:36 +0000
Date: Wed, 6 Dec 2023 17:01:34 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <6sk33by3ajun6hhlo5zl5xpu3nqudubhk52m5w4li5by2pptff@bflvu4p2voy3>
References: <20231206160617.7-1-francois.dugast@intel.com>
 <3v6lvfmd37hezn6tudgzrwv235f7wv4wct4d7zswa5qres7sfx@jovwzf4vgh2l>
 <ZXCgqvhDlMiEJNFo@intel.com>
 <wpaxuzibwzygcbkoxzznwvjmb3ruvjbfauzvbkmjebq6jyxlx3@krcvv3no3x6o>
 <ZXCyg6rlskWo9T2P@intel.com>
 <3thkin72xw73v2rnbqd4reuuehwqzfioyuuyqfqospv3vabxfe@27ggwnwadhcv>
 <f15faa0af5fc03f8da360dbb7bfe3a6d7a92d4d3.camel@intel.com>
 <ZXC5XblGwzRhEaZ8@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZXC5XblGwzRhEaZ8@intel.com>
X-ClientProxiedBy: BYAPR11CA0047.namprd11.prod.outlook.com
 (2603:10b6:a03:80::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5453:EE_
X-MS-Office365-Filtering-Correlation-Id: 97da5ebf-88e8-4bb6-f838-08dbf6af4c5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: czPuj7q65dAoi6eJmauGJegm5MtMqwf+sgS0Ks3n1KCc2S6UizYaiFPd5mCwHegKp1Ev6yIXtrg5aWZm+PU+GKR/7OS0vz0ueXJrqXX/6uAm9GT2aXpHI6HfVUTvyrH0P2wj8LX+T0VniJUVmImnecjYbIdI4MxGxCNBaBp+20gydXaqApLWs7hSGedfY6vEDqJGTIagw1R3BXw5NFh5SL9ICWpmDR6vfB2FxPywapXearQwz6ti0M+489znYaT+y91LX+yQeySMJQziuFGBk+7HZRh3QWKyyQ23KT+f90AdnCy1Dz+YRh0+UkdoABULLkBXhH8t3YK5EwbiMBokEDiwRJZ4Gs4RT3bann3SAPyCi9vF/WEdP6/S8NkV0E/CXsr3pfTv2G5eC2b63qtE7mU09yD8kVfcWwwJRlRHJ2Fh0Ge9rj/MCY5lhzZ1SbaPObAtHIlOw7vMJrbah7v8tPk98NC2XWhiNGiVufZlIdaqRn0gIK4yXdGeF6WiASdtPpKxiaS9vVBkP9V6L04rT2XGKsdwsXpnaLTVevAxddBh8ukELZ7bMExyLf0VF4Oo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(136003)(366004)(396003)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(9686003)(6512007)(6506007)(6486002)(478600001)(66556008)(54906003)(66946007)(6636002)(66476007)(316002)(26005)(83380400001)(4326008)(6862004)(8676002)(8936002)(82960400001)(5660300002)(2906002)(41300700001)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ehNz8GWFizrqeHOUaPoUiSo8e0tFLVvFwfPYFV3X23JE4VNPboj70oPoM2dc?=
 =?us-ascii?Q?Xw0gvV5n0mmtnoa7GrEkQDSxe0rSVc1l24dswx7uMGXqXy30DNGddEaQP/0V?=
 =?us-ascii?Q?UwziCVV6cVmTv9IYfbsr8L5u84IPST0qMDaLWwMqo3WfmcG1Aeli2IgZ+48i?=
 =?us-ascii?Q?ZbyJ6AeIBZYi5z6KBB3Jg3u3w+C3ZwuntnHgaI/cJLTKIp7qBytF0jX4bVJT?=
 =?us-ascii?Q?3oTV2eHTaPO+0KD8CgFGg//1EBN0ugPv2UABFg+kRdiw5kmPovUnrpedISIc?=
 =?us-ascii?Q?QmMyJlFsWRR9efI3Yhji95n9PYUH7fdQ94cUHXgeMH0s4iRGEvX/NxfYdbRf?=
 =?us-ascii?Q?Izm88ENnLNp/6pEzyGXpcloUoRHLgRzb3nWAG6VMCFEjz36vvoGHVsGXD01l?=
 =?us-ascii?Q?J8bXcMid+KLe62CekkwSd8AGMyQg1u4CvXuEJmlLdvZzzRk/ud463BGC3Pco?=
 =?us-ascii?Q?mqDdw3S7Tl6Xo/Pt+0cwG83Ve+3cAEYelzYxMAE9UjOBC9V7KvEUWCN/tdt6?=
 =?us-ascii?Q?+BKkM3V6rSNdgIqa/JKxndI4Y/4PtEJkWgdIhqr6YjNyuNsazhmvpMolcpDu?=
 =?us-ascii?Q?eRfuDgsqIkVIiB0nEpsE+g4lqQMw76U/RAIHjwXIZW26L3HjUA87eGVk5tVT?=
 =?us-ascii?Q?g9FrHZ3zp+NRncN7GKoXDMQIT8U69+PLBApMD3p98WGWK09Zb4kcFA9PVfjf?=
 =?us-ascii?Q?9aR8IT68t5sMpgSD8RU2DVV71O7odC47kB9NM3EArPP1s/BsHhwrPi+6fU7Z?=
 =?us-ascii?Q?T3I7ARB2xr2A2F7CsTzpXrnnSZD65aftmA63GWWtxXWYpKhHmJR5AVNxepy8?=
 =?us-ascii?Q?ms27uKEyXEGTxzKqV/kuXX4bOow3G4/w2ZA15SYgvWAU8XknvC9CHMwgk6fe?=
 =?us-ascii?Q?stNfagr9Ttdl0ZdfB7KL+Duz+JNkW6qePkEWGxybGOj5tjt4O8xaZWT1yoAk?=
 =?us-ascii?Q?qgJrzsGGokXkj4ndN5oJBOhoZbLHJYn3X4t3tHNZtPATqUJSeO4vyqDdlLnh?=
 =?us-ascii?Q?SqglUkPgMUZwNzy65s43IsxtdTxZtip3t+D3LH8cPbUdApMV0AeYmkd3I1zQ?=
 =?us-ascii?Q?WLeJvDPWx2uj72iAecfwr+H+o/cIFI2bY5pi4amUZLZGmot7KMZqq736+pjc?=
 =?us-ascii?Q?63N8FnrBxTIh81tpJDuHicFtzmGC5PWG+5yKo81wiWubY6PVrgn6msSGUmic?=
 =?us-ascii?Q?r27zcxvrJodgGJryK5K9eNcEYoGCqLUxK1Uf5OUZV6aYCtGVWkBAwVYeZJKA?=
 =?us-ascii?Q?yPISZfC9LdQIDVUJfIdbE+ncaLnbLsJzy326ZAWXARCguqYc3J+tW7fiklqP?=
 =?us-ascii?Q?YOtOdC0U4ibfIFbPecd9lxXp9e2VgIvehqIuKGGNSjZIEpqHHO632SCiPngI?=
 =?us-ascii?Q?B3rIiiFyBUpyhZ3l0QZ2LcP2sGXAaHCzwTMnSOIiOCyjBsgV6n6bJEB4PksJ?=
 =?us-ascii?Q?HzKgTJkO/OsDOVU3GKetD1Ya6ZjTlKCDGILOSLWN0QZ0O1UV4lq3K9MQTQQg?=
 =?us-ascii?Q?N8N0zPa9Bu4M7q5BQJIDVLIRaTJCO+498CV+Ei+TGrnPVy9d++XXs5tj7Xkb?=
 =?us-ascii?Q?mFMQeIcMppdJkb/Ngil8uEwXU3bREJ2/Jt69XlG8QibhIznUTgT/mKRjIKLK?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97da5ebf-88e8-4bb6-f838-08dbf6af4c5d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 23:01:36.6580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rfZBRBuAbt2+Q+kzVk021786cDiymXc7HvT0rgFGQvdlfNl/xVQzp91PgfjNOjqvY4L7+9JtCyVmaiseG3ntnnMmZp8sGHD084E8Au9mLII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5453
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove
 DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 06, 2023 at 01:11:41PM -0500, Rodrigo Vivi wrote:
>On Wed, Dec 06, 2023 at 05:52:52PM +0000, Souza, Jose wrote:
>> On Wed, 2023-12-06 at 11:48 -0600, Lucas De Marchi wrote:
>> > On Wed, Dec 06, 2023 at 12:42:27PM -0500, Rodrigo Vivi wrote:
>> > > On Wed, Dec 06, 2023 at 10:33:35AM -0600, Lucas De Marchi wrote:
>> > > > On Wed, Dec 06, 2023 at 11:26:18AM -0500, Rodrigo Vivi wrote:
>> > > > > On Wed, Dec 06, 2023 at 10:16:22AM -0600, Lucas De Marchi wrote:
>> > > > > > On Wed, Dec 06, 2023 at 04:06:17PM +0000, Francois Dugast wrote:
>> > > > > > > The exec_queue_set_property feature was removed in a previous
>> > > > > > > commit ("drm/xe/uapi: Kill exec_queue_set_property") and is no
>> > > > > > > longer usable, struct drm_xe_exec_queue_set_property does not
>> > > > > > > exist anymore, so let's remove this.
>> > > > >
>> > > > > my bad, sorry
>> > > > >
>> > > > > > >
>> > > > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> > > > > >
>> > > > > > should probably be a fixup to that patch? Anyway,
>> > > > >
>> > > > > no because it is in the uapi header that gets "copied" by the UMDs
>> > > > > and IGT already merged and Mesa likely... and we cannot do fixup
>> > > > > on their sides.
>> > > >
>> > > > wat?
>> > > >
>> > > > any UMDs would just copy the header and point to the commit it came
>> > > > from. It doesn't matter if we used a fixup or not.
>> > >
>> > > But history wouldn't align. If they have already merged the commit with
>> > > the sync pointing to a kernel commit that we do a later fixup, there
>> > > would be a mismatch. Anyone looking the history in a later time would
>> > > think that the UMD code was wrong.
>> > >
>> > > And instead of blaming me for having missed this line in the first
>> > > commit they would unfairly blame whoever authored the UMD patch
>> > >
>> > > right Jose?
>> > >
>> > > But I would be okay with a fixup if that is okay for Jose.
>> >
>> >
>> > when a fixup is amended, it's not like the commit remains the same. You
>> > will have a different hash for the new commit. Just point to the new
>> > commit which has the same commit message as the previous one.
>> >
>> > And we are still on top of drm-tip. All these commits will still be
>> > rebased and have their hashes changed anyway.
>
>for this reason, any patch like this I do in IGT I use the commit subject
>but without any hash.

I think that's a mistake since it doesn't point to the exact commit
that was used while testing that. Same reason why I insist that on any
rebase/force-push we save the previous state by pushing a tag. I don't
want to invalidate tests done in other projects.

The hash identifies the exact commit. Having 2 commits with the same
**title** doesn't seem odd to me and is perfectly fine even if we are
not talking about force pushes.

But I already gave my r-b. I don't care much about this specific patch
being a fixup or not, I just don't agree with or like the motivation ;).

Lucas De Marchi
