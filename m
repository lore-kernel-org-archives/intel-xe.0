Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407F0C61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C69910E8DA;
	Fri,  3 Feb 2023 20:18:11 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAE210E0A4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455489; x=1706991489;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=GBziQc9dvr9Q6nQMPVWiNSDdVDPieP4AJvAEjYRw2xk=;
 b=hJwRkRg0YHDKNFGDLhZR8lJZBu++zy4fp/P9We1NK2Ms3lzZYvJl6n+S
 YMw4GdG8H11S9vfWtMNRBO8Uy+B3MShcAKpIUgSVKtBcotHSLcfJNyPZG
 6VUs3n/V363w0ctXSAH83bPVuGCebY2jdq1x/GvugV/c/nMiy7rMOf8Dx
 /+G3Pe8Z2v7mbCje44QXXJjbeKTypj4VZMwwSLy2DALYpKZ+nMAfwIIsz
 qnHe8O1Gcoh40dyovRmxFAbaitt82G3GnSacx5mkOlp00BM50uVyzIt+1
 HoA3CoWVylBWNTNj7g0sD7l6N8n4zkTQ+kdZ2BfrdZd26g/5bHnZapGdd w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="328861874"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="328861874"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:18:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="994630124"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="994630124"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 03 Feb 2023 12:18:09 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:18:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:18:08 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:18:08 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:18:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+fdcZi8F80sN26l7YavBxWdpw3zWy/EmjWVQK+NvGY2RBIgUTxoy2ZN+FCqRxG6OEWbFPkpzU763RgWnxdeuLZtuMUeLyeT44j6wX7hiZwi/WTozsc4PQCM03aHQYuSkYk7k7uJunK4VHieL7K8Q0PJH1WMZLjGCKriJaUs+B5nHeo+B7g17I0kWWYjr2Ob8BAONieBWzbdQteny3DTsPUmKSFPGQX7XjTbGpDpOGMDCbUIZRQay290qfpQBG/V2CV7rVl9UwaMMbef/Z2QQg86H2WukDgzglmgs+iNrGNalsbc5R33hH6lqzARulrBIPYl8s936EY9TN+UGoBfGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0iuW0oTVeMh+tzu2WG83POrryu0/PELlKWLdnRscyE=;
 b=FGCXb3UTAgwJq6FxEJYU7LMcHA5X5dJuH9+U0YasCZTITnasOFoMmrbRjK9K8X9W2brZDUm3tuQWMlrJQDSh+ETGnR5k3GgGjQtuDCGULgD63EUgDftIwq373hDiAq4+SfgSpzX8BRAm5aP91nZYQAlXwxG9g/J71KCx9qRcM7yC7oxVutTss1Q/EWDYJ6F3J44kvU2+AQvnnqKtZucC7sWtxtDHgdxVzvfQiouQYalFgmuC/wBrbk36HYWFiMYkBXalL8hYclCPwg+/OxVl9D1LskKoFyZHSm6P/rFR6popcb+h0bAbVY1Z2JLcHr6qQ0IuxkFJIFHikWa+zQLntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5706.namprd11.prod.outlook.com (2603:10b6:610:ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 20:18:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:18:05 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:17:54 -0500
Message-ID: <20230203201758.573775-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0092.namprd05.prod.outlook.com
 (2603:10b6:a03:334::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: 37326113-539b-40c7-9c48-08db0623c1f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jmui1+KGe3YhxfHPZddcLQXWlhACodjPfVTU0c6kCyTYE/EOt2Trj4Kwn/JI0757SVdCqeLTsZ2WM6FJuQvuJaK8T+sZDl+4X1qP8SJTq2zKyn+M4ic8TVIw9qpw+hmjtXzIfFyYHcJLZdS2YYrXrP1DfpIh3ztpzeBLZl8P8nWGbC5A0BN/ADgkHNbilHQaCEHJRQGwPQE7E2EVM+f+JHgtgHqlJNa68q155RarpEacmNavPo+3HoMI5FfRq0Fn5IuUazI4e8TVF9k1LhYm5JGK3QQnr5XIEtaveulK/kSwFAOC7RZ4hbNwH6CIaayA09vVTgun5x9X7AEnX5V+tSOf0XJsZgt08O6FK3stPBKVy2FnvgMODh2KFeo3cFAE2qQ7er7mPiKXZYCsEaHj9gPpFu3xlyordV0+v4lyr9ed+rjkIe6Gsc5rxCy3ScBS1hQo/3dVf9ivdGdXsVsXju1+0UBCRgVHh/Ogdo3eLrPKI9yDnc6UxxrR0Wzt/TsFsAuuYCtJ69b2YCkGS4bz/ceu0b0QVB0sYX1UcykbzcxpYCivHTqHwx3M/3xNwjXyDsc5c2My2DKgaHyJHSz8UtAlu+9RgNjmo76mv4yvqLmt1+3NocrApgpRn3ddlwld1e4Y+k0hYyZ4Rb3Py4bd7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(346002)(366004)(39860400002)(451199018)(6486002)(6666004)(107886003)(66946007)(66476007)(2616005)(8676002)(8936002)(6916009)(4326008)(66556008)(6506007)(5660300002)(41300700001)(1076003)(44832011)(4744005)(36756003)(2906002)(26005)(83380400001)(186003)(478600001)(6512007)(86362001)(316002)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTFVV1E1UlZnSy83c1AzbXlDa0prQ1dTSmVtY0JXejJTRG9GQ3kzcjhEVllt?=
 =?utf-8?B?ak5LZVdIQmp3QjVUN1BqVWpjaGg2aE45eUlvUmNYV25UNStWOC9sMXQ5L3V3?=
 =?utf-8?B?WDREZ1ZHR05hNUo3MGZiVkdlZXlETEpiK1RELyt3eXVILzh1anN6UkJPeU1J?=
 =?utf-8?B?OHpnQm1Pa3d6RDNkbnJ2Yi9yMVZMVjNWZFN5d2N1R1NnOGtBb1BJb1ZwRHVa?=
 =?utf-8?B?VXlGaFlkc09FeEZ3RmhOaDBxdXpzMWhtR3NrZHdUbThEZGc5ZkVIY0NTLytB?=
 =?utf-8?B?ZVZmMDF4VXBEb2xCSE1TUVVvdVFZdHU4cUtQanZkQzZ3YXJXQTBhUXdtOEgv?=
 =?utf-8?B?c1VQaXlRTVk0ZGJUaUg2eEh5QVVKMEpLUUhCQzlJd2EwdTFqTWVJMHhqdEM2?=
 =?utf-8?B?T0QrNGtETTJYSWJaK2lPVTZsSGM0eVFvUG9HWmNGMVlRS0pIOXhDSmo0Qm83?=
 =?utf-8?B?OUwzWmxPRTBxNjBXV2dQTXFGbFMwSmt5WGFneU1xR3NsREJYR2lYZnJUYkFL?=
 =?utf-8?B?enlTK0w3OGt5Z0IvNXBxYjF4MDE0Z0F2ckhxQ1pWU1NhcEhhV1BwK3d3RUZX?=
 =?utf-8?B?M2NsWEJkeGo1MmdqR1VVREd0R1BjMHVtUDdhNjgwbE44djE5Si9pQXhwSUVo?=
 =?utf-8?B?bSt4QTdhd2trZzcxR3o3eHZnNnNVMXBKUUltM1R5QmpTSWVuTmhXSWNOb3h5?=
 =?utf-8?B?QmNRRERPMXFtVkRkbzgwWitETk9JMnJqbEdoenplVkViY1NKMzZvRkFwbWxW?=
 =?utf-8?B?Z0tsckw5clp3MXU3WmRLOWxsL0xBMy94K1o1ZzBHQjdJV0s5Y29tWVJweENO?=
 =?utf-8?B?TEhjZ1ROSWE5Z1ZMOEUwSUZ3WlduNml4T3hOYVV5djJQY01pUDR0UTliNjVr?=
 =?utf-8?B?aHIreDZBSGFkQ0phVVBRcXRBSHFEUExHSkp6cHhya0h1THp6K0VZR001MTAy?=
 =?utf-8?B?Qk9NUkVTbXMyNVhra2tQc2RVL0hlWThWRHlQcUllTnZjYmNTeVFaaVhNMWRh?=
 =?utf-8?B?clZkY3M3VzJxeFFNWjRBc0xKNFQvYkRvazJDajVsS2RnM0RGRjRVYk1kWmlN?=
 =?utf-8?B?Mm9rRGQxVW5CTER3RFhldi9rc3hoUjA1ZGQ3TmYxeEZQYS9mZmdEYWlBUFFo?=
 =?utf-8?B?eW9Vc2dBVHIvR1h6MGRncGNzNUp3WmQ1TVpoUkk1UW5wcHpTRU1QY2dVMXpJ?=
 =?utf-8?B?czlXLzlmNmFVVUNDMUR0a2Nwa0dpaytGRTk2SlFOQ0lTRHQ5bmNPQUh1cy9u?=
 =?utf-8?B?VXM2N3lIZ0J1ZThuQm5GbUhHdU83eCtDYXM4a1lBVVZOSXQ2MzBqZFNXZFFp?=
 =?utf-8?B?b2pNU2dMTm1sbTI4KzUzZVZMNVVvcFNkZ3ZGY2dseDNZRjMrUzlRTVNtM1RK?=
 =?utf-8?B?VFdtZ3dQcUpxVlBqcWx3aE0vY2JKT2ZwcjVUUGliUDBHWnZhUkpNNjh4MStJ?=
 =?utf-8?B?U1ZNWU93dWE0NUVFeG52VXZvMmZvVTFBaUtGZEhwL1FTV2xqdTJlUm40R0Rz?=
 =?utf-8?B?YW0vd1g5Y1hqN09tVkNGT3ZlRTMxRHVaMVRRWFpMSnhPZWpHVnVxWmhGUnIv?=
 =?utf-8?B?WVhJVXFNWkRnajFQYnFvVVlGejAvQ09VNmZjRWhPWDMxS0JqR0p1ODZiY0xL?=
 =?utf-8?B?WHFVSERrSVM0MkNZL0ZoQ0VvK3M1QUhmeUJrZzlSTzYxazdnV0txbEdGWStQ?=
 =?utf-8?B?emI0b1IzUVNyRXNaSU9ac3d6b1NtNXBmL2JJVmlJMDBjelllWS83V2I2eGxY?=
 =?utf-8?B?TDNXOEp6MWRiVE9CNWttTW8yKzNBNFd6eFc0NHhaUjhNejY3a1F3NWRoU2Vs?=
 =?utf-8?B?bklkQnlkT3pPMUNhYWNlMjE2bFBBWU9QM1pITEJzMndxd1ZrQVgreTRtQ3Fz?=
 =?utf-8?B?K2t2QTcyMmdPMUYvM1pZK1hJRmQ0NS81RjF2a2F0TkZURGxsN0NyQ1UybjBE?=
 =?utf-8?B?M1B4TW9iWVJhTjNPbXdjajZ0bzV2eU9WNkhSaGFTd2RadkVIaVdpL0l6VWpT?=
 =?utf-8?B?eDN0RUh0L3duT3RkRThPTWZBN1U4dXBiYXlWOTFRNkQ5SGlvckRYcEVFanU1?=
 =?utf-8?B?d1Ura1RDelBEM0pBMHF5TDBWaTF3eVErMGZBcFRudjdCVGZsMk8xQk1pNHBW?=
 =?utf-8?B?N1pPMUNjdlNwN2FLcUo4UmRzSXVNd1hmZG01TWRPbFpKK2dJLzYvK3c5eCtM?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37326113-539b-40c7-9c48-08db0623c1f8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:18:05.3318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qsMb5DwCGBrg5VfUad8GvvYxa8rndjsKtmDavp730L1j+1B7JRwBKKnxW3RV9/inpqaJxcp7FisG31X1bI9xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5706
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 0/4] A few display patches needing review to be
 confirmed
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Resending a few chuncks to ensure we confirm the reviews and
are able to merge to drm-xe-next.

Matthew Auld (1):
  drm/xe/fbc: set compressed_fb to NULL on error

Mauro Carvalho Chehab (3):
  drm/xe: fix XE_DISPLAY dependency on ACPI
  drm/xe: allow building XE_DISPLAY without ACPI
  drm/xe: fix DRM_FBDEV_EMULATION dependencies

 drivers/gpu/drm/i915/display/intel_fbc.c |  2 +-
 drivers/gpu/drm/xe/Makefile              | 13 ++++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

-- 
2.39.1

