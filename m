Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D443C5DF94
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 08:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA07110E663;
	Mon, 24 Aug 2026 08:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYISkX12";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6611910E38B
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 08:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787558963; x=1819094963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bS3+wVXHwdEb5JtIzcQMEWM+YKEA50AZvJq57mWdTuE=;
 b=KYISkX12SjDbE056WTjFNOEZ7ko1Fo8mR1gBrT+zQVufouac26ZLHt8G
 AW+8lrubGKTUb8lKhQN1iz0+cyQnx2Lx65+KtsJiCTU0wgswfpvROqpJJ
 33yzS0oGdKjl8db/v2ymeOaBHloqzbLQdT7pOIU8ntcN4IxKA2XeDKzq3
 2qt+pFY2g6su1S1mdXOCFYOo7ZCVuS3hxtOJol4tyV9gZKuqeskIC6QXI
 bxGGe7i3K6KKi4SBD3q0GR5zCHW57vIhX3iVNJ+W5UssF9HyJztQ1B0le
 jnVmUIb8ksFPBbMLEd0W2kmDV+xNo3GLpHWCizlavbJFFXENHglovQfP8 w==;
X-CSE-ConnectionGUID: ty+oamEjROOG1n0B2jn80g==
X-CSE-MsgGUID: FLLrfvxvRsGHfeymrcKpKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91681463"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="91681463"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 01:09:23 -0700
X-CSE-ConnectionGUID: IgNmDYXsReathv5Hh0pCYQ==
X-CSE-MsgGUID: QHQCXT5JQY+Y15FyTYzFqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="305135215"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 01:09:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 01:09:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 01:09:21 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 01:09:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zoxi7YNLrsFxrLzfLqBzIRwITwV3ZETVIRof2QmjwrfPa/pFgGHTeL0loTu6JvkindE6M5UonkfJfl1k0W/I19vGWEsKDWrHpzNemEdjRYswD9fwUIvgIWZxlXkqt3/JI8MakzpVgCerlhvGGlbdTNYLStDxtKpwpiJl4LG338CXLh9F1J3tM9aFYtM+3BNwLuA/DNrQCWzX+/hYqiqpC47ccC4IFntmsktWr1+Siz45yuHWlQSVAjYxow0t1JkENQ0ZDxpNaedk0mUo92m7mBQ4JIbqEr8vLbP7ekWczwQKuGm7z9GTJbMgTN82dAa8hAwo+X6lV1FGuUEE1NiEhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbzYrUc470k2ii00S+AdYy/U6JMq3kw6R9gRPM39r8c=;
 b=Akg9Sw7VgN+sVqlmhSLqFZwBqMznvmccQ3mQq3T5aZIDdvTumXQR126ANo4OyBVpxkr7CaNXAES0LDyRFNccjaqh0gSlgD1eh9cJK4QSt55UgJlNpNa6VHEhj8qzbMQMCgD0RnlzbfUa7BthQdFo7O5RvTadG41vUQnTOntn2/sGUA97iy3Ih2T9PU6Essg3AFdR+gYVys0sBhI3Sei6UH2yjf6gv6ZJeGGOqDnEJ8GvT3VUCZQN3IL01CHhmpRBnz2q3YUlqxC1oT2vImTrphm8vvKOEYWiHSMKP7tMf5TTnmyY7UEnAtAY3OpUZQrVek3t/UZTOw697yOlbWnCfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by BL4PR11MB8869.namprd11.prod.outlook.com (2603:10b6:208:5a8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Mon, 24 Aug
 2026 08:09:19 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 08:09:19 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 1/4] drm/xe/vram: Add binding information to VRAM regions
Date: Mon, 24 Aug 2026 10:09:05 +0200
Message-ID: <20260824080908.701133-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260824080908.701133-1-piotr.piorkowski@intel.com>
References: <20260824080908.701133-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8P191CA0021.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::31) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|BL4PR11MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: 0755d511-b9af-43dc-212d-08df01b6ffbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|56012099006|10067099003|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vs4EDH3Cw+su8i17S7FZOrG1jtyp0yM464oUXxq2s3ZbQryd4F7K9XxvPDQ1MILXUt6ICDiFK2EaYtevCpaZD5SleVbMhdgFrCNl0qpPsl7goqLsEW5JmkrrkdpiBEjDjs96TugZfA2b/lIFVh03xBbt6RCWkzwTa6auh30emGy4jYoK7iMxdx4s4/9nCh9qrsHzu/rL/2M8KVkWSn0BbaGKj8Zk+19ToF+DRve6qMYEhv8KqkHSxz2t6/ZWUrStBLkTIMmAODD80ksJauImOwZVPoMEkEcWsV7iTNUgrjrrP2BBJCZ4bwwVRacUojxSCPGbV37q+8oKo+10HGJdTq7Ryf5LlzEsLvbtZpPCKFvYnP+RFEaaq6UU+2b67or1quE1gTlgTJM8eENFZy2vLUwyD8wxF7cq/TEqv1p0CDS3RgL1RNuW6Y6O17Kh4HVCoFqP6EMUvlhdb+ZHLNSxcN0afe4+fm6SOmxjtpNSEO7glMSGR1Ni3RMeQMH48LwNz4WC4yIrVQmOLElKE7O0639oVigI30U4O9xh5jSgBo9afUNDemcjAgLlzzX64WQQstLdqCdtvDqgQhoGGBYhFFN62IMdb+aMusu4FZgpk2Gp0WmEc40cwuBoxXISny5/PdVuawht5Lizt27FU8ugE9UGTWim2PVUKCZtCtf6bEg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(5023799004)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0p2L2ZQa1BIL01wWmFzUk5tTGNJVDRiUFFYUmNpbDBhUVA1WG1QNWlZSWxG?=
 =?utf-8?B?emRDbk1OOFZsUVpGbUZ6NzN2ZWIxQ29PYzVMWVQ5SzR3djlZQUFRZHd3amoy?=
 =?utf-8?B?bGZqbDBLbFkva2dvYmFyNk1FSnJpQ2UwL1BYRU1JU3E4Q3orWWZ1L1MwSUs5?=
 =?utf-8?B?dEJzYlUxQWd1a2xUR0ttYS9MQ1NZZUlaMVhENEpWMEZPOUZ1RHlPSTN5NDBH?=
 =?utf-8?B?RWxsQS9oQTZ0SmZFc0t5S1M4bmZqZ2NXUmJkMWhyM21OQjlpaWxjRTNqMVQz?=
 =?utf-8?B?QWdTK2J5a1U2ZVQvcUFoaVMvcVc0cVFGeGVLTG1waFd6SU5KNjdoRHJVWUFZ?=
 =?utf-8?B?ZXgyUHpoMS9ReXpjMjFSbE5oSGVQUXArb1J4aWozaWFyT3ZNOFU2dmZqSEZ4?=
 =?utf-8?B?ZzE3QjFxbWljMUYzbkVqclVpZFhnUktNelZCc2pOODJNSkVXemNpL2x2SDFp?=
 =?utf-8?B?UkFNcUE3dVdMbzNURzRtWjVuWmxhUlBybXpMcTd2TlRCUElRNW5lZnJYNU5w?=
 =?utf-8?B?dUQybjFESmRYSUJnbEpMQVd5ek4rTHJMUlQyODhqMWRjM3lCU0xsU25wbmNr?=
 =?utf-8?B?cmFhYUI5VEIyL2lpYkVpRXllbGxYODJFOSt3ZkY4MkdBU2Y2dlA4TTVjOGJO?=
 =?utf-8?B?cXNmTkFVVDNkRmhkZmtBN05tVGMzQk9rWjBGV2IyU3BGdldsSDhvOXhGWHE4?=
 =?utf-8?B?bEd5V000U1MyUXk0U1Rqb2g1M0pEdEZKbVdJUmZYZUpoVk5VUWlzZGx1UDJh?=
 =?utf-8?B?eWZSZUh2Y2wrTk4zd1hsQTdtSC81WVdodVBEYkxxeWx1Sk5DRkxZUWxrcVRG?=
 =?utf-8?B?Kzc2V0p3Z3BnZXdRQWxyekNtcnY0dlJqNk5tN1NTRFRaeHlIK2tHNXBZV3ow?=
 =?utf-8?B?czhVZ00wcDREelZOcmo5d2JPQVkya3p2bWdxZVRSNFIwVXlHNXU2dDdCOUFP?=
 =?utf-8?B?S1BEODlUYXhNVmFXNE9ubTdaRE44Qmp5dDdkSFZDbTNiTWpNcGhyQWlVaEpv?=
 =?utf-8?B?Z01aLzB0QnhrbEF1VzJxcDFvanZCUWhnYTVpZ3JvUEIwRkU5aDhyaGNWbnJH?=
 =?utf-8?B?VVJZY0MzcVprTDNoa0pGdE9Gd1FCU1hpZzNmUXB4TGhaZi9DOENFd3hTRjg5?=
 =?utf-8?B?emdkaDFrbGtMQXFqN1hmMUpSeFk1K1JBVUR6ZWVFMXZXK25pZStTTmNIVlZw?=
 =?utf-8?B?S3p3RlNMV2tUSXg5UVNBcFVkUzV4R3E3NFh4cDhjVVE5NEExdjFmVTl6VThW?=
 =?utf-8?B?dk1FNldYam9ndW01bURWVjUySm1nOE40dlZ6bWVRUXd2SE1RN3hrNFN3TG5t?=
 =?utf-8?B?ZDIwV243ckx6QW5mVlRhWnNza2VQZEJidi9hWmJFd3JvUFAxZHAxZUtVbkhy?=
 =?utf-8?B?U0U3TldHNjNDZ2FBbk9teWQreG90ZlZJOTVtT2ZYbUJkRkNoTlB4VnoxaVBi?=
 =?utf-8?B?YnBvUHVMMi9XOE56VUVrQUg2OVQ4dVNwL3JTUmhXOEdDVXBaRzVyV2FBWkNU?=
 =?utf-8?B?NnRUK0hRNEQwUFBLQnhPbCtBRXRQcU9jZTBDdjV6NDJHYXN2MTdZRmMwUGZl?=
 =?utf-8?B?TkR0NVU0RWZqN1h2eGgzL2RWdVMwTFp4THhzVFphUEh3cGhpL2JSektSVTN3?=
 =?utf-8?B?am5NWk1BY1E3SEkzeVVYUEFtS3J6OExoTnJlZDVsMnhFTitlYzNsdm1MYmVQ?=
 =?utf-8?B?dmdBRmZYNWdydW9UaWIvZ0M0Q0JZY1BsTTFDU3R5TmZIb3lFdklnR0MvWXdi?=
 =?utf-8?B?NlRKMFdZQzVWb05ZS1lnSVFtUno3dmVkMDdrWUlCYXduN2JudnZsU3lCa0hZ?=
 =?utf-8?B?UWNYUk80VjA1dUx6clNBZytKVURCTTR1QlNvZitMOThDU3Ewbm0zTURSdlNi?=
 =?utf-8?B?MGhReFZtUGM2VEtwWkNlczZsSTRFY3ZuWTVtUjRRZFIzUUR3cmoyRkNDTERr?=
 =?utf-8?B?VmFoUStUTWpBSHFVTThoRmR5K0ZvRVl5cTJEbTZGV200aCtTKzdFUHFPRm1z?=
 =?utf-8?B?TDNMU2haYUo4K2xIYlBEb3VGOFVySTNkRlFpNmpiV2lUQmNxV29KYUNYbmtz?=
 =?utf-8?B?RDA3SzJOcC9sWjh1WWpPaWpRblhnU1l3TnU0RHV1aGVROStERG9BQnA3VXBn?=
 =?utf-8?B?SDc2eFhDSk5IUmh6Vm4rZ3Z2QjlTeUcvK3VJa2hHYzhxeWZrdzlSNHBzMGtl?=
 =?utf-8?B?RzNzUlIrV3ZzWXNOV0p3U0RHOHgzNVZJYVBqK3dqRzM0dENYVTRHMmVBVy9O?=
 =?utf-8?B?cUxVSzhJZzlKeThxNWl3Z1crVXhVdjN5djlVSkZ4NVQyZWtzaFkrMnBXVndq?=
 =?utf-8?B?NlBHT1M4emxsZ0Y0Z2FOTjlueXBEM0cyMnVRc0JFZ1NzVy9aejlQL3lqb2Ur?=
 =?utf-8?Q?3yVFbZzfVz6nPLMo=3D?=
X-Exchange-RoutingPolicyChecked: OzMGYQTIq2EDQMbOfQna4RUZkV94awt4y+RAN4Ke+9AS9jvkZO4J0p+1b7fEUKlX0Z58v7LdP046WIjtnCSH0IvRiA1Cp4aqnuM4PY70582e4LEdm7UTZcPOj1oc+feLRYsmUDw6yPpG9irIrnlc+BLdGO4tCnmU85vGROjYj1ib4gD3Dv04itD6Iy0MUxn8hu5LfioW4vcRPnWXWY1Go1ukC8JEKcRPkncywDgWLeuoinf0BSRUtLbqq0uNpAh6xu4U1ypKdyCvSfoSeg6Kn9h9ucfWhW4Yrp33rmtQdjD7TOFuymvS23JwlN+1+yMDWGfi95kCd/9Je+HGVrjBNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0755d511-b9af-43dc-212d-08df01b6ffbf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 08:09:19.7141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5o7aQt+5TmcRW6hEDZb8eJBgyv0osBJOlbnN+EjKa8xxxnALTvYkytdQmc0uC2RsArLFg+N1IjJRIOryOF/3+kxP3xS+HrkEePNulGypk+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8869
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add a binding field to VRAM regions and pass it at allocation time.
This allows distinguishing VRAM regions serving different purposes. It is
needed for future patches where different VRAM regions serve different
purposes, such as dedicated VRAM for kernel allocations.

v2:
 - Add XE_VRAM_BINDING_NONE as the zero value so a zeroed region does not
   implicitly claim a valid binding, and give the device level aggregate
   region its own XE_VRAM_BINDING_DEVICE instead of masquerading as tile 0
   (Sashiko).
 - Allocate xe->mem.vram through the new xe_vram_region_alloc_device()
   helper and validate binding, id and placement on region allocation and
   initialization.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     |  2 +-
 drivers/gpu/drm/xe/xe_tile.c       |  2 +-
 drivers/gpu/drm/xe/xe_vram.c       | 68 ++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_vram.h       |  7 +--
 drivers/gpu/drm/xe/xe_vram_types.h | 16 ++++++-
 5 files changed, 80 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 74d566693dfd..5f7aa15d2480 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -762,7 +762,7 @@ static int xe_device_vram_alloc(struct xe_device *xe)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	vram = xe_vram_region_alloc_device(xe);
 	if (!vram)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 74d925a337b7..fd0c2e4cbdd2 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -119,7 +119,7 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
+	vram = xe_vram_region_alloc_tile(xe, tile->id);
 	if (!vram)
 		return -ENOMEM;
 	tile->mem.vram = vram;
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 23eb7edbdd57..2376d32b8ce7 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -24,6 +24,20 @@
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
+static const char *stringify_vram_binding(enum xe_vram_binding binding)
+{
+	switch (binding) {
+	case XE_VRAM_BINDING_NONE:
+		return "None";
+	case XE_VRAM_BINDING_DEVICE:
+		return "Device";
+	case XE_VRAM_BINDING_TILE:
+		return "Tile";
+	}
+
+	return "Unknown";
+}
+
 static bool resource_is_valid(struct pci_dev *pdev, int bar)
 {
 	if (!pci_resource_flags(pdev, bar))
@@ -189,12 +203,16 @@ static void vram_fini(void *arg)
 	}
 }
 
-struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
+static struct xe_vram_region *vram_region_alloc(struct xe_device *xe, enum xe_vram_binding binding,
+						u8 id, u32 placement)
 {
 	struct xe_vram_region *vram;
 	struct drm_device *drm = &xe->drm;
+	bool tile_bound = binding != XE_VRAM_BINDING_DEVICE;
 
-	xe_assert(xe, id < xe->info.tile_count);
+	xe_assert(xe, binding != XE_VRAM_BINDING_NONE);
+	xe_assert(xe, !tile_bound || id < xe->info.tile_count);
+	xe_assert(xe, !tile_bound || placement >= XE_PL_VRAM0);
 
 	vram = drmm_kzalloc(drm, sizeof(*vram), GFP_KERNEL);
 	if (!vram)
@@ -203,12 +221,40 @@ struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 pla
 	vram->xe = xe;
 	vram->id = id;
 	vram->placement = placement;
+	vram->binding = binding;
 #if defined(CONFIG_DRM_XE_PAGEMAP)
-	vram->migrate = xe->tiles[id].migrate;
+	if (tile_bound)
+		vram->migrate = xe->tiles[id].migrate;
 #endif
 	return vram;
 }
 
+/**
+ * xe_vram_region_alloc_device - Allocate the device level VRAM region
+ * @xe: the &xe_device
+ *
+ * The device level region only aggregates the sizes and ranges of all tile
+ * VRAM regions, it is not backed by any TTM resource manager.
+ *
+ * Return: the allocated VRAM region, or NULL on failure.
+ */
+struct xe_vram_region *xe_vram_region_alloc_device(struct xe_device *xe)
+{
+	return vram_region_alloc(xe, XE_VRAM_BINDING_DEVICE, 0, 0);
+}
+
+/**
+ * xe_vram_region_alloc_tile - Allocate a tile VRAM region
+ * @xe: the &xe_device
+ * @id: tile id
+ *
+ * Return: the allocated VRAM region, or NULL on failure.
+ */
+struct xe_vram_region *xe_vram_region_alloc_tile(struct xe_device *xe, u8 id)
+{
+	return vram_region_alloc(xe, XE_VRAM_BINDING_TILE, id, XE_PL_VRAM0 + id);
+}
+
 static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
 {
 	struct drm_device *drm = &xe->drm;
@@ -217,17 +263,21 @@ static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *
 		drm_info(drm, "Small BAR device\n");
 
 	drm_info(drm,
-		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
-		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
-	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
-		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
-		 &vram->io_start, vram->io_start + (u64)vram->io_size);
+		 "%s[%u] VRAM region: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+		 stringify_vram_binding(vram->binding), vram->id, &vram->actual_physical_size,
+		 &vram->usable_size, &vram->io_size);
+	drm_info(drm, "%s[%u] VRAM region: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+		 stringify_vram_binding(vram->binding), vram->id, &vram->dpa_base,
+		 vram->dpa_base + (u64)vram->actual_physical_size, &vram->io_start,
+		 vram->io_start + (u64)vram->io_size);
 }
 
 static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
 			    u64 region_size, resource_size_t remain_io_size)
 {
+	xe_assert(xe, vram->binding != XE_VRAM_BINDING_NONE);
+
 	/* Check if VRAM region is already initialized */
 	if (vram->mapping)
 		return 0;
@@ -237,7 +287,7 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->io_size = min_t(u64, usable_size, remain_io_size);
 
 	if (!vram->io_size) {
-		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		drm_err(&xe->drm, "VRAM region without any CPU visible memory\n");
 		return -ENODEV;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index dd1c8bf17922..20148791cb21 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -8,15 +8,16 @@
 
 #include <linux/types.h>
 
+#include "xe_vram_types.h"
+
 struct xe_device;
-struct xe_vram_region;
 struct ttm_resource;
 
 struct xe_vram_region *xe_map_resource_to_region(struct ttm_resource *res);
 int xe_vram_probe(struct xe_device *xe);
 
-struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
-
+struct xe_vram_region *xe_vram_region_alloc_tile(struct xe_device *xe, u8 id);
+struct xe_vram_region *xe_vram_region_alloc_device(struct xe_device *xe);
 resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index 646e3c12ae9f..e4e928b39fa3 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -15,6 +15,18 @@
 struct xe_device;
 struct xe_migrate;
 
+/**
+ * enum xe_vram_binding - VRAM binding types
+ * @XE_VRAM_BINDING_NONE: no binding assigned, default value of a zeroed region
+ * @XE_VRAM_BINDING_DEVICE: device level region aggregating all tile VRAM regions
+ * @XE_VRAM_BINDING_TILE: general-purpose VRAM region bound to a tile
+ */
+enum xe_vram_binding {
+	XE_VRAM_BINDING_NONE = 0,
+	XE_VRAM_BINDING_DEVICE,
+	XE_VRAM_BINDING_TILE,
+};
+
 /**
  * struct xe_vram_region - memory region structure
  * This is used to describe a memory region in xe
@@ -26,9 +38,11 @@ struct xe_vram_region {
 	/**
 	 * @id: VRAM region instance id
 	 *
-	 * The value should be unique for VRAM region.
+	 * The value should be unique within a given binding.
 	 */
 	u8 id;
+	/** @binding: VRAM region instance binding */
+	enum xe_vram_binding binding;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
-- 
2.34.1

