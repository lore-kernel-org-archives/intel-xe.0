Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B85EC021B2
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 20:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0C410E9E6;
	Thu, 20 Feb 2025 20:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m1bBagUC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D04D10E9E6
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 20:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740084792; x=1771620792;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=86r1Stzp2BOUuMnuihhmlHJVN/ToOqwjirVJKbvSHiQ=;
 b=m1bBagUCllWbO6Ziu6/PrfXKJZzoYd4iwhZ6tTKbkN7I+EuuEaiReGYm
 xgqzszkVvsS/avcFR9jKDA6X05X1567yssTpelH7n+EjgbfkaLApbO+kg
 CRLohHnouiN4jA0vHGUaTKcHDOnyKm1PKDUKlj83exRS3T6HSreKcWfJA
 /tASmlrgMW/uvnO0iYvmDbSfrvhoGAUGU+VWxuMlhtrWh6eS8VQOVkmmC
 gkMr9rvgMXcAJTYohYsHH1HQHbpw8TtMgiNcLMef5LuUn3/ODkc4naqjA
 8hVecc7zuaXq8pyAx216RPcN+6SxBmGYF5p8PmzUksmXktMI407PlK4K8 w==;
X-CSE-ConnectionGUID: oYZBBMEJSXai8cAH4fYrZg==
X-CSE-MsgGUID: lOUea47wS7u2HKAmKCGkbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40746034"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="40746034"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:53:12 -0800
X-CSE-ConnectionGUID: S4fOy/tJQoyGD2kdnB+0xQ==
X-CSE-MsgGUID: CHm663dUSYCjTStSdrZGPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="114883670"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:53:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 12:53:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 12:53:11 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 12:53:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEBvv2b8bsan1jaH2/wJQ6ZOssWeOFjkni+QUxQ6vlSneR0kvcYTnKW/yRte1wv0iidjTOPKPuR/nsYPVDUfdTlU3WwLMBr/nPWLOBLXeodgf9FetTGfBc1AG1e3TNq//0mEHkvXToQ2LteRWXvJdm6CtiYhP6acWwXPOlDIx+3pz8dIUecUrW0hI25KjVyagWHeeK6W5mQAeM1B4CCYWVAKv6iGf5NMBdj9wxe7DFicZH4vb8GSBQADl+t/f2gwPcQHUN2hvs7nwIt6vvaSilgnPwUGnfxeFHbO/wQsy5Ek3OUyv8MhPJlIjaGJWtzZscoE4ZDfYTq2QjaC67Fojw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXwk1buDeBpVqY0h9qKCfshlLZMwgzPUdD5/FJ5xQ2k=;
 b=qTT1e0t/aPnjO28VZqdpiovBzwi+aQpam5n5kHk+Xw9zPPQGirxYNnRauDAI9KykhDxS0efHsQ87XCf79M5FoyZm9zZpdbKYLqbvhDHB1D8MBmMO9WNihSxONZib1H5wgIG6dUpHMJgmUreHpVjF2FkssWYR8sFyP3+DlmFMdzvQmGMTbxhetP+nG3weAtIj23MKu5+RYJKeKFZHo3NTZVGkwNY4iSP3o7Sp5AS2ipJkVnsaSobpbmE/LBZ7l1gNklV2Qv+Cu5gLa+u04uXf+RNP8xHkUq0JA9gV3FuaG53n/EsGQOZpGVO70aqgIuZ6PN60dp80/Qi+4s13j/wKug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 20:52:52 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 20:52:52 +0000
Date: Thu, 20 Feb 2025 12:52:49 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe: Rename gmdid_map to xe_ip
Message-ID: <20250220205249.GW4460@mdroper-desk1.amr.corp.intel.com>
References: <20250220172532.66613-1-gustavo.sousa@intel.com>
 <20250220172532.66613-4-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250220172532.66613-4-gustavo.sousa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:a03:333::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL3PR11MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf3dde5-068d-43ad-f50b-08dd51f08ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NqEtE6A6C5oMBKvkEOlg59yclUzJtOSY/4K8TCiytXhKwUGNNmfBL5Oiw6LC?=
 =?us-ascii?Q?YXPIRRlZDoyet4PmQfg/tcxS5vGKtj27mrEeeXKdPYP/d73Uv+YwQ7A622Oc?=
 =?us-ascii?Q?C36P7B5wDT8/MXJkgl2WAPlaA9TmWIdsHN30Hkm2arAc/h56Wwxe0eQJAcIh?=
 =?us-ascii?Q?MfY431ybjCINS17tfGj9VT4Kp1LCfYE3bRWcTX+Ueiqucc4o4ZEPROktDcAo?=
 =?us-ascii?Q?LZRKSJn9fPj53faF5Q1c7YUxNfasNl3uQ2B/v/4eBi/CbeSBwulbUIghcVuA?=
 =?us-ascii?Q?/6aiulY/OITf/XcXyAFx2p0HYobII9daTFRAd5IpQFkKB7my5gw9ief81aE7?=
 =?us-ascii?Q?URQSG3dQmsmpmNmqAhuSTpCe3YWAGAWfAQ1fEykF3tvrkXDDx6kNd8+vgw3X?=
 =?us-ascii?Q?I41poVDpix2FatEAMR1M7c3Xk/oek7GEWFg+Pb0I9Bj7+aM3Q0Wq6bJ0upwF?=
 =?us-ascii?Q?GbhKwTWcbCmZmUGJ/QHTBKr4udjVJgwr+RpSGCzCDqK1ETb8Zx4IIqaC9nJg?=
 =?us-ascii?Q?5U1eNrZo3JiX90wBlVkgAL8OMvhue/hlI0s4wWg1R2Yn21IZd04nRw18spCo?=
 =?us-ascii?Q?LR4iDBsE2hRb9LJ/0Z5Q7U+gDo+KrH++eC2h1dNKqZrA4GCum/4lDVxNwPdO?=
 =?us-ascii?Q?H4L3sDqBYhTGAWkDeoT0dDhGoZsztoA+LToo0o7oykI1K6cMc2QBTCleUO0/?=
 =?us-ascii?Q?Xk0X8GRpC1j+8erkvL/YANiB/ijeAt9TVR4Kxr7hI6kkR3ABMAv6kwxTxL+k?=
 =?us-ascii?Q?0MjYgbL9wU0Hg00VGRVDzD4aMavvIwbl1AGQcTA4uKieFeY9TR4clP9msZoE?=
 =?us-ascii?Q?CQXdhK28r67LoFYsBAKHA0rWHd/Kfur52nGR++FJToS3Ol/4h1iKGdXgYIs0?=
 =?us-ascii?Q?7JSz7WdAhoJxCdcc+tTSqNTd7W1MEF4z6SB3uCHZSIea3or7GXFg+aRVzZiS?=
 =?us-ascii?Q?KlfjKZSBsFSJaoVuwxgWtelhOMi1shQLDH1TeJRoDh/FU2eZ3WG54JIokYZ8?=
 =?us-ascii?Q?lGEXKgZf3rPEX+8nBu4fbSoYjxv0h8ZW63J1xwVWqj73UxJDxVkAtw+Uq2CD?=
 =?us-ascii?Q?K7BmNDcShq7FmyHOaAF9es/4fhjV+WkGnq8VRINVJtMFWITPUEQ+sEeF/G58?=
 =?us-ascii?Q?pxi1JLh5R/TmBu0jpJEa5docEx48pv0A26eJrlKbhZ9C7t/9qA4V1TdDb/n0?=
 =?us-ascii?Q?sXcuY4hTPQmzYwOnPqZXUXRZCesRnk1CA0DVueWF2qAP3OFRhRyZjNj0HWsM?=
 =?us-ascii?Q?+5k1gUxJ+6heFX3tjffjTZcLLk5xJ2/MJlyNHRe5DNtWhp4tKrJWnYqBs9jc?=
 =?us-ascii?Q?w4q3YAdN8qZMJNEv73EvbceqLugEkdZ7Yr9MEH/M5DO25hpfPFoU2iWCWBIe?=
 =?us-ascii?Q?bQhzR9jeVOsIhxSDesA7ganXnYFp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xysvpZTMq8KRcK/K6NFp9dFnH+H5aXShjYwpgcHZzHP99+nDDDB6RpWrKwW0?=
 =?us-ascii?Q?vzKugHcstdeYrGv8J9fZn5iL8/Y94f1defsQuhkMs531Bfcjk5zo8RilcwTf?=
 =?us-ascii?Q?O0SQ3wU6swNbM5T4z4bRJNGjganovB+9sFxl+YgyEJamKSek8Zm+DFnCPWmM?=
 =?us-ascii?Q?g0LWhCCn68qaYRaD90bldt9IQ4eu9xdnFEr8XMLjPtpqFYOQL1WaBWKO4BY6?=
 =?us-ascii?Q?x2XIuhzw3cp6XReNUdqbisEovXRLvzmnGaCmSQUj/GGeLO0As2Fr9u65Fubo?=
 =?us-ascii?Q?8aou14JZ7q51qTEQMaHk7gOnOU+Taq0j4vZm0UA3I/SPqGASljYjLQA9HeaU?=
 =?us-ascii?Q?T1fLoZ9skCTo2v38c2pTueRak3vI9+3y+dfZsCFBJWyIUPYfT/zt6KHTscTj?=
 =?us-ascii?Q?n9L1VsnaE5Y3Bycc00UvoXWe7YWjtXpuLXOsY2/JymzG33RaTfEjs/0OQVy5?=
 =?us-ascii?Q?LBWyRLlR95AMxNy6FrL0Fv5o9yE2rIi6xuqmXklg1oUHsgffMlQgsA5qRmj5?=
 =?us-ascii?Q?ZIAjo9gR/ZsLrArrVNIE6oDiJZ2ivzeHIk9DHlmRuoz0JT5u9dhs9FMpYOMA?=
 =?us-ascii?Q?2fZ4lgUAG3/SXStVN6+8S1VfUa0UAOnlGhDO9FR6lkbHQia6A2/RgfpzxGZP?=
 =?us-ascii?Q?ZQ6jxGd8Iw3WdrssPvQZ4oXJKV5/wZOoc1zcxPeGOD7DM0KbI7GFwAfZxv+Z?=
 =?us-ascii?Q?NIalQJYl29FgYSQyhV6fKWZ1vUo041TG0pPJ2i8krSOv/ryu0oetuNFw7cu3?=
 =?us-ascii?Q?fUTSHijx08jT1sRD6fXkh+rSL8UNLHLLXKe/4kQNrv7FuYHQjIqCppg8oQWd?=
 =?us-ascii?Q?M9d8BYSRs+I9ngrV6v40OgJJHCrqXQJDid02mOysQfZjbX6hwTHtugIa807c?=
 =?us-ascii?Q?FXGKJsTeD2DKnkcCf64aa95qt7LoDvThKr16Ozal5HjlhEhUmFGobcn5oiB/?=
 =?us-ascii?Q?T1IKVTaV6ivqICQUa/aYckttTZs68U5+Wl44n/6oQJJHF9sk8N2knnd677t/?=
 =?us-ascii?Q?sf1v7H30SJaCbAbcnxqPD4dQxDJDncCxxYvqNWIUBNdcQItD6bN/D7t5GuVl?=
 =?us-ascii?Q?j7gqH0GLRFt299jXVskjoDU9fc+mxndU1MPK30G27MfRCGYbvyRX7EOCtEgu?=
 =?us-ascii?Q?/LDqMDWWlu3ddltLrHrTOm9EshD81TtRZFQRVZkes3WwEiYP5dMHT4LSyjDZ?=
 =?us-ascii?Q?JdD1k7p3JiAiXgqhmGwKPmuypUkPP7839YrTVEWKH4RBtV9rAGy6bpSueVTv?=
 =?us-ascii?Q?tL4CD3v2AXFUniQd71OZkteDqBsj0eenpZKj5D+ypnayR3DJhkjChiykysWz?=
 =?us-ascii?Q?7gafiM7ej+spMJi4I6xHyZpXKSYgUesS8bMpBnMa+tmwt0vnuCU8VtvCvTim?=
 =?us-ascii?Q?RVBh6kHx3FeJJPcFuaSFeWk8aEAkv0lamvVhwLmGSl4tq+M9FR2cxQlK2yga?=
 =?us-ascii?Q?px+H7y9SFW+3AGqQ4ykn9rZmFIoS8z3Lzm0wmfKbCgFZJOmTn/pLRx2iK6V5?=
 =?us-ascii?Q?uPCPecDdf2VNqWX3srDzEWksI7snLP1TngvOlJr0bmTcyvpvMZZ/rNaqN9va?=
 =?us-ascii?Q?0rCq4rluFti7UjCzFNFwg/rxiSXbJSoOXGnS9uNwTcuPggdvPabEozvRzKr6?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf3dde5-068d-43ad-f50b-08dd51f08ac1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 20:52:52.0135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AI9iZoYcWZgh+2otZ1SAMIiJmFTTowRGUOhYPB6iZ3ASIJIVXEcR7Cvyh4i9fcEPFml1ltyy94UXnXi2jY6VNO4oH0lP//J/1JRn1w3vhwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6362
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

On Thu, Feb 20, 2025 at 02:25:10PM -0300, Gustavo Sousa wrote:
> If we pay closer attention to struct gmdid_map, we will realize that it
> is actually fully describing an IP (graphics or media): it contains
> "release info" and "features info". The former is comprised of fields
> "ver" and "name"; and the latter is done via member "ip", which is a
> pointer to either struct xe_graphics_desc or xe_media_desc, and can be
> reused across releases.
> 
> As such let's:
> 
>   * Rename struct gmdid_map to xe_ip.
>   * Rename the field ver to verx100 to be consistent with the naming of
>     members using that encoding of the version.
>   * Rename the field "ip" to "desc" to make it clear that it is a
>     pointer to a descriptor of features for the IP, since it will not
>     contain *all* info (i.e. features + release info).
> 
> We sill have release info mapped into struct xe_{graphics,media}_desc
> for pre-GMDID IPs. In an upcoming change we will handle that so that we
> make a clear separation between "release info" and "feature info".
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c | 24 ++++++++++++------------
>  drivers/gpu/drm/xe/xe_pci.c       | 24 ++++++++++++------------
>  drivers/gpu/drm/xe/xe_pci_types.h |  6 +++---
>  3 files changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 67404863087e..5132c1961472 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -21,15 +21,15 @@
>   */
>  void xe_call_for_each_graphics_ip(xe_graphics_fn xe_fn)
>  {
> -	const struct xe_graphics_desc *ip, *last = NULL;
> +	const struct xe_graphics_desc *desc, *last = NULL;
>  
> -	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
> -		ip = graphics_ip_map[i].ip;
> -		if (ip == last)
> +	for (int i = 0; i < ARRAY_SIZE(graphics_ips); i++) {
> +		desc = graphics_ips[i].desc;
> +		if (desc == last)
>  			continue;
>  
> -		xe_fn(ip);
> -		last = ip;
> +		xe_fn(desc);
> +		last = desc;
>  	}
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_graphics_ip);
> @@ -43,15 +43,15 @@ EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_graphics_ip);
>   */
>  void xe_call_for_each_media_ip(xe_media_fn xe_fn)
>  {
> -	const struct xe_media_desc *ip, *last = NULL;
> +	const struct xe_media_desc *desc, *last = NULL;
>  
> -	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
> -		ip = media_ip_map[i].ip;
> -		if (ip == last)
> +	for (int i = 0; i < ARRAY_SIZE(media_ips); i++) {
> +		desc = media_ips[i].desc;
> +		if (desc == last)
>  			continue;
>  
> -		xe_fn(ip);
> -		last = ip;
> +		xe_fn(desc);
> +		last = desc;
>  	}
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_media_ip);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a61a8982ab67..8b8111e954c1 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -369,8 +369,8 @@ static const struct xe_device_desc ptl_desc = {
>  #undef PLATFORM
>  __diag_pop();
>  
> -/* Map of GMD_ID values to graphics IP */
> -static const struct gmdid_map graphics_ip_map[] = {
> +/* GMDID-based Graphics IPs */
> +static const struct xe_ip graphics_ips[] = {
>  	{ 1270, "Xe_LPG", &graphics_xelpg },
>  	{ 1271, "Xe_LPG", &graphics_xelpg },
>  	{ 1274, "Xe_LPG+", &graphics_xelpg },
> @@ -380,8 +380,8 @@ static const struct gmdid_map graphics_ip_map[] = {
>  	{ 3001, "Xe3_LPG", &graphics_xe2 },
>  };
>  
> -/* Map of GMD_ID values to media IP */
> -static const struct gmdid_map media_ip_map[] = {
> +/* GMDID-based Media IPs */
> +static const struct xe_ip media_ips[] = {
>  	{ 1300, "Xe_LPM+", &media_xelpmp },
>  	{ 1301, "Xe2_HPM", &media_xe2 },
>  	{ 2000, "Xe2_LPM", &media_xe2 },
> @@ -584,11 +584,11 @@ static void handle_gmdid(struct xe_device *xe,
>  
>  	read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
>  
> -	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
> -		if (ver == graphics_ip_map[i].ver) {
> +	for (int i = 0; i < ARRAY_SIZE(graphics_ips); i++) {
> +		if (ver == graphics_ips[i].verx100) {
>  			xe->info.graphics_verx100 = ver;
> -			xe->info.graphics_name = graphics_ip_map[i].name;
> -			*graphics = graphics_ip_map[i].ip;
> +			xe->info.graphics_name = graphics_ips[i].name;
> +			*graphics = graphics_ips[i].desc;
>  
>  			break;
>  		}
> @@ -606,11 +606,11 @@ static void handle_gmdid(struct xe_device *xe,
>  	if (ver == 0)
>  		return;
>  
> -	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
> -		if (ver == media_ip_map[i].ver) {
> +	for (int i = 0; i < ARRAY_SIZE(media_ips); i++) {
> +		if (ver == media_ips[i].verx100) {
>  			xe->info.media_verx100 = ver;
> -			xe->info.media_name = media_ip_map[i].name;
> -			*media = media_ip_map[i].ip;
> +			xe->info.media_name = media_ips[i].name;
> +			*media = media_ips[i].desc;
>  
>  			break;
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 8e586d02d089..f46426ef8ed8 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -37,10 +37,10 @@ struct xe_media_desc {
>  	u8 has_indirect_ring_state:1;
>  };
>  
> -struct gmdid_map {
> -	unsigned int ver;
> +struct xe_ip {
> +	unsigned int verx100;
>  	const char *name;
> -	const void *ip;
> +	const void *desc;
>  };
>  
>  #endif
> -- 
> 2.48.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
