Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0FDFC6172
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 20:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D06210ED8C;
	Fri, 13 Sep 2024 20:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KuRb4KES";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B5010ED8C
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 20:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726259994; x=1757795994;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=exZv7SmOA4paAGLO7mxaCDmLJIGfr28DvHCW52Dy4E8=;
 b=KuRb4KESRgoM1vYxbdcdZlWtI9fhtbQCmFkzU9J4VjWTUTLTYb7eetLo
 lV/g55RytjWupiLdxg8iflmyzoHf28lPT9VSDeidb5xanr0g8Ev5Jt+Dk
 LXQp+UhFDXCNSMHCpVjCHOY9AXyG1I++VhUtwuExh6h67CpcQfmGjTuC9
 4p895c1Sit+kx+C8CebaUgnHr9n5ZB5/wzW1CrIItePczXVr2oTjLf3Nz
 VaC+oaO7q4//YtJjXRsu1gT/eHT8K8Wv0yBZ5ZVy6Vq42OXOyywOAmHXU
 T2Wl8GDhOvfuix8VUtSmSIHVpeZ/j5HvjMKrywiTuJ+PPfYoDVez7RfsW Q==;
X-CSE-ConnectionGUID: AYbWRkjFRnCJDk4BxyqIvw==
X-CSE-MsgGUID: ybOwlYTJSgGbP7Um4BFc1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="13518903"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="13518903"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 13:39:54 -0700
X-CSE-ConnectionGUID: 4lVrHI+HSpmnalny26WRig==
X-CSE-MsgGUID: e/RnHmW1Sny0Sxe8KzqZXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="68128787"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 13:39:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 13:39:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 13:39:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 13:39:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 13:39:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGYTi+IP+m0TLXuNQO1i3iXUWNvDfPBFxa+zkBnmqglj5atKWuI0RBv/KuEVA0R1MHJIU+2vlyJo3ho/bLYHyz0qG0tsrGW5mhY/PxpaSkCv8CTr//yYhXvJ7o9xLrD5spBLfNpIqypAbZ5nGLZLnwfgmNlcfhHGDg8VvwUpk3ExYVqZcZCBGNoKrTwjDSolx7n4LoNZroaqOpIelFwZZi6C+p/s2GAd5b7ygjswsVuYe9ZwmvMeCjS6+5S3Sf0lurCZeZd/rcBDe/TbKD7uBQlqTYyq75RI+h0RuZy7+9tyUlPlkA7kpTAQSCBo0hgvnHryxBpbx/kliyam9N/2/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8TdYWC5rY14VE81KS1QoXTG1PAnwMfLV8AvPlh9u6I=;
 b=VnHg531OQnSXViRf9nQKCwuBhUgQrmTyYaW4btNi3j1gpHFIkw+W/bvFpYH0DxYGLC3JK99w9aJ2SOKRqri7bSQGvvb7Izw0DoaKbZ5tIpiCli7gxu6TSkLZRP3tjLag3j4IQgR663ulsmzWE6TOKjbe30i5pwKwevEeqqvC82JMHOaAUzri9oaGsGv1yvcGK0OE2PddBiiYR69X6Hr34/2pbY3jE/AJNtonkqod55r5uEFFihxwImPI5I+try+jp74RveUfVJuTnPd5lt/igKFckAmdyHINvi7LFy71ife1+2Yg3RfKT9lUbQZBjJDcL8iZ98OnkM2JP6wzyq0LZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 DS0PR11MB8069.namprd11.prod.outlook.com (2603:10b6:8:12c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.20; Fri, 13 Sep 2024 20:39:51 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%7]) with mapi id 15.20.7939.022; Fri, 13 Sep 2024
 20:39:51 +0000
Date: Fri, 13 Sep 2024 16:39:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/display: Do not do intel_fbdev_set_suspend
 during runtime
Message-ID: <ZuSjDVbdjJHkggkJ@intel.com>
References: <20240912012545.702032-1-suraj.kandpal@intel.com>
 <20240912012545.702032-3-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240912012545.702032-3-suraj.kandpal@intel.com>
X-ClientProxiedBy: MW4PR04CA0151.namprd04.prod.outlook.com
 (2603:10b6:303:85::6) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|DS0PR11MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: dab395aa-649e-44a0-0384-08dcd43433ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C9P4qlfr4H9LsaomadwIUHQide6VjjE0oF6u9E/Qz87YGqQEBzJwFfnWVNhi?=
 =?us-ascii?Q?z17syJNYhTrSevAKZfe6En28xSlaHJy+CcQEXa2b5/r8ON8J8PE/0OkqMTGg?=
 =?us-ascii?Q?vW/7+XqrgQgXp7Y3FfWXIeZx451FgPXjOqYMp8lwazd7kJoHs4XiflpZOJaf?=
 =?us-ascii?Q?oNB21CZwyZDy2oRDYzoZ7BZS+y+b/yxgVz1Zo3CgpJmS9rclClvjindZkDCf?=
 =?us-ascii?Q?l+6ZQLR7kznFTWR+ZFQXbee9oQG0IEMXMa6hWDmBJwMJjAzAodid9wO9o8UV?=
 =?us-ascii?Q?dhI6rcexPyTH26nHqc3tVgCCvAzClwZBlJ5xDOu7b7iGvbeVxgka3zmc1yJ9?=
 =?us-ascii?Q?q6/Z+xPg0VB7ScaDWaCh3GB1Qn6w9lcpLy2XgQ6R4K7XNgkRyauEPxESx8HN?=
 =?us-ascii?Q?7NkGZdA/Y19cfgZSVhvet6T9y9lVV1UDJd8whlL4UqxYOICGwCF24G4ZYrfd?=
 =?us-ascii?Q?N5RX5TZVaveogU7VUCEYhR1yU4hr3dqzza6/xSc5v9poWtH4ZgeVdo2C10ed?=
 =?us-ascii?Q?Nf34KYqg9y1m/jqV2pp+yywkxdQW4Qc1rkGTAaKQKAsmp/ssZU+GeFrQYrHX?=
 =?us-ascii?Q?CF6bJ/mPsPfX5MrBXJBCOHFsJKDGEanRrb0IJgiV5JDAMluQG6Qf/SPLrpoH?=
 =?us-ascii?Q?ie6/TUCIk43myhQi6kEJ997zt/dVQLrByzOXZwIqtszuiGAJOfaLoLRXERM6?=
 =?us-ascii?Q?ZHlKZ+/joHAvDO9juSr7FDuh9Kzj0HzYycNOV7pnAnM++h+gA1Xab50zVJdM?=
 =?us-ascii?Q?FbGeJxNK+O0Dl/rFwZ68680y1RqIUTzKApVxZrc0wn5y/4GeQjWxMcJYwJY4?=
 =?us-ascii?Q?IGTEYSlxKO7JLFjt3Djqr4HBQXpcSyGjUFI00iO5Sr3Yz/zQtuF2nhpC2Q/y?=
 =?us-ascii?Q?6qWxSL7AmN48JMXwO5MfTcZBiSPbqiWA/+JqImZp4kuaLdJWyKHf/93UAi5m?=
 =?us-ascii?Q?T7EJHye/zl2ycFDNVUjPWtYwIT9FW8mZKxd0xv7iM4TQGjj+0RLIkUtsXwCF?=
 =?us-ascii?Q?TnE5cXUIpnRS2UpdxF/nqZ6UpCjghNdi5/O1h5+80nPnBWla7VPhbMGs8iVe?=
 =?us-ascii?Q?TYj244wf2kK5U4VuBwIs0Bldn6gT3WrjQNWYhfECGfnM6zXsNi7yT9NSIrU6?=
 =?us-ascii?Q?P8fyGE0C3D5mekEnV/I55gJ1Wk+0MT5vRaQWnbV6CkuJzuVUvLA+kdE0vf7O?=
 =?us-ascii?Q?EXYG1+SU9MGaDupDNcJiUW4PhaNUePUd6TKsIqc25E0tHk8c0oOvkIE8c4hI?=
 =?us-ascii?Q?uD1mxDUfP3m0sdYc5acUgdOKY7Tfl2Y1UrWBwOQtBectrOcf5afVlxc6PH8A?=
 =?us-ascii?Q?5zy8QCmG/Bo0e1ki43qHaMYAXkcg8JxMzU5sP4glYFt+Ww=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RudcKtIjgbj7z05GxOgoXyZdNYSH0oYNB1dBnhgP0vAd3F8rVy9o4HxQVu0Z?=
 =?us-ascii?Q?1Ub5ZZ3uheCSr5KIVSBFee5nbuDWbWI8CyF80uHqRMeJa9unlwVyS+iEVRe4?=
 =?us-ascii?Q?ndAAyfAokgLbPIwIL9hHmPAL5i62bm04UvOI+LUskKwukcFGseSk7knMBhZ7?=
 =?us-ascii?Q?Pk5r6woxT2avlIGbfFxlBtUhgBAkpsff3vRgRHgnJAmUespGVYBfZMafVytC?=
 =?us-ascii?Q?i5qQw3npUn3UdxWBQRgPuwRkB3IfolPTMiu3TT7gIfqjpiS24z/OKDwZyceT?=
 =?us-ascii?Q?hBgtxoJRM2qReain9lPaoZUaf1oNP7uJeIYo0Dti1twNWNjFeJSGWkIUhqgT?=
 =?us-ascii?Q?7ZET3MlN+WvWuOtoSKBYDPj2ViKTNGdmEPuaJmBlawQwyzwIOv4bY/7NxRsK?=
 =?us-ascii?Q?dxeYoKS4AoTtiTU4b3/uwyUgV1Zbn+z0ayAv3x6bD9I+75ouw48wtk/7QeCe?=
 =?us-ascii?Q?G/PG/eafTg3kribN87HGV+aXIWOQfuZbzUAjqHqWzfD9usB1BxAc3BZtxKBL?=
 =?us-ascii?Q?nBim5XxbpRZYkNT8erH2dfsOsEissfeXO0b3Sp+PZR+1cTQZFOL3O4bx5v+q?=
 =?us-ascii?Q?XBK5eosxE0DlZ1IRY4SWuB6u8n3h/eMZ4qEj7d9vqUjR9OKehrPZ9pMLFIay?=
 =?us-ascii?Q?nd+mSwS0N8n++hCmLu89/ahuxaeEf/ecIULyCUNkUPgPFLzb5FjY+4iy8haQ?=
 =?us-ascii?Q?V1OBCbY92kGV0E23MHmtDGU7UNk01qVJikeYSSwrMzXHFzQpTEd/ibPR2ebh?=
 =?us-ascii?Q?BlGwqkk3PMc+Njzh+QIGLhJtgJAxGMN+ZL1dASDq+a6XAjC9Gjz9QvXzq3b6?=
 =?us-ascii?Q?4w7IUacTF6Ie4sarrTpcL6ycg8x+RP3UqOLFCBP4/r2uL6nT1r4k+LJmXvGN?=
 =?us-ascii?Q?SjyIG19kvyXfIYlleALkk2n6OgSnl+KIMUisWSub8gf2H62qi1XQl1Ji7DPq?=
 =?us-ascii?Q?NbHW47sAHAqKuw2PLQl4rC1feZn/mxIfiSO25laElAv3i3hPaqUeTgsZXnPd?=
 =?us-ascii?Q?IgUjCMCVm01k+PEAvNhx/ODB3gQvS8Cca6PWmHFlAHqtlYo7nggR55XwS+9I?=
 =?us-ascii?Q?n7MO6V1a2tTpMIlwZeIoVcvZzcAITGHlDjaOplt5elQfGXNm8L/OkSTgFX4N?=
 =?us-ascii?Q?wjn3JKK8DdOzGq7U0iqfRuVrciVLHEL+FZES6owFSX3oqYJX8z7W71VA2Bk/?=
 =?us-ascii?Q?yHwqxpQECvVQJTi7tIfL8eealW4QrwEVyM8PizVyrr2B+8RKoSwWuJSK2esL?=
 =?us-ascii?Q?takTEScxIkH1MVo13OMm5cqHWkna1O4/2G2g/7dmNW3scW4FTDjOM1Wt/Ps9?=
 =?us-ascii?Q?+nkTwUjq1y3EZ0kc9tLcclHflHAb62WcEmsmRln28f8Ds1vHsLcYhANCFTzz?=
 =?us-ascii?Q?ZuZkxBllVRu/gJBqJk2eNEWDlgyv89uQ5zbuOjT3xlsDnIwEC+2NzWPqpVpL?=
 =?us-ascii?Q?29fHprv1PNnQF8r1ZyJbKL4VOSJaloRvx0lex3bcYlK40iXbpmeKyTLjhA5t?=
 =?us-ascii?Q?19YKS3vNK5wpcjeGhxtuLH51Tjs2T9b7GIuoH/Ik34v7cKci5IpvgOR0s2Ac?=
 =?us-ascii?Q?ikhbceVMdZpj3zpJ++WGXbSG6RJfi9fwackt9qQ59C6GvPUT1vou8ZCSeZOC?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dab395aa-649e-44a0-0384-08dcd43433ca
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 20:39:51.0424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDqHO+vx3hKnTi3xueiHpx1TH7Zhipg/aeE3uZyQy0oJC1/M3oUeVHeTfoYYnTXThcwpIPXP6oyq3jPFrc6eCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8069
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

On Thu, Sep 12, 2024 at 06:55:45AM +0530, Suraj Kandpal wrote:
> Do not do intel_fbdev_set_suspend during runtime_suspend/resume
> functions. This cause a big circular lock_dep splat.
> 
> kworker/0:4/198 is trying to acquire lock:
> <4> [77.185594] ffffffff83398500 (console_lock){+.+.}-{0:0}, at:
> intel_fbdev_set_suspend+0x169/0x1f0 [xe]
> <4> [77.185947]
> but task is already holding lock:
> <4> [77.185949] ffffffffa09e9460
> (xe_pm_runtime_lockdep_map){+.+.}-{0:0}, at:
> xe_pm_runtime_suspend+0x51/0x3f0 [xe]
> <4> [77.186262]
> which lock already depends on the new lock.
> <4> [77.186264]
> the existing dependency chain (in reverse order) is:
> <4> [77.186266]
> -> #2 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
> <4> [77.186276]        pm_runtime_lockdep_prime+0x2f/0x50 [xe]
> <4> [77.186572]        xe_pm_runtime_resume_and_get+0x29/0x90 [xe]
> <4> [77.186867]        intelfb_create+0x150/0x390 [xe]
> <4> [77.187197]
> __drm_fb_helper_initial_config_and_unlock+0x31c/0x5e0 [drm_kms_helper]
> <4> [77.187243]        drm_fb_helper_initial_config+0x3d/0x50
> [drm_kms_helper]
> <4> [77.187274]        intel_fbdev_client_hotplug+0xb1/0x140 [xe]
> <4> [77.187603]        drm_client_register+0x87/0xd0 [drm]
> <4> [77.187704]        intel_fbdev_setup+0x51c/0x640 [xe]
> <4> [77.188033]        intel_display_driver_register+0xb7/0xf0 [xe]
> <4> [77.188438]        xe_display_register+0x21/0x40 [xe]
> <4> [77.188809]        xe_device_probe+0xa8d/0xbf0 [xe]
> <4> [77.189035]        xe_pci_probe+0x333/0x5b0 [xe]
> <4> [77.189330]        local_pci_probe+0x48/0xb0
> <4> [77.189341]        pci_device_probe+0xc8/0x280
> <4> [77.189351]        really_probe+0xf8/0x390
> <4> [77.189362]        __driver_probe_device+0x8a/0x170
> <4> [77.189373]        driver_probe_device+0x23/0xb0

same here, please let me see the full log

> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 39da79069b5a..a3131a67e5b1 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -322,7 +322,9 @@ static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>  	 * properly.
>  	 */
>  	intel_power_domains_disable(xe);
> -	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
> +	if (!runtime)
> +		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
> +
>  	if (!runtime && has_display(xe)) {
>  		drm_kms_helper_poll_disable(&xe->drm);
>  		intel_display_driver_disable_user_access(xe);
> @@ -457,7 +459,8 @@ static void __xe_display_pm_resume(struct xe_device *xe, bool runtime)
>  
>  	intel_opregion_resume(display);
>  
> -	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
> +	if (!runtime)
> +		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
>  
>  	intel_power_domains_enable(xe);
>  }
> -- 
> 2.43.2
> 
