Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6EEC44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 05:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535E610EEB0;
	Wed, 15 Jul 2026 05:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2HycKzf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5044110EEB0
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 05:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784094649; x=1815630649;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oYRoMtufdiO1Wi6YGlGO/KWfp7mKLpchTi/8gu0D71g=;
 b=i2HycKzfEZl0CHuHJEurUAKe5RYA1JP+AJOx9jKRtN4EvndhRN9DpihN
 f1JTW0ED30BeldrsdNfxSW8TLTxZ+TdlLAK6zqaEO//YmCEZvtdFZURpx
 YsuT9+DfgeujieBetgD165h+2FRxkHpB56DBzw7V27XHdaGjiOy0/8ckk
 Dq1x/cDvK/xg64EvScn/kPRPNFWAaUh4VqITcBD/0C1/AmWYlowAZRnB6
 Yzt9NjHJkvAdXWDX64YWfM6N5QQB4FoRRrtRRl6F1p1PfGhurmz1drVv1
 lb9aU7hHpscwODiyzPp6P7DfNwZHEblkIsgV0EUM1Y94Fxk3W61SFp28A A==;
X-CSE-ConnectionGUID: PQvn1zgvQnmEl8St86P4Ig==
X-CSE-MsgGUID: +tDWVv47RO+eEkMjupZr1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96235604"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="96235604"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 22:50:48 -0700
X-CSE-ConnectionGUID: FNXOzPwGS26ZdEv6+Viieg==
X-CSE-MsgGUID: ekqt7ETwTsyzx+Oqv5VZmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="260364928"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 22:50:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 22:50:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 22:50:47 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 22:50:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxQH3/wQQ7rfZr1ArbSFaf0w2WxoYcN222oTdLPbdBxSXgmmNkovh2+zYABKoKHnxcF71/Pec+Oc9h2R9EGrjT+YOCuHW19/qS7/yo6tFks+H0Pn3L0VvZU9xkzEDOIW8jG+3Ry6oDnBv4a9iP6vE8cR79SkgOtgF+AR986WwC5jnaenOOQ+d+9zQES42WFBs6opnfyesZDIVPkOpm9DWHr4AmwA58lH8jUQWsdnigwPiyY+9xOTg/0zK0tcjq78B7gOXJumRZD4w5qAAg+dGBFc4nLSXoQEbB/DDGPHVOCxo8slH5VBwWlNRjXmlIWgsomeRfhDTbrFWxLIkmRJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNCVWlqmmyceVD6H6jhTbECFHx8coAYTOTuwZD1C8FY=;
 b=RJQ9PmSVE9MGhgpuWe+k3ph7lHEmSVTj3Q8eshUvlfCDxiNukQEx1jnk3lAeeHwbfpIj/CZaYzESmmkLz5QdZpgbOr2x5m+4qVz2ueV7jmEnitE82zzLkqUHbW+aK9jTKOy4cHF2lRZsXP7eyJPMluKArANTX1/m4LhaOJ1AXXryGa/LJv7XUNTQ7iKJD7iSdVRGdKaSnsa3qlMtu39Z0ogbeu9XcfqXOoHLuOuPKRYtHSKGvQuXxQTvoCleUODdCL4mr32pMwW9Qe+FSrn9D1ODm5EbPoFZnNRNGwSmb956/7n3+lUjlZ5p8bA6XEkJPzMS91k3ka3FFSPUqDihoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7927.namprd11.prod.outlook.com (2603:10b6:8:fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 05:50:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 05:50:45 +0000
Date: Tue, 14 Jul 2026 22:50:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v11] drm/xe/guc: Hold device ref until queue teardown
 completes
Message-ID: <alcfssE1eHTRnpOh@gsse-cloud1.jf.intel.com>
References: <20260713042530.2108459-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260713042530.2108459-1-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4P222CA0012.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a7c613-3373-425f-3276-08dee235036f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 83AhK/UkoR/9HP34lsRVRM7SXrUFQwTunG/Y+Qi9TzS98t3ZHqXdZRIwDOuh8g4YijerUb2pSCzG8O/n5mFk/0uY+czcO20Vmb8k4ydXFaUKifFb7vWmb5Io3kCyKSoh+LpxcyyXoa2FJpOARSG7zOB72zGmZeNV+5wGDJxnGl2QNqJ9hZqPd9NsQIAeulUytIunq3pXDR5OrSJQrJ1lQe1+CjGJ5L2UynyV9hglCmikJ5uB7YPPs1LsO3dpvZHx7mKf5OZvEnxMcghCHjY6aZBRnpHrKFuGt4XjApKJBf4VytsEFNoYxMLm0SaTpCWu3F6WlMqoSzEH8Fnw6H+z0wcFV6LJuZVO4tiAevHdbEpXUXRLTubepkkMacN7auBbN7FK1yVkiykB6htJg0nl7tLsfjQs8/w1tKVmC5hshaFRqcLTfUaERVpTFczxZVYbLO9tQwewo6AHkRKBqbo0l6fDWoW9ZmSvZYv+y3AN4G0sK//mLD+TCmHpiCl3jDqOjk0lqgzFUJFrY0T7Y6E4xIF7thkB01jMovQRPrsKIx4sfwN1YZ1hpDRGfRqhejV3+lJ1Q9g2XfDrEyfVMruWA8u72Z7wE1sdeImz39PGAeVGx2uY75ve67AvTxiXE7DK5eUmU9//kdw9k7tSb5SJ+/dY82i6Btv5PAUmtOq4V8U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?S3NWYgcdoOLocFq6L08UROl8ExFU+cGPLu3L+57/w9TeK2h1eIrKS1x9wN?=
 =?iso-8859-1?Q?7dsinuH3QAy5OPap2reUFShnMTudCV64++GnRPxVq6nSwKu6HUt1Shml/k?=
 =?iso-8859-1?Q?BdLvHGFD6kKIJ/RNpgGYGpikfODjBqXBOsWqLLOiUAgUXGihsxS3kMJasu?=
 =?iso-8859-1?Q?UzB3aUqABqUemZwBocVjRdY0QHMlrL8R0AmHDv/FfrlQxjCgyjpTacIlE6?=
 =?iso-8859-1?Q?dnAJn5WDb0Tcn841zEQZEXd0cjtDZo77JJsgtmpzfzRUc7zSccQ01PqQVv?=
 =?iso-8859-1?Q?ZAFPh84izfHsIAnxsXKksvNBNLoSaDcN2HKWC8JKNE/6Hu9Athu/dq94RO?=
 =?iso-8859-1?Q?YitehNfBYXKMiZU8NdSgWNZ1g6OVgaS4Fh6IWCIDjfjxkZHUk/cBlXH3hf?=
 =?iso-8859-1?Q?s0GM+WboXVlfqmg3tvTi0MOIV4wAcUdfSeoHT9jqdLO9ZCaH6ssYji/Rt6?=
 =?iso-8859-1?Q?chKBfrmFSQnzrjZeNuWe12TYbbPTNisKjkPvo7vhTt4IKafygT0SluXvr3?=
 =?iso-8859-1?Q?M7LqIled4OGuyGwPjUHLn+nJ2mbogtvZ+BPrVSbi5Ke92IOHrBjfSFM+Ww?=
 =?iso-8859-1?Q?55jFcBBDm0atbqieggNNt1XIpasyscuLFu7CQ4kiXy+DWcBvAARQcJc9s2?=
 =?iso-8859-1?Q?A8FYx/oVfIdaTycmedIchAbP0re78D2i0xByghnyMOjoymh8SCnmm8Rs4n?=
 =?iso-8859-1?Q?aygE2zz0FotEEbglbaQRYS3UFbA6ZWlfvZVpECJ1E57kKkfN/uRvK4e4Nj?=
 =?iso-8859-1?Q?kHILPzW9WlhSC6NJBJ6OtJGfeLFMKDCjsfsm+fVKdry6NrUe7FE7YcsxwM?=
 =?iso-8859-1?Q?Gsa5pLt0UefSimWkh/RVMNo5Xx2ujD61JvcPd4/xJHJKbabZav5bWqfsgG?=
 =?iso-8859-1?Q?A3MCMOJBMf5QLSFlVUojDou2UjAj26J7xn21YwZ0v/TvtAS4nvXdUUkwRE?=
 =?iso-8859-1?Q?TbDgqlvI9/OZJFpJJYIIGxxLYq/QGRPNjrng8MSZ+MhpBvWPjyb2ozI7kf?=
 =?iso-8859-1?Q?deL+w+mE52nIL0Q7J2BXTXtAw1ErWZk7RBtfLVpVAH3NhgS8mT2a2aACHE?=
 =?iso-8859-1?Q?knKKb/JzLrBDRrWIXY4FBj2s2TNRNCpD6D5+pkWH97x/Bg0tbRutOAtR2K?=
 =?iso-8859-1?Q?3BEXBquKR426TY+H9fgQ0AUToPvA2eQPK3FieJr/Tv/VD7dyea7wmqX7p6?=
 =?iso-8859-1?Q?Yp6BI2BtgBKb7RNB0ePGVgk6tbozYGfqT9HvmE4BUzK0gsMHP7b2TGyiEX?=
 =?iso-8859-1?Q?jVLvQazNpCSh5Y4M3zvila1dE60Jv8C4cRJyRo+jJZ6TfljozzWyB9qU1X?=
 =?iso-8859-1?Q?aYWOIbs/beYEU4uEZ9t10OCx3Q7Ir83phv1DxP6eS30R24vg5Z1VzREoGx?=
 =?iso-8859-1?Q?aalB2NZjKjKkJRnAyrbf5/HTzxmZr8RFQ/KDLJkfKV9a+CbWFq9qn754Mg?=
 =?iso-8859-1?Q?utfE4pIpypbsAc/vdqOCV5XO3DPLkK8rncumA4OLUBizM2eMjVYXiAKI+5?=
 =?iso-8859-1?Q?O6C12gZKKMoRlO1LdEpLRJc0AQK72iEwsBZvmm6P0zxKz1iL33zzR3gM3m?=
 =?iso-8859-1?Q?ojnhlzEBvjejk0B3NOZKoHolPcv+tANS2TyiSbMA9F8jDnawKVDzjHfyDw?=
 =?iso-8859-1?Q?CaV27JQERVV25urUp0FBO90PYAHlzcQP+A0dRP3c95QyxZqtAzP2JG/roI?=
 =?iso-8859-1?Q?j29DuArZz4A55iCUhR1KJQsNsRkGCQiZvPq2WyVWg/DCvWsbfR6jWo4DG4?=
 =?iso-8859-1?Q?AiVejYWHX1XSvR3vt4Nn4400jGgcYiYsqrFhBnxaK+rpDBABA6fpbSSZe4?=
 =?iso-8859-1?Q?pODZKu2djA=3D=3D?=
X-Exchange-RoutingPolicyChecked: rR9yRB7U4FpOPDuTutRuw3WKi7IjrMVKhHm6itQbL0vdZa01ld0IEfvLno3woJTRPd5H0akWtIep6sQyaTLVqh0gyKCu0YzUL1vXo3z1hOt2CogPsLJuNCqYolgIBtnEKi6AY4YVp4wlKSoT3cQLnuaab7FcX/hmtQuSBqv698dCctGF76tzGWi5a0yKTjD6XVIK+IlQSpDTNa2DB/fBtQ7yD5LMk6hBXddWBrHBRHVmw+kheEjJkzd30DKdck7kSgZKhOVfF1qtIGfQ3wWhxw0kHTJA5/MCaxSTC+6zkJbfFMFnVQ8KAGedGbZJvKRi3hFdgh71tKp33eY6YyOzig==
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a7c613-3373-425f-3276-08dee235036f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 05:50:45.3397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTD0p4fY1XSzSzh/mwufKznsMqwX10BXvULSjyUUquE5FddF5vOVJlwiwYhORtRbvBzoutVgxeSchiy7yLJVNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7927
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

On Mon, Jul 13, 2026 at 09:55:30AM +0530, Arvind Yadav wrote:
> GuC exec queue destruction can run asynchronously. If the final device
> put happens from a destroy worker, drmm cleanup can end up draining
> the same workqueue and deadlock.
> 
> Hold a drm_device reference for the queue lifetime and drop it after
> queue teardown completes. This keeps drmm cleanup from running while
> async destroy work is still pending.
> 
> Move GuC destroy work to a module-lifetime Xe workqueue and flush it
> on PCI remove so hot-unbind/rebind still waits for pending destroy work.
> 
> With queue-held device refs, guc_submit_sw_fini() cannot run with live
> GuC IDs. Replace the fini wait with an assertion and remove the unused
> fini_wq.
> 
> v2:
>   - Rebase
> 
> v3:
>   - Switch to queue-lifetime drm_dev_get()/drm_dev_put() model. (Matt)
>   - Queue async teardown on system_dfl_wq instead of xe->destroy_wq. (Matt)
>   - Drop separate deferred drm_dev_put worker.
>   - Remove stale drain_workqueue(xe->destroy_wq) from guc_submit_sw_fini().
> 
> v4:
>   - Replace the guc_submit_sw_fini() wait with an assertion and remove
>     the now-unused fini_wq. (sashiko)
> 
> v5:
>   - Move destroy work to a module-lifetime Xe workqueue instead of
>     system_dfl_wq. (Matt)
>   - Flush the module-lifetime destroy workqueue during PCI remove to
>     preserve the old device-remove wait semantics.
> 
> v6:
>   - Keep SVM pagemap destroy work on the per-device destroy_wq to avoid
>     letting it outlive the xe_device/drm_device. (Sashiko)
>   - Use WQ_MEM_RECLAIM for xe->destroy_wq because SVM pagemap destroy work
>     can be queued from the reclaim path.
> 
> v7:
>   - Drop the per-device xe->destroy_wq and use the module-level destroy WQ
>     for SVM pagemap destroy as well. (Matt)
>   - Rename xe_exec_queue_destroy_wq_*() helpers to xe_destroy_wq_*()
>     helpers because the WQ is no longer exec-queue specific. (Matt)
> 
> v8:
>   - Rebase.
> 
> v9:
>   - Keep SVM pagemap destroy work on the per-device WQ_MEM_RECLAIM
>     destroy_wq because it can be queued from reclaim and embeds
>     the dev_pagemap used by devres teardown. (Sashiko)
>   - Keep the module-level destroy WQ GuC-only and drop WQ_MEM_RECLAIM
>     from it.
>   - Update the module-WQ kdoc to document the GuC/SVM split.
> 
> v10:
>   - Keep xe->destroy_wq per-cpu while adding WQ_MEM_RECLAIM to fix the
>     workqueue allocation warning.
> 
> v11:
>   - Drop the SVM pagemap destroy comment as it was revision-specific.
>     (Thomas)
> 
> Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Sashiko flag 2 seemly valid pre-existing issues and one non-issue. The
two former can be done in follow ups. 

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  2 +-
>  drivers/gpu/drm/xe/xe_device_types.h |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c   | 66 ++++++++++++++++------------
>  drivers/gpu/drm/xe/xe_guc_types.h    |  2 -
>  drivers/gpu/drm/xe/xe_module.c       | 49 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_module.h       |  5 +++
>  drivers/gpu/drm/xe/xe_pci.c          |  6 +++
>  7 files changed, 100 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index ad7f3e61d457..47630e9f7410 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -581,7 +581,7 @@ int xe_device_init_early(struct xe_device *xe)
>  						       WQ_MEM_RECLAIM);
>  	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
>  	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
> -	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU, 0);
> +	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU | WQ_MEM_RECLAIM, 0);
>  	if (!xe->ordered_wq || !xe->unordered_wq ||
>  	    !xe->preempt_fence_wq || !xe->destroy_wq) {
>  		/*
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 022e08205897..56c17cca79c0 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -355,7 +355,7 @@ struct xe_device {
>  	/** @unordered_wq: used to serialize unordered work */
>  	struct workqueue_struct *unordered_wq;
>  
> -	/** @destroy_wq: used to serialize user destroy work, like queue */
> +	/** @destroy_wq: used to serialize SVM pagemap destroy work */
>  	struct workqueue_struct *destroy_wq;
>  
>  	/** @tiles: device tiles */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index cec3bbf3a10e..0dd2c9913e78 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -10,6 +10,7 @@
>  #include <linux/circ_buf.h>
>  #include <linux/dma-fence-array.h>
>  
> +#include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  
>  #include "abi/guc_actions_abi.h"
> @@ -37,6 +38,7 @@
>  #include "xe_macros.h"
>  #include "xe_map.h"
>  #include "xe_mocs.h"
> +#include "xe_module.h"
>  #include "xe_pm.h"
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
> @@ -232,17 +234,9 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>  static void guc_submit_sw_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_guc *guc = arg;
> -	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_gt *gt = guc_to_gt(guc);
> -	int ret;
> -
> -	ret = wait_event_timeout(guc->submission_state.fini_wq,
> -				 xa_empty(&guc->submission_state.exec_queue_lookup),
> -				 HZ * 5);
>  
> -	drain_workqueue(xe->destroy_wq);
> -
> -	xe_gt_assert(gt, ret);
> +	xe_gt_assert(gt, xa_empty(&guc->submission_state.exec_queue_lookup));
>  
>  	xa_destroy(&guc->submission_state.exec_queue_lookup);
>  }
> @@ -319,8 +313,6 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>  
>  	xa_init(&guc->submission_state.exec_queue_lookup);
>  
> -	init_waitqueue_head(&guc->submission_state.fini_wq);
> -
>  	primelockdep(guc);
>  
>  	guc->submission_state.initialized = true;
> @@ -411,9 +403,6 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q,
>  	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
>  				     q->guc->id, q->width);
>  
> -	if (xa_empty(&guc->submission_state.exec_queue_lookup))
> -		wake_up(&guc->submission_state.fini_wq);
> -
>  	mutex_unlock(&guc->submission_state.lock);
>  }
>  
> @@ -1708,6 +1697,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>  {
>  	struct xe_guc_exec_queue *ge = q->guc;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct drm_device *drm = &guc_to_xe(guc)->drm;
>  
>  	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>  		struct xe_exec_queue_group *group = q->multi_queue.group;
> @@ -1726,36 +1716,52 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>  	 * (timeline name).
>  	 */
>  	kfree_rcu(ge, rcu);
> +
> +	drm_dev_put(drm);
>  }
>  
> -static void __guc_exec_queue_destroy_async(struct work_struct *w)
> +static void guc_exec_queue_do_destroy(struct xe_exec_queue *q)
>  {
> -	struct xe_guc_exec_queue *ge =
> -		container_of(w, struct xe_guc_exec_queue, destroy_async);
> -	struct xe_exec_queue *q = ge->q;
> +	struct xe_guc_exec_queue *ge = q->guc;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct drm_device *drm = &xe->drm;
>  
> -	guard(xe_pm_runtime)(guc_to_xe(guc));
> -	trace_xe_exec_queue_destroy(q);
> +	/*
> +	 * guc_exec_queue_fini() drops the queue's drm_device ref.
> +	 * Keep the device alive until the PM-runtime guard unwinds.
> +	 */
> +	drm_dev_get(drm);
>  
> -	/* Confirm no work left behind accessing device structures */
> -	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> +	scoped_guard(xe_pm_runtime, xe) {
> +		trace_xe_exec_queue_destroy(q);
>  
> -	xe_exec_queue_fini(q);
> +		/* Confirm no work left behind accessing device structures */
> +		cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> +
> +		xe_exec_queue_fini(q);
> +	}
> +
> +	drm_dev_put(drm);
>  }
>  
> -static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
> +static void __guc_exec_queue_destroy_async(struct work_struct *w)
>  {
> -	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_guc_exec_queue *ge =
> +		container_of(w, struct xe_guc_exec_queue, destroy_async);
> +
> +	guc_exec_queue_do_destroy(ge->q);
> +}
>  
> +static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
> +{
>  	INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
>  
>  	/* We must block on kernel engines so slabs are empty on driver unload */
>  	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
> -		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
> +		guc_exec_queue_do_destroy(q);
>  	else
> -		queue_work(xe->destroy_wq, &q->guc->destroy_async);
> +		xe_destroy_wq_queue(&q->guc->destroy_async);
>  }
>  
>  static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
> @@ -1950,6 +1956,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct drm_device *drm = &guc_to_xe(guc)->drm;
>  	struct workqueue_struct *submit_wq = NULL;
>  	struct xe_guc_exec_queue *ge;
>  	long timeout;
> @@ -1961,6 +1968,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	if (!ge)
>  		return -ENOMEM;
>  
> +	drm_dev_get(drm);
> +
>  	q->guc = ge;
>  	ge->q = q;
>  	init_rcu_head(&ge->rcu);
> @@ -2037,6 +2046,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	release_guc_id(guc, q);
>  err_free:
>  	kfree(ge);
> +	drm_dev_put(drm);
>  
>  	return err;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index c7b9642b41ba..31a2acb63ac3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -100,8 +100,6 @@ struct xe_guc {
>  		 * even initialized - before that not even the lock is valid
>  		 */
>  		bool initialized;
> -		/** @submission_state.fini_wq: submit fini wait queue */
> -		wait_queue_head_t fini_wq;
>  	} submission_state;
>  
>  	/** @hwconfig: Hardware config state */
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 39e4fc85f019..848d65265443 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/init.h>
>  #include <linux/module.h>
> +#include <linux/workqueue.h>
>  
>  #include <drm/drm_module.h>
>  
> @@ -88,6 +89,50 @@ static int xe_check_nomodeset(void)
>  	return 0;
>  }
>  
> +static struct workqueue_struct *xe_destroy_wq;
> +
> +static int __init xe_destroy_wq_module_init(void)
> +{
> +	xe_destroy_wq = alloc_workqueue("xe-guc-destroy-wq", WQ_UNBOUND, 0);
> +	if (!xe_destroy_wq)
> +		return -ENOMEM;
> +	return 0;
> +}
> +
> +static void xe_destroy_wq_module_exit(void)
> +{
> +	if (xe_destroy_wq)
> +		destroy_workqueue(xe_destroy_wq);
> +	xe_destroy_wq = NULL;
> +}
> +
> +/**
> + * xe_destroy_wq_queue() - Queue work on the destroy workqueue
> + * @work: work item to queue
> + *
> + * The destroy workqueue has module lifetime and is used for GuC exec queue
> + * teardown that can outlive a single xe_device. SVM pagemap destroy uses the
> + * per-device xe->destroy_wq instead.
> + *
> + * Return: %true if @work was queued, %false if it was already pending.
> + */
> +bool xe_destroy_wq_queue(struct work_struct *work)
> +{
> +	return queue_work(xe_destroy_wq, work);
> +}
> +
> +/**
> + * xe_destroy_wq_flush() - Flush the destroy workqueue
> + *
> + * Drains all pending destroy work. Called from PCI remove to ensure
> + * teardown ordering before the device is destroyed.
> + */
> +void xe_destroy_wq_flush(void)
> +{
> +	if (xe_destroy_wq)
> +		flush_workqueue(xe_destroy_wq);
> +}
> +
>  struct init_funcs {
>  	int (*init)(void);
>  	void (*exit)(void);
> @@ -109,6 +154,10 @@ static const struct init_funcs init_funcs[] = {
>  		.init = xe_sched_job_module_init,
>  		.exit = xe_sched_job_module_exit,
>  	},
> +	{
> +		.init = xe_destroy_wq_module_init,
> +		.exit = xe_destroy_wq_module_exit,
> +	},
>  	{
>  		.init = xe_register_pci_driver,
>  		.exit = xe_unregister_pci_driver,
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index c75153471248..a0eb7db07770 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -8,6 +8,8 @@
>  
>  #include <linux/types.h>
>  
> +struct work_struct;
> +
>  /* Module modprobe variables */
>  struct xe_modparam {
>  	bool probe_display;
> @@ -26,5 +28,8 @@ struct xe_modparam {
>  
>  extern struct xe_modparam xe_modparam;
>  
> +bool xe_destroy_wq_queue(struct work_struct *work);
> +void xe_destroy_wq_flush(void);
> +
>  #endif
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a3b968bccd40..cdf30a50a938 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1118,6 +1118,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  		return;
>  
>  	xe_device_remove(xe);
> +
> +	/*
> +	 * Preserve remove-time flush after moving destroy work to module
> +	 * lifetime.
> +	 */
> +	xe_destroy_wq_flush();
>  	xe_pm_fini(xe);
>  }
>  
> -- 
> 2.43.0
> 
