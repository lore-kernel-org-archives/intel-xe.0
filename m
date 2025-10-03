Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C474ECAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 06:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6B010E0BC;
	Fri,  3 Oct 2025 06:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VaX/z7cL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573A010E0BC
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 06:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759474598; x=1791010598;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AoaAg17GU+0zYIC+TASVtJt41bVt6nTAdhjBgrRMfsE=;
 b=VaX/z7cL5wsnayjpJ12vf1i0TGv8kqiVz2kDeYAyEJnEm5K5enZIBDNE
 tNLDC1amdBlkb/iF+6Rj3HVFvhhIUHDhQUN91i8Uk8BTd0gNizxVDHWr1
 hT7CZ69qCOMVFwNlTyMD/7cRO9mAU7O2EclDkai+7eMTqiPh6WRwlANfE
 wutYPHqBOTJhm0l8+uoibgweFeyRDV1H5L75JjxZ6edatsTa9iR/F5Ye1
 pI1hioofM265kjPdhgly9mYDbJOxlcBaBPZA3D6JEHUFR40x3ptZ9wST/
 D7kQO0DCoXI72NJqapLC+/zSqofYY+RCH22cK8mYxnWvS5mC6pDsqw9kX Q==;
X-CSE-ConnectionGUID: J6L5VEJySF2H0nISPHqdNw==
X-CSE-MsgGUID: hFOHfhTXTG6gtMk53Gb9FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61795118"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="61795118"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 23:56:38 -0700
X-CSE-ConnectionGUID: 9HiB8H9OSImlLv0+kNvb7A==
X-CSE-MsgGUID: qe8gTMAjQIGDEvbkG0Gr8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="216347623"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 23:56:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 23:56:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 23:56:36 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 23:56:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VD8K+Ge2CTO3LUNfGC8knbPiyrdfKQDMCw6shUY5QXNvfBeI1XjV1TSKEgV4ePaoRyUKs+gPqueNC93Zdp5wJg7cTW10CM60gcUlVTOcfX7T2LQNC0iZ+2DU+9hgucNeoydo1XsrlGbX18xsSrI/JT2gG2bZKa9fosqrgqhmwRw4NgrPd/1JpyK7IaQI1Y1LZ/3H+837NQapiyJ7MeIQ+w40yE+O6jPvrvHGebR5Rp4qRu+ikQSfZOdYnntJPRTK3fKCU6h2hWo3oXfHh50ArL0hbHXDa8IOxJOUmKobNAIBY25gVjyHSeqddQRmFNUTRHhSqcyik+fn8a6w8VFBuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fB1XZCaWk5lgDFiHILdT/Ky+Drw6srGltaf+SdPyDgQ=;
 b=ymWNmfx3GpwIPbH5ZCEaN2gnDRV2zUVEFabtm1Aacj+0v+dTejZiO/XNw7VIseArr0L6hm7O3WEK4IiYMjVgIWE1YJTIZ2Bx3vqPV64Rpc3xsxULTt6yCoiKBulXEHG9yJHQgkPh9je8YdvlY9DCtu3zWkutYFKODW9PEnuK1N/ItBdILXUgD3hHQNneQxF29gV3VksOZnh+6P+Pjilr4V6KnXSHHAr+PxGJGKWqchpPzpIggsu8EUP+2DODzOhavscbjWKl9szENVlQ7R0CD9YDh1oaRcla9tJxxay00n6D9IPFCW3X7QuJlWJ1RN3K1I4+e4W240RWMmtJu8UUDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8467.namprd11.prod.outlook.com (2603:10b6:610:1bd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 06:56:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 06:56:29 +0000
Date: Thu, 2 Oct 2025 23:56:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/7] drm/xe: Handle missing migration VM on VM creation
Message-ID: <aN9zmrOxEhgiEgv+@lstrano-desk.jf.intel.com>
References: <20251002230444.313505-1-stuart.summers@intel.com>
 <20251002230444.313505-6-stuart.summers@intel.com>
 <DM4PR11MB54568D4AD095B963ACD2442BEAE7A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB54568D4AD095B963ACD2442BEAE7A@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:303:b8::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: 480dd4f5-6a98-47fa-0f2a-08de0249fab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6sWJNcM2OKZJCsMua7otm4bEt5a1SOANL+Sw5KLAmdblAXWkdEDIp5j2XQKw?=
 =?us-ascii?Q?NurOyMmS7sY7GtJ9U84h2aT1NJfHJa4qrddDAFK0S0DcJQ1GSm5HzAUTuOpK?=
 =?us-ascii?Q?yhMwbLq2pnC4YnLMn62P5W+tmyNW9kjX1YkiaPK0dllnv4Sv4vSKmuYKjo4C?=
 =?us-ascii?Q?hw8FHCAtCEoa0wg78cnHu9XCidCsseF032XJ20jKzRl1NQ2s6EQvtJ4ICd+y?=
 =?us-ascii?Q?/UKlf1ifaV0xGFfecLqHVNu6HBmH7Dj2uf/7MtTJh+DggHi3a+bUpoYohti8?=
 =?us-ascii?Q?ahOkR0M5oSlLKaNtp+nZklycmRU/bXmpsbpJu6Af9UwudjO1dSsqI9tPlKQD?=
 =?us-ascii?Q?62MwNrj/Qb901TDqyeIkNU3RfB1gj4yORl4phcDcm/Z6PxXFK2bbZX171Uhy?=
 =?us-ascii?Q?BHNSPG29bei1Er4LNMGh9zIfTOzeInavSEJfXmxIsnCPc4SoQp8RFqJ+svxw?=
 =?us-ascii?Q?l6shw8u+HVk2AKw5ME40vIpbI99oWfAQhrP4tbewgNB/ARS7FgVNnuvrO/UY?=
 =?us-ascii?Q?VSzGPb3oDgDDYxlQQjh2VGYsj4SxWouKzx2SyT+9ki9BMnJH+I5V+wECb2Wh?=
 =?us-ascii?Q?MWnE1s6vPl7KvcaNjJOIhHwzDydTN0vH9lrEw8STsgqJD1dZnVHDQulQMmZP?=
 =?us-ascii?Q?mioeoSHmRn1wzwqPCb6PITwmbRxVyH3saI2rFvbsKb/SU1nrkqtEy1BDW92n?=
 =?us-ascii?Q?2ftf4bEQ9ehjSFP1JrnzGY+JxhK7biLk5Hpe56eI82sw3H94hahSv6QVn8Qs?=
 =?us-ascii?Q?iO/cSAh6JpGeNQMFmJGgoyx7Vt37AJ0dbJAC4Z4KLe/Coo+mywJ/oOIW2qAD?=
 =?us-ascii?Q?3naU4PSqflV04LA1Hv1OGPSGHZ+AytIWF2z66LiNhp0czYci6mYDVsZECLON?=
 =?us-ascii?Q?6DCGadTgcLGdCBxURMlpCQakGgOAMxDf5093S9qhCXYGu0bWA4zqzs8cJSGt?=
 =?us-ascii?Q?ansibQa8QkndXzNcQSrQ3qBAmRF9n06jG03QXdx0GmBgzqffCww1qxqsrspx?=
 =?us-ascii?Q?+zGmhmJejLLl8HocOmR22/fenC0t1Lcsy2/SOqQ8m6uabO3rrn4DS5ayxudE?=
 =?us-ascii?Q?2+6zu0BNSfz1Kv/UTirwaqsZwMaq6j60lSrf5BACN+LYcvMXt4PIfxVYK0PU?=
 =?us-ascii?Q?ogNZsCWogiOZBAKcbOw/x6ulc413b/XWx8+T0edozf1TZtSYIgMoRMXi28FD?=
 =?us-ascii?Q?66p+Q1bPbeyiOxlpqC9L7Dww6WDneNIhkT+mlXJguim6hnomExSD/B003ZdC?=
 =?us-ascii?Q?6WZaZb77p6PRYJEXhmb1tuZ07zgNB9EnygywMFZnGHXw6PtJEmMd4F3mFkXK?=
 =?us-ascii?Q?CtkXipbBUox8BDhzI7+8GNCbZkxedCe3eVpvJDSTac5/1lpiTfO5j0qgnogN?=
 =?us-ascii?Q?SBJBzxggUkvjr4nSXiQyHTReG35881EngVs6fo97djU4rvwdYhsK8XTE/fIF?=
 =?us-ascii?Q?9DGr5otEmoiy9Q+6WrjFTxYav/Elia0a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WSmXSn3PRpF19cyRM1DEJfVactcqIHnjOflv/O77BkV8ghHRHEq70xlmuUQb?=
 =?us-ascii?Q?RiSn2q8kJfRJaCZIxdKBO9UqOBSMHFZ4XkFxswG8WDW/1Uk4/t+0B6NdHlpf?=
 =?us-ascii?Q?nD2HqTZKI6Dv9HSHQzlSRQlIUxBIlrX34LqAmeVPdqRd25ASMHpsNL2wZXmd?=
 =?us-ascii?Q?8A8UvcDKQwSYiIY9rbWbH+oieRK7oT5lVXBlJ0QdqQFYzue0ZeXc9clZVhul?=
 =?us-ascii?Q?0OZolCplVtiNO3PAG38KjmOwKPpHk60G2F6ReD5LvWXII9aJP+h7B3ND1KDY?=
 =?us-ascii?Q?ql3s6cwLBm/EU/ZgH5KAY+kqKdGq2Mkn9m6NlKCKQQ+L1k2cPOAGbipJbJrQ?=
 =?us-ascii?Q?EltZnZqQtLmYZq71C7nmdEaP5t0mb8/NBQQ7tRPysOim6g5beGRn6IaNhlYh?=
 =?us-ascii?Q?GjgNhOzw/I7mugD1W3lITUCvNlY6Wcp3CSazIM68xwHrl7syq3B1JW9nTGma?=
 =?us-ascii?Q?8vu2q4VM5k2T3ChvnnpkJ4EIFDu29YoJueSh49L6AWCoMXC3ITh/3dotbQue?=
 =?us-ascii?Q?bPT3ibOdlTQfJDIUvAg3UtnKHIcN8MyO6w5BZ46WKlZis6KqIONKriAFCYgx?=
 =?us-ascii?Q?T5OZAGGs1Xmg59hf8jMUVUHs3wkrcCAkXqRgy8A+VFS8u+fufEalRhQg5IAc?=
 =?us-ascii?Q?XTZ5pU1iva4+xaG9cUl5YWwmSVPodMdnQQRlATlaApw2DgkoimisW0tLqmKZ?=
 =?us-ascii?Q?e95oijEakfykbdbJckpWRb2ke+9uopdhPS54eZBo3fbG5kPGaPBysbz5keBQ?=
 =?us-ascii?Q?ygy5fNK83GnurirLw+z5ruYtkrRNRSgrh6kMGM3nhMDFHWqn8Do1RaAr7I2V?=
 =?us-ascii?Q?p9M+HrmTwpQ4yW4bBLEqBRqy8N/m9kAx+AJkSiF+UwijOa0hWZboW/CrmCX1?=
 =?us-ascii?Q?objjGuwKwVq03DOBBqvPPkGElxKC4rgQhu64qCRefRoqlXeU8aW5pj/zAzwM?=
 =?us-ascii?Q?iODuko7z6Azc8trZwSDtlhe4bmqE6duqgNGFg1X7fM2D9pnXGDuo+ZZWjuCi?=
 =?us-ascii?Q?cdIIaZ+fAoy0RJ31vDUpZM4shcRxHRhFwUzE+k6qz9K6lJQ4zKmLgMdF5nkE?=
 =?us-ascii?Q?eCWpKLnDARtKbf3eU/K3YT1R18rTmX8QiCqOGVeIiKLfTGGxPCsndkld6nnw?=
 =?us-ascii?Q?nd05axtNroYF5Hd4mAbe5a9sy5rwsuVNs7MfzXcraAOBd6WIOuLPl6WRvJLh?=
 =?us-ascii?Q?yKr8FLIQn8hcFo0eQobESggfdtS1Jq82Bg99stspR5AFqs6n5+yoaFPGsKMj?=
 =?us-ascii?Q?pjy3lAx3U1i2P+sJY2k4v1WNzK0Yrge/dTiTca45KiT58VAWoSg+UEPvBuT9?=
 =?us-ascii?Q?qMkdpxbcnk4A3+vybJom+nDXqg5sh7Z01iP7hVJOerRL4hM8r6P7agwR1ecU?=
 =?us-ascii?Q?2i71bHmYuDJ1Mt6RIzeJjbITKjys/F9F8U49W96NWju2hW0Hje5WFoeaZJnJ?=
 =?us-ascii?Q?5i6Pz8MsXR3O8wigT6uWE10gDypx/nxji3p+zUCwvdB3WJOfh3dgivCqFMSX?=
 =?us-ascii?Q?YunSS4HrSSWtWtAef7PFdHFE1MeC2gE/HbH0mbrVHaIfL6+GdOtpnRQfWEqP?=
 =?us-ascii?Q?x/wNWcVU+VFSTFhIoye+aYu/WqLlKcbvadky5gV1ceuH2z6Rzi1M53+8fZCL?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 480dd4f5-6a98-47fa-0f2a-08de0249fab6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 06:56:29.6993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGCatK8/PZ5hkb8T7P54oZrI6ayqhrk7yfZMIVfYw3ZC47n87A4JUYJbVD9uK3JdsmNAc59CYwZWtTjXYOGVng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8467
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

On Thu, Oct 02, 2025 at 11:34:29PM +0000, Lin, Shuicheng wrote:
> On Thurs, Oct 2, 2025 4:05 PM Stuart Summers wrote:
> > Theoretically, a user could attempt to create a VM while the migration VM is
> > for some reason being destroyed such that the xe_vm_create() routine gets
> > called, but when we assign a migration exec queue to that VM, the VM for that
> > migration exec queue is no longer there. Add an error check here for that case.
> > 
> > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index c31bc8411a71..6baa19b8051c 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -326,6 +326,9 @@ struct xe_exec_queue
> > *xe_exec_queue_create_bind(struct xe_device *xe,
> >  	struct xe_vm *migrate_vm;
> > 
> >  	migrate_vm = xe_migrate_get_vm(tile->migrate);
> 
> If migrate_vm is NULL, the xe_vm_get() called by xe_migrate_get_vm() should already crash the kernel with NULL pointer.
> Should we add the check in xe_migrate_get_vm() or xe_vm_get() also? Thanks.
> 

I'm not really convinecned this possible as migration VM is tied to
driver being loaded / bound. I don't think you should be able to unload
the driver or hotplug it if an IOCTL is running. Has this problem show
up during testing? If so, it likely points to an issue somewhere else.

Matt 

> Shuicheng
> 
> > +	if (!migrate_vm)
> > +		return ERR_PTR(-ENODEV);
> > +
> >  	if (xe->info.has_usm) {
> >  		struct xe_hw_engine *hwe = xe_gt_hw_engine(gt,
> > 
> > XE_ENGINE_CLASS_COPY,
> > --
> > 2.34.1
> 
