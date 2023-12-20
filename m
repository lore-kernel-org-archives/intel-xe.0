Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BEAC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 16:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2948310E0E8;
	Wed, 20 Dec 2023 16:13:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BC010E0E8
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 16:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703088792; x=1734624792;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=v8nmFEaTDA1CFViGdo0fgEQ85qVT58Tbxp6y3J4/nyM=;
 b=YjQrwAbuOf3lNtjadO/PivQ0+ksCxfWShiWqnsgxLG0FQp4LQHJFYNGM
 +683rVYYSJ4+gaV3vhRhY5OTFQrgo/4J9HktO+8jQPGiPoJkdDwJ9t0AG
 N6SUtIAePngwcmmRv6QInb9WjKrvDPvat1hELknvPNcStAwrV5CFnk/RQ
 ModvbUjzPb7piFkaCHOFtdN9qwL8lfhomarSrStujcTC4JvrkGrGJNBEY
 Oh7jYnCfKLA9G5HzK9SI6+dBejoAXkvZWxfwwnaxlbNjVu5x8pmA4zKSx
 pg34dRsJZ6Z5GMxN8EjVqpXH1kCIOs8NKsVYCmpmXIRz3oeA4Wcy3E8oy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="2663650"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="2663650"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 08:13:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="726126173"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="726126173"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 08:13:11 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 08:13:10 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 08:13:10 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 08:13:10 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 08:13:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D69m3RX2DCKm6+z1cg7TK8RGlZ38e9k+ZFuNpL687fm+bXQmOXTkfc2aAsloKIcBwZQt880A/B0QVRKfZR5Y2zhUv/TrYMB2hDNWspE8JPxAgYEnwfXyb4MvLRaIYw6lGRkHn0vuSVNYqFIvNmjgMDRS7bBlUgzQfXpTv4UE+85xJUS5Mt/N/H5DcvnTEqX7ylRDn57gCy4DjQfaC0sFD/PzmySVKKAeGK1qeId4IuPxGYho2NmX2Kccnk8yUd02fbz9VLEpBvu60s1opEnnT9mIu2+pCfmJJs2JgF62jhOPh2KWCNAJonITBasJtfJGOFwUx/mJL5I+cZqHLsBLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6vlUVpyy4evQ+5exPkYi8dL6ymFSiBIOWxYWlpN7ow=;
 b=ikDByF++4cy+wFQpv8fjxLFBbSFuSgWQ9T4zwImEyLd6VxbWIfib6URwOYYsJ8FZePHitLilh+KbcKoEX8xbJXz8uwW6nv7qapO14CpgEEfrGz+LSvtaMrLL4y4Zpm9Oq8dXz1EKj0YeuDWWTjlrRzUCwpkmSJP6bWo37X/RTZLfBBP7B9Fmu718LIilneAsexfK6FVsYrSZQgoIN7EmkXECq3GwSwXAc1cESSyv5PsAXRUKR2JkcDS0/xtk14jhQF6ioDU9QONgwbTJrgxfrPOTOyejxcV72i9joqXQINR/Jr3AI35WNxSIOBYshK+NEnnmbGiFn/qxxzKw52ptjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7936.namprd11.prod.outlook.com (2603:10b6:208:3dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 16:13:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 16:13:07 +0000
Date: Wed, 20 Dec 2023 10:13:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/vm: Fix an error path
Message-ID: <xha45ldvurbfzou45zdtcygtczipw3dfw3jkokqx3oxfvrk7iu@4kswrmq6qrx2>
References: <20231220144214.2077-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231220144214.2077-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0110.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: 675fa31e-1f41-4102-6514-08dc01768d9b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 95mxIuEvOyYaCKNZJ2Inw3hf1UH0IPFU2vC7BnUg6ZRF2eKOfmJugNMPr3lXVazjO4BNg1Yqc1HFuvXK+KSOVAzkwjQXsK17HW1ibbZrmmbxLOcMoh3zBpcz8TXdUvHIc//QFoAABLHcSMSLBxtSTeoCde7jYisonCKKYj+vR7K+1cVi3zMEdXJOj1oAPBajGONV6FiVSzNHsI8271mosLMqC76oOd2FRXPICHPD5AY2bN/lhp8dGzK5H5+Ae+iuJg7JKw6mnfdxsnJDprxZXg0AazlC7nCVXFhLIMOy6jfEMY+z8i6tMQlYfskZwG4hDbpb4+X+8SeWNKhDnyIPXjB1wyPdcgRZ6gQnGkq7ZGbM7rC9NHVomgZEH1ZGBf63qa1jwW5gAEFcYtC49zqHJzFHa8fUbjG/oZhpw2UzqDhTC7kbvWGNAvdmXPw/29JL6k+C/3LQawcTUrid9+86mEPJBaHVzxS2w9k5cEl+FdqgpA4dPlk9YZl1x0/yYvo9HYJ9gmQEzfAaHLN9Oh+zWK94zujSDQmzi73m/mI9EX8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(396003)(346002)(376002)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(5660300002)(2906002)(33716001)(41300700001)(38100700002)(8936002)(6512007)(86362001)(26005)(966005)(82960400001)(66574015)(478600001)(6506007)(9686003)(6486002)(83380400001)(4326008)(8676002)(66476007)(66946007)(66556008)(6916009)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qwGTedpytV4JQHjAE8vTgmv5+bPaf++uBkQKpAXpfmyRbusSNxiVQ2Ifyu?=
 =?iso-8859-1?Q?0VIzYlmC6iHyTcnWpB5rKi67xQgSTnmvvPnnce157Lg+7tjLUyS4kjZCe3?=
 =?iso-8859-1?Q?428kSDHv6QfT/TIipc9WSkAfUEv5QngA51TIpfs3wKON5KyESp2N5is0my?=
 =?iso-8859-1?Q?qhYh/acmWirBH1Ud/vQM0U1gPgbZ9Ly0HdVZEQ6LD62ztXjUG8xvsvgSYB?=
 =?iso-8859-1?Q?bwUfseT4jgfsWI4/c8P7iXLU5jH+NTVEMSWppc1gx/N5Fzyhakebea1ina?=
 =?iso-8859-1?Q?CU3xKIdnjjsJ7VONevFMOg+zaQIL2Xtxvr1+oVIPgu1UNpRic94YbUIYWD?=
 =?iso-8859-1?Q?sYcZ5nMaiMGE6JDgMnV1zeKCT/cXyQYFh3T//q8273pa913d9gXAmyQFzD?=
 =?iso-8859-1?Q?deVgrU+e4JKCb8R6kb/LcwduDzINPdYfQRGaJTYXP7Zn1Ww9sjWOqcev4X?=
 =?iso-8859-1?Q?4gkk+agq+X5BofzsfOGDEaZwe4ro5qIvLD4L+eR+wpzofbH9epjkZOpmQ2?=
 =?iso-8859-1?Q?aGdcShEVaM+NyrUHLlBkuvWJInsdigPGygSFnpm+MTms3t4ccYu2SNVK3p?=
 =?iso-8859-1?Q?cIT/ipl/iRt6fgZxg7v7JHKqQoVN3w2wPUIDtTaJSw4DVsiWQL4Rlk2uHr?=
 =?iso-8859-1?Q?VRogtlVsIyh9I74Q2N6JQSh2P94EhcJYRE8DXtpYchtuBx422GkWHpXV9H?=
 =?iso-8859-1?Q?iBvV4BN6WvKHj4Z3Kc7SiKakArSPXfVM3hJc6loRDToxIhXFlyZ0wkIQzs?=
 =?iso-8859-1?Q?9qYCRIntXYkt/GVfEMVc8DzBGjzFLaFU4MhUVwRbPBnoLzzEg7pEGq1MVQ?=
 =?iso-8859-1?Q?NkmSM/F0nhbpfWc6ofEKu/g0Iw8/KgZhVl3hCaKrvBJn8PHHk1sgLvopNX?=
 =?iso-8859-1?Q?KdGjxIbiQcgFavPlsUWcxw86fc1q+K+VH6cMNSInPg6pH5AAA0s9se31R+?=
 =?iso-8859-1?Q?LnPyzhSkYtW3nZ11dLIqM2A1inDtjk823LB1sqGU5GMXKtgrUgbBMHzIJR?=
 =?iso-8859-1?Q?a8sXm/DM+H0+Vk8oeh7JeQM3/ZP5piBscoezyDy1iRnzgjNPXSxNsipsyl?=
 =?iso-8859-1?Q?FmnH4d4CBVEIi2W8LA+Uv/rET833AhvYnvUkVgyHjN3YsnArb1loafZepx?=
 =?iso-8859-1?Q?lx+qbGmNqsWh2485q4TUVjSTKaKvNQLM8F3bZP+UcL4zt+zWaCuDlyBq01?=
 =?iso-8859-1?Q?vBF/RagqOxe8//OzRm2G4oa+Mp3AQccbiDf8ZsCFiQJz4++wTwLC1G5m8n?=
 =?iso-8859-1?Q?piBTl/0eikSZpKaAqBEt+mE2i4rJb1yWSJyi57GWB7zwKBDBvDGBmJA5Rl?=
 =?iso-8859-1?Q?28mlS67PlNyW3uCpEd3O3EGRFdsqEKzpJCuNq+FqDHMgr91TTkcP8tK5bh?=
 =?iso-8859-1?Q?rnUJcvOudvoQDsEX/tWhCD5yzliNrX4728NS53tY10LJ3aDyrWBKc4ToYA?=
 =?iso-8859-1?Q?LdT4isHQABbIOj8cRlh+YayECBAobnudpQPPHvUib5ZIlMa85DAyXrNZlK?=
 =?iso-8859-1?Q?FsDvvOSQ2QfGuAMHvwq0jw+vHi0u/C27NQoPanqwvvYhcnJRwd3lrHMN2U?=
 =?iso-8859-1?Q?UDIbiPGOnAhupk9xmcyT4l7vtfAAlTwRbfPYgt5KV3vxJ/ku+gtsPYxCgS?=
 =?iso-8859-1?Q?zGQISYc/qZdY2m7RF70cAGDGel0FvJF/L+0oaQ7e6YlNREdC6ur+87QQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 675fa31e-1f41-4102-6514-08dc01768d9b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 16:13:07.5469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyyk3/70xdVQCrL46K2OLpwwviKxRaMTINzMibzE+Y7Nz/E49QxMRDofGRKYNeIHYrMUNAUw6dRF/X0a1ajyjZUElXX6iwAGdECQ8sX5/pA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7936
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 20, 2023 at 03:42:14PM +0100, Thomas Hellström wrote:
>If using the VM_BIND_OP_UNMAP_ALL without any bound vmas for the
>vm, we will end up dereferencin an uninitialized variable and leak a

dereferencing

>bo lock. Fix this.
>
>Reported-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>Closes: https://lore.kernel.org/intel-xe/jrwua7ckbiozfcaodx4gg2h4taiuxs53j5zlpf3qzvyhyiyl2d@pbs3plurokrj/
>Suggested-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>Fixes: 9f232f4ae249 ("drm/xe: Port Xe to GPUVA")
>

^ this newline needs to be removed so `git log --format="%(trailers)"'
shows everything, not only your s-o-b.

>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>---
> drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
> 1 file changed, 5 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 1ca917b8315c..127842656a23 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -2063,9 +2063,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> 		if (err)
> 			return ERR_PTR(err);
>
>-		vm_bo = drm_gpuvm_bo_find(&vm->gpuvm, obj);
>-		if (!vm_bo)
>-			break;
>+		vm_bo = drm_gpuvm_bo_obtain(&vm->gpuvm, obj);

if the issue with that we don't have any bound vmas, why are we going to
create a new one just to be released?

Lucas De Marchi

>+		if (IS_ERR(vm_bo)) {
>+			xe_bo_unlock(bo);
>+			return ERR_CAST(vm_bo);
>+		}
>
> 		ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
> 		drm_gpuvm_bo_put(vm_bo);
>-- 
>2.42.0
>
