Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B504C79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 19:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1178310E13C;
	Fri,  4 Sep 2026 19:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ha/aDMpu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17EC10E13C
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 19:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788548655; x=1820084655;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EsySdUTgkQmenFul3eA3OTtTnLi2orl+pnJQ7gxq8Fc=;
 b=Ha/aDMpuSnSAgaQlNJbxASbQsRWp/AQ6XIrZh6T7RwkY01f6FQOftkRA
 DdnziV/LsSR+T3nWI8rd27q0I4AIg1Tf59nvGr2hf4kMFi5QcHMAiX5JK
 3fdsgr1RHze9Pb+Z4CwbnchMBUvVlTx6BKyGVyoKNblLqJVa240jQWRN+
 QJZRqYdU4hXuBUmXSjOKz2VWP4SBhH5vub0s60Pyi2CjayTLkmV2MGhUk
 Pr93tdXCDRQz1afwkQ1CNuaw+IWndiUHza8SmMB8WggUG4X91iixGliZG
 2bqFYup4y5bRpK9KiB6hDtrrm10EnCs/bYJCuKYPxBZX4UP2+U6+HkiOe g==;
X-CSE-ConnectionGUID: NFDIMXFlS/Wpp0AyVWCuYw==
X-CSE-MsgGUID: 8Jn94oIIT8SraIvqbwzUMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="99389442"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="99389442"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 12:04:15 -0700
X-CSE-ConnectionGUID: /meMcyNqQMudSDk9zW69Wg==
X-CSE-MsgGUID: 6MNSwYAtRUGkCfVfayvdog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="274273051"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 12:04:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 12:04:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 12:04:13 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 12:04:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IH76zFI0IA9uywreBEGt2guREmWIF2mjQo62zED2J27qvdhnIqsfh0ZzvEvpQ1dBGAIZLzJeWypT6KIf6hbMyFwyXpkqYokeQQVFSCDi4deVi/dFeBC3Qxc+q21jgTcxMWkBii3WaWzSLxmFFyELw2LSciQmhiIrP+1GyFhgaVXPwHLp84Lh6hz7pKzp4yi/ma4N0cl3HeB1/DVNoAkMz3J9BmI00B6q61x/igApKzKofk/vi9tRQLygEu7RXiMwCuIGd9XP5PDL7PmdjmMjYxn054FI2llel6os8QJ3ZbiNkqWexYCrhuXXZgFUJo7gR9eJG5T8i3FXhkxIhlAUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YdS+CRs5EUiKXwfpBtoBztR6SlrCCJbtgJ8tFl0RJE=;
 b=D8IFtKUk/nhH5csjVd3xg+fy0Wmj7xE3yMUIHHrMWorDrlWLDlGeJmbe6Vckc03wml/Fy8hG6NvMiawOP3bEsP6bnWAK4HRMIsV3KkAt5a+7ynj11gvyLht23OCwAOfy78adxX8FAkinoWLV36jWszXmwWpv+egsYmBNl/pevyxniFYVc33qnWPH1wp7TFXSv1EcOhDytVXnTMUXRdIEL0KKwTBZKkIcQhjrl1lAgjOsIJ/gOAQGLa3HI867p17DZDh59zDoDdrMJ31A3cAE0YUOP/3gZoShw+dF0vXoNWHlW50rcCPlT6JZecZ1HI5qkYevFbJFyjulRXZK9gSjeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7150.namprd11.prod.outlook.com (2603:10b6:303:213::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 19:04:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 19:04:09 +0000
Date: Fri, 4 Sep 2026 12:04:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] drm/xe/vm: Handle purged BOs in VM snapshots
Message-ID: <apsWJg8+R2/ADs6S@gsse-cloud1.jf.intel.com>
References: <20260904072252.4009491-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904072252.4009491-1-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:303:b7::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: 028e3a26-4767-42e2-78ff-08df0ab74cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|11063799006|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kAsqrnQ5xrWTS49oVRg8EvvmI4feQ23hyjRqvd2u1FO//eWiSreis6Lbgdc6UeCOGW9NbbFaUiOmkHfOvcn50ZBaWrYCo3fljbaTlxegX78KZSPEWVkl5ryODSfKarN5vaODOcBhwKC9tG/IzmwsMi1Uz8VadYkjkehhQXpgUOsr+f4z7OSe55BX+Nv/VEskfRR938ADfabFuMA57b4aST6IqTUami+rzuni0K0KFE2D7vGTEsLZxyJ67fzEricoJUMQmZZgklBx4uDsUcvfWzL6xSqOCfpARVElnPlWUBW413LeC59AnHh28X7sh3m83XNgGXj1dsql5XlvhTTj4toYloPI7oDHnSvq7mwcKoNGKrzuZ6M+QqOcq4RdtEHiUCCEUoR6I46vOwIwDEaW/dXCFDxXK6EvEGhNCkmgrpEkYo3yoQ/orliEenonUo/fuvXFl9IaCQONTQLDopy78pK2vnCMW5skIUFc19rFcbt8J5EAyV+PCYFOvaIFYiIxguaBQ8LxShjnCXcu3U2lnpH2YfFQhFYf6YDui7lH9ofkvpKdd8l9DpGkOO4XFEBusTQl9N/dNmL+h4m+uif3Q6I8IhhiaWHaAgCXgIfKYho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IxBrlkfHj3xqf2cd1L8H/jXyc3tgxGzsGSYYU3eGUcfvEQzqTD8oPPhnJU?=
 =?iso-8859-1?Q?abrZkPHK3yzCFCspu9Dvo/YnnuaDrZc8MdoTpwPLSID2lOnknqAQ8vFme+?=
 =?iso-8859-1?Q?RKjeRZDlEafCGWeLt4zKjffXwMOUhP8DO2lDTyBzN3XbiLo4LYV/lE5HLv?=
 =?iso-8859-1?Q?e3pz94UMoMMttwWtHHEFY1Q7m6wj8OOZaPNyeOmjPUJii1LakAc9GhjoSi?=
 =?iso-8859-1?Q?5Brv6/Nlv0uzxtWzPq67tE4LmntIfqZotzM3ECg6CLGr5UbFKW/KlUTGc5?=
 =?iso-8859-1?Q?0AfadTZ+k2OAJC61oJipPpZJKvsh/fvipTNYrJW7jU58O8AaglWrHpPSQc?=
 =?iso-8859-1?Q?3GNci4I52UsOnC3W1sTERUWywkRjLm18RWin4Q6LT02N5KMtiry6hOncGa?=
 =?iso-8859-1?Q?7I1hlxCvQBwRDkYbT19LwTaIFkzteVpe4NqthYDcexeWkHZ1ce+dNYvTIt?=
 =?iso-8859-1?Q?lFe5uz3CjHx+PxbZ3kAgwmnGniCYB9rfv9+ywrFWuqOILIJR+8xi/Mo8dk?=
 =?iso-8859-1?Q?FWqFVTMFB1URhVsuZYUD/Nz97lA4KpONKA8IXgsgXxqp0DcHZ54/CV6IHZ?=
 =?iso-8859-1?Q?KbgvIHBi4KmSyg57wQgHRRce7E89QHB1ArbC201tApaDgm1hvGK/rAmQbz?=
 =?iso-8859-1?Q?HXhnTmQ/HYXN8Die0iy1pchyhA3jwkY/TkidWmDKqUGXr2i7hzpos7FHcc?=
 =?iso-8859-1?Q?v6j3FXvMp3g353TKOdDfNb+c2IDKpaBIw3ssHWlEBzUeJAoqxKnmEaSmCh?=
 =?iso-8859-1?Q?tOXs4gH71EKizbWTgk0BlY74v9DnQTX1IWHoE3qlkgpi0gtPNlXreeOl8P?=
 =?iso-8859-1?Q?is1rJhQQ2FNM9cSBDwcuEBB8QpDaCDphwjTgTQwArqoFJrKbBvQqWD9yu/?=
 =?iso-8859-1?Q?qu6lPoOP25rkybG3IgEC5oYGZODrM7CW2+9T7yZc2s8ZCacyrwDQYVuZTG?=
 =?iso-8859-1?Q?c8ZsBjppM17r5lp0mHNkc19xqqeBORAROQXHgxotd7ZHQ5PlkDFAu9TwH9?=
 =?iso-8859-1?Q?ZEJh+UAS1m07oYyzkvqfiLyr/rrU+ZVkqjCRv3iHDizNQ8eXZ6LBdRpzpB?=
 =?iso-8859-1?Q?GeTdFmVaAYAMFAjhtpYjVG40WfM6BaLHfttXdZcS+/iZYkbD88wS04Ex3m?=
 =?iso-8859-1?Q?Ef7WB1UlDiPUrMpQowH3zKxOxoI9s+QCsnM/DNdw0bW6Z6UmiWM7FouPHT?=
 =?iso-8859-1?Q?+q+imnsMwnaAQ3SNvSqg/ZWzOCKXqeL9cq+Pde3cHt51oH0l0C+ItLDfdz?=
 =?iso-8859-1?Q?w4BIAaJ3Xs8V07oAAIgbURIE2Ug7io2jN9Y8akCy8ZDuaVs8/lgS7kWmSA?=
 =?iso-8859-1?Q?m3qs2RFH6W9D3ELItbW+/BG7FBx+8F1JlZ5gRYI80UCXa9uehX1g5tCtzr?=
 =?iso-8859-1?Q?vACTRj0BZX2thmQ+xVoN7YHMC+HaCb+jfxEYRZTOwaMWRCVq6q8OJgYyib?=
 =?iso-8859-1?Q?6ucN18EMmZBSTYpi660H84eMkywkStb75h28i5ugYOLwaSf9Jx9sFqL2dO?=
 =?iso-8859-1?Q?IvG5mVaZeTmU73iJhIcBD0XMVmuHdkrtEaiI+0f2bU3MBFyCZJroTSyJvA?=
 =?iso-8859-1?Q?zN+DQQQtoa3Ug9zw00WAe73lkqfnmF9Ddwb2EjBwbo0hrkmV5FHIcSDitE?=
 =?iso-8859-1?Q?LcwCX9KeGql8jOUf15NoymxoonZ9L7/LnSJi5JHy0sHDrd6LMDAwH+7qRN?=
 =?iso-8859-1?Q?Jfsze+UjipxZZ2CcbSuMraq3z4XcfOeDK9KF3ds3gGJnvy5iRAkr+qlhV6?=
 =?iso-8859-1?Q?AjQagzBxRtJS4kaQIr8eFjReAlmXM0w0whs6r+Mr3KS7Tf9NjegX33LWXY?=
 =?iso-8859-1?Q?p/J9um+u7Q0fboQFH61fVkSRg4oKr5o=3D?=
X-Exchange-RoutingPolicyChecked: mLxK8aDgLDxNUPfKn0reop9pC1Qo6AxOk8MbaJe6r/O2K7Ik5tAWCtZY06KDJ6hO6UOzNo2bOMF3aDQt6XoqU5ql5vq8EbkbrUIvl9srlXybErrZWJnkXSRAnzqci/AHFfhV+Y+EjnR6WhepVLuv/CBCosKYFdOz2AE4QuOH+8c0zqrrDSrOKVUPe/XDRv8RRoLcsyZaYHQ00p5q6q+QUs3xhzz+rEVKRGv6dTc4eFEnyR5GBG9VSMq4m2recPwJRAcerrFXXT0zgWnIhvw0JRp2ciLkfSAGtqjBlFqjw5ND1jsT1DoVQ2pturaBkTk4aXbb2qxepXNTp3ALBktJkg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 028e3a26-4767-42e2-78ff-08df0ab74cae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 19:04:09.3615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yp0adxCm4+Dsgx1XABXmzELCZea3z1lrfN0RuFr0fGsgK9As/QCQq0sneEoeVaXf/5Jqnif4RX9Hr4KcxuxDMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7150
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

On Fri, Sep 04, 2026 at 12:52:52PM +0530, Arvind Yadav wrote:
> A purged BO can remain in a VM after its TTM resource has been freed.
> xe_vm_snapshot_capture() can then dereference a NULL resource while
> capturing a devcoredump.
> 
> Record -ENODATA for the affected VMA instead of dereferencing
> the resource.
> 
> v2:
>  - Read the BO resource once with READ_ONCE(). (Matt)
> 
> Fixes: ad9843aac91a ("drm/xe/madvise: Implement purgeable buffer object support")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260831064942.315720-17-tejas.upadhyay%40intel.com?part=4
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

I think Sashiko is right this can race with a kfree but that isn't fatal
as this kmalloc slab memory (kernel can just access it) and we only read
(non-destructive if we touch the memory), so worst case is we get the
wrong answer. I think I'd rather sample than deferring to when we can
take the lock as we are more likely to get the right answer if memory is
moving.

So accepting the race:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 19b3d0be7928..fcdd34c4f0fa 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4663,20 +4663,29 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
>  			XE_VM_SNAP_FLAG_READ_ONLY : 0;
>  		snap->snap[i].pat_index = vma->attr.pat_index;
>  		if (bo) {
> +			struct ttm_resource *res;
> +
>  			snap->snap[i].cpu_caching = bo->cpu_caching;
>  			snap->snap[i].bo = xe_bo_get(bo);
>  			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
> -			switch (bo->ttm.resource->mem_type) {
> -			case XE_PL_SYSTEM:
> -			case XE_PL_TT:
> -				snap->snap[i].uapi_mem_region = 0;
> -				break;
> -			case XE_PL_VRAM0:
> -				snap->snap[i].uapi_mem_region = 1;
> -				break;
> -			case XE_PL_VRAM1:
> -				snap->snap[i].uapi_mem_region = 2;
> -				break;
> +			snap->snap[i].uapi_mem_region = -1;
> +
> +			res = READ_ONCE(bo->ttm.resource);
> +			if (!res) {
> +				snap->snap[i].data = ERR_PTR(-ENODATA);
> +			} else {
> +				switch (res->mem_type) {
> +				case XE_PL_SYSTEM:
> +				case XE_PL_TT:
> +					snap->snap[i].uapi_mem_region = 0;
> +					break;
> +				case XE_PL_VRAM0:
> +					snap->snap[i].uapi_mem_region = 1;
> +					break;
> +				case XE_PL_VRAM1:
> +					snap->snap[i].uapi_mem_region = 2;
> +					break;
> +				}
>  			}
>  		} else if (xe_vma_is_userptr(vma)) {
>  			struct mm_struct *mm =
> -- 
> 2.43.0
> 
