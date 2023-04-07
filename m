Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EE5C76196
	for <intel-xe@archiver.kernel.org>; Fri,  7 Apr 2023 03:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9588410E362;
	Fri,  7 Apr 2023 03:32:32 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0649410E362
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Apr 2023 03:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680838351; x=1712374351;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D/Hi+1sboHMIZpspOBxoou1ul8hWrzGsgybFXPjcCTg=;
 b=SwKZe+cfESezyNMPLICIHCvmiIOJdmhyiB5GCZBjtANhUZWq+d6XzO+j
 0BDKHmDFBNAgMs9/HG4+XMdaKapLwfWDnMqJp2Uy8CpL5mbXv9ItM7lVW
 hruZUEDugxg26pX6EiNs7yOdeyi6o0HUkbQEfSmxd7CwXT4jWDJtxDW/s
 fXJ1CDbtRQ385zFGeBHmoglZLVPvd6V3qmpe8kgPLpgArYBYhUdi53IE1
 EZnS+F+FAi3/+UXnxOsX50hN7B2M8GRtYkQDli6TxwLRqL1S+5ExmTgHa
 BtowTfet9uhBkASqankV0uv+7Lei5WMynV5zgDX0TNtOK8eMxCg4/0Zkr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="370753110"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="370753110"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 20:32:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="637572070"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="637572070"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 06 Apr 2023 20:32:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 20:32:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 20:32:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 20:32:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 20:32:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWQS3GOM66Hr6kucwygbWhlxM1c4SLAm8THnvGFGs5H1845a619PTDCqlREaAn36NOYnYc/VgWOro7jMwK9mlCG/IHDvxMXuzx44ppi/fkxRZ0JCNr+ufL13OYJhwQ4gFx/odAHGpx3KRzRyI3oImq01EG5OVJIk/PD5IYzo/LTxK7GOfKie7UYlPI4+nyT7I2UdscUS5+Wt7gVQKcIp0ta70NJHdKNAgWdfX+cNrJyciLMhowhMnq0/ebd4iph85Hc0Z0QIuDMWbdvbK1YVTWRUSeAR4icooVC16CdtRQ6cC5qEkGW34/IwLB+32B5PeingVKw7rNfoZhtI0oZQHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuU857qf6gMahF95m0RdvAUfPF+Lsf7tE+KEprDEbhU=;
 b=Vy+XvdrYM2hXC4nQnc7qttKLUfvWY/tcRAcEADkLLmEYPQKamHI976G0uctqVGcVntrshjY0wFGCEzptMU7vTwZqY/fspR+zi2TfXt7j3Eqf68EXciYlNvfQ+H53rm6UyNQDImg/w/VmjdE3VIxbOKSSTw7+SstDLtRAC57HPDwCI6pz99uL1YLpSp86U0lYMeEn0/dPlHlZo2XUT2nrSxE8KX9V1WzuRJYvEM+6JYU3u/h43y0Zef/KY/iDncaQs6XQ+DiROfdPO8IpankKd2O2O4OZqlvylSR1x+D6lCMOB1D1NNohyk/UOOygJN8Io4QeWPYpzAhl1efn5dlxKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH0PR11MB4805.namprd11.prod.outlook.com (2603:10b6:510:32::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Fri, 7 Apr
 2023 03:32:26 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d%6]) with mapi id 15.20.6277.031; Fri, 7 Apr 2023
 03:32:26 +0000
Date: Thu, 6 Apr 2023 20:32:23 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZC+Ox54Rjr962zUZ@nvishwa1-DESK>
References: <20230406204841.18774-1-niranjana.vishwanathapura@intel.com>
 <20230406213625.GN4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230406213625.GN4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH0PR11MB4805:EE_
X-MS-Office365-Filtering-Correlation-Id: e4de2545-d427-4bbc-1d44-08db3718b4db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8LWAxqw4yeSiLZPxtXNakIDYahXg5LxNAi1W7hpWP771P0Fg6/2egojYLEA+lbrljb9Kax92/QktcSMEZrjtv71h1fEIefVcuU1b1bSqIvnKOcyQrjC4qXMpOKHDL6Pt5/k+dWEiqq5Qm/eYno12+i02eIObT+Pn9lFm9yu8pEZw+LYDeChNQXzy0llcEGSr8SW4vXrmLPK9qkz3kKdyKwkau4l+7XTiR94tIihGJjIeKASxjtj7eyP5vlPlYU6UEWx3vTTMLN7xQbThOOFkH0a6DZLw2pF7r7yzBpnwGu0VakeVlWRC6TajiNx/KINnpVI/Fy6QTaGig1Onqa23Yd8gHWRDdsUDM4wlLud7maBk5uuIx6b5YlNNTlMm2PiLk0hbvLpNvv8+KeJt45i7UFEaFYAZZS2YRb/iyq8Vn8F68zGk8AulxWXJO+CDWCQz0RHdqWdRhgypWz0erbyYCXEXkzibQAtuHEX+sFp+tqOCYZ0Yq6czkp5R8i5k16wDkR0KDcKOQsf5vjfffyWctX247R5bHLHWndnRUhfCYSEd6PIRR/eujFFKy0jRVs+Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199021)(86362001)(2906002)(33716001)(966005)(45080400002)(83380400001)(6486002)(6506007)(26005)(6666004)(9686003)(6512007)(66476007)(8676002)(66556008)(66946007)(4326008)(186003)(478600001)(6636002)(38100700002)(41300700001)(82960400001)(316002)(5660300002)(44832011)(8936002)(6862004)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z9RrWUVmY2rfZNIpXuGfVRctBeTkd8vwhjyueXhqKJ46QYykJZTmmXu7eROK?=
 =?us-ascii?Q?8CrkE+ZAD/+NrHLmPr92FNXbbJH3okoMq+gbnRcDoDddxg6WxS5RXnOXB/Mc?=
 =?us-ascii?Q?Mve4l+FyhQ2TFFN9lXAheBBO4RTRipzC/WIa0xVO3u+jajWtXXFEqQMNt9vC?=
 =?us-ascii?Q?mW9UvasB0OsWGXBVBzH3Qpy2wtW5v8TcD4MxNaa9aGkIpRVcUCQJcblMhUpJ?=
 =?us-ascii?Q?s5q5TyhlbmPX5zuNoMO8vabNu1M0/RGfzSE+f0F6EwV89MSQrb22VBL+C4t9?=
 =?us-ascii?Q?1xLDoBj463RFVPiUa5DYsx4g5gxIN75S5HX+zuUwSCiHbGia69XMmePK47/1?=
 =?us-ascii?Q?+aTu+PTEmSSPxYWcQEImaX6CDrgz5t0jQmJqAgTpdU18voMIqQROjfB71aRG?=
 =?us-ascii?Q?e5tP4zruyXFUnswjOgT7rIl9i6xlJ1A4gTigURta9ZsLDAma6gTkZAxNFKkM?=
 =?us-ascii?Q?/4AsDBgwRtv/a1hXKDzXZRcYGoZ/VIOuNT4yiDbfKXaa7oYFAYdyT0vZzqig?=
 =?us-ascii?Q?Msla+B5QPZLPuI/8N6c9+p8F7Nb+W3soMUSYx1ESRH7fgVNvw0UlE51lJdub?=
 =?us-ascii?Q?AQMhZzEleIS2cPFZidCk2C/SztR5CuOC9J7apKMw+7B8qSZUQVVikRrCH7aa?=
 =?us-ascii?Q?iKdYg+ROne7mCj9oGrMIlfYVFlP2+vsd8ZrPIuP5BeiGJ3Exc/NYglp02LuJ?=
 =?us-ascii?Q?panVdZJC93f8RWiNvNgSFWncBgnrdqBOY0eDdby73jBVwmsJ0ODgMf9e38XR?=
 =?us-ascii?Q?20+JD+amXsYWMPMLBebM/jsm27GbXfqqCTuzPV0tWHcUv3a60rXwVe2NWu21?=
 =?us-ascii?Q?0i7NXO+GMofKIZyGBXExMVK5nfXuKPLikltFymBip4efTTTMFQIpmwZ/+wHb?=
 =?us-ascii?Q?ajWhs/OkYW4qEMxNqAGxCpBYFJyMCbhxOy/zsgn3p80c+syk1SYCDJUa+n4h?=
 =?us-ascii?Q?jVWbQFAdTPHQUkjgidX4OdnhDskirDppf51RnSFXMsW+R2zSdOeJ3Mxct13o?=
 =?us-ascii?Q?BPRimOFG1Z2uVdwiaN/XULePKoGr5SdKs0dGKz2Cx9H44azVW9mPGxNjl43h?=
 =?us-ascii?Q?rR59qKFW9drbng3ALWaNEMZiQTPFPvewVp4oVahucgmz398kKiDA33S0hN3V?=
 =?us-ascii?Q?CtaxRRdbx0HMdId2d1hzTOGSj/Jq16OH2yJQfP8bd13nGa3utr9OjgUAkBC9?=
 =?us-ascii?Q?VnWVADId9d1+goTXsTubiWceYWd3TQKPtLLh6UdIw/jX9/ScBoQctBVziBpG?=
 =?us-ascii?Q?6hRQDCGji5y/Hx0nj1j0mR4r/dg2DqzIR6zF5J3V2USeCnD7O/DyzuqeRYyB?=
 =?us-ascii?Q?oAq3XIWPvBpS8Jupv101h48iMqV0oCZ6NhYxJCdQ20yti+gHMkBC7w0zPup6?=
 =?us-ascii?Q?3IRMR5dQ/unBYvCIMQT+wRfpO/It0UxDGYiV646ElkOiQVXs297rpWiZ9BhS?=
 =?us-ascii?Q?6krpDRuiGmFeU1c3Q0J0MEexLZSO+7GWfu932XtMohEGStL6awH1uzZ00wp5?=
 =?us-ascii?Q?YPuzdvbed7Rj/sROEotS4+nrMirsuHaJP2QHHnuXmHWJI3n4vMVHoGg6EQqz?=
 =?us-ascii?Q?2APYaFKAPYn059Fpc6YsGZdGraI4xHmc0mIQJZxOyt4qc+wHtqBUF6/rmdeQ?=
 =?us-ascii?Q?A5/cAO27vaMA1Fro/GJXF9g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4de2545-d427-4bbc-1d44-08db3718b4db
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 03:32:25.9372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGZzWnHjitFYsD4AK//jJqUFjvE5ndGZ5+ClpUCNbmXNzl3Ol/jchZngz4uRHUzs6s7q1lVjTD5GJV+9fKxVcBe7dm4OH5Wi4lDjJF22smXVgstbW4WEv/ihCWOHdf1W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4805
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/2] drm/xe: Revert coalescing of GGTT
 invalidations
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

On Thu, Apr 06, 2023 at 02:36:25PM -0700, Matt Roper wrote:
>On Thu, Apr 06, 2023 at 01:48:39PM -0700, Niranjana Vishwanathapura wrote:
>> Causing a bunch of hangs driver load and in user space.
>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/232
>>
>
>Tested-by: Matt Roper <matthew.d.roper@intel.com>  # ADL-P
>
>Previously ADL-P was failing driver load about 50% of the time with the
>signature in the gitlab issue; with this series, I can load 30-40 times
>in a row without issue.
>
>If I load/unload in a loop enough times (usually 40-50 times), I do
>encounter a different problem, but I suspect this is a distinct issue
>that's just being uncovered now; it probably isn't caused by these
>patches:
>

Thanks, applied.
Yah, this seems to be same as the other KASAN reported issue we are
looking at.

Niranjana

>[Thu Apr  6 21:32:02 2023] xe 0000:00:02.0: [drm:xe_guc_ct_enable [xe]] GuC CT communication channel enabled                              [5/46010]
>[Thu Apr  6 21:32:02 2023] BUG: kernel NULL pointer dereference, address: 0000000000000000
>[Thu Apr  6 21:32:02 2023] #PF: supervisor read access in kernel mode
>[Thu Apr  6 21:32:02 2023] #PF: error_code(0x0000) - not-present page
>[Thu Apr  6 21:32:02 2023] PGD 0 P4D 0
>[Thu Apr  6 21:32:02 2023] Oops: 0000 [#1] PREEMPT SMP NOPTI
>[Thu Apr  6 21:32:02 2023] CPU: 9 PID: 10370 Comm: kworker/u32:2 Tainted: G        W          6.3.0-rc4-CI_DRM_12746-g6ce36b596fa7+ #499
>[Thu Apr  6 21:32:02 2023] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P LP4x RVP, BIOS ADLPFWI1.R00.3323.A00.2208030835
>08/03/2022
>[Thu Apr  6 21:32:02 2023] Workqueue: events_unbound g2h_worker_func [xe]
>[Thu Apr  6 21:32:02 2023] RIP: 0010:__wake_up_common+0x5b/0x1b0
>[Thu Apr  6 21:32:02 2023] Code: 85 0a 01 00 00 4d 85 e4 74 0b 41 f6 04 24 04 0f 85 a3 00 00 00 48 8b 43 40 4c 8d 40 e8 48 83 c3 40 49 8d 40 18 48
>39 c3 74 5b <49> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b 40
>[Thu Apr  6 21:32:02 2023] RSP: 0018:ffffc900018dfd20 EFLAGS: 00010086
>[Thu Apr  6 21:32:02 2023] RAX: 0000000000000000 RBX: ffffc9000182fad8 RCX: 0000000000000000
>[Thu Apr  6 21:32:02 2023] RDX: 00000000ffffffff RSI: ffffffff823cc0f8 RDI: ffffffff823ec02c
>[Thu Apr  6 21:32:02 2023] RBP: 0000000000000246 R08: ffffffffffffffe8 R09: ffffc900018dfd78
>[Thu Apr  6 21:32:02 2023] R10: 0000000000000001 R11: 0000000000000000 R12: ffffc900018dfd78
>[Thu Apr  6 21:32:02 2023] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>[Thu Apr  6 21:32:02 2023] FS:  0000000000000000(0000) GS:ffff88849f880000(0000) knlGS:0000000000000000
>[Thu Apr  6 21:32:02 2023] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>[Thu Apr  6 21:32:02 2023] CR2: 0000000000000000 CR3: 0000000006640002 CR4: 0000000000f70ee0
>[Thu Apr  6 21:32:02 2023] PKRU: 55555554
>[Thu Apr  6 21:32:02 2023] Call Trace:
>[Thu Apr  6 21:32:02 2023]  <TASK>
>[Thu Apr  6 21:32:02 2023]  __wake_up_common_lock+0x81/0xd0
>[Thu Apr  6 21:32:02 2023]  dequeue_one_g2h+0x15d/0x460 [xe]
>[Thu Apr  6 21:32:02 2023]  g2h_worker_func+0x5e/0xe0 [xe]
>[Thu Apr  6 21:32:02 2023]  process_one_work+0x287/0x520
>[Thu Apr  6 21:32:02 2023]  worker_thread+0x53/0x3a0
>[Thu Apr  6 21:32:02 2023]  ? __pfx_worker_thread+0x10/0x10
>[Thu Apr  6 21:32:02 2023]  kthread+0xf6/0x120
>[Thu Apr  6 21:32:02 2023]  ? __pfx_kthread+0x10/0x10
>[Thu Apr  6 21:32:02 2023]  ret_from_fork+0x29/0x50
>[Thu Apr  6 21:32:02 2023]  </TASK>
>[Thu Apr  6 21:32:02 2023] Modules linked in: xe(+) drm_ttm_helper gpu_sched drm_suballoc_helper i2c_algo_bit drm_buddy video ttm drm_display_helpe
>r drm_kms_helper syscopyarea sysfillrect sysimgblt fuse x86_pkg_temp_thermal coretemp kvm_intel mei_pxp mei_hdcp kvm irqbypass wmi_bmof mei_me mei
>e1000e crct10dif_pclmul crc32_pclmul ptp ghash_clmulni_intel i2c_i801 i2c_smbus pps_core intel_lpss_pci wmi [last unloaded: ttm]
>[Thu Apr  6 21:32:02 2023] CR2: 0000000000000000
>[Thu Apr  6 21:32:02 2023] ---[ end trace 0000000000000000 ]---
>
>
>Matt
>
>> Benefit is rather small too, so revert it to stablize the stack.
>>
>> Reverts below changes
>> drm/xe: Pad GGTT mapping with an extra page pointing to scratch
>> drm/xe: Coalesce GGTT invalidations
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>
>> Niranjana Vishwanathapura (2):
>>   Revert "drm/xe: Pad GGTT mapping with an extra page pointing to
>>     scratch"
>>   Revert "drm/xe: Coalesce GGTT invalidations"
>>
>>  drivers/gpu/drm/xe/xe_bo.c         |  1 -
>>  drivers/gpu/drm/xe/xe_bo.h         |  1 +
>>  drivers/gpu/drm/xe/xe_bo_types.h   |  4 +---
>>  drivers/gpu/drm/xe/xe_ggtt.c       | 35 +++++++-----------------------
>>  drivers/gpu/drm/xe/xe_ggtt_types.h |  2 --
>>  5 files changed, 10 insertions(+), 33 deletions(-)
>>
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
