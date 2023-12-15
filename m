Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED983C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 16:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F5710EA63;
	Fri, 15 Dec 2023 16:35:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B8910EA63
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 16:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702658124; x=1734194124;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7MmIm9ztaYp+Emz6bPSD5iiZiPsuGqq4rYqDx5Ir2r8=;
 b=dZmWMvmgqeKWVgfjEgqXIn47wEC6XaZTCEydewOK/vlvGo5PU5BEdzgx
 7u46kia4jOfyI04eIbs7l4RwrlWsSh/lQpnfi3NXerNG5Y4Bh89KfjCKR
 udQUEvW+lIVOG9AYrHEjg4Tg3veFVmTd8wE6k/5DUVgeX+ceGONobYfsm
 PEFCC+SbTdEFeN7Z/nYROrNwea3nIZIwaXG+KnTFAap7t9HcgMeMT+DXO
 q/nS9nzpd8D5IzzRooH+GafgJFVuNOs40cO1M2lnokOVMW2C4D+FyhdC8
 cDn/WelktpHGVRjtmyPqz0GoRTEeNAwRHhXwsyXq0ILjXNHFYLPBbdLdd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="8655558"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="8655558"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:35:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="750987822"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="750987822"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 08:35:23 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 08:35:22 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 08:35:22 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 08:35:22 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 08:35:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fobtxyU63poyaaaghM0LHQkVR0bCg6RRf12omMxMnblzy+3UIkfi7tnZxleLpm0YUYRjb0T+V5a4sE8Xu3x4/TveQbz12AmJjuKm469D5bDDtPznzifAunNdcHlcjqCOBc8mJDdLM3NNHy6/MRfLQBCRtK0t7As372Y70Rj9ktU0lTokSxhK4DAJ/4CUM681/SoJonlR+UMRnvPkYLed5KO2PWkW9hGi+jlPygiQUHeFtUFyANH68GPzZ19vshzwlJa0hhn44oqMUbPtZ1wX67mVJ/X/qBukpW/DuURc7kJhOnzKDDlBfzhDOUT1G98M3DPRDlxdvEQII5oB7RazRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MmIm9ztaYp+Emz6bPSD5iiZiPsuGqq4rYqDx5Ir2r8=;
 b=QoCLLCQakmqLpuPW3dqd8pDZiDQDdv9930qC1gRTDeRS9AdtzZx/DxMiSYQGQ2TbDrIodnGtAJrTc6fl/hmHAjtqWnZbANBGNl+56AVC4Y6UPyyVwzPTJUBb1THW4YvClxHmRux5o/JFCe6BWFulmOrKCNb89WjF2WPFwYFSl6j3UgsTbRbBDt0VOGuaBdXe5A6ebRm4FKVfPqUr6e3nAbVAY3JuKP174fwrPCmu3QE/+kJxr/g+FmF7z1NC4YxXCzelLotRgGaHR/546/XROFO/DHAw9RUBV7RIKbxbD4B/hZuIWAyxa+p9CN4B32NGnVLqfZA3h83q0m8J8HT0Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5311.namprd11.prod.outlook.com (2603:10b6:5:392::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.32; Fri, 15 Dec
 2023 16:35:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 16:35:20 +0000
Date: Fri, 15 Dec 2023 10:35:18 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v1 21/21] drm/xe/uapi: Remove reset uevent for now
Message-ID: <hgxmvnpcd4ycgbfc6zlpn6byhv4p335hbib4wh3wok7hwebiie@ifezfd6b4bvv>
References: <20231215154553.7-1-francois.dugast@intel.com>
 <20231215154553.7-22-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231215154553.7-22-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0226.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5311:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae013f8-d4d3-4349-57b6-08dbfd8bd445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iadx8uMBNAxH0NBPdWsbuueL4ITU2Tyutj8pd6RtJVbC7qkGzDJmVUW070Bj9wiN5LVcsDMrvSuMjaAYaRM5PEBeXX00vz22D+6e40P/fBtvE/V291cKuIWmyDvvAxlonuk5sbTBNwzPO/hccPVEEvfkPhgs3AbwYKPI3TBAwi00mIIM2NWQX4LE0whXx1b28PgRjdXO9MPN17fI7uqbtuUoUkfdahpcpmLHHHY5ZCKRw1XVw582FIFDUCxE/b8TJLh5hisC/lK0Xlj0Pu+Lj9svoe+TyfwE0Arc6daeGIC/F68dO9vVth6estHIGWTbgaUGk/mHymHEsoxipsdpBj1lQRm9/Wt7BR6TDcmFyFLGmHSQLG4seZs7LHmCOmnWfM1Zm2W2QRu0pCYSGiAnfmvexIE3YxUlsIcoRmGV130gQJ2fca0l3r3UCyJzfW7nCncmxPo291qElHRYlgLYcMe9e6WJLTEtE+hjNm1vsed90d8FryWK6v61TjznQjEJAxbr/nLxTHpIkKVEWl9ouOtSZBZiI+xk31s7/Nwx0sBtJWinj66JET8qHhZ2KXWx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(346002)(136003)(376002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2906002)(4744005)(5660300002)(66946007)(66556008)(66476007)(107886003)(478600001)(6486002)(38100700002)(8936002)(8676002)(6862004)(4326008)(86362001)(6506007)(82960400001)(41300700001)(6512007)(9686003)(6636002)(316002)(26005)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ec+qB2N38baCBsVvvznA1tWHR/kz3JK3CtAtjF2vyIrjgbCXi1Kc4WwHelfy?=
 =?us-ascii?Q?2ZkD7w8yQFID2dcA+y9fFs7VsFIl5WKlLqcH1IR6A5geVfNF+ZeSWiH4agmU?=
 =?us-ascii?Q?8TQKHM7FSuFvGreJ9OgguDwHdi1oSexGZxxnW+Isi0aNDRkrMUL/K1BosZLH?=
 =?us-ascii?Q?aUKwkqtxZUvlkN4Elsh2uNYtX6pWTuV9PxIN7NjtExRW6d6EhUuyPK+3EWxG?=
 =?us-ascii?Q?ZsureE7aK6E7OjMSUK6+rvdn6lbjrA3MNzq15fxos8v+IjtbyQ4S/WjYjsoT?=
 =?us-ascii?Q?01UBA94u/ujWA/CsJ/0/jbyxjI2cpCWuJJTS4gDGYrHE2AC6grMB12g4z1c9?=
 =?us-ascii?Q?sVE8dOHaYw/tgYjgFvy/GnftsK9Fsal9+oXppOhczyF+JgYR1TACTXs5h9bg?=
 =?us-ascii?Q?xrUqzf5aL0Q7tTHVBGcgM9NN9HWFOJlTagJ4woa3ppQ0SEfXbrIvha3GAt2W?=
 =?us-ascii?Q?F2MBoqpjUKYC6OkP1cyT5qdgF9+DukXEXAY1DfxqKSksXdyrs2+66ho0gCU2?=
 =?us-ascii?Q?w+UpPefqandPEJMDND+4D0Fjr5tt4MyNO9msioprCxLwjLQWGHdd0O3j/rvt?=
 =?us-ascii?Q?BVhkbnYH29RvtjROginhCsfAgHYV+rmSHEblBxYINm7kYzCmIWeTcUBkKlMD?=
 =?us-ascii?Q?l1be8VPjWFVSZ2P3RfcEmDffFjiT0PXHR+mq8lt615DI+U434mV5K7XLPjpM?=
 =?us-ascii?Q?DUeFEK4spkbnyRFT08qTuzV2eYqqnoYTFlfKZfyqkRT/xGw4wmwGPLxUBIER?=
 =?us-ascii?Q?VIYTopB4e25mYL8UijX4+KzCC1uDIG2bZTG7IcKKyjQCimk1hStnCxxR+E8n?=
 =?us-ascii?Q?JzTbnxM79ZCvRYP39gCvlxVZK/BPpXx+coDm23CoMSZct5aR6QnHhCOXI9qo?=
 =?us-ascii?Q?kwmq4bRBD98vC/8fx1iXftwAqrZW/h6wtbeU34QZHPw3LSty9+tAQ1tuOytK?=
 =?us-ascii?Q?y7K+cb0h8IfOvi9e6fJTjAUfw3RS5BlSQ0vNLQfmkTyLCgIx1AUELgVuNO/2?=
 =?us-ascii?Q?ZFKJzgnPOwRHrh3Z7nN5LOrTZnnJE+iogO17oRlZP279wbb5GH9H2GhUoKDK?=
 =?us-ascii?Q?gh6Pa9J4XqvJfGL+wd1GJ2fLRi4UkWwVajyhWy0lBkMqqhTUPJofseSNHnK9?=
 =?us-ascii?Q?ow1R0WPdMiK5av3okm5GMGtoeYwDformw2EvaNRrRCdih/7TT+ohZzjnesWW?=
 =?us-ascii?Q?rhjR9xVs683LS+gyBoVC5S2Mw0dkGCdX3S/sSl2LEC4PGWay+4Fr3nUPoClR?=
 =?us-ascii?Q?1IXyC+FCbgFy9qI6L4814JVmXfIdu68Ja/O5CgGcsicEqyqGxm4P0PxaVsHY?=
 =?us-ascii?Q?o/g2zAJn3awf0qYjiVydDXZkVhgwHcUqwKFbtM6kDodqpQXPWy+63Ew7Lh0/?=
 =?us-ascii?Q?e+kn7zP+y4JBkO79tgVun/DhG/uPSokbZrc7+94G0IKx4VBomy+5/hxv2wkP?=
 =?us-ascii?Q?PBZBj9PuV0apZ31/88+ryxTB3cINNNNwxB794s2/uuFzr7adLz2DTz/hKPUs?=
 =?us-ascii?Q?qm6z6/PpW1BXGACNSwmcw4Wr3khZZcTEcToKNOkBRG5qVRJE7Rt/j0fJHwi/?=
 =?us-ascii?Q?64x2dF/+lVfbnLzj7z8u6yf5B3mXE0nEYfqPFNEC3OGV8tehmCL7zLQ/i13k?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae013f8-d4d3-4349-57b6-08dbfd8bd445
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 16:35:20.7878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWmvXSvepm1XsXKRHLQNffac4Sc/wg4j/EibRyEoKhsNNh62/RMbNLHw+VZ3KeMyFHh+LsorVo/vifXMeQ1PcXCyhLhiKzsmfaKx+jfh0ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5311
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 03:45:53PM +0000, Francois Dugast wrote:
>From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>This kernel uevent is getting removed for now. It will come
>back later with a better future proof name.
>
>v2: Rebase (Francois Dugast)
>
>Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Francois Dugast <francois.dugast@intel.com>
>Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
