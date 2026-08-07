Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35BAC5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 18:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D60E10E455;
	Fri,  7 Aug 2026 18:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fS0kHjDF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E003310E461
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 18:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786127992; x=1817663992;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xbq2UZYubyXQtcf/6mKjy7HGYBNxP98Vz3jUyoTT85w=;
 b=fS0kHjDFQ8161+B5du6Ma6R9Dl2GAWeelYU6EyS8Rz9QBPfnSOEQ47ab
 O5RMg3LfyfOeQpZ/uBp6rolIyhs8lX9ffOFMvPsiTnNByBoFITqK4+CMn
 Oz7zBqF9xmErCyWQQCDRrtadUnd5QKRNyDLO/KgX+eD/CfV0dbycU1eJ3
 /4QsTCw2v5Rzb22N7YClUnd96tNH8aB0GJHJQlZWaYfMYTx3pMpuO/SKp
 P/M+NacwL9EFNXcED2ANTGO6imKapvZh1DXgRlYXyMfhJFLtSgXD+ZWGU
 5T2sCHmvLVanxXR12HaAfU8KJEMZXERvMEkBAcJuNnRupvP1Rm2RSyvxY A==;
X-CSE-ConnectionGUID: WlCpm3YWRs2Snzs+vMhwUA==
X-CSE-MsgGUID: peIHkEVKTVKlD/TPjIlClg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86950295"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86950295"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 11:39:51 -0700
X-CSE-ConnectionGUID: yCXMNZmuRByif0rtfdYrtQ==
X-CSE-MsgGUID: RTWPtNSQQgGCOFERfOz5dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258165698"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 11:39:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 11:39:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 11:39:49 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 11:39:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1P+bAwmIU9rTYoLb7VyrFcHi/MzwI3iXlf+nRO8ZvnoAjCMQ41g6naiWK4HRR8I+84BZxwdzznUnC0d/BSGoxi7DGI+tibL3jTu+8UByVfP1sDsw1PZHyKynlBHHPz+TEfQBu8sOVI+/KMiZBoIjyJk4u6Yv/UyBQppgQPNilaQ36D6LLcc+3zcGPNjzbDTwfmDfIc72sXxfakb6yZivOeK2HwJvpND5QFZ7K1kviilJqnMVe1LShm2qm5jziFFaytUK5xc+XQ0KY5pNqTX2i3OrvXsssqW7nuaPSpIIoR6JNFIKlYqWCAr+1cW1P0YKCrE7sVl4YEWStI03MxtvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oHxPaPJTL8YzqcdwaBVoZuLWMbJ/FU4yTw+a69j2sk=;
 b=JRY77c7uwaj5C5tsGwcJ7J7DxAbnQMlN7d9uHRgcHdORbDoNGTrXZgKYmwPxYZLaEwCbxP5diCAEQQT0+7aw3op7fngdoxWCoV6d8352nsOaAVW7Vj7cQbYuDi/mHNmuAarBzHTz+eK6EG7ZJCu0mEmJ/i2n94GUZyMZrEfU7mICCKXopRW4GVkUXu3dzpFJMJV4hU/xlNGv2yoaR9yIM3Qro68evoR/3Tg0wLXhDggxsKpSgxIy9QlnIk/k5ztySPpOtmTicO15AdTUrEVILpJ1uilNTtpIf9z1F/IZf7rTrALPVMY39aHUXzCvxDbQoAhIyuTP59CqNwmGq+uhIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7058.namprd11.prod.outlook.com (2603:10b6:930:52::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 18:39:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 18:39:42 +0000
Date: Fri, 7 Aug 2026 11:39:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>
Subject: Re: [PATCH] drm/xe/pm: do not warn about missing runtime PM
 protection after hot-unplug
Message-ID: <anYma4AnVURdyJ6B@gsse-cloud1.jf.intel.com>
References: <20260806085711.437110-2-nitin.r.gote@intel.com>
 <anRGHJeae97n3ZwU@black.igk.intel.com>
 <anRV+xVRHWpTEiFh@gsse-cloud1.jf.intel.com>
 <anTaJUiijSUN+Dmm@gsse-cloud1.jf.intel.com>
 <SA3PR11MB81187A8BED050933916D5E02D0D12@SA3PR11MB8118.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA3PR11MB81187A8BED050933916D5E02D0D12@SA3PR11MB8118.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:a03:333::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd785ad-8cef-4aad-f033-08def4b33e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: 4dEhHrA9UXqpKlb4wkjeKenbTHyjrJ0jKFjy2XK2lFm5JhPwpe5YQq9DTwlIWpepat0o9G4J1sd5KQCaGixf6a9a5g8Mo7+vBSGY8ccESXrq32TAgbQ7xaEfQsoqKNdlQMxwcJKbVQ5CbgFCIZu0/VUal4hmGZ+WWQjV2uItTpdwcb+seieMaaIVjVuPRPaconnp6uEeQV694zDnk1y2PFHYBIUBdPyVv6+QK4MxX0KooHgEVa+r07c9kPT+qj+GR8aeIgpOf5Lx2zLMzvx53Dpkqno0vFgfALGb25PPdLiKo2UUN/b7t9UafF1Orav3XY18KpEVKmQzG71L+Ih8vpeJ9hSfZDM/dAlbK97llpkHzGTQwZci4qBqHJ4H1Mc9E0N2omdDzt43Dr8BgyddGmcU+2m0iOcJeXXuPoWQpGRMGPxayYZV5Crk7Q9n2EuvBLlfhtN/Ggxv35ftp7PWY+zQWwlcfCfqRXl/KDUAhoXP0lDzf9vd1KTpyS8jh+SJjYonWb6iNi/log0W2P0R5cAZGqd5lNzRVWLuwlPtM81nHxW5q3paD4U3EuePVbm/+Z0jbY9HAF9W7ojl9acVlQSMEKTFYgfz0p6jooprQ6d3OA5slfHTTFy78LyQn+ZUng8jx7KGzZ1wGJ8tGJZHe12JHaz8RBkTml5qFvM8WDE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UVSVk+xAP0bre8Z2MLSKQGWiUBrj3IgjrPv44kFWt3QlakPWpIspdfTxckUd?=
 =?us-ascii?Q?I3PG/EuH9CzLli1L0B+Q2ZpqBv32OaNY8QP0BgeE8dzb4+wDC1MOwGkiK9Oj?=
 =?us-ascii?Q?h7t1sbFUINEZ1TgVLSMTu7xX9lUfPr5kl8G1EYEkV2u3Im1EDT2TQJIlApcX?=
 =?us-ascii?Q?7GXi4orQjI92k3Yaad/NaSOWqAHWhq8/3egpBOoHHnsrVMY/N82V9w+4jr6l?=
 =?us-ascii?Q?a3LUYwMDPFDF3zGdWElSXQZCrUoFaZ/vlgZipFKbraJ0YSWVlree/T80XhF5?=
 =?us-ascii?Q?fe6WSvmmMidPKtFpZS7dqNQDgL+wb/4kHRcuviV9R3zQs1w41ss0YYnr8sVk?=
 =?us-ascii?Q?5DISnt8IpgFDag8Odmwhe+Sn7piwbZDgkQklCMollXE0z1bnO5x4ITqYF04F?=
 =?us-ascii?Q?pAdjnA7ROioMNnyWeqlCc9nJsFvYXjJGw5cO0ztbnnoeJUKUAULZ9NY+5drg?=
 =?us-ascii?Q?mqjFuZXJy+D2mQD2NIUo2NFHOKDvW5httvTgixkd00PNztPBQPH+HFuPaMUG?=
 =?us-ascii?Q?+Qb0+Wx/Y7LRELYUVronGYFBSRmim94C7FPCwBtDbvVhW+U4vQINzw8r8Mdr?=
 =?us-ascii?Q?V9kntLux90R/wkalDyOM88eL4zD0Hm+t1B/jCwlKi66yLhuMaiSX5zjC4w7J?=
 =?us-ascii?Q?CpjAZzoGDBaAxQocA4fUSHtQ9LyVX1LxQXoHRJfLUTIBCAsvvQwVaWIM9dQ7?=
 =?us-ascii?Q?FLEhwKzjuXKWaKbjPf5CymiNmvFGMRemL+wvlhl6wIDSxZI526FXPUuqbKc3?=
 =?us-ascii?Q?MTXB+rf6zFcLo4OPwQSSS7U9eFbTx6Vmv03oVvpDD/D2ZY4oaFFyUBZmNBm3?=
 =?us-ascii?Q?lyTg0yH3xTBxY+/3GSmXcA4MOPpmNv1LhOsctPHeHhgoJlFEwoA5wUGD48Ow?=
 =?us-ascii?Q?GWQuJfAMJK5Gx4RcrOyDd3KDBBmDUjyh1AB0t5bsPp68r/aevODN8SEzkrCL?=
 =?us-ascii?Q?gNXv7bcsPGi5OrUK6RHrNzVIm/9cnN+paRTKxFkQfMCRr4QWNCwfmJZSzk8a?=
 =?us-ascii?Q?L2kqrZAPZXngpeJOmnHMltwj1H6k2d/A1ZH38jePqu+2zmQvJEbJLacw5Lx8?=
 =?us-ascii?Q?yDiXkd5mRzGC1oQgFV/l1iW7+shENXuxR5RY+X3WMOo7CPkJwf+9w/Tb6g83?=
 =?us-ascii?Q?2JOuayHuHJcqx0XQhkG+Kgr1xTstngPa3joyWS7DnitJIXbl9p3BHwC0YpZI?=
 =?us-ascii?Q?XV2jf6caCt1D/EfxFAEkF9hi/QAkZ2sFixva+isF7ySRNSPc+SU4QuhkKLK9?=
 =?us-ascii?Q?ksFQ7SAu6PPN5oHhBsnEPfrZePAFNg4uElstgJcmMqqb8ioeV5RD3BxetkCq?=
 =?us-ascii?Q?ujfwzr3r9Le1hHn1o4jvODMr8TUFoEMb7JK/TwSpt5ye28LyQ6PzJdtJqKYi?=
 =?us-ascii?Q?K4YWaKwWNJSAhTPLYCxDs+OHhqGtLJcm3Bg3l3dj0aluLWYajUhvWWgGXYrK?=
 =?us-ascii?Q?NdZ0WbHF5EJUVBwsOmZvqvlrV5SfJt/TLeHh5rw1m0m/zvUuCq8UklPjtzbM?=
 =?us-ascii?Q?Xn2gJGpaorBLI0PR+dmIxOCW2Z5oR8Vs2zewd7e6R9N8bUUsljTIVAjAvzu5?=
 =?us-ascii?Q?drJnqNLvWgixFWGzW9aKhIqux15TXaxoRFwxFw3pOIbfpSgpSniortnqbK2a?=
 =?us-ascii?Q?G0S9BvK4oRX24g+VNW/kB+/T23vXbNzHcLAJTQ4XfdSJ6XPXZMjNpOQJ7gRA?=
 =?us-ascii?Q?FhBF7Ag50bnoE+2lIGvahD9LLl2KGGypuRL3bs2HIW2dDQ5QFrfMPrBC+FKA?=
 =?us-ascii?Q?Gzmutih788AedO0Iaoehr20VXgKgKfA=3D?=
X-Exchange-RoutingPolicyChecked: OZO6gbEdLcUGg+VT0CQSQrZGeNI+Hqwfa+M2Q5/7t3hdTY4UYbukdnNGC38H5HwRhhALPkSrylQxduVAzXeFUc6pzrXmHOXxd9uCCDa/AIUOKK294a5XAOEWqg2LOW8jelqwxIqF3bIoQ7Yue5XOp6RTDna5bVTc0JE2jKt/4m6q28saqpgStJO7+6TWdJYYupB+11VVb2Ab3AD+0ladlGrFBaR5gWlPlA32bGxtULf9XvfYSMWT3cWWQZuj+b80+/Ol1vn9Fco7sCFXv160htaTHA2IMCQ2N4LJwrztnzCGCtuLkXCBWdBzKHs0rWixwxrFrDfqbgk3qIl+8YUUIw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd785ad-8cef-4aad-f033-08def4b33e74
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 18:39:41.9399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULjnceB59EHI2xr5atdk0P1917rdda3d1cgCWlLJz0swWlXeHkBSMinD1IQtKD91z5aFEF/cxhWJTkAqOkh3IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7058
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

On Fri, Aug 07, 2026 at 07:38:40AM -0600, Gote, Nitin R wrote:
> Hi Matt,
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Friday, August 7, 2026 12:32 AM
> > To: Jadav, Raag <raag.jadav@intel.com>
> > Cc: Gote, Nitin R <nitin.r.gote@intel.com>; intel-xe@lists.freedesktop.org; Auld,
> > Matthew <matthew.auld@intel.com>
> > Subject: Re: [PATCH] drm/xe/pm: do not warn about missing runtime PM
> > protection after hot-unplug
> > 
> > On Thu, Aug 06, 2026 at 02:38:03AM -0700, Matthew Brost wrote:
> > > On Thu, Aug 06, 2026 at 10:30:20AM +0200, Raag Jadav wrote:
> > > > On Thu, Aug 06, 2026 at 02:27:12PM +0530, Nitin Gote wrote:
> > > > > Exec queues are owned by user fds and are destroyed when the fd is closed.
> > > > > After hot-unplug this can happen from a deferred close during
> > > > > process exit, after the device has been removed and runtime PM has been
> > disabled.
> > > > > The queue destroy path can call xe_pm_runtime_get_noresume(), and
> > > > > since runtime PM is disabled pm_runtime_get_if_in_use() returns no
> > > > > reference, so it warns about "Missing outer runtime PM protection".
> > > > >
> > > > > This is a false positive for the hot-unplug teardown case. The
> > > > > device is already unplugged, and the queue destroy path that
> > > > > triggered this warning was checked and does not touch hardware
> > > > > state after unplug. GuC has already been sanitized by
> > > > > guc_fini_hw(), so no H2G is sent and the hardware teardown path is no
> > longer reachable.
> > > > >
> > > > > Skip the warning when the DRM device is already unplugged.
> > > > >
> > > > > Observed with new IGT core_hotunplug subtests:
> > > > >   igt@core_hotunplug@hotreplug-with-load
> > > > >   igt@core_hotunplug@hotunplug-rescan-with-load
> > > > >
> > > > > v2:
> > > > >  - Drop the drm_dev_is_unplugged() bypass from guc_exec_queue_destroy()
> > > > >    and instead exclude hot-unplug from the WARN in
> > > > >    xe_pm_runtime_get_noresume(). (Matthew Brost)
> > > > >
> > >
> > > I don't think this was suggestion but also I believe I misunderstood
> > > the problem, but maybe this works.
> > >
> > > > > v3:
> > > > >  - Clarify that the queue destroy path was checked and does not touch
> > > > >    hardware state after unplug. (Matthew Auld)
> > > > >
> > > > > Link:
> > > > > https://patchwork.freedesktop.org/patch/725773/?series=166744&rev=
> > > > > 4
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > Assisted-by: GitHub-Copilot:claude-opus-4.8
> > > > > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_pm.c | 5 ++++-
> > > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c
> > > > > b/drivers/gpu/drm/xe/xe_pm.c index a5289a9df8d2..a038687d5b2c
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > > @@ -10,6 +10,7 @@
> > > > >  #include <linux/suspend.h>
> > > > >  #include <linux/dmi.h>
> > > > >
> > > > > +#include <drm/drm_drv.h>
> > > > >  #include <drm/drm_managed.h>
> > > > >  #include <drm/ttm/ttm_placement.h>
> > > > >
> > > > > @@ -914,7 +915,9 @@ void xe_pm_runtime_get_noresume(struct
> > > > > xe_device *xe)
> > > >
> > > > From the documentation
> > > >
> > > >  * This function should be used in inner places where it is surely
> > > > already
> > > >  * protected by outer-bound callers of `xe_pm_runtime_get`.
> > > >
> > >
> > > We should have those.
> > >
> > > > >  	if (!ref) {
> > > > >  		pm_runtime_get_noresume(xe->drm.dev);
> > > > > -		drm_WARN(&xe->drm, !xe_pm_suspending_or_resuming(xe),
> > > > > +		drm_WARN(&xe->drm,
> > > > > +			 !drm_dev_is_unplugged(&xe->drm) &&
> > > > > +			 !xe_pm_suspending_or_resuming(xe),
> > > >
> > > > So IMO this is more of a band-aid.
> > > >
> > >
> > > So if I'm understanding the problem correctly,
> > > pm_runtime_get_if_in_use() (via guc_exec_queue_add_msg()) fails when
> > > the device is unplugged? I don't see how the PM reference count could
> > > be zero, regardless of whether the device is plugged in or unplugged.
> > >
> > > My suggestion was (and still is) that guc_exec_queue_destroy() should
> > > always add a message and determine whether the device/firmware is
> > > still alive while processing that message, then either kick the
> > > destory or issue H2G. Other messages likely are also missing proper
> > > device alive checks too.
> > >
> 
> Yes, it was. Initially, I thought to send this as a separate patch once this issue was fixed. 
> However, I think it's better to include it in this patch itself.
> 
> > > If, for some reason, obtaining a PM reference via
> > > xe_pm_runtime_get_noresume() doesn't work when the device is
> > > unplugged, then that logic should be handled in the message submission
> > > layer. For example, use drm_dev_enter()/drm_dev_exit() for hot-unplug
> > > protection, only take a PM reference if the device is still bound,
> > > encode that information into the message, and then determine the
> > > appropriate next steps when the message is processed.
> > >
> > 
> > Below is rough sketch of what I was thinking. We can also probably rip out
> > EXEC_QUEUE_FLAG_PERMANENT then too. We'd also need solid explaination
> > how why xe_pm_runtime_get_noresume doesn't work if device is unplugged, as
> > that part it unclear to me too.
> 
> Regarding why xe_pm_runtime_get_noresume() doesn't work after hot-unplug, I did some debugging. 
> You were right that this is not a zero refcount case. At the warning observed: usage_count=3, status=2(RPM_SUSPENDED) and disable_depth=1.
> 
> During hot-unplug, the PCI remove path goes through: device_del() -> pm_runtime_remove() -> __pm_runtime_disable(), which disables runtime pm 
> and increments disable_depth from 0 to 1. The old struct device stays alive because the old drm_device is still referenced by an open fd. 
> When that fd is finally closed, guc_exec_queue_destroy() runs on the old device where runtime PM is already disabled (disable_depth=1). 
> In that state, pm_runtime_get_if_in_use() returns -EINVAL regardless of the non-zero usage count, which causes xe_pm_runtime_get_noresume() 
> to hit the "Missing outer runtime PM protection" WARN.
> 

Thanks for looking ino this part. Make sure to put this into the commit
and bonus points for updating our xe_pm.c doc around hazard of PM refs
after the device is hotplugged. I suspect this isn't the only case in Xe
where we have missing drm_dev_enter/exits.

Matt 

> So this does not appear to be an actual missing runtime PM reference. The failure is caused by runtime PM already being disabled during device removal. 
> I'll move the handling to the message submission layer as you suggested, taking the PM reference only while drm_dev_enter() indicates the device is still bound, 
> instead of trying to gate the warning.
> 
> To confirm this, I added some debug log and saw:
> disable_depth=1, status=2(RPM_SUSPENDED),  usage_count=3
> 
> Thank you for the rough sketch, Matt. I'll work on that approach.
> 
> Nitin
> 
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 9036f89dff7d..08000f8db28a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1812,32 +1812,15 @@ static void __guc_exec_queue_destroy_async(struct
> > work_struct *w)  static void guc_exec_queue_destroy_async(struct
> > xe_exec_queue *q)  {
> >         INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
> > -
> > -       /* We must block on kernel engines so slabs are empty on driver unload */
> > -       if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
> > -               guc_exec_queue_do_destroy(q);
> > -       else
> > -               xe_destroy_wq_queue(&q->guc->destroy_async);
> > +       xe_destroy_wq_queue(&q->guc->destroy_async);
> >  }
> > 
> > -static void __guc_exec_queue_destroy(struct xe_guc *guc, struct
> > xe_exec_queue *q) -{
> > -       /*
> > -        * Might be done from within the GPU scheduler, need to do async as we
> > -        * fini the scheduler when the engine is fini'd, the scheduler can't
> > -        * complete fini within itself (circular dependency). Async resolves
> > -        * this we and don't really care when everything is fini'd, just that it
> > -        * is.
> > -        */
> > -       guc_exec_queue_destroy_async(q);
> > -}
> > -
> > -static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg
> > *msg)
> > +static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg
> > *msg,
> > +                                                bool bound)
> >  {
> >         struct xe_exec_queue *q = msg->private_data;
> >         struct xe_guc *guc = exec_queue_to_guc(q);
> > 
> > -       xe_gt_assert(guc_to_gt(guc), !(q->flags &
> > EXEC_QUEUE_FLAG_PERMANENT));
> >         trace_xe_exec_queue_cleanup_entity(q);
> > 
> >         /*
> > @@ -1850,10 +1833,10 @@ static void
> > __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
> >          *   it is safe to directly destroy the exec queue on driver side, as the GuC
> >          *   will not process further requests and all resources must be cleaned up
> > locally.
> >          */
> > -       if (exec_queue_registered(q) && xe_uc_fw_is_running(&guc->fw))
> > +       if (bound && exec_queue_registered(q) &&
> > + xe_uc_fw_is_running(&guc->fw))
> >                 disable_scheduling_deregister(guc, q);
> >         else
> > -               __guc_exec_queue_destroy(guc, q);
> > +               guc_exec_queue_destroy_async(q);
> >  }
> > 
> >  static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue
> > *q) @@ -1861,12 +1844,13 @@ static bool
> > guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
> >         return !exec_queue_killed_or_banned_or_wedged(q) &&
> > exec_queue_registered(q);  }
> > 
> > -static void __guc_exec_queue_process_msg_set_sched_props(struct
> > xe_sched_msg *msg)
> > +static void __guc_exec_queue_process_msg_set_sched_props(struct
> > xe_sched_msg *msg,
> > +                                                        bool bound)
> >  {
> >         struct xe_exec_queue *q = msg->private_data;
> >         struct xe_guc *guc = exec_queue_to_guc(q);
> > 
> > -       if (guc_exec_queue_allowed_to_change_state(q))
> > +       if (guc_exec_queue_allowed_to_change_state(q) && bound)
> >                 init_policies(guc, q);
> >         kfree(msg);
> >  }
> > @@ -1904,13 +1888,14 @@ static void suspend_fence_signal(struct
> > xe_exec_queue *q)
> >         __suspend_fence_signal(q);
> >  }
> > 
> > -static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg
> > *msg)
> > +static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg
> > *msg,
> > +                                                bool bound)
> >  {
> >         struct xe_exec_queue *q = msg->private_data;
> >         struct xe_guc *guc = exec_queue_to_guc(q);
> > 
> >         if (guc_exec_queue_allowed_to_change_state(q) &&
> > !exec_queue_suspended(q) &&
> > -           exec_queue_enabled(q)) {
> > +           exec_queue_enabled(q) && bound) {
> >                 wait_event(guc->ct.wq, vf_recovery(guc) ||
> >                            ((q->guc->resume_time != RESUME_PENDING ||
> >                            xe_guc_read_stopped(guc)) &&
> > !exec_queue_pending_disable(q))); @@ -1934,11 +1919,12 @@ static void
> > __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> >         }
> >  }
> > 
> > -static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg
> > *msg)
> > +static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg
> > *msg,
> > +                                               bool bound)
> >  {
> >         struct xe_exec_queue *q = msg->private_data;
> > 
> > -       if (guc_exec_queue_allowed_to_change_state(q)) {
> > +       if (guc_exec_queue_allowed_to_change_state(q) && bound) {
> >                 clear_exec_queue_suspended(q);
> >                 if (!exec_queue_enabled(q)) {
> >                         q->guc->resume_time = RESUME_PENDING; @@ -1950,17
> > +1936,20 @@ static void __guc_exec_queue_process_msg_resume(struct
> > xe_sched_msg *msg)
> >         }
> >  }
> > 
> > -static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct
> > xe_sched_msg *msg)
> > +static void
> > +__guc_exec_queue_process_msg_set_multi_queue_priority(struct
> > xe_sched_msg *msg,
> > +                                                     bool bound)
> >  {
> >         struct xe_exec_queue *q = msg->private_data;
> > 
> > -       if (guc_exec_queue_allowed_to_change_state(q))
> > +       if (guc_exec_queue_allowed_to_change_state(q) && bound)
> >                 guc_exec_queue_send_cgp_sync(q, 0);
> > 
> >         kfree(msg);
> >  }
> > 
> > -static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg
> > *msg)
> > +static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg
> > *msg,
> > +                                                 bool bound)
> >  {
> >         struct xe_exec_queue *q = msg->private_data;
> > 
> > @@ -1969,7 +1958,7 @@ static void
> > __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
> >          * CGP update + CGP_SYNC (re-applies the current priority from
> >          * q->multi_queue.priority).
> >          */
> > -       if (guc_exec_queue_allowed_to_change_state(q))
> > +       if (guc_exec_queue_allowed_to_change_state(q) && bound)
> >                 guc_exec_queue_send_cgp_sync(q, 0);  }
> > 
> > @@ -1982,37 +1971,46 @@ static void
> > __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
> >  #define OPCODE_MASK    0xf
> >  #define MSG_LOCKED     BIT(8)
> >  #define MSG_HEAD       BIT(9)
> > +#define MSG_PM_REF     BIT(10)
> > 
> >  static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)  {
> >         struct xe_device *xe = guc_to_xe(exec_queue_to_guc(msg->private_data));
> > +       int idx;
> > +       bool pm_ref = !!(msg->opcode & MSG_PM_REF),
> > +            bound = drm_dev_enter(&xe->drm, &idx);
> > 
> >         trace_xe_sched_msg_recv(msg);
> > 
> > -       switch (msg->opcode) {
> > +       switch (msg->opcode & OPCODE_MASK) {
> >         case CLEANUP:
> > -               __guc_exec_queue_process_msg_cleanup(msg);
> > +               __guc_exec_queue_process_msg_cleanup(msg, bound);
> >                 break;
> >         case SET_SCHED_PROPS:
> > -               __guc_exec_queue_process_msg_set_sched_props(msg);
> > +               __guc_exec_queue_process_msg_set_sched_props(msg,
> > + bound);
> >                 break;
> >         case SUSPEND:
> > -               __guc_exec_queue_process_msg_suspend(msg);
> > +               __guc_exec_queue_process_msg_suspend(msg, bound);
> >                 break;
> >         case RESUME:
> > -               __guc_exec_queue_process_msg_resume(msg);
> > +               __guc_exec_queue_process_msg_resume(msg, bound);
> >                 break;
> >         case SET_MULTI_QUEUE_PRIORITY:
> > -               __guc_exec_queue_process_msg_set_multi_queue_priority(msg);
> > +               __guc_exec_queue_process_msg_set_multi_queue_priority(msg,
> > +
> > + bound);
> >                 break;
> >         case CGP_SYNC_MSG:
> > -               __guc_exec_queue_process_msg_cgp_sync(msg);
> > +               __guc_exec_queue_process_msg_cgp_sync(msg, bound);
> >                 break;
> >         default:
> >                 XE_WARN_ON("Unknown message type");
> >         }
> > 
> > -       xe_pm_runtime_put(xe);
> > +       if (pm_ref)
> > +               xe_pm_runtime_put(xe);
> > +
> > +       if (bound)
> > +               drm_dev_exit(idx);
> >  }
> > 
> >  static const struct drm_sched_backend_ops drm_sched_ops = { @@ -2137,10
> > +2135,17 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)  static
> > void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg
> > *msg,
> >                                    u32 opcode)  {
> > -       xe_pm_runtime_get_noresume(guc_to_xe(exec_queue_to_guc(q)));
> > +       struct xe_guc *guc = exec_queue_to_guc(q);
> > +       struct xe_device *xe = guc_to_xe(guc);
> > +       int idx;
> > +       bool bound = drm_dev_enter(&xe->drm, &idx);
> > 
> >         INIT_LIST_HEAD(&msg->link);
> >         msg->opcode = opcode & OPCODE_MASK;
> > +       if (bound) {
> > +               xe_pm_runtime_get_noresume(guc_to_xe(exec_queue_to_guc(q)));
> > +               msg->opcode |= MSG_PM_REF;
> > +       }
> >         msg->private_data = q;
> > 
> >         trace_xe_sched_msg_add(msg);
> > @@ -2150,6 +2155,9 @@ static void guc_exec_queue_add_msg(struct
> > xe_exec_queue *q, struct xe_sched_msg
> >                 xe_sched_add_msg_locked(&q->guc->sched, msg);
> >         else
> >                 xe_sched_add_msg(&q->guc->sched, msg);
> > +
> > +       if (bound)
> > +               drm_dev_exit(idx);
> >  }
> > 
> >  static void guc_exec_queue_try_add_msg_head(struct xe_exec_queue *q, @@ -
> > 2182,10 +2190,7 @@ static void guc_exec_queue_destroy(struct xe_exec_queue
> > *q)  {
> >         struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
> > 
> > -       if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) &&
> > !exec_queue_wedged(q))
> > -               guc_exec_queue_add_msg(q, msg, CLEANUP);
> > -       else
> > -               __guc_exec_queue_destroy(exec_queue_to_guc(q), q);
> > +       guc_exec_queue_add_msg(q, msg, CLEANUP);
> >  }
> > 
> >  static int guc_exec_queue_set_priority(struct xe_exec_queue *q, @@ -2650,7
> > +2655,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct
> > xe_exec_queue *q)
> >         }
> > 
> >         if (do_destroy)
> > -               __guc_exec_queue_destroy(guc, q);
> > +               guc_exec_queue_destroy_async(q);
> >  }
> > 
> >  static int guc_submit_reset_prepare(struct xe_guc *guc) @@ -3296,7 +3301,7
> > @@ static void handle_deregister_done(struct xe_guc *guc, struct
> > xe_exec_queue *q)
> >         trace_xe_exec_queue_deregister_done(q);
> > 
> >         clear_exec_queue_registered(q);
> > -       __guc_exec_queue_destroy(guc, q);
> > +       guc_exec_queue_destroy_async(q);
> >  }
> > 
> > > Sorry a lot of this stuff in xe_guc_submit.c around corner cases /
> > > teardwons is a mess from early Xe work I did, we should aim to clean
> > > this up with clear semantics.
> > >
> > > Matt
> > >
> > > > Raag
> > > >
> > > > >  			 "Missing outer runtime PM protection\n");
> > > > >  	}
> > > > >  }
> > > > > --
> > > > > 2.50.1
> > > > >
