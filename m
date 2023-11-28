Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8A6C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 16:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09F310E166;
	Tue, 28 Nov 2023 16:28:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C785710E166
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 16:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701188921; x=1732724921;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VWqh9xYinIP60ucME6Lg5sWAYCZCbyWxlWAxYHP/deM=;
 b=h9aCoiqHWmQ19tVj88mF0xPDYwpjPyCXlXwMcYUQEg7NAIOjdZKv6PrK
 g9iEkcWehfcPYJyhxd/xWm6gLpNyU0iUv5FJyQYPf4qaP2noqhQcM9LZk
 uj7dbnXm5E49tKpMRVKpBtjMHdBLq5/0Ahp5vNNnhouh3YhZlJSCvQXLz
 LHMMtD385eokp4BEATaCIq09bozCxmA58J29yxLD/u51XOzNPlHpZJ+1/
 X8bqUDnMQDWpElbEeJyS9Hhy00CncuIGMdfz9w5Oed0LJx3XMqNQ71Ijg
 nIUlRRNkxLoS5lczsDH4FjgsLPT5hbRLDViYvqpTEhGRqUx49z6aE1DfO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="390110621"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="390110621"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 08:28:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="839108047"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="839108047"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 08:28:41 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 08:28:40 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 08:28:40 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 08:28:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etWzUxCTbTJFqpnOr+U0HaSTjaQFd2HHuE9eLxHlgh+ON8HvmZvAc0a+7FQeixfgdL+beHl2iDZt+0C5f0iW0XPhOGMNvpdTaTspRtvNsyVn3PMjTawr04SjRLOT94mphpmcctXd/j/FbI0j45xvLpI9wwdaFtZ+5afUAh73gZeGgGlU5HvUNKzTjbe/RogvhAdojvpIPN6xZZfNdSVr0/aBivVWTDA+V/tQek0o9is5sqmZlE2c/X8+oweBLgnLl/vcaepvL302A7Sr07pQqbNpTaZDPBDhtiwB3/zLTfrjQZ8OOTA+U71kls7b8ZSGGDLQ7prTt9dNKUtPWPq89w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfaslpB+qlU8UEX3gQe6Kwe5D8X+dc2fEyLdTU8ueXA=;
 b=OCWp5PZXhYN/YEsX3g1bBafUt4wGA/0q6svhWfsoiegeZCdi+saEZOVMN6XP8JAZv9628wWcTXh9HR4n/v0K2csT9xgiR1TY5d2pXwHfpK2S5Omx9CiIwipwMnI2rxei56/tucf1/fTqkTeXW44+bsYqSoV/ZSzaBvO9zFTdGEQQwnrtrLhjrXDKAYvNPEFODI+jihEVy4csgNBPDVsggX2pwzLoNXes81V3cVOyi0W/yCwLRS43Le5GZSEtP9I96Yy1682cWICjtpcfI86ugessutdt4ZAl5cOlF24LmuIK1QPOABkRlJSAOuxq2s/k4f9+V3/VnmmX5JYVZNOleA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7611.namprd11.prod.outlook.com (2603:10b6:806:304::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 16:28:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 16:28:38 +0000
Date: Tue, 28 Nov 2023 09:27:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZWWyaVbQpbciDXs4@DUT025-TGLU.fm.intel.com>
References: <20231127094458.18130-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231127094458.18130-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fde2f52-8867-4596-2c97-08dbf02f1332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FWoHzmFfm+IrjRfVu6qumyo1zu0w+2RmbhJ6kvu4xXpMji5DNHroW0M6LTS4GMefaICD6Xi+p195ZEVP3r0fSJIsPTECAcPH/OrnY1OPP3ZMpQrGbWQAO+rYdV+ag4ZMWt7aYAHtSgXy/GpnfSsSj9KFvfwgxQ4mH4Th5cUUZjJm4BYnM1V82I4pj+3EriD7AVZOvS6C1YTNV3y4xRO+oM8resBjyzqkN1vYW/FZnnaOm5+/QTGtPG1UrRO/0juwwphTCQ0YnNBSGWVkJToelzl0Dsw1r8gLhfyCSWKywqWXuBIyAlWF7wW5yIVOkDh8zz5TmmiGXz5+F2755VQ1In27Le3TO+dxXEKOK5HoJTYAQH13Q55iBfHOtLHBSac5a5f9YK5Twa8aWuby0pg0f2EzM0+602j3pq9ES0n3b0rW9jOmO3XyFDANAZLNu4taSfWEMf1oZ5aPijA16z2s5PK9nTqlabGHYQEXemVK1DsCpXh55mSw+ll3g9OSMROGqXDQsQz+zdgltPILl8+4RQLdbs/Ap4OS2ESLWqPPLmPtTK2RBJ4eKz+E1YmlMXDVBLI2SNzGzbIROSWJR66PJNxhvWKLaLosP6QAiCc0tPgSjxtAsE7q3TO3n9hhP2Ih
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230273577357003)(230922051799003)(230173577357003)(451199024)(1800799012)(64100799003)(186009)(66899024)(26005)(478600001)(6506007)(6666004)(6512007)(38100700002)(82960400001)(86362001)(6862004)(2906002)(41300700001)(4326008)(83380400001)(5660300002)(107886003)(6486002)(54906003)(66476007)(66556008)(66946007)(316002)(8936002)(8676002)(6636002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lKqS768g9i1f+HWgsCGA3wrbqGNHDQSdU0Z2EFP4C82wuljLWmVb34N95fKF?=
 =?us-ascii?Q?X+ry/IPJlNoK/pAtCP+PUH7+XbHc51TwRTbLonkqsrrl7nzQO9Vt3Si5PtRc?=
 =?us-ascii?Q?47k0TEZuVqIlTuLr7na6w1GZTrqM92xEAUpIUOT9Fq3y4QVljtbRbhcGqvzN?=
 =?us-ascii?Q?c7y48GWNA2s++nm9NiqtEoJpAdHoG6Jz/5vnQZ0FWkEee3oxVCKk9gDdqMzh?=
 =?us-ascii?Q?f77KVXwGS5c9+edwXTHmkVzUkby9JZPWoNUfcrnur+L472VeOpgC89EE+JPR?=
 =?us-ascii?Q?hHg0nYxocGJl4x65FlGNjlJzd1/r92+Mgt8J8mONtZDfZOBdRB2PPF3lxwMV?=
 =?us-ascii?Q?pSQuRm/lfFSfmLJPTU/E37359scrRl3xw8+Y8FuPRoi6Hb5M2m+orY3CFw0K?=
 =?us-ascii?Q?2nsU4DbJex8jppCpZ4FcYs9jsjt1hNr7np56FWBviKbcYixV9+oMpuOEWmFN?=
 =?us-ascii?Q?qDszK5hdFXYMKsociTYiM99jW7NZxY7lhFAYxzj3o5QxB0fFxK8LaXOo6hpV?=
 =?us-ascii?Q?+ij+19Naa+DfIvLXMcaSlJoIfKeMUw5HUDu5Ham1rbdl4dxh7pkfWKljtepp?=
 =?us-ascii?Q?KoS+K6Eaik2xYaI443XSeE6ww3tw6j5NnPjqa4XxFZFS3CJygOwDLipEqIU4?=
 =?us-ascii?Q?oaMlxkdLykz2hbPFKw+C9KCwZgTZw+VJtwJvOmsx/q/P9U59qm4AdCB5d2ER?=
 =?us-ascii?Q?j5i4NbvWPJ/YT/RAGkOHf3ZDLVUAI8Qs9oCJGyFu2rTeWUsUQsbSWkYV/SPQ?=
 =?us-ascii?Q?bsfglXaNibMw2PgEGM0VT6IumXDYffPDfx+BR7cMwqC5avE3FR7Yga/A/zEm?=
 =?us-ascii?Q?5PtwKWqgju6LKkQNF2I48rC0q1aCtATQaksalYXiKjh+vhDQOl/UEDuUmxWy?=
 =?us-ascii?Q?0oxjpJQjNngef2KXtDUPDPRk6JIM3zEDuTzUUtCIpz4zX6GIUmJO4PO1KHYX?=
 =?us-ascii?Q?soKw1FMtZN8DryBLIsnBieMJyMesLTUC+Qdu2UJA2cO24MIxZlLTt+636TS3?=
 =?us-ascii?Q?YuGr0Qick0VfgUif2ooADAIx/R+tjfxBDOL5vx18c9lP0/NS+Zbq6cHdgzH1?=
 =?us-ascii?Q?6h0IUOiyBwC3bH1afCymQq4omNjsd5XiVl5t9WAsJAC6Eyt4a08tirHVn2Ml?=
 =?us-ascii?Q?u+JjdvV1UyO070IipmusvN36vaWOlUu/lddjIsI9al6z3HO1K0MahXyn+D8h?=
 =?us-ascii?Q?cD7/67w3aMBaCOawcRTD9Fb11gIWmT0uOisgLnEE4lWjxYq/NZPAjM3Sf5s3?=
 =?us-ascii?Q?2CW3dCYEAh+9z5D1Df2gAaQKr7RbLPuU3iQKokpn6wfNAZmoH9lNpvzaLjr7?=
 =?us-ascii?Q?CK706AyzG25iQ2Rd2Um8/I/ZcwJXC+fclOy+BkzmvA6+YAyYJv/ZR08VdpS/?=
 =?us-ascii?Q?SYwE2bDi5YZ70IT0NAU83+qEcEfeBl41qA5gYTUihTQ+5+5YwWDP3tNP6z/I?=
 =?us-ascii?Q?SfLe2zxKHlUCzt2/UG9/Ryf3w8lOb1H/Q4JRpITGF+/jOQ6E4Xkmw8SIf852?=
 =?us-ascii?Q?dW9+m4ppwFt8RMcBnR7scARfpLaNvG8EN4xWyRYtazgZ2/L+8e7VxMwl44SC?=
 =?us-ascii?Q?vXRyPz8Pv2JvEKSG3UEQwYAcPIgWX339X8wD4aBmVcCDUPKSzdHdp9i5umvl?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fde2f52-8867-4596-2c97-08dbf02f1332
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 16:28:38.0697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hmj9ecZd6lIEMcsZiuxNqGVqF/x4EQ07eu4UNf9TkcLbHT/Vx93+bXoGO5Qc86TQFgSooesoe552z2i60gT2zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7611
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: fix mem_access for early lrc
 generation
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

On Mon, Nov 27, 2023 at 09:44:59AM +0000, Matthew Auld wrote:
> We spawn some hw queues during device probe to generate the default LRC
> for every engine type, however the queue destruction step is typically
> async. Queue destruction needs to do stuff like GuC context deregister
> which requires GuC CT, which in turn requires an active mem_access ref.
> The caller during probe is meant to hold the mem_access token, however
> due to the async destruction it might have already been dropped if we
> are unlucky.
> 
> Similar to how we already handle migrate VMs for which there is no
> mem_access ref, fix this by keeping the callers token alive, releasing
> it only when destroying the queue. We can treat a NULL vm as indication
> that we need to grab our own extra ref.
> 
> Fixes the following splat sometimes during load:
> 
> [ 1682.899930] WARNING: CPU: 1 PID: 8642 at drivers/gpu/drm/xe/xe_device.c:537 xe_device_assert_mem_access+0x27/0x30 [xe]
> [ 1682.900209] CPU: 1 PID: 8642 Comm: kworker/u24:97 Tainted: G     U  W   E    N 6.6.0-rc3+ #6
> [ 1682.900214] Workqueue: submit_wq xe_sched_process_msg_work [xe]
> [ 1682.900303] RIP: 0010:xe_device_assert_mem_access+0x27/0x30 [xe]
> [ 1682.900388] Code: 90 90 90 66 0f 1f 00 0f 1f 44 00 00 53 48 89 fb e8 1e 6c 03 00 48 85 c0 74 06 5b c3 cc cc cc cc 8b 83 28 23 00 00 85 c0 75 f0 <0f> 0b 5b c3 cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90
> [ 1682.900390] RSP: 0018:ffffc900021cfb68 EFLAGS: 00010246
> [ 1682.900394] RAX: 0000000000000000 RBX: ffff8886a96d8000 RCX: 0000000000000000
> [ 1682.900396] RDX: 0000000000000001 RSI: ffff8886a6311a00 RDI: ffff8886a96d8000
> [ 1682.900398] RBP: ffffc900021cfcc0 R08: 0000000000000001 R09: 0000000000000000
> [ 1682.900400] R10: ffffc900021cfcd0 R11: 0000000000000002 R12: 0000000000000004
> [ 1682.900402] R13: 0000000000000000 R14: ffff8886a6311990 R15: ffffc900021cfd74
> [ 1682.900405] FS:  0000000000000000(0000) GS:ffff888829880000(0000) knlGS:0000000000000000
> [ 1682.900407] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1682.900409] CR2: 000055f70bad3fb0 CR3: 000000025243a004 CR4: 00000000003706e0
> [ 1682.900412] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [ 1682.900413] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [ 1682.900415] Call Trace:
> [ 1682.900418]  <TASK>
> [ 1682.900420]  ? xe_device_assert_mem_access+0x27/0x30 [xe]
> [ 1682.900504]  ? __warn+0x85/0x170
> [ 1682.900510]  ? xe_device_assert_mem_access+0x27/0x30 [xe]
> [ 1682.900596]  ? report_bug+0x171/0x1a0
> [ 1682.900604]  ? handle_bug+0x3c/0x80
> [ 1682.900608]  ? exc_invalid_op+0x17/0x70
> [ 1682.900612]  ? asm_exc_invalid_op+0x1a/0x20
> [ 1682.900621]  ? xe_device_assert_mem_access+0x27/0x30 [xe]
> [ 1682.900706]  ? xe_device_assert_mem_access+0x12/0x30 [xe]
> [ 1682.900790]  guc_ct_send_locked+0xb9/0x1550 [xe]
> [ 1682.900882]  ? lock_acquire+0xca/0x2b0
> [ 1682.900885]  ? guc_ct_send+0x3c/0x1a0 [xe]
> [ 1682.900977]  ? lock_is_held_type+0x9b/0x110
> [ 1682.900984]  ? __mutex_lock+0xc0/0xb90
> [ 1682.900989]  ? __pfx___drm_printfn_info+0x10/0x10
> [ 1682.900999]  guc_ct_send+0x53/0x1a0 [xe]
> [ 1682.901090]  ? __lock_acquire+0xf22/0x21b0
> [ 1682.901097]  ? process_one_work+0x1a0/0x500
> [ 1682.901109]  xe_guc_ct_send+0x19/0x50 [xe]
> [ 1682.901202]  set_min_preemption_timeout+0x75/0xa0 [xe]
> [ 1682.901294]  disable_scheduling_deregister+0x55/0x250 [xe]
> [ 1682.901383]  ? xe_sched_process_msg_work+0x76/0xd0 [xe]
> [ 1682.901467]  ? lock_release+0xc9/0x260
> [ 1682.901474]  xe_sched_process_msg_work+0x82/0xd0 [xe]
> [ 1682.901559]  process_one_work+0x20a/0x500
> 
> v2: Add the splat
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 62d0237e724e..7a9186cea5a6 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -90,12 +90,12 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
>  	/*
>  	 * Normally the user vm holds an rpm ref to keep the device
>  	 * awake, and the context holds a ref for the vm, however for
> -	 * some engines we use the kernels migrate vm underneath which
> -	 * offers no such rpm ref. Make sure we keep a ref here, so we
> -	 * can perform GuC CT actions when needed. Caller is expected to
> -	 * have already grabbed the rpm ref outside any sensitive locks.
> +	 * some engines we use the kernels migrate vm underneath which offers no
> +	 * such rpm ref, or we lack a vm. Make sure we keep a ref here, so we
> +	 * can perform GuC CT actions when needed. Caller is expected to have
> +	 * already grabbed the rpm ref outside any sensitive locks.
>  	 */
> -	if (q->flags & EXEC_QUEUE_FLAG_VM)
> +	if (q->flags & EXEC_QUEUE_FLAG_VM || !vm)
>  		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
>  
>  	return q;
> @@ -172,10 +172,10 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>  
>  	for (i = 0; i < q->width; ++i)
>  		xe_lrc_finish(q->lrc + i);
> +	if (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm)
> +		xe_device_mem_access_put(gt_to_xe(q->gt));
>  	if (q->vm)
>  		xe_vm_put(q->vm);
> -	if (q->flags & EXEC_QUEUE_FLAG_VM)
> -		xe_device_mem_access_put(gt_to_xe(q->gt));
>  
>  	kfree(q);
>  }
> -- 
> 2.43.0
> 
