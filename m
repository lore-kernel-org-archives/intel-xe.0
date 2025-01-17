Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD15C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 19:38:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767E810EB73;
	Fri, 17 Jan 2025 19:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TDd7Kgb8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428AC10EB73
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 19:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737142733; x=1768678733;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=gksRnuE/kZTrrNf1MNfNHsQ6yZZGux/UhASTNRZeJK0=;
 b=TDd7Kgb8nHzQpYaWalc1vo+YjdSSoQGSgqQpjxBoBAdZ+Tx/P6Q33jpj
 E05I4uM8cVoQmSszAzBMsWtT1US6LHa7VDiOGe+GytP3dSjYOA9o5LJmg
 QBvQ0ZkLTpTtZawnHc9jKuVhLcsqjhlJnD/eHTUqKvGfqo76LwLmQNxhU
 y8y+wCWwnCNJ0Bie//GIz9QiHX1prMUTtHov8edpsM7U+KO7Glp1a7/rw
 LUWWBZdzuwdO0Cr1yrSRCEr7VSPkMB+kwABnk3I1U75jhPWDvItlh2d7K
 7fr61QXTAV5yO7rkGGXdED1xVlmGHASO4Jm0YnYjK7Bt9qkNrnDD6rITB g==;
X-CSE-ConnectionGUID: 4gp8pUHWSV2pX3cHa4z4jA==
X-CSE-MsgGUID: fiT3tOOmSMqQxgAbg/crbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="54996646"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="54996646"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 11:38:52 -0800
X-CSE-ConnectionGUID: Ke+CbwonRKuKiEvG2vp+xQ==
X-CSE-MsgGUID: PHvIhfm0QouYMGLKEwIboQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="106485325"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 11:38:50 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 11:38:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 11:38:49 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 11:38:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PzDx7PD+AELRAyArTAwWomWkXGWohkXgWaSG8mPrKj2E6EpyO5iilsF44/5wcar9Ab7a3NoXFki//995GwmUSKLV7uhKH5XiWmbhabGteDPrf2rs8v65CbL2a/8kdwtCNis8zAQG41RSeQnWsSBLg09yq2q1aZfe5KAIOBJblrpvL2W8zsYClE1N+4S9FQE4qIZ7rE6PPzsb2/pFbYwfB89IIfEL36sq3AYJGw5WEXmETRizc6+KqbsoJ3aGx9WG7eCxBCJP+ypIZuVpJCbM35R5VUJpzuimCROTX697wRLd2dQLyDuCCMZAbbqV6Ox55TSaW63mbRTGx6BD0G2k+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HA60B23cGpwG4CUdERftObP/xHj/Ug5vRfuk6wbGi4=;
 b=hm0a8sgSNBM75Dxb4V22NLOBHQfbcMrf2A94czGoqBy1nSTbKNWjj1VRwjvNXkTECuvRleuq4f4DeFIEf+bgXO1W4s1FRYdmmv0TdjGsDRa6FNJSQT26neDX76Hrn/vWlL/TpdXnwWSbA5UgpZPzHSEks36AT12rwKE2OQW5hZxvkHorc/mfdrCy7KfV9zteDtLiRCs/4TnKNehTGiNcq7XHVv3uMzMYO5tyXMxueEHMO62VXuaqWbLoIJ5mhpDsuO8d2PJQ/AhOoUkQNZHVal5wP+AuqUvDP9MVccQrR9yW2iUfBLPPC3XoPtlP3+LtliZkL7HGBpfaR0hdDEF+4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH7PR11MB6356.namprd11.prod.outlook.com (2603:10b6:510:1fc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 19:38:32 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 19:38:32 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/uapi: Fix documentation indentation
Date: Fri, 17 Jan 2025 14:38:27 -0500
Message-ID: <20250117193827.91779-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:303:16d::33) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH7PR11MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: eb987760-f7af-41ac-bad2-08dd372e8642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?93OuBWbpSyQl4jYPK0A/7NUWZWRsoQnAqJBlos+jGYbA4ryfhBlXsLNlhugY?=
 =?us-ascii?Q?aVDcy97uYhoMwizwU97Xzw5w/gUxDRe9xnl0EClc+IGkKtD+zUXYNJh8Stdv?=
 =?us-ascii?Q?puEy3TvkSK2/oxgDmaT75HfTBlbj5yatuXhLLxyKovLT9Al8DmXpmAnCKaqO?=
 =?us-ascii?Q?j+RoHf1ReudhmW5LtrGUWq87ofDngM+pRGbNvNghxJm6KH+bNG4frU00zYWM?=
 =?us-ascii?Q?H5+qoHLYk3pqVBTnfRha1CwTzxi43PAbxAd6FkPHpGEznVeaa8FqzBGCsgMR?=
 =?us-ascii?Q?tfMXpSeUI7+ZZDtcblYJQ/6OtdViArVaar/ZmSYSkIxnh1wt0sBh/gfpM48K?=
 =?us-ascii?Q?2HXuwf5ks4+3DOLwUHcEllKmSojqFHnmTL3cUMTN9wyEpvTe0KIhO3KwxWOq?=
 =?us-ascii?Q?+7Bn50kz/rlpijpnSQDwgxwqQEk0LUC083hNkqO2/Lc4y+G0H94OKL5dgJk2?=
 =?us-ascii?Q?jcvbObmo+AE6O263vNBUjy2s6gio8uAZZJq1MIFZOn8BdV5hAF6Nqj6BzJEK?=
 =?us-ascii?Q?51/sIMY8n8ZI3Hv6dp5/FOuqln7LwmmVPD/aveaCgLFL48Tku1al+aNz1qHc?=
 =?us-ascii?Q?3yVmszn+MFOmqtaYJRLTQJXfeHAerH0cwdGDXx1s1NB64bKStiNJu5ddlscI?=
 =?us-ascii?Q?JtYttbqyEBEmPFMbhm3CnWhym84YDTYj+YdOSqgtgjdcnJZwzvXxGmbKVDIT?=
 =?us-ascii?Q?POqcuyk7s/je145nlUNWFh0NRy7ABkMabUyG8cVvKNvgQ7kTIzoMTINR3ynN?=
 =?us-ascii?Q?NN6Bp1IvnuJVyuX6FbrLbYM8mmDI4IpVj9+oPz4gRr51J7t/giCnBkpiIvye?=
 =?us-ascii?Q?VABMfWPvjfkRySoCBJs7j25UPHzbz7UM9CKpXq5onpGEwfiMPE4rsQfHsmyP?=
 =?us-ascii?Q?1GosMCdlJiJXE3fYG4L3oarV08k43MGNRqnkM0u4aZWP17iD+8i2Ua8b0/gh?=
 =?us-ascii?Q?LxdJfv4K2IJGZeoHJbjV2ZOTXWIfhg9nCg2kgA6hrHt0CAT0rCO/G1jkIqS+?=
 =?us-ascii?Q?J5u+ZHVKD9Js883HZzDMNNIdFouLutz5ZlfSZUbKQaxwAQgqLrZfp4kgyvdt?=
 =?us-ascii?Q?BtvJitNp4088/3ujgCU7PGZV9HAWIk/hM2Cm/m7nJaEQ5bZJjN/m5JOVtdoE?=
 =?us-ascii?Q?pNznPBvoVm+bc+AWAGvxji0mHAP0DiCxTfI7PVraVCXm6xVzgNi0XSIx/GNg?=
 =?us-ascii?Q?0dJMNqlLkj5MdWQxUEwlSMtysVc/EbUeIHY7VAXUu2ALk2V+RoCTOeXgSjGT?=
 =?us-ascii?Q?0xOP8Z4tX0jwxN5IpJYM7zXFPNo4C5bFFo4GsYQJj0rWR2ZVQLzw52bepHeO?=
 =?us-ascii?Q?Ky5xtiZT8FdRFyqxqU3H0SvVU7SCpRa4QsBLvQDfoGDNU29lDkmk2ve1I1zP?=
 =?us-ascii?Q?hR0fstvb8CH1bdunQM4hYshFTyPX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fOUUoEBNpgT5GZMSQz+iQR2nLW9bGXolWXC1sTTgiq9ndcI8VRz54EOuuZmN?=
 =?us-ascii?Q?BrFk+UN4hm31+r53h5MNW4rFmAIoM6N7uj6A07zW+F+NdthREMA9+X8IP6WH?=
 =?us-ascii?Q?k70NBtQCVZhNGu92nUnPwwphVOwo60a9VRAc4eRkqDTL+L1oJ1JvouVc5xZm?=
 =?us-ascii?Q?k3nxXeClkkIK7U6lY0VfVV8Aizl4RRY+f326kzMZqhrHV2hgH9Cu1CLgCu+H?=
 =?us-ascii?Q?yPlb7tbx2J8e+2QHSYiylBSb7aeuHuCgMtVfkx6ZYg8+9isMCY2mTsHaTaAZ?=
 =?us-ascii?Q?Z4P8NenvRpn+AsZfMSbbrGpIhQC7hs5joILcONsCnsqzkMPP0D7EXf3S/X0a?=
 =?us-ascii?Q?Xr5L9BWF1S1tSUOn+17734p5/llE5vOeK+YZBrzvuEbRSEQQ/CUySZ8KdWWk?=
 =?us-ascii?Q?xLxL8tvcXMh123iqD6ipUBYnGlOD3zMYqLNXjJV0kRV4FAeQ/IwHBk/vUqXH?=
 =?us-ascii?Q?0qhgs+cRyuO2cZzQPh27s3iPv3goFxFs5a80bY3OMD4DETnk8MVB3UoEWeOn?=
 =?us-ascii?Q?oeHpq2wC2JCkUmGeXBhK0SpidH73feVlfXGrK5wNy72qPnC6xMF2TlTeHndl?=
 =?us-ascii?Q?fv+ceDt+uMyT21nQu4gDC60V3RTB8cpmDIGabGStLAOKHKuei5yi/28DvGs1?=
 =?us-ascii?Q?EdbuqxfsmLTiIxBygzRijOP+QSSX535Y/OS3V1kuMC9IM31EXguzKYmUDDCE?=
 =?us-ascii?Q?pGd+4B52ZgLqGCGzEIv8dZ7+8LG/FoKmNcwfgxX3gTG0vy0SUjOsz6DYc8t4?=
 =?us-ascii?Q?r98/v8MH4XJc4gjihKZyiArkTxOTxBXJJ0y/wz/47JQop45rPRIb2lQJHemS?=
 =?us-ascii?Q?Q3sOjG39Kih73MphnRpONMkmSBuTxHxsJNg7Y9Jw83tcqrVfcpLiTHNeeG5m?=
 =?us-ascii?Q?M0rQ/pjrC6le2QseOeefMfgcWN+8uHOSFk1cAeJEPqtv7rvbWnJXHPevJFoa?=
 =?us-ascii?Q?zqVql9E/RUiy7P9v8eeSuUpduvIJcZSfmtPkPkH4HI2fOOJYyYwq9kWpEps9?=
 =?us-ascii?Q?qF6mq7yDghw/Agzcscv7JKuB9Rs4kvGSR3i+BhTSLC8Pc0CqDESrzPBg/JmA?=
 =?us-ascii?Q?xDF258iJOLvc7YbxAAIpG4ivXz4wjbvyLZrBESzMQdrGB6LCEHdrJhFZp0mx?=
 =?us-ascii?Q?5AvuWFByb457OlzQGLObs4zC9sttM/Nj95d4378Luj61KURQuzeskL/JhMtM?=
 =?us-ascii?Q?rumJ4RQo74K4XW5LkLzIVkQY7KaIQe7q5HALBl6uMPup6nSeznmB6CV9Sdo3?=
 =?us-ascii?Q?LcoGm/gY1YqljvT6ky/ngtSJx7GN9X7DjIrSp6mS0n+j/4dTbcALRAr2p8KN?=
 =?us-ascii?Q?bfQeXhm6P3RcvGwxoRIDGA91ZqUZw5rEe2+MLYiK1WKDcWnX8r4udF/oU8qy?=
 =?us-ascii?Q?rccBTnJvyd7XufY1FCjDqAnx5P+qCnYGEhY6PT/9D7Hr4BPfE2SfRJPa9Cgx?=
 =?us-ascii?Q?/vKf3Tt8pa2VvL2VZcz0+OHA6p/bDbtvH6exDwp1/QBZz6c/kRhMRIpppGLP?=
 =?us-ascii?Q?XqQFwQnlHLYW65dc16bhBZTbfFhgjxILFe4ppTsPUxOEZU7TTTQLh/XxX45B?=
 =?us-ascii?Q?j+VKOo8jLU3R86vePIn5C9W+GlFhwAvnwOCUyIf4ZxFgtBH0llgysb7QCIpL?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb987760-f7af-41ac-bad2-08dd372e8642
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 19:38:31.9689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUTNLcBmms1YT52mUsxMV+xoZLppriJgF8kmeICxOgypVvPdGSvBjkqpEPsyEhJrwbXI/dFTYC4ZiqfI/UQqWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6356
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

Fix these issues:

Documentation/gpu/driver-uapi:29: include/uapi/drm/xe_drm.h:817: WARNING:
+Bullet list ends without a blank line; unexpected unindent.
Documentation/gpu/driver-uapi:29: include/uapi/drm/xe_drm.h:835: WARNING:
+Definition list ends without a blank line; unexpected unindent.

Fixes: 75d37750a753 ("drm/xe/mmap: Add mmap support for PCI memory
barrier")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/intel-xe/20250117164023.3fdc00b9@canb.auug.org.au/
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index cac607a30f6d..e2160330ad01 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -814,29 +814,29 @@ struct drm_xe_gem_create {
  *
  * The @flags can be:
  *  - %DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER - For user to query special offset
- *  for use in mmap ioctl. Writing to the returned mmap address will generate a
- *  PCI memory barrier with low overhead (avoiding IOCTL call as well as writing
- *  to VRAM which would also add overhead), acting like an MI_MEM_FENCE
- *  instruction.
+ *    for use in mmap ioctl. Writing to the returned mmap address will generate a
+ *    PCI memory barrier with low overhead (avoiding IOCTL call as well as writing
+ *    to VRAM which would also add overhead), acting like an MI_MEM_FENCE
+ *    instruction.
  *
- *  Note: The mmap size can be at most 4K, due to HW limitations. As a result
- *  this interface is only supported on CPU architectures that support 4K page
- *  size. The mmap_offset ioctl will detect this and gracefully return an
- *  error, where userspace is expected to have a different fallback method for
- *  triggering a barrier.
+ * Note: The mmap size can be at most 4K, due to HW limitations. As a result
+ * this interface is only supported on CPU architectures that support 4K page
+ * size. The mmap_offset ioctl will detect this and gracefully return an
+ * error, where userspace is expected to have a different fallback method for
+ * triggering a barrier.
  *
- *  Roughly the usage would be as follows:
+ * Roughly the usage would be as follows:
  *
- *  .. code-block:: C
+ * .. code-block:: C
  *
- *  struct drm_xe_gem_mmap_offset mmo = {
- *	.handle = 0, // must be set to 0
- *	.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
- *  };
+ *     struct drm_xe_gem_mmap_offset mmo = {
+ *         .handle = 0, // must be set to 0
+ *         .flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
+ *     };
  *
- *  err = ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
- *  map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
- *  map[i] = 0xdeadbeaf; // issue barrier
+ *     err = ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
+ *     map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
+ *     map[i] = 0xdeadbeaf; // issue barrier
  */
 struct drm_xe_gem_mmap_offset {
 	/** @extensions: Pointer to the first extension struct, if any */
-- 
2.48.1

