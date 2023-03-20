Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE93C7618A
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 08:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E8310E248;
	Mon, 20 Mar 2023 08:13:16 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080EB10E23D
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 08:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679299994; x=1710835994;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=ayFMcsuI4DN+PcDoWMSxaEsuAcN+iV7lkZjCDx3Q440=;
 b=jU8r0N0src5oHA70+UPucYJ9UiZYt+cX0DflgNNLnGD/f3lTpyoi2mXM
 h5XZXjUYXxLcpEl0fnXT6rXePnGg1BSyvSS+Q3VHKjcKqOdjK76hrAVrJ
 VjWJ8HfOZKnJUuk2/8HdiPUKdmRVcRSjDvtxwN+DXomOElW+M6+evf8qj
 7vsRIf7fKRNvhJCj+B7Ysf5u3b5ouvcjbYV1RtV9U9C2jxd9ZAGJgg/2l
 URAPoKb4Uk948ZxnTge29yGkG/conSkk1NYblNTURJ0gr4B++4EJusRhh
 fh1PkwZPWSGBR2StmcYg2ya/gryexpVZ/bYEcLRTKBD/At/45+m6EeHrK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="366317455"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="366317455"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 01:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="804821118"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="804821118"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 20 Mar 2023 01:13:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 01:13:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 01:13:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 01:13:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 01:13:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1eejWYSLUHhecLteQFuzYKieu2QjMVA9l7dKqAjNO7DoQFV/v/zsB+XoRwYy95ffTB7vmrMrGwpiI2r54ReLpV2Qdds+gUzPaF28Ou4iDRYXQekSAtZOC7f63vqpiu/ytlUhkFVrcFBcjQzE0zrnNfXCFwj5f0x7Qp+8FQew6aZoWOKhdGXVDwlywm5xHx3JvCo/DFZjKu+4dgepRS0i+ZMRrr073+3GULXE5xX8A/iY18VJCbwhL43ahxhBc1WQ9MjBMdgc/TZ/8kCSY/o2b8KFHlWhRs/yLpRRqraS/QlMu/O3yGMlGK7GiccXYI1DPRdlIIYABqWG8xW8Ci5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EoNi+kJw9JXM74+FFJ4q8gES+sWl3TCm1o3zH4Pgyg=;
 b=U5er65jlwmGsgctO/uJAXhvORtfp71oHg7unQKYyMsTFgmCWQkxBl1n9ekbfUo+P17nzN+v+WbfDnUKCIcv82f04vwBdXP8MHeE3Wk/VVVHCa1BsdzLzQCSvYXRV4VmPU13nKrWsLibHAJsyOiVDAe8vm5RYFIo/3Gh3XwN3AD56kkIB3BZZhJ3KoS82qgshPOENV8VKth0DtjNdN8cKBX1DjPeCxldU0Z4hgxyB0JN1DUrUJsr4PKTKqaS4f5+NKEeBTwp1YQWm/Z6FcIqp6W6mnl+ooTWVCTtBedHq1LTM8A4aw+IkqQORXRcf6PtX1vcsvRi0kMZIoPLOMotq2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by SN7PR11MB7601.namprd11.prod.outlook.com (2603:10b6:806:34a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 08:13:10 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 08:13:10 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 20 Mar 2023 09:12:54 +0100
Message-ID: <20230320081257.1788039-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::8) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|SN7PR11MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f615ef-ccd2-4993-cda2-08db291af15b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P/NimR+t8toc9n5xDG2TotYgtY23bbmaOFFl4j+FRkRxGiX+yJo6mZ+SSjbSV1zKT9jFNLYdBLGWu5q/FjlJ41tKJxqTekZN7KLwvNLDNjvAGSOAu8GGuA00pJSDEVQ9OnWfqU20Eg9DbX2LWOoTEOGk7qNem8JhCGM6Nf/6i+V3Ed+S4KNWBqk214EH3Q8vm5o3i3qHj4sQXs36e3ZbKFd1AMDhyCWFUwYXkXsNun5y73oDCMrlbVoPXGwYRkY6RvIb3KnXh2eNxyQFnHC+cmEKTVh/Wwg9Qy19ognmLbti1T1bsvqaQqKCfSvu8Abji1ItnndvXLOgkxfXPrHYAiKp06fP4UQvCGOxo2qyeWwyOTuNsyulY0CS3iT7/YctebF9ORzly7rbrDuURLSof/KZh64SoL2ukuja/uCPol1JjbIfiyTwxEFf/EGi42x2rP1mPFDQXH/dTUE1nOkcN/etzLcavpXw0d8fpfqFbYiTIlT2CwdOK911R2nS0OrFcTPxDxUqzZK2a9bO0UJ7PjPSUo4wqIUbIHYNloZI2toDSGrfwnLDNW/XWjeKTfvmepUTdeBv+ntTSLV3NtAtIGry5YJugl/vI5ZuzAgmuHzZV4hMcb3ko8YbG8hT5xCYkWcztYFlgw2gw30Vla/1Xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199018)(478600001)(6486002)(107886003)(316002)(66476007)(66556008)(6666004)(6916009)(4326008)(8676002)(66946007)(8936002)(186003)(26005)(1076003)(6512007)(6506007)(41300700001)(5660300002)(44832011)(2616005)(2906002)(83380400001)(36756003)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?99fmv4Cxqo1w8TPesteo3RymZ0M5c5/x+x9uX+jgdPR7YTTkKI0TZ137brgt?=
 =?us-ascii?Q?J1JtazJUQ3j304SWctIj7UsT3VLrZWRDhUTk5934MRiDuQS3bjQQ8Zr0PYDc?=
 =?us-ascii?Q?6erYhbinbB+kRgLcMu/Eui9EE2ucNOXZguSflg8UlSTA7tz1DzxzbR+JiS3n?=
 =?us-ascii?Q?VRXi8G0icDLm+xbZbIThooOtW1Lmkh53egqcdKfiPf694eNZVg/VJg3edHA8?=
 =?us-ascii?Q?ChCdxIZn/22hpPetzTC0IpH7KtMzwxHDRENIl5TCa8IGn86xP2z4/amtv5bb?=
 =?us-ascii?Q?/27OKbYx9EBpHlJwCL6PO1v4iEDnf/2hboWJ8TzUNSKYGhK1NeB42UsswO54?=
 =?us-ascii?Q?y/YHV5SpxM+5PNyHg8r+5NhRRvmEmyLlg6fzSsDgHXeLUp/gbWmoPlc/1ysU?=
 =?us-ascii?Q?tmc4Ol2lf42ods2IGUyRMmHJxmK9P5dm5SsIxkFTi03OwjhaV6fExYIV6TmM?=
 =?us-ascii?Q?T9qwzk52yzs4C7GR8xu/9w/mqBDR1QZrtK/nJbjBgC6DFmi0b0fLBcjuURpO?=
 =?us-ascii?Q?bh3+r8iEQnzOikjtE+sYgUxN0yimVSmyFw9Z7zs/hykzr2Kqk6ld/ISZHcm2?=
 =?us-ascii?Q?Tv4ZXl9+ispRe/w6hMkpHLZskUq45644d3lkd53KUu61+y/+TR5C/+6gRHvN?=
 =?us-ascii?Q?AvcypvZ7fAdWA2AkwyRk+be7rGNbgJg/L9xCtwgiulJLgaQLjQmZt9LPqN6h?=
 =?us-ascii?Q?MygzIQe+KtyIQowGxKBMRyDGH+D8oIgLrJslG5pzACD14PXOkYMecASFHtI3?=
 =?us-ascii?Q?BVepD+JLwKm0kfnQaBWbUCdw0le4Rl+7QQ4r5Q+xosySmgkK5hoNFjLpy6Jz?=
 =?us-ascii?Q?0dwgSGjuq9WD6/OccWOvdyWRB+dpMNOUVM2XqFtwUo6Q/alVXlUgaxqaTkxe?=
 =?us-ascii?Q?tT5a+kis1v1RP8HVXh61mcmmje64vngDZMMK0C8yiU1XYyPkwpMTfHwAchH7?=
 =?us-ascii?Q?0s/2PGtaN8IdojQCAmuNapC7FY7cpCsYljdSMzwV826BegZLbEVbR4GBULum?=
 =?us-ascii?Q?KxF2N/kyjpLFz0/YyPfljh0yEWq/CMCC8BuAYRmbgxnQ+pIVNWPXyvH5WuKR?=
 =?us-ascii?Q?P7Op9UQFZPPp+3td/3uD3+++CQgB6TZlDA74NWfqVGhiia4dN4k+qj0zvsSU?=
 =?us-ascii?Q?AC6bSx0dvoR2Ba3JF1CCMGZ4dZjP0KI/JlSbL5yZvMvj/I8PLMXRYhrSc+LQ?=
 =?us-ascii?Q?flDU684uudB2T2pPhyDhHZaa7pEj4zb1La8Ed8n6DA3COM0BSSht5b7ooZcH?=
 =?us-ascii?Q?/HRsaZaRGy/LYvOtpjCAjUx72v5bFRChYNEcuYAPNUZWDfmuxa4TeHzFpPNm?=
 =?us-ascii?Q?XDw0WTM2iDucV8n1VifqWd/qE7ihk/uiq+XukjoXD2aM6nfs6ywQbjm1AXrU?=
 =?us-ascii?Q?xInwzxHA2/a/RSo/o8dn+wRABpxchcQ15jzQB9/nDYD1H3aLE5HJUnl9qLwx?=
 =?us-ascii?Q?B23NWuI215fWK8vBzAB4/hDvgCBBDmwW4pMG0ViY8mN0SPoaAyQiE80ex1H8?=
 =?us-ascii?Q?RbPqF0ZryOH5RwtvejJQt0cpSTcvwHKAwkXLrTZ7Zh/q5Muj+0E1qnYSA6Xz?=
 =?us-ascii?Q?VewqaGYvumsQnrUnGb2MQ/FCxIzAlDZ7wqnoAdUqbkJGa+QhbsK0T3Bfjk/H?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f615ef-ccd2-4993-cda2-08db291af15b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 08:13:10.0458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kT1fULgnoT6KyVvjfUxRqAQnAqFEyAszF5154avlxl912io6vLwzgJAwqznq4LY3kdC+MzD9NQe5mponpFwmf0jV8MkpKrG0W35IRvKTWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7601
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH v3 0/3] Split code between common and
 platform specific
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

This patch series explores a code split between common code and
platform specific code. The minimal hardware abstraction layer is
implemented with a structure of function pointers, similarly to what
is done in accel/habanalabs and in drm/amd/amdgpu.

The objective is to ease the addition of new platforms by limiting
the need to modify the common code and centralizing specific code in
separate functions, potentially in their own file.

v2:
  - Remove platform files and leave platform specific code along common
    code to ease the use of helpers
  - Break down global function pointer structure into smaller
    structures defined and initialized locally per area / compilation unit
    in order to limit exposure of inner details
  - Refactor functions in xe_guc_pc.c to provide more examples
  - Add fake new platform to show impact on code
v3:
  - Leave wrapper functions
  - Use const pointers
  - Assign const pointers to the struct rather than individual function
    pointers members

Francois Dugast (3):
  drm/xe: Introduce function pointers in xe_gt.c with local structure
  drm/xe: Introduce function pointers in xe_guc_pc.c with local
    structure
  drm/xe: Add platform specific functions for a new platform

 drivers/gpu/drm/xe/Makefile            |  1 +
 drivers/gpu/drm/xe/xe_device_types.h   |  2 ++
 drivers/gpu/drm/xe/xe_gt.c             | 49 +++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_gt.h             |  4 +++
 drivers/gpu/drm/xe/xe_guc_pc.c         | 50 +++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_guc_pc.h         |  5 +++
 drivers/gpu/drm/xe/xe_newplatform.c    | 34 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_newplatform.h    | 15 ++++++++
 drivers/gpu/drm/xe/xe_platform_types.h |  1 +
 9 files changed, 147 insertions(+), 14 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_newplatform.c
 create mode 100644 drivers/gpu/drm/xe/xe_newplatform.h

-- 
2.25.1

