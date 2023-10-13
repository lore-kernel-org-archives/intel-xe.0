Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226B9CDB482
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 18:14:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39B010E621;
	Fri, 13 Oct 2023 18:14:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C88B10E621
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 18:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697220856; x=1728756856;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/0aYzDI4FnRcL2DmS2gFXGe/+AaeqRE/ufV0QaLESAE=;
 b=XCaAstCoyr7l/Hcs32F/LF4YGAoOoWbXJnvsYXGPZX3+asOk9JxPOfK7
 77N+SmZS33YYw6VYyDJd1rLbTFv6R7qa0KkQ+VGmXPsvD7LFdHWsdmXKx
 GJzaFOvFgTlX4xSDX7uUpTsBoGIfkxzn5FQCIpBuWNav1WcRi4RyekVlC
 MdgWGBWXieoZISNzWoYLZzrxxmdbxmmyGvsRXOgi5JV2RA7u7Ggx2A2bf
 3zRSAVX2PpDWMWFPKoa2PwJyahOES2JPZy5aLpfNB8/QPFIxXc3Z6jZhV
 GT3uidRUU6mnrzDVtCC1Jp1ocV3Aj2/Lz8ce62ZQYgc1qjJuvmEwMSuay w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471468333"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="471468333"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 11:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1086236577"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="1086236577"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 11:14:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 11:14:14 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 11:14:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 11:14:14 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 11:14:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TT1mf0tq2t00n7DhKNJ3ntWKA8ic1OyUtAmWtDm4Gk+uY+TuHinPsLmQxk6IndJ9a95Zp6+J9syYq0P/DBNp3yriDZPhMF0eyuEWco9VBkeW8ytxsyVwGKTs+wQznNE3HiJfRtFb56EB1FERz3zUJwt+q3leUIrFLCyZDuhNmD0CIesFPne0RtlB3Z2G+cPycODADZRpymsAaBbaulayDZMLknxHjrya8wY31iC+JAKQk5clctVXyORgS0nhYmrKg2FuB2d7MqZdFteU/lX0PoW9rHspylxwHcrBVpki1K41j9RQrEZm+WhldG90pBsa1NumuM9rFklQFVSU5OVk2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kax4ckV7woW6ea67osdZPyXNyesegqM2x18PEaQ+70s=;
 b=oNHhcrwCzTkS/ILp9d5aZaz8OjGP5rHyMRZS4C8Ce0fTmBe50UvZ7AePQesbK7DInvSdgJn1ar2yUZkHCs19rf3JrAXTiNdwzK4IiWIs74QUzPI9TUhG4i1b4N62Q+I1qqniQl7//puu6sf5WA7+FwoGiFVj+XesieA02bDGYqRB5VZBAUQOcIFgrWw23dIwAyqvFSOWV9XKRP9k5AZkAfPE8iLh0npiok6ph9E1127cXbGvHECZhN0xpjPkGyBXKoK+IukvNvhsMsB6q8OZmSBC8gDjs/W4/ZEmS56MQ9hh4Y9uZRqhb/g5j4xQsiSlaeiHuoRdQsEToZTXKY5w5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6969.namprd11.prod.outlook.com (2603:10b6:806:2a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Fri, 13 Oct
 2023 18:14:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 18:14:11 +0000
Date: Fri, 13 Oct 2023 13:14:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <im557nhivgzgh4nqea4gczfkwqjh2trwrsfl45fensii6p54fq@2csdpghuqrep>
References: <20230915223459.2964036-1-daniele.ceraolospurio@intel.com>
 <20230915223459.2964036-5-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230915223459.2964036-5-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:332::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 71f4338f-9486-441b-4a1b-08dbcc18335b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iWI5Ynacz7AcwWd9qw911hzjelIVNFn985pkk6kB1JqnSzgXIwwIVsC2ZR5Zo59HiP4IJXhkR0Y/vsf5oJkcnGQB7vpwZ1G8aqRnxPBo9IWR8APnht6w7b23Pf4aoExKCy9TptW/wqsbRoCNWHTGYgOr0vRruuFlS5Ly4cPtbuH+pVXPimaUKzJQhRLTb2X7SWH1u3XLy69UvHDLj1AAUoJERmzomd7/Nuvi4Kuj+x3OdKI18iTSLKsmR+dNicxMOWBEx7j8/ZuX6Vw/RRYnLsnjTLTdNIwZWKVcV5krODMsCP+mFeY8PnH/DvgVOxvj7Nnz76CpAU0rwdmXBzIqcVyti37EllFmNwCzyYGmeJvmKOB8CYwTu5q8IEEnsbPMh2qv9EY40HptvNRcNGAtaHr+k6LmhsVCXMxPogRDhK65vKpMkkrBsUJkZM5B+Qi900lzohpigHWHk9LqVpvp/dZpWE5I1HZizGyuinKL3kMn5hJKMYmFaudNi6Xu6LENSmKBhbh7Ww9zxkZ/Gmfbmbd96barmJoqQp3rFAJnX8/sV9JD9XtRRzsDh6pwyFZh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(366004)(346002)(376002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6512007)(9686003)(6666004)(478600001)(6486002)(8676002)(83380400001)(2906002)(33716001)(66946007)(5660300002)(26005)(66476007)(4326008)(316002)(41300700001)(6636002)(8936002)(6862004)(82960400001)(86362001)(38100700002)(6506007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fhnr+XBE+ngxQ65b+gDuR+U9+lzdNcI1T/v3KJIMn9+U2t4R16SI457xhNnc?=
 =?us-ascii?Q?6wxhekk4RKwRaMo43f+KsGIjOLBm96q/YIvjhAYxSvKPA79bXImpIZENXVWY?=
 =?us-ascii?Q?P+7xsVs87K48KcGCrh8e+ssUSFHAPQ2ZKp1fjTO/zwtoZS7gjdUd19gRpwf+?=
 =?us-ascii?Q?RIHyxVklPrSxkqUBjKVhO1s9fXyJ6TzQV8+5IUqM0B7DkES1XJU/kYZyYpVl?=
 =?us-ascii?Q?8bhfv+tPLyzXXD7Oxo5rsjsGm7imqACW3D1fMoH25RCo6Ye+hxzLTnoA/NkC?=
 =?us-ascii?Q?Ao+uLfLlQapJxcXezDyF4hI/ngbk7VTNaAPgF5e+98mgQm6siGWdN74jhe1g?=
 =?us-ascii?Q?e/lGUvjev6SF8L7SgO9/SGpI8ei75GcP20c0GQ+rRdUT2TDM6BObkGNdz7yz?=
 =?us-ascii?Q?dvxtTUiMY/2V5OexdF661uUxpnnxeCNkbmI7416elyxkD/09wlUWAoSegncs?=
 =?us-ascii?Q?Oq5zNOyH1QDaZbdCGmeiR9ufDa073dGcdL7B73xrR3AtPn536Et4kjPCwKIA?=
 =?us-ascii?Q?5lzceFw/vwjHn6Ahy4M1ehiW6Y13mMFCDbZ8zZCnKQn2y2gQDXwaRbOL39Gv?=
 =?us-ascii?Q?Wz+PDRAC4KNW8Rx6o3kkHou7oBkdaWfbi5q1/xdUKVQY8+0M9YdsZkys3jLf?=
 =?us-ascii?Q?zbeGd+8+V2c72DwgYAVspzxJRjHC/3ac+MXdJPC30DE91gXSq/JXLrkzeoRs?=
 =?us-ascii?Q?OXkjpLqDwkawlQK28BBTpeQPqZnON7Sbf7apxjodANIBSOLq5rNBLKmS5EJe?=
 =?us-ascii?Q?dRSa48LZtRw4TTp/R/U6u5UHBaoC8Rh4IrloCSb6Sa9UHGwCn0c9K2l8Dggb?=
 =?us-ascii?Q?xppEw/ymYXVSjVKbgXv1udEvBwqWr5yA1k8RE1eNTCbJ8bei0cSbZwcbcJ1w?=
 =?us-ascii?Q?CRpMy0iRjSA57cdfJJPZGmhM5ZvVUiOTdhIcj/dShXUNXUghlw2g5IWmvhox?=
 =?us-ascii?Q?QLu+5qVBogHP1JHCznxihSgq8irC3FVEwdSokhHMwOGEtjyHTJ8qv5gsOHCp?=
 =?us-ascii?Q?WhxU00xCmO+uXmgdfRXXNEeUooHNXLzTbOMeDjMAtiuoWdssW74PoMJhxGJU?=
 =?us-ascii?Q?50zG7Mow9U4U1kRtFQuQrPZb2DbA9aFzql6PBWF7nym2NLk5/LThIQla1ftJ?=
 =?us-ascii?Q?ZADGvPUZjxcVWIwtC3laOUVA63FpQzjwr28qnhETeuiqZCNa2090YcgZuefK?=
 =?us-ascii?Q?Tx0T87JZRxc79MGgOHbHVuebnOWZeswgPKUVKOBdyhr6y0z3QFb0l/cPsv8H?=
 =?us-ascii?Q?eDmybS8DxgC01PKz5ZmQkG7FAsbUOZsjD0CX7rQeg0KWbdKwDhjnCHlNcAUY?=
 =?us-ascii?Q?ZgbvLu6gcSZ3j0H11fgsNKiOyoC7Vv+ez0EgZEovxqfgNZbc2ivDQZrYL75i?=
 =?us-ascii?Q?Usbe0dKLx/zlZN4w1+4NDOfS/sQoNoOdhsDT9nOx1k102n++y2vfg1umPv0i?=
 =?us-ascii?Q?xbd3Zm5t3i/7GHRPGIoupAAWZvd+EWgaGuUhCXUbuhcQgXd3hXRQYbVN1rnE?=
 =?us-ascii?Q?MFnsayID6pAq4/Aj4EF4apknXtsBxvHUyYxwlkhLBXPi7oUIf/6O6p1bwQDF?=
 =?us-ascii?Q?puzYRZjwy8eqt7R8xT3qOWEsQB5CJ69o29CkbrtZ38uUIZvxn8qJ0E4Tznr4?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f4338f-9486-441b-4a1b-08dbcc18335b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 18:14:11.9036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6qA7wHlHyPNOawqiOv7bHwFGgOCWdxQ9R96AlAjmQ4LlRIvKm9udsdGuJbGonhirzBeS/4He8act08OtydrHUrLpnpPyWAn9teXcSE7fvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6969
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe/huc: Define HuC for MTL
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

On Fri, Sep 15, 2023 at 03:34:58PM -0700, Daniele Ceraolo Spurio wrote:
>MTL uses a GSC-enabled binary. We expect all GSC-enabled binaries to be
>defined with a "_gsc", so we can check for that in the name to
>determine if the binary has the GSC headers or not.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 17 +++++++++++------
> 1 file changed, 11 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index f956457d0b11..4e43b16a61d5 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -113,12 +113,13 @@ struct fw_blobs_by_type {
> 	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 5))		\
> 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
>
>-#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)				\
>-	fw_def(DG1,		no_ver(i915,	huc,	dg1))			\
>-	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,	tgl))			\
>-	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))			\
>-	fw_def(ROCKETLAKE,	no_ver(i915,	huc,	tgl))			\
>-	fw_def(TIGERLAKE,	no_ver(i915,	huc,	tgl))
>+#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
>+	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
>+	fw_def(DG1,		no_ver(i915,	huc,		dg1))		\
>+	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,		tgl))		\
>+	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,		tgl))		\
>+	fw_def(ROCKETLAKE,	no_ver(i915,	huc,		tgl))		\
>+	fw_def(TIGERLAKE,	no_ver(i915,	huc,		tgl))
>
> #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
> 	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
>@@ -207,6 +208,10 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
> 			uc_fw->major_ver_wanted = entries[i].major;
> 			uc_fw->minor_ver_wanted = entries[i].minor;
> 			uc_fw->full_ver_required = entries[i].full_ver_required;
>+
>+			if (strstr(uc_fw->path, "gsc"))
>+				uc_fw->has_gsc_headers = true;

can we rather get this from the headers / magic or whatever from
*inside* the firmware? Relying on the filename IMO is not a good
practice.  If we don't have a proper way to identify, then I think it
would be better a try/fail approach starting with MTL: try with gsc
headers starting on MTL and fallback on error.

Lucas De Marchi

>+
> 			break;
> 		}
> 	}
>-- 
>2.41.0
>
