Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB8CC25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 21:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3685989186;
	Mon,  3 Jun 2024 21:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbX+9cC0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF7A89186
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 21:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717451547; x=1748987547;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=c3gzCw1sFy5RhREUrShDn4SGAxmMZKrp0gb1PEUcdUY=;
 b=KbX+9cC0k48d7VZQL1YUzqZ4w+J9pzpgCWLB/XcUxvrf62CR97Ip0im6
 8gTJVp9ZT2UqRonH5QyU1o5gpzm2j/l/KtM+9w1144qmr/pCi/J0WVj5e
 DOYnDCbpVH+zc1EJQGG59JFvS9unC7SP2wrrUFxsa0lwEfUUPF4Dq7CAn
 cRN5GfOsiqbDimIkEDFHzLTneflALuijjXPLegdgAaFlGA2vhhHxidnpM
 QaBH3npViAmFMIm/Aq0g2GwpxVXs0CzB5DFX7QpQLnHegng9wlQK6dJsc
 fRseamITeBrnpG41Okdzt3m4iyJdMXY+h8vxz2YLvItqWDlEKnPESxiFu Q==;
X-CSE-ConnectionGUID: InkWq9lrTMaIcNhlq60NZg==
X-CSE-MsgGUID: 7FyV8X5/QxWS1xjgDwtAxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13718563"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="13718563"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 14:52:26 -0700
X-CSE-ConnectionGUID: VbZ6MbzsRs+yAsMB89LDcQ==
X-CSE-MsgGUID: MOaeQH34TZm9pANK2/bP8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="36899945"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 14:52:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 14:52:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 14:52:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 14:52:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXyq6uzWs/cAW23Zl7K+BcoAS5KpS2obcxcvDybiQ6F1DNPbsKbEJ1ADPtDdPKEv7QmvTHgkyZQB+8WK237GQZKxBRCxKKmvzhvN+PtlEIoC7FlGNpt/MUOA28qpg28FpwEVGDbPwMutJ+NC6yb49sT30x7ZtVUxxH0ItqrxjFc7TgyyXlat//WVZJb9k+nT26uFVhXpVUZhq0QMkXGkiBR+58bp0cwL9WK7Cy8hlK5YfvY0n7Ic0Czzuw+ze0NjwN87AonV84hR8Ga4M6WGbm/+QaEhgp5n3v+vCjgUSJ+/P/fEmfG3dvFQBgGLzKCg05refYEpjg5kic3iROoOdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XuDaF2mLkRxr9RnnHFIfbs06v3OKAzRniHZsQe53FTk=;
 b=H3fRFfvAjHTKFL6ICurMZEw7pYwylxASPXDU/STUgz2/qTYAwuvvogMsRy9sYJ7y7j3p03hm1bgAeV6uf/UNNkoAZBKadIkx2oBm3RKvp9QVeIckLIy+L8wbOZ0CgYsIkZOA24+o7iqmIbUjEiomyeNpYLftYbv/8xvjLYTiOfTYfUUEQZBFGxFSzkyut/t/TjoHG5/pKjMGG69hdh1B/3S5t3FFJ8WWHqsCrX9ZWE79XzEjC5KvcUp6Z2FkqKI/A30xB0Kx2R2q5AFJego0ILS2gdO8QeMl8Bmhpd5S2h1GiTJz3UX4eKTkvRKu+5nQj75ROOs6UwGruUruOjtIvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ1PR11MB6276.namprd11.prod.outlook.com (2603:10b6:a03:455::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Mon, 3 Jun
 2024 21:52:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 21:52:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH 1/2] drm/xe: Avoid fbdev suspend at runtime pm suspend
Date: Mon, 3 Jun 2024 17:52:17 -0400
Message-ID: <20240603215218.14278-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0019.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ1PR11MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f621d0d-2b1d-46fe-6b47-08dc84177272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vIgVo8Ak0VVHNTzwBuPpNoMylPDl5a7iS60TdBkGun6U6eWBsdjS/fQttWoj?=
 =?us-ascii?Q?gqU4GZjmwYyBn7X7jIGnRcaAjeucQhQ88akr2cZQtopkEVLW87gbjiaGbjOQ?=
 =?us-ascii?Q?P0OyT7v91Y+EuBgFOFKUd7WsN4/KuVL8yjSf6nzJmXRD6EqFjeZgQcBf66ur?=
 =?us-ascii?Q?Z+IAU8c1EtMtSrHMDIn5ySgZTWiCcwzki4BWv+frPsoOIVseVkNMhUf2unUZ?=
 =?us-ascii?Q?s7kpGBZmskRXfWKLVAC/wvdhFh1/iel/JvSPRYEA1OqYsWr4QIDFym4fwiVu?=
 =?us-ascii?Q?/nHX+IYAW8FsDvJGHwfnLVAVk3wSMoHG9UCdIYpgeHieXHa7GgdSH2Mhb2IV?=
 =?us-ascii?Q?KUt3QdfVCV2ZVkMq251oyOev3/PHTcgPdG4Jdbb6Evv9ADE9Vo06L/Wqzib/?=
 =?us-ascii?Q?UcMInOsm9AT6bgwLtTyVRUBZhB5rTIwxkRMARELqQkpAKxuxtTmPmfty/Xef?=
 =?us-ascii?Q?zE0GVRtBK41Omijrrj4tY6zpaeRIndvsvmoC9Sih542h+9pVpQr/k8Nbd/OL?=
 =?us-ascii?Q?PxctiF4ff88u4F9D47uzSkJm6CiIxuYlWZGsh8xv5+jPS75y/emxVncVHlOz?=
 =?us-ascii?Q?ZOiX9d2eEmpqI7mpUqeHVrsa1dMbXaz+r+At13QtbA8CCycDHRXuNJ76CDYd?=
 =?us-ascii?Q?M9anjuRNXVNpZjwGH8rCtS6ElwzX3/niiHAPvK4flFNfwDvfeOnua28GfeJG?=
 =?us-ascii?Q?rLULdEjiyrqykFVnox4eDxDdmD5kssk/lCaZ2fVNwfhmruhd3o/J4US63H9D?=
 =?us-ascii?Q?PU1qmbNg7r8z6OvYoOFh8+/h631ZXU+/4OHomBfuwHzQeKH8uokW4DS6lvl7?=
 =?us-ascii?Q?Z0Zw0WlROupS9Hv9WK1SlZYYMmvs+6bKbaKm3AKN5OtBkSkG+ZTUYhBYrdrq?=
 =?us-ascii?Q?WjjMnbuI/9AAcc9+Ix9k1Dec9KMN72UbSfFshMVuIKm7ZemFbOvKavdWri7V?=
 =?us-ascii?Q?hGIUoOUO12hGZROOrUwYLv4d0b5PPpzZhPekIi+9WwoZC0SEJDUETcJMxjTD?=
 =?us-ascii?Q?V/5Z6+Uzrqlph1gfU3Yj9liWSfzgHzjKfxftnauvfdYCN43QZ8QKRSoquS7r?=
 =?us-ascii?Q?Yq1mqvvQdna0ntoCVZIOPyNL/xCg2A/GkcGrbD4oRKO/VPLLltjAGUqeCngR?=
 =?us-ascii?Q?MRv5xWjQuFFXC1fYjbFL9jMaUkweKRZ+MmPbIAcif9+Eu0/sTU27x6si6eD+?=
 =?us-ascii?Q?pVaVqpsPA8ZOonlRN2SSogytN58zL0xVcmS7FxCb22OURiFXBDlV9aPIzFfx?=
 =?us-ascii?Q?UO+F9wF9mQi38Yk7yjbO1FMEJYtmqCXtAMnjDlmT7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F84c5Hl0tAs+WmVE/MvJI1OY9l1zFkLYS23Mc/oNkdeoFGNHlI6enSJljg+5?=
 =?us-ascii?Q?s/ZWHO5YJ9BQrY4fLNoHIFuBaQ3okZ0tSNB28R5VLhc1H3QMNeNF5t5gD4Jb?=
 =?us-ascii?Q?HU4x4vKVSv6EXUjlVA7/usxKVWb45rStQpyno++rBwby/GnBUStpvH59bcEh?=
 =?us-ascii?Q?kM5xpmgVIayn8Xg3BVH3PPNJsTtzcmhP6L2PJRz41F+k1qKZYn6haJhgMStp?=
 =?us-ascii?Q?ZbEfuHgzyX6jPDKWNWdNUV6FUX4O9kFzkkguBZWscMUdjQcRyPbWYj7JMIP8?=
 =?us-ascii?Q?cmGC3w6H4otzGbhhhIfeqmZceri8LXqJ4RNfOb0dkSNFRbW1N4ZWcmIsfOzz?=
 =?us-ascii?Q?8rCHjhhu2OmlwceAdXgmCdmSeqgvM3DPyhMaa+M6wqVWHRs1JD+Ct1r3pv9q?=
 =?us-ascii?Q?ZNwXKQnz8AFD2nNbfXjfdsv4q5O73QUVqJrHFsi8LBJThmSL4KrDMgmRlzJF?=
 =?us-ascii?Q?xSbfs2ThokITZv0YoFVwQu2jExCwdvgDY+A39j6FnmgMlj3VnQEyvFOoa6VL?=
 =?us-ascii?Q?hQ1Ru+kLkZ1NJ+i8ay2+WUgCqMJkB9MCMYHedX/Jsiwda6agarEvid43y0BN?=
 =?us-ascii?Q?eHba0jjHq+fqF5pV9j3AX3qgynk0QLgs99OW4ZlFyQuydNGyV7a01USsMpcf?=
 =?us-ascii?Q?8AlekVZZz6hYnvOX5tDg9AagdAPhiU7gMPh4nlteD8hfWClm3TBZDhkEV92k?=
 =?us-ascii?Q?1L63FdE8f+Xw3o3uXIcN6EwB50LKbygtKhrF2wN3So9uBDGC1xQsltjx8slR?=
 =?us-ascii?Q?Lq00WAiK47r5frynlZ6muV3ZYqIO9yy4h/grumer1/qIS93UKK5aJmj17Z4a?=
 =?us-ascii?Q?M3IUuUrOLVzrJFFNTmJqGRo0lQfnU/kVIm9umU4Bu2ymv2DCSX4pWUhkcRIT?=
 =?us-ascii?Q?u1aykkZM3aQdqJBFein0wyznrd0uLQb4a/hY2TNX5SE9cDWUmX+0cZI4XGoy?=
 =?us-ascii?Q?lcqXFE6a1oqWcR5/oHP5lvLidXoBZm+Etua6LIAyoxe9weDA7ppSV2dG0yrw?=
 =?us-ascii?Q?he5qpDjChs8a7+2cJdwATMKAX7Zvn9myH4q6pGT92W7xDRp+f0lBG16fvV1R?=
 =?us-ascii?Q?4TYh4qgSkKwFFUW5/HPJmb6lSnTS2otAc/QaRZwm4tJ0tacXn+eKct5E4RhV?=
 =?us-ascii?Q?ckwqb+rCb/rty7tb14ofiDgdP8GlowTm8Flc7acQgFhchhMTM2vwVmHd759Y?=
 =?us-ascii?Q?IW0rpvMWLH2GQNMumzVleVaKivOsRyCBxjBBh973HV1zMEd+t3PZt9hqyLVS?=
 =?us-ascii?Q?OzjcxVk7C2OBehlbLZCiyxQgxDD4x9nWhmWboQgAkOIHutGeeLdkgl2h20tR?=
 =?us-ascii?Q?HQEb9hx/x4J3nZYA/JTAdz7uIuEygZE0pTpqIGHh2sKPm5k/mSEa81JxxCD1?=
 =?us-ascii?Q?jcoTW/kwJ+tTctPYfnisNNtHMVpKK1ueKpDLdAVptTD5AtZ/QbZguOHt9tmt?=
 =?us-ascii?Q?iYJiBnqPTwWmYcHMKHgx2VVeTCNGa3swwA7IpQb2Huj+R2ZKk8519Wi+IZ+U?=
 =?us-ascii?Q?c9bI0ujtjMnzhg6UnpB+bLgA5VFKDXJfnafUe8a6LG760GvrluOeutaBzT93?=
 =?us-ascii?Q?AsI0hAOiazsfaSXeJBZzvNFgT8gl55dKnKgx4c63?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f621d0d-2b1d-46fe-6b47-08dc84177272
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 21:52:22.0785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBR+XI6V+PIemLeQnaitmgkWAMnUqOcWzMAd87iabjtyd84FXAOKCsBEd1+0hheL+y9vYJATui6Z/VqC+k2QAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6276
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

There's no need to suspend fbdev upon runtime_pm, and it is upseting
lockdep:

[  313.150411] ======================================================
[  313.150412] WARNING: possible circular locking dependency detected
[  313.150413] 6.10.0-rc1pz+ #99 Tainted: G            E
[  313.150414] ------------------------------------------------------
[  313.150414] kworker/2:0/33 is trying to acquire lock:
[  313.150415] ffffffffb5f61340 (console_lock){+.+.}-{0:0}, at: intel_fbdev_set_suspend+0x115/0x1e0 [xe]
[  313.150495]
               but task is already holding lock:
[  313.150495] ffffffffc0ce74a0 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}, at: xe_pm_runtime_suspend+0x2a/0x2e0 [xe]
[  313.150561]
               which lock already depends on the new lock.
[snip]

               -> #2 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
[  313.150563]        xe_pm_runtime_resume_and_get+0x44/0xb0 [xe]
[  313.150626]        intelfb_create+0x150/0x360 [xe]
[snip]
[  313.150932]        xe_device_probe+0x439/0x4a0 [xe]
               -> #1 (&helper->lock){+.+.}-{3:3}:
[snip]
[  313.151097]        intel_fbdev_set_par+0x16/0x60 [xe]
[snip]
[  313.151402]        xe_device_probe+0x439/0x4a0 [xe]
[snip]
               -> #0 (console_lock){+.+.}-{0:0}:
[snip]
[  313.151548]        intel_fbdev_set_suspend+0x115/0x1e0 [xe]
[  313.151607]        xe_display_pm_suspend+0xd1/0x100 [xe]
[  313.151679]        xe_pm_runtime_suspend+0x2bf/0x2e0 [xe]
[snip]
[  313.151817] Chain exists of:
                 console_lock --> &helper->lock --> xe_pm_runtime_lockdep_map
[  313.151819]  Possible unsafe locking scenario:
[  313.151819]        CPU0                    CPU1
[  313.151820]        ----                    ----
[  313.151820]   lock(xe_pm_runtime_lockdep_map);
[  313.151821]                                lock(&helper->lock);
[  313.151821]                                lock(xe_pm_runtime_lockdep_map);
[  313.151822]   lock(console_lock);
[  313.151823]
                *** DEADLOCK ***

Although we know that this scenario is a false positive because
runtime_pm suspend can never happen while the probe hasn't finished,
the best approach is to avoid the unnecessary calls.

Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 2a9b4a4f2e71..cd97975344f1 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -333,7 +333,8 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 
 	intel_opregion_suspend(xe, s2idle ? PCI_D1 : PCI_D3cold);
 
-	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
+	if (!runtime)
+		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
 
 	intel_dmc_suspend(xe);
 }
@@ -383,7 +384,8 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 
 	intel_opregion_resume(xe);
 
-	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
+	if (!runtime)
+		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
 
 	intel_power_domains_enable(xe);
 }
-- 
2.45.1

