Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34999D116F3
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 23:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6E610E4C0;
	Mon,  1 Dec 2025 23:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OG+OjVbj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7874C10E4C0
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 23:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764630167; x=1796166167;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=q8ylzriwQ881uXS8S9u2GNXb22AwgpS6lyP7liiON9s=;
 b=OG+OjVbjX4fu1s0McFVNeFzZqO2b3g4ZmJK2MOoUKGv3tzOBfn5Mc19K
 izuTE25rkUHfl/uyevuQ/gdjN2l3kEGOC12pAOORK+lA8bu5qatDGzz0o
 hJHqEG6ot0uGcH8GFVkWqYeEN/wYEkxDsPKUn7aAY63rZCamaJZnSa6Kg
 O9sHJtyVvv76XLNQpAGvjzg7YrZBiilKTRfgGN3vz/eE9kQpowgCXQXRt
 r2a+FIX89i7xJjtQtQlR8JSPZSvitltwxMObKNbiTfojTKgZMBlrpAW/4
 aWlTc+HyFxtzZ8G8opm88baQI41pWFPrYcq+YtbYRXnD9KC5qehr38vVM w==;
X-CSE-ConnectionGUID: QpEGz4QSTHGdRnVtI8nUng==
X-CSE-MsgGUID: nyZyA+8fQyiQZrp9Bzm9vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66749175"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66749175"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 15:02:47 -0800
X-CSE-ConnectionGUID: a2IYU72rQjKqGGyMxr4T0Q==
X-CSE-MsgGUID: FMOxI8SpQ8CxBSFLZG8JyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194031239"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 15:02:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 15:02:46 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 15:02:46 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 15:02:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIYRv7sybtVlNsjUh2PSJgKWm7hyXKNU5fgqhe1ztvg4yVRImkIplKXRqGg6zinHhCrlSkTKSt5s+qzuia6TglNjaqPBwhTb7VZjpdHBGdtLRm1lLNRQEqbb7JJZGbLYBISN5M8am7gsm+Y1NAA0Lai/x7lIeGR8pDHnBXCeCv4T0LfWWtZmGnSkeRpY3B0qPgvmeuvnOkRkqs+qMV6JXApkOGCr+6iXq2dhytRYeRDX9VJng3gcx5KShjn6sNjXJD91s9xcwqJdSIxTBRf9MOde9OWocJiETuYTaJB5YTSmoT3ByL1UEiUvZaepaOJcFCfsKxWl1P9XCXLyaY03Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIWLuo9V09J+KJjQ2DOoFu6fcWJu4RF3gV1sGH6OwHg=;
 b=BXMI5NuDeD/83MtBq0MwYl2U+aCcz32SV0xt3bR9V4gGnfiAUISmIbWFq12RMTsYlYXoUN6y+dvGUqZ4BXPXeJ6n5FfjFICWlkMVS+mDqLrLTCQKLYU85jk7vRH1oColX76R5iqrIV/MQk+gSDNHisvKdBcpZNW63Bz83yhM7S3pQSZhmLWvknGNu1ZggW+fbfjbqW0XxZXtutb9olJnKvWs14pqvqMwjVBtxQJ5Wihuqb41BRy5qUE6toFP1u4yJwcLEFqFvqS9CucgQ2kT04eeZYGBUPaGC4FiJo+IGrg5brUXl6ZP8gkm/YrEFj0nJdwcPPn3T5yLcJ3yQNgT2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6481.namprd11.prod.outlook.com (2603:10b6:208:3bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:02:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 23:02:44 +0000
Date: Mon, 1 Dec 2025 15:02:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [RFC v2 2/9] drm/xe/bo: Add purgeable bo state tracking and
 field madv to xe_bo
Message-ID: <aS4ekWE6xfeYUcOL@lstrano-desk.jf.intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-3-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201055309.854074-3-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0370.namprd04.prod.outlook.com
 (2603:10b6:303:81::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6481:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d8516d-c7e7-4ac6-87f2-08de312dbcd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?35GfRznNx04zlYF7m/2iszDBKlL/kgtSx1arbl5KR2iBaDl4kQU62LzPJ2?=
 =?iso-8859-1?Q?QuPNcesJPpyZNrBy0EgEP/EMPVdbLNtPXctiNmcNQNz2GuoAsO3ue+KQ3w?=
 =?iso-8859-1?Q?0/TE/TvlxRyvtkVSCubFdEMK8eoOV9jJnnTHlW/uZGyKgTopguN1xeKUjJ?=
 =?iso-8859-1?Q?RfEA4B414gl4jCw+1F6qsrmM54GBkeJ+rHDmjnTDP1W8mjmj82RbesmIwQ?=
 =?iso-8859-1?Q?+IPu19iMH8sCs0MROq6nsW0WgruOWEFS/667cWgsVelX6+Rc4OMywBlfzR?=
 =?iso-8859-1?Q?zlp2+aMGNQiIRk8KZQfFRFHVkR0qCoHsxkmqO5v0hwhFqt74D7LmiVcLqD?=
 =?iso-8859-1?Q?fdxGoPaYkSC4vVu9Ooywu7S3TOUa26KrMRFu97ZXcW0fPVwfz8FcdsQQDk?=
 =?iso-8859-1?Q?yzrEZsXXNSoyTYRhfsymHcQWwanrYuLQfH2W2occNTL2/L2a8M0iGk4jM1?=
 =?iso-8859-1?Q?idEiFkF7nnHmuEGFdh3S688+6qw+uEqoWn524w3hxaW3JuwteQOyGbPdb7?=
 =?iso-8859-1?Q?s3kXlOSF6FhORgI+8b9WyUrucOgpO4nWs0tWeXwX0supbJxb2oOAtfFTPo?=
 =?iso-8859-1?Q?lRAHKNZGy8Hg4brtY2qMLaH/wk+jEhRC57jt2Z7wM6H2q73qVA5h7lT8RX?=
 =?iso-8859-1?Q?e6CHqqSq5Yxw8P6rPzyJLOB2enidjqKwZuCilP4jwy+2hG6m7i5sXqM9lP?=
 =?iso-8859-1?Q?KKPMKqNcKetLNUbhcc3wt7KCoqhge5W9R1xmMd14gnnSE9PaC5Ln/OR2LK?=
 =?iso-8859-1?Q?WDrn1RThYtZ03iV/eyE/h4mCVg8in9c6s9JdGIjdAjU9qO6/1cO9J+ENds?=
 =?iso-8859-1?Q?WkpVMq+ckzD6NbuA8eoWyp2i01PwIJXv3S2nXd7LyZZBooDG/G+CM0QYVs?=
 =?iso-8859-1?Q?KS1PdRT8l0C/k9sbawk/oFDvAcdr2/3oHgfZJFxD08iYaFYiDNhSkVuiik?=
 =?iso-8859-1?Q?k2GkviSFrND9ZoBIpAsKpNHUPrYszNrzp2kCzahFDIraOZd1aDp32alcuj?=
 =?iso-8859-1?Q?c3VYOuzz5dbr/vihVCanbCdrAzKd7o75p0jkh987+d0rPO2WKRb3g3uEho?=
 =?iso-8859-1?Q?SohEP5sDkgQyRyXYc4vLujHTQ91kXyyjBYifdW/pC04R5XGIydOLsActxc?=
 =?iso-8859-1?Q?ZyCkmqQa2l5SOKpUEXGIdwFUEATIIRPj6ZYlBGX3h79/s3gd2PHaKvwNKJ?=
 =?iso-8859-1?Q?cHN/5wz2SWX1+f/oSzHX3mDbPCq2MOpYsP2+2diJuWqxDrbsWWkw/PjVv+?=
 =?iso-8859-1?Q?/NFCqAOU4SOy5RmEdqeT61wSogIIafO7oRychEH4Ey5E4aU4ewGAWV41qu?=
 =?iso-8859-1?Q?JsLCzz9aLVYe5JvbW4FE0qe5eqeg58x6L8W8znPg0wZMfkysH/sp8wmJ37?=
 =?iso-8859-1?Q?Kgmj252pY7z66855ztFCfczsZf+VSUTfh5dthOXtXEC8Lkqa0muS65C5JG?=
 =?iso-8859-1?Q?sDK0ACZOXJi8J8xWoOTtbVU48DYcW2IT9WChica1nntkR1FIH15G+DwLZM?=
 =?iso-8859-1?Q?+ZjC1K/MFSBbohIoau7uTA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GPd6Aj4XMCJWUJN5YvaUzuqGFHiLFUpr4+nmeAg8ozF3E2k/ewDGm6jhRa?=
 =?iso-8859-1?Q?506pXuywV//xF6EwGUV+8N5IlmLoKtyJ+huE6ue1Z3YgVRFbExSv1uss0L?=
 =?iso-8859-1?Q?2WBWdobBw4YoY+0e++1i9q6K8EmMrADay3yBm0s1sP6a44dNAR69wKOXcU?=
 =?iso-8859-1?Q?6QKR6cINIcM330boqJ4M7Xv5mhnlmW9TGLO3HJYJodLXMADg+A2I4KXHUi?=
 =?iso-8859-1?Q?WHrKtIArp89xPK5sb7KtuNfdQcfUL9aB71Xyukot+pfFfEuzGe0W9BypXn?=
 =?iso-8859-1?Q?ahjfOTGdm5RJfPp21wRIxgq7NolOUg4XCsMbd3NOsyLAGJGtkYv2RfZEPK?=
 =?iso-8859-1?Q?gLh5CVfrLOxfVkI53x9pOLyTnIGb2CLQp4GKFLnBj3GFIXZA6OUvSa+OaP?=
 =?iso-8859-1?Q?OAu9c30LlZZJvESUWidGbZ0C4+7ktrpWul7iyYaO2uGhVmA/L1BcaFXC66?=
 =?iso-8859-1?Q?ZM605Rvrxv/BnC2rbWSIEt9yglL3f4XDwd7T+64sC88P5vj4VPBlUjIyjK?=
 =?iso-8859-1?Q?MY1WRaD0GPvuuX3zfzLiuJjKbYTQ5nyJ4V/SiwjLsCYIE7j3cXQUisqC0i?=
 =?iso-8859-1?Q?sC7Z7G5d4EqvqRD8RKTE7SW45YwM6DZv79uB1o9OEetO4+zRG+G2NIzTsu?=
 =?iso-8859-1?Q?JEVIUypFTI+5SCNeubz7JvDt64apoRQPUic4mxdtCh7+iVreLgirAsi1EB?=
 =?iso-8859-1?Q?sb6el5ne/WHejkWks8ZJMckhg4yrUW2CVb8F+RmOkMKpHdeLRBUKRibZ3C?=
 =?iso-8859-1?Q?n8D/St7AuaYYuLZH9zJLuvS+QhuAM3CrAe7iAiny8xBvquXZc7qD6uRuAV?=
 =?iso-8859-1?Q?55W5Kd9HnRodcqL0J+/ld9ISpMgNXyeLNdQ7vbSRkOUsUHqABj+mJjkS6j?=
 =?iso-8859-1?Q?vGQ3pASdQQghp5Kzcmsv2438oZHAD+RR3hNifOdyfhEPt3jrN3UXkJMVIc?=
 =?iso-8859-1?Q?dLM+MiGxtRVpTvE13mTg8KBfIFTe/1kMMtm6WkwYcA17hph2+GSTBSvkw6?=
 =?iso-8859-1?Q?6P52UoR5nqEiIbnd/vWqH9GOPtMVQLkO3/9pxfOqvg6cQDYpH+MwsVMXx0?=
 =?iso-8859-1?Q?RGScmrVW4te5X1Rz6IlKDX5kOaT4llUYY+rfwO3pM67GsI0EnoVBFeeLTF?=
 =?iso-8859-1?Q?13tGGSfkL4BydL78l1rKeBNtJQyaRPnpjIuK1eSrmeXQthS3dmCsLxnuMw?=
 =?iso-8859-1?Q?6dxQJqKehUgf/OyXunjDIAO6KVrVbakjGNMuxsjJLLDCAmv29TT0od+eHm?=
 =?iso-8859-1?Q?+GCT+cM2kUd71dnCHVjv3JnZUfxCnLHDNamOmULKVSN6FhJMN9/z90C+VS?=
 =?iso-8859-1?Q?3j98BroKjjjQ7nktCLUKzfPoJYc+aQgrL9TOB0Z+LZeT14RiEb/stY6lsH?=
 =?iso-8859-1?Q?X8IffGoMH9O79hdoyOPyPOekn+rTvLdE83mdTfHe0DygzDhNd/Y7ue/xao?=
 =?iso-8859-1?Q?aYg8epwQ29rxc+gManWo2l7SmUwZ3c8r6OldUFWJ7n8EVe5XlTqhGZj4do?=
 =?iso-8859-1?Q?ma/EO6X5i6NDJYGdb455/7QIQSifJUJFMEhBqhMfurvDhBUWPjL8buBNIL?=
 =?iso-8859-1?Q?/6Mhdq4aqc8bHQKNMWEertzwdo2YxRF8QmICvDXGZpBSuMknXzizJcD4+W?=
 =?iso-8859-1?Q?v30KRE4mHrrT54VzAY4yqHiYgQMbeHKGzJTBR5t/Vz4rFGozR2CpDOXg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d8516d-c7e7-4ac6-87f2-08de312dbcd4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:02:44.5610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LnJCiAGaSmdjvyF7sOgrMm5wsiw7XCdvMcPV8F7cFyfJGNk4HSc7vZX/WDkFjwe7+Z/ewns9sWWauZTCFo8a/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6481
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

On Mon, Dec 01, 2025 at 11:20:12AM +0530, Arvind Yadav wrote:
> Add infrastructure for tracking purgeable state of buffer objects.
> This includes:
> 
> Introduce enum xe_madv_purgeable_state with three states:
>    - XE_MADV_PURGEABLE_WILLNEED (0): BO is needed and should not be
>      purged. This is the default state for all BOs.
> 
>    - XE_MADV_PURGEABLE_DONTNEED (1): BO is not currently needed and
>      can be purged by the kernel under memory pressure to reclaim
>      resources. Only non-shared BOs can be marked as DONTNEED.
> 
>    - XE_MADV_PURGEABLE_PURGED (2): BO has been purged by the kernel.
>      Accessing a purged BO results in error. Follows i915 semantics
>      where once purged, the BO remains permanently invalid ("once
>      purged, always purged").
> 
> Add atomic_t madv field to struct xe_bo for state tracking
>   of purgeable state across concurrent access paths
> 
> v2: Add xe_bo_is_purged() helper, improve state documentation
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.h       | 27 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo_types.h |  3 +++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 911d5b90461a..b0a31c77e612 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -85,6 +85,28 @@
>  
>  #define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
>  
> +/**
> + * enum xe_madv_purgeable_state - Buffer object purgeable state enumeration
> + *
> + * This enum defines the possible purgeable states for a buffer object,
> + * allowing userspace to provide memory usage hints to the kernel for
> + * better memory management under pressure.
> + *
> + * @XE_MADV_PURGEABLE_WILLNEED: The buffer object is needed and should not be purged.
> + * This is the default state.
> + * @XE_MADV_PURGEABLE_DONTNEED: The buffer object is not currently needed and can be
> + * purged by the kernel under memory pressure.
> + * @XE_MADV_PURGEABLE_PURGED: The buffer object has been purged by the kernel.
> + *
> + * Accessing a purged buffer will result in an error. Per i915 semantics,
> + * once purged, a BO remains permanently invalid and must be destroyed and recreated.
> + */
> +enum xe_madv_purgeable_state {
> +	XE_MADV_PURGEABLE_WILLNEED,
> +	XE_MADV_PURGEABLE_DONTNEED,
> +	XE_MADV_PURGEABLE_PURGED,
> +};
> +
>  struct sg_table;
>  
>  struct xe_bo *xe_bo_alloc(void);
> @@ -213,6 +235,11 @@ static inline bool xe_bo_is_protected(const struct xe_bo *bo)
>  	return bo->pxp_key_instance;
>  }
>  

Kernel doc.

Matt

> +static inline bool xe_bo_is_purged(struct xe_bo *bo)
> +{
> +	return atomic_read(&bo->madv_purgeable) == XE_MADV_PURGEABLE_PURGED;
> +}
> +
>  static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>  {
>  	if (likely(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index d4fe3c8dca5b..57b4dc7012e2 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -108,6 +108,9 @@ struct xe_bo {
>  	 * from default
>  	 */
>  	u64 min_align;
> +
> +	/** @madv_purgeable: user space advise on BO purgeability */
> +	atomic_t madv_purgeable;
>  };
>  
>  #endif
> -- 
> 2.43.0
> 
