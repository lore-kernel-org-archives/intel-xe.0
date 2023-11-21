Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7F9C61D85
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 17:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B6710E54A;
	Tue, 21 Nov 2023 17:45:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0AF10E54A
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 17:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700588710; x=1732124710;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t1Zwp9nAzVK2pE0FHDf22uJjzN0CXj5fqm6qAgTFwX4=;
 b=Jf9eR02ZX5ZXwKZRFiVJZpw2QiBAdoXIhTgf6ONRNwlp7VeaBCMH+C6B
 lBZHDZ9YPhD/0XJ2Zo5Vgb4Uv6Yt6L3l8OZDv8tlwfwUXDh3zwv+YZdRI
 Ui2aZgM060F5Ytm7gJaWXltaJEWJ3fyj/DADSZ1tZLnAvaF42ttGLPt28
 rGHGA5mvAnCrbFxu1+Riaw//DDnQaOjuNuEwTt0x7T5dRKW2+6+9kduqI
 tUCTX99NI1ub/ybUfFsc1vFfuUZRk/jdAafaTkWPEZZzzKq4WWU8JA29v
 8Bs/+37/0u2c+PYQhk38Zuvq2LLi+DP8W8W3P6ItPn1jRhZyznJzEeIbQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="422986473"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="422986473"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 09:45:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="760170446"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="760170446"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2023 09:45:09 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 09:45:09 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 09:45:09 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 09:45:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyNfPqrFj7rvP3vX4zU4wlUuUNUHC+0melTf/Glscme/C2mX+lsg+gh2yx5fPTAYptMBLCJdSDqbJ2Zjjcp0F7gTxdA9Q8IiGtfKOp5AI6lag8AFn4EvYxbF6K5EApC9+HvAwMNc5HT7n+1C/ifww/2Jn20zVrpMY/2E1DW/g4iUfpqVsVyqjSHatQMi3eAjA7eaJ9etSkJHyijuuYNkCjIalMPbIqRrv0kXhUgqAQIFoRXfo7QfQ4PCom1eNLr16PnZK3EtIwvHVa+UsvRnljfUGRJUQYJvUQc3lxI9bsRMjU1CN5ul/i+v8B1XlCjm6Wo3wWI3OpAj53vKDQTvhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViJfg9zppExba35WMP4XlbGTbX8yDb3sCqS1uwzhQlM=;
 b=GNjG17ojxjcSVICtyA5iBkCgCvddf7yII89NVjLcSrPcOznftoJ2roDjqdmzs9IPUTM/nHFExe0bMH4JJDPvPbrpdzb0hooCSpnJaXrw/DTfxHwNgx/tPGN0hRNoy1YMOAVtV/NzZvje3mUQb3tJGhEoHGQB/f4teiPcYpVhRGHO0sHD8449tsTxgcAyyVCHNUOm2SrXtQJ24QyaGcbJh2i8OCRkpTuxXHdjxFDbvguUUlhN63lXS+rRYW/aWa9O9OmzLBhLR3BD6PWSQ6cGW01qXg5vrcK5KBaDGO7zaLoQR6xMdsQg8YJZHRRg13t+PCED7BLCeqKgZupb3K1VNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM8PR11MB5623.namprd11.prod.outlook.com (2603:10b6:8:25::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Tue, 21 Nov
 2023 17:45:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 17:45:06 +0000
Date: Tue, 21 Nov 2023 11:45:04 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <wichc7yv6jjcm7wzlaahiyibofobqswq34j23hdz23dksmdnfq@ztxrjuqewk7k>
References: <20231121040852.462742-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231121040852.462742-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR02CA0041.namprd02.prod.outlook.com
 (2603:10b6:a03:54::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM8PR11MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: ae8b2085-a3e4-4666-d22e-08dbeab99965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gnIhs5tJp8VdXbOJWs0GivR4Rl5ejtXP04bpiGPqi2Wm962MbrFfC3fYdr86lK9WNuDQ1IZ0hYoUjXMp+uPCOT1TKW7w6TsbWxMUiPfJCAm1bAjXPKEUh+Gbm7y0ZkCKPTzoQ3MffsGQ3oghXoXrcZm9rnYV6hh4X/iK4o1jhy2YdTxswxBIK2zFJkrXTlnHOog/a1fBGiOWCtCNG7AJKX7hXvzBg/Yr62WA/6pklbjeDxEjoe4XN8C5pqsaiTtdlArOe122jdD19c2WDPcveeEo26Imd2dWGAjvWszcKRXnJBvIcPnAnImycBH92SfCtcksxLTnlH7IbkzLjqh2C77hLtmmZGNN3r7X2ECELV9/fkDnBm5df7MKBV9wEm1db6vqDfv+NLhb29DCGAzXrUk6nKsiiWaxy2PbFJo+qJInMv8VufTd1hKDVYlgkfhtd1jN/WymmNgYT+8VpYOW8shpACQE61u54kcUjVO1HXGuazXBjA1x1hnhUvHPGDzqSfkkUChX0pWtaHqAtt3s41EPT6etf4wKI7a10jPJtJ8KpYe0VJLeMqxwkDoTkjct
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(366004)(39860400002)(136003)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(478600001)(6506007)(26005)(6486002)(9686003)(6512007)(33716001)(82960400001)(54906003)(316002)(66476007)(66556008)(66946007)(6636002)(107886003)(8936002)(38100700002)(4326008)(6862004)(8676002)(5660300002)(2906002)(41300700001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WP8p4EkNVhR6UYEx8aB7wTcj3H8j/23m/9XJ+3NxetNvF3OcGnKgOuEnZKco?=
 =?us-ascii?Q?4/4mF/gEGrfTFzcuHhuQKdV6zu6C0olhFcyE/YUOL4uWoqa3rDuQuA2kZ6Us?=
 =?us-ascii?Q?pHBfyvMKfhY5Em+6A2jhD0hqbOUVhUtRkMNT2ZiSFjriZjqwqRM9HUlpH3/7?=
 =?us-ascii?Q?757tRPT9RvC8PeRpPXQIOfETLR/BP/7M+rLHvhEdzEKf/IRlt/zZR0xh7EoG?=
 =?us-ascii?Q?QdUBRJLI4Nidy+i6q6C3oJOKt+SQYMmm7pE70+6TO3Tt+HrnZIpLiSZkqm9d?=
 =?us-ascii?Q?VKEtNgsuMdUhB959ZN+1Kuzws9aDRx19vxhVNb1KEWV0Grnz9Y7PceEz/mmv?=
 =?us-ascii?Q?+Du8zDeZTPIZn2OjtZPAUDlRd3mCXcZmQ/Ytr/nqKqmwJjijCN/WWbezKFm3?=
 =?us-ascii?Q?JE4pNOlY+ESpfKWEF9fFEsRd9us5doyS3dbHrg8LDnKdojtlZw8TPChZDLzF?=
 =?us-ascii?Q?mavni1mHnDa2RYoxwZCaTe0OmHkQSbWj2bTCkFM33iUBbPk30mbnaquHSbEh?=
 =?us-ascii?Q?1ic66d5vyjNfrZb8idrjworAvV8JisRPAUFWX7VZ1DoubVM12U4PJ1Y0oQIj?=
 =?us-ascii?Q?7uUV5uzPvATkB+OQ719uawf6wEnDa6XCPgLKAjDewtUBF9J3J8V47jJ/lmxE?=
 =?us-ascii?Q?+ikCfWFQi3rbsBOGk2o+fyu7gJEo3LRNkyo7mjiWcQHud4DQTxgoKvHCI8dL?=
 =?us-ascii?Q?UXggWnA9AatMOtp+byV/RU6R8Bw9qMZbqzMENjUnJVuvORUvS5U4oPGmk/5U?=
 =?us-ascii?Q?CvPVGnW3W3eGoB8Js58aBfPV0hB4znmN76ePmcgBRaZKC7oXGRrWO4JbguMw?=
 =?us-ascii?Q?/3opbXjzKHb+gn7hfmkVql4G6riRdzyJDdpWgn7TUopmRGFTJyzJKEVtKIsA?=
 =?us-ascii?Q?Gbq7vfUKd/pLmZn6dST/cbgxHn7RX/1qte6fhqP1afj6UvIiQTaDjs7SGM7l?=
 =?us-ascii?Q?Tr3lvgRXLyTvo+OS16g3ua+WbKN5fXdv0Ww8MOh9546dc0wwfGRKHgrTLrt6?=
 =?us-ascii?Q?Z8d9ahapBPKL9a5V6QdFlXeZP/aESfuJv2qoyIxS4xqOrJ0adYhI2Fu3eOLm?=
 =?us-ascii?Q?xMLkPZ99nZWpQbgrP6bz5BlHAAUYvqWPBJ1SUZrPCff54oD/hxgg+jLqNWJq?=
 =?us-ascii?Q?EiHUQCYBcQ8KQA3nE6KpibTyf/VUxn+QtEhtGcmh878cEAv4nDt9ooiSSjUy?=
 =?us-ascii?Q?6gVS2rvKZWBIarUKg5lZwGqZbU3JDP3c4zGDaO04IsEQTqCkXyuDSNQZXC2G?=
 =?us-ascii?Q?+OcuVeL0hnr0v0f6TCvI3UOp423fvl/7xRTeGovpaTYePcZXMyEybCZVu1/g?=
 =?us-ascii?Q?ft9MomTcTEneTJMa3RcvwMAnAfEMZoJA/YGMHcAfE/wfGtWRXwFs66eOiDZ8?=
 =?us-ascii?Q?cQovoLsjUUFJr3fRh1IOR+BzLtk8Sb2h8Qkv+fZ2kn8vBg4s2kyyW8/gUK7u?=
 =?us-ascii?Q?l0DfNM0XVfBcj7Fgmcg8FC9812L4bDLgsdla2/RsRzcAz0+CU5KQQOo8irjo?=
 =?us-ascii?Q?Ie2ntZ6mL+b65F6zT6hHfaeujvP3HeKzhg925JXg+LZIxW9GtRAeRrmOCPLn?=
 =?us-ascii?Q?BbHQw1255In+nHkUVmLUQl8GLIhnFyjVZ4efj/9TUEC21pYaCl8LYz4BV4XB?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8b2085-a3e4-4666-d22e-08dbeab99965
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 17:45:06.8871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pS8SAqUbGAOMJLt00649YEBdJlwuxpbHNPJ/RqEHJD0B1GtBqyRstXhpC5cbcIWuQURnqq5pR5rb+Mllp/DrPrrxlXiod/W8z0u5cmX4ZIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5623
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Moving and renaming existing
 frequency sysfs attributes
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Nov 20, 2023 at 08:08:52PM -0800, Ashutosh Dixit wrote:
>Actually: Revert "drm/xe: Moving and renaming existing frequency sysfs attributes"
>
>This reverts commit c2785fa716b862203a640564a849377d4d8470f5.
>
>The commit is badly broken. Allow the author to fix and resubmit.
>
>$ cat /sys/class/drm/card0/device/tile0/gt0/freq/min_freq
>Segmentation fault
>
>In dmesg:
>
>[  786.327812] general protection fault, probably for non-canonical address 0xcccccccccccccccc: 0000 [#3] PREEMPT SMP NOPTI
>[  786.327840] CPU: 13 PID: 2267 Comm: cat Tainted: G      D    O       6.6.0-rc3+ #15
>[  786.327853] Hardware name: Intel Corporation Raptor Lake Client Platform/RaptorLake-P DDR5 RVP, BIOS RPLPFWI1.R00.4221.A00.2305271351 05/27/2023
>[  786.327868] RIP: 0010:min_freq_show+0x15/0x120 [xe]
>[  786.327973] RSP: 0018:ffffc9000481fdb8 EFLAGS: 00010282
>[  786.327984] RAX: ffffffffa017aee0 RBX: cccccccccccccccc RCX: 0000000000000000
>[  786.327994] RDX: ffff888147209000 RSI: ffffffffa02c3da0 RDI: ffff888103f2af40
>[  786.328003] RBP: ffff888147209000 R08: 0000000000000001 R09: 0000000000000000
>[  786.328013] R10: ffffc9000481fdf0 R11: ffffffff8147d0e2 R12: ffff888103f2af40
>[  786.328022] R13: ffff888108df6800 R14: ffff88813d668e48 R15: 0000000000000001
>[  786.328031] FS:  00007f8a5a4db740(0000) GS:ffff88906f880000(0000) knlGS:0000000000000000
>[  786.328043] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>[  786.328051] CR2: 00007f8a5a462000 CR3: 000000013d85c000 CR4: 0000000000f50ee0
>[  786.328061] PKRU: 55555554
>[  786.328066] Call Trace:
>[  786.328072]  <TASK>
>[  786.328077]  ? die_addr+0x32/0x90
>[  786.328090]  ? exc_general_protection+0x1a5/0x3f0
>[  786.328104]  ? asm_exc_general_protection+0x26/0x30
>[  786.328118]  ? kernfs_seq_start+0x22/0x110
>[  786.328130]  ? __pfx_min_freq_show+0x10/0x10 [xe]
>[  786.328189]  ? min_freq_show+0x15/0x120 [xe]
>[  786.328241]  sysfs_kf_seq_show+0xb5/0x100
>[  786.328252]  seq_read_iter+0x111/0x4c0
>[  786.328264]  vfs_read+0x1c7/0x330
>[  786.328276]  ksys_read+0x64/0xe0
>[  786.328285]  do_syscall_64+0x3c/0x90
>[  786.328293]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

do we also need to revert anything in igt?

Lucas De Marchi
