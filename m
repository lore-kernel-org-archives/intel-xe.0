Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647F9CD98F2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 20:30:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F814895B9;
	Fri, 19 Jun 2026 20:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSolPXYy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE680895B9
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 20:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781901002; x=1813437002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xlByymzx2rHISvjIbVaeuA0C8xhsbGneck81+DxMZlk=;
 b=CSolPXYy2hkLNxqGyTNJ6LPpdp5zNKdetiAFfay6PPcXaWuIJ84sMLUS
 8I880ZADnAkzLNMemDl1rTVMVjXgZZKzd6I4EQvHxnr1ckezZvjPCHtMk
 yEUn5itWqMgsDaCk8+uW+jmxaMetaTQU1fmwrQZqVwBD8CNgyHJ4phmhD
 GwK0oYfhuRcIknRtcuS8GdFkyIEXIVXef4PQwPvWrvO4z+9tEwy0DqZv4
 sAQGcBsc3eH2RM6FCnw3cB5kNPHEaytaPGiHSAtCo0O/buX6KVUMthrYB
 uOPBEeFJbCkPkcRwtp24KI10UeubD/5C0nwRRVciqLbz7OZXX4xTYMlOI g==;
X-CSE-ConnectionGUID: lbNFxRGdRz+9mXOuaIKX6w==
X-CSE-MsgGUID: QeyBelmXQfCdf6JMIetvwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="82852266"
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; d="scan'208";a="82852266"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 13:30:01 -0700
X-CSE-ConnectionGUID: +lCNvBZdSAmzPBerrfY/pw==
X-CSE-MsgGUID: anhPQ8NDTLKC5QC4Q7ArkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; d="scan'208";a="248739308"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 13:30:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 13:30:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 13:30:00 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 13:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7g3qhfOgtKYuYE43PtvzoH68Aa5Zb7s4odSH85d3mBysLybmiga6TPqhEIhaOe+a2DIGJwN0RNwxiq1o4M2Hl3DyQoZ4kNj2yZnkUTov5E4AZLcOC+k9AhohSfg0F5o0r1/k+KpvSWZIKhwaMyABSW0c3VhCc6fES92e4FUWlP15Z1Wia8TXwYPW3XkQupPDZa9Wp9leeCqFTbap/y6VF44COlvbWCSJ+MhBvmC51vjafmJIrW3MJtqaQ5Q+3VsujZcZWFz67/IzHs0J9uzb24O8ERLO4KnjKUNFl8KKdT/rEft55m6+W5PcoCU75z6azPg3ZSqf+syBGtiJe9arg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/yFAZ9X1yL64nuvOJcPzFZXWggQkNQeXYNgqLP4p7s=;
 b=euNHqOj+gl8ViAwlgOIRC+biWsOB9xNxklLseW8UAfR3L57NT743kJ+dd0eGQlsHoHrl07fLEryI4w50dAC1PYb8omWN+zs/uJz8HGLAqA0c2oFOj3XDYRqk0PKoDFg9N6NFckAzizx1B2lNM1ml2qFmRIMXBiMYArs4hMlBFQK2t9wB5SYIEupMbusJcpSBJXIEaIht0+5Mlc9SkoFVbhVZwMrcxEqzy8DWByiKYSd580haa4L4rTrFL7DopQU//lkh5VteROw8Jh+wyFW9INPz30YP4Ug2siqscqIAA4XOJ1ODWNF8/a43HAchwqGRjxw2CoxY7cXXt17/q8od0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Fri, 19 Jun
 2026 20:29:56 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 20:29:56 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v2 4/7] drm/xe/guc: Decouple the GuC DB manager from the
 submission state
Date: Fri, 19 Jun 2026 22:29:32 +0200
Message-ID: <20260619202935.2701499-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
References: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P251CA0029.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::35) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS0PR11MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: a99be3d4-000c-48ef-922e-08dece4186ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|6133799003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: zZJ/kT8WxB4WZDea4hn/QsFRIrHi2xnNbm1WJUQxjN7zc3aed/zM0N4xmQQMURDfFBi08np/mZeyCT5p2Vdeav/fRKziTMycekBtam8zC/qGOnNdIDjXuUKe+qxg3Df/xy1xV1WTnhSQpDADqZwjcxKAFkz0B3KjGTf5xU1GLD1mDqUbS/U1JmybGnCSELq49GmEixe1nKLdf/323adyZ2RXAfMTch4RlPNKEpRGohFh6HwIYszBH72BswA5HXH/262DRtyJ15nKSHYF4SdiGpJLOFz+w4kJMwpJMhFym/GA+ZnXhVSUf3JwiLSryNq3kYiJ0ReF2MAjWjWU+rAPg45UA1yFTGBK6zJqTMPVRDE4HxO5ZV5NR3DYZB2Tm0guXDn551arh5XpX0LXBePUGqRf5q8aWAPtvghsdD7LWRNozPEmhg2x3SeQ+pKptAFWWCN0OsmMhF8xNB4rjkkpvvJfT/cUn8qWAA8UCQoJvhSXTF/nta5TLUGsqnJ4m6H/PoLRigo51NuKWnzRNPBY6hBIzbPAaaR8UOzJKMGPslWt9422GTDtZyq1IUoHYldYPgo2SqDma8LHhCTUsaKRoqD/wdfJOXeJ/7Kt1NkBdAYh9gtnaeLuHINOyPSgGzEWur7PqBILbw1bHX8lgAxVPA9bjw7/iN1nr62D3tz4QBg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(6133799003)(11063799006)(56012099006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anErS3FETFRxUERHZklsb3dxenJ6U3ltSDhnNnZvYnZPQmtLTHBDTmxUdXR1?=
 =?utf-8?B?bGprM3ZielBoZVBQUW5VOUgzVnVkQWIwL0hyUXRVeVNBamZEQk1rVmtETGlI?=
 =?utf-8?B?Q0dhVk1hTEFpOGZ1NkRkUTRmMnNDdVlPcjBDSFVhTTRiSkoyNzdaSzRIOUZU?=
 =?utf-8?B?TzhMWjdmY2NpWGtwemZHVkxRNEhrKy9tRXV2MWZ3NGxNeU5ETWxzWkVYWUZT?=
 =?utf-8?B?dEhjWVhsNkZJNUY2SnBxYnhPUGpBN3BmS2ZzaEJSc202dXRadDh0QldPZENo?=
 =?utf-8?B?QnhrTThpSi9OdWJkSHBEeXUvaXg5TkVTdyt4SmJjcEpCRWlERWFqa2hFdU4y?=
 =?utf-8?B?RERpYmE5RmxzL0RhS2kycWx6M0lUclg3RkdaakZXSmZwazhOOFYyb2hsWkFY?=
 =?utf-8?B?dnJHMTRhTisrRXpHTDRXVWc1Y2NoUFdXWU1JTGsxUVp2YURBakZTVlhISk1W?=
 =?utf-8?B?azFManExZHNyVE5pZ1U2SFlLZ2xzTktjSHdwcVN4eDVxN2JrYWxnckZIZjZV?=
 =?utf-8?B?OW4xYmZYY2lXdlIyN1lEMlhjTE52NC80T0E1RG16c2FNSVVDUFNIeHhsaFV2?=
 =?utf-8?B?ODM5TDhIMFR1UWhodWtJSnhHNWdoVmZSM2FXbjBEOXJiMDlDL2RkVDQ1bTIw?=
 =?utf-8?B?N3k1ZHM2eTlJbEhJM2FPLys3S2x0NmIxQ3RIWFpPcWZiV2ZyOFlZS0tGc2Ja?=
 =?utf-8?B?NmhLU0ZJcndYZnNhVStvc29ocVRUZS9VMnVnNkdKbkoxOW5senlyOThHSVNF?=
 =?utf-8?B?MXZaRVpReS9zSy9VaHBwR1lZYVVBaUljVFhIMWpVU0RNTCtaeHc4blN0YmVH?=
 =?utf-8?B?NEV6cTArU1lGSlExT1hEeHY0a1UwVEI5bnFkN1BQeEhLVjFoUGsvaVZVYlAw?=
 =?utf-8?B?cWpITEo4VFJBTmxaUVBXa0owc0hxeXA5cU1uWDVTd1hmTkdEOHNiT0RUd3k1?=
 =?utf-8?B?ejJLZ2RVc2hKVkhJNC9hYkNITkQ5MVBWNmpSUXpyL085Z3psVHYyaWRiOTVX?=
 =?utf-8?B?d3hlankwR0tPazZ4djVFUFF6QUJoMGZXaGVmb3gyRFFOYXROdFNtRXd2cit6?=
 =?utf-8?B?L29uMkxVdDIwT1NmZTFydVRpeThFdGF2OHppUU1FVC8xQWhDMy9XOWt6VjJI?=
 =?utf-8?B?ZkV3UE1McksxeUNQTUN2THEzYmtHZUtJYVNYZURDWmpqcDBrTWF2dDduZlBW?=
 =?utf-8?B?emYxdVlOSzF5ZHJ4Y2dab3ZYdWVVWGJHNFBra1N2OXlxQWs5NEphaGNUMktl?=
 =?utf-8?B?aWtzd2xPTVRrRnovNm5xM1R6OFhvQlZpT014NWhrNGR3ejdvWENWRTJwMi9u?=
 =?utf-8?B?eWE2cytYbDdFVWNJQW9yS1YwVlI0a3lpa3dhWVYxMjduR1cxeXRNQ2JMbGEx?=
 =?utf-8?B?RjY5Y20zd2hmV25HU3o3enZoRWdRT3VVQmtNRkd6RHZOcHc3dnptdGFUY2Jw?=
 =?utf-8?B?aSt0ZmJkbURVN0hvdDFnUy83SWtZTUFMMm03UG9DcWJaVVI2VWFtQXQrdm5I?=
 =?utf-8?B?cWJJZ1U1cGtrZUNIT0VWVnFodHc3eU8yN3FINkxyVFdaa1hZbFBtYTVZRUVW?=
 =?utf-8?B?cmp0Z09TOFExUW4yaGU0bWt4UGZ3Umlpb1hYY1N1UTFacWdqOUZseEVuVkhw?=
 =?utf-8?B?aGptcUd4cUlLVStQdThTbnM4MEowUVZwMmdWSEZGNmxlaUtPMEJsdStkVDRi?=
 =?utf-8?B?cklwUU5lT1VnMTBIWHNTcDB2NUhVYW5xbms5OTByNGh6U2ZJdEdKNndmKzJ0?=
 =?utf-8?B?cnVpTWtuN2JRcHFjUnc1QXZPT1MzOWZkVkF4Qzh1Y0RzNEozMHhoZUJQSkc4?=
 =?utf-8?B?bkF3RUdkVm5WMXMxMlRmOTlEMGk3ZmIvM2xCM1Zib0J3Nzl2NC9rZVpxMFBk?=
 =?utf-8?B?RkxydU1NTnNXQWN4dXA1MmV2d3dZYVhOVHUxK2JhdlRwY3pxZ3dib1pyUWJE?=
 =?utf-8?B?MnNRSFZFZG8zSkwrcFZkVG9NdXltclNRNjhFUStWeVBYU0Y2L0d1ZTFQVTdi?=
 =?utf-8?B?OWhuemhUNlozV0RrWmJickI1TzFlbjhvWVZxRVM5MWtwZ3VlS0w1cEd3NWpa?=
 =?utf-8?B?czlpMmt5a3ltcG1VTjVnMUkvVlI3S0p2a2JNOGt6UER2UDk0ekRaRzlqR092?=
 =?utf-8?B?Vzd0U3FENUxyMlhMbHdDTlp0eVVVQzZYT2ZDTlF4T1JCSkd3eHY1VkJEWFNB?=
 =?utf-8?B?MmkxMzVGampwTGJSNXV3ZHEwZW5sYTlFTjJyWkVoL1QzNndKSVNCUCtaOXNw?=
 =?utf-8?B?eVExUnJpRUhTY0UzQ3dUVHZVMFUydytjaXF0akJBSXVnUTNjbXZmdUowUXZN?=
 =?utf-8?B?akxjQ0dHNkliejF3TDRLdWdJejI5OENaSnQrM3VQNXMzMVJzOXBOR2ROeVVU?=
 =?utf-8?Q?ZAAf6Q5PHhOM6ofA=3D?=
X-Exchange-RoutingPolicyChecked: k96IsgUUl57LK6rXhis4MeKRvNTQn0ziInx83z6boIpfUA18xK+JRTdbUlt0XFzKZ23SWJMg1WM+M2x76vrd8rouQLL41NVKPnLPWRSQhrPYtMOHNL8++3EEMu8KDG+8bcKbwWQSdancEzEpiD3en0dMxv+bfgm0Am3VTuKBa1LjR2vH5J9yLoEgZv011cbWsQLC1yU+jnQ/3OsfNVhE2vDlYOa6aAEbMc7/Kij22qbFpGsYr1sAI47GG8BKQbAG8LygJ58zBBFmCERwYFrIfmCDdyZgYurKoOi9gbNV3jw3HLra4xaL+q+biReQW6RpJEgseG8oLyjo+263TcvKXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a99be3d4-000c-48ef-922e-08dece4186ff
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 20:29:56.7184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eh7k35gRubv6zJrrO3jfspW99jV1pIq2jRPP8MKYOoT0epsimOW2iQdoEy38Dk9UYsFT21VJAUpp3HVpSOgNEKhAc53f7TQYy7U2Df1PlVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6375
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

Refactor the GuC DB manager to remove its dependency
on guc->submission_state.
This allows using the DB manager outside of the GuC submission path as
a standalone resource pool, which is needed for future patches where
it will be used as a separate pool of doorbells for SR-IOV VFs
provisioning.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 20 +++++++++++--------
 drivers/gpu/drm/xe/xe_guc.c                   |  2 +-
 drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 17 +++++++++++++---
 drivers/gpu/drm/xe/xe_guc_db_mgr.h            |  5 ++++-
 drivers/gpu/drm/xe/xe_guc_types.h             | 20 +++++++++++++++++--
 6 files changed, 50 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index c10d2b3f50ea..8f0be29ae9e3 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -107,7 +107,7 @@ static int pf_gt_config_test_init(struct kunit *test)
 			xe_guc_id_mgr_init(&gt->uc.guc.submission_state.idm,
 					   &gt->uc.guc, NULL, ~0), 0);
 	KUNIT_ASSERT_EQ(test,
-			xe_guc_db_mgr_init(&gt->uc.guc.dbm, ~0), 0);
+			xe_guc_db_mgr_init(&gt->uc.guc.dbm, &gt->uc.guc, NULL, ~0), 0);
 
 	/* more sanity checks */
 	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
index a87a7b4b040a..fed4e70be49b 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
@@ -15,16 +15,20 @@ static int guc_dbm_test_init(struct kunit *test)
 	xe_kunit_helper_xe_device_test_init(test);
 	dbm = &xe_device_get_gt(test->priv, 0)->uc.guc.dbm;
 
-	mutex_init(dbm_mutex(dbm));
 	test->priv = dbm;
 	return 0;
 }
 
+static struct xe_guc *test_dbm_to_guc(struct xe_guc_db_mgr *dbm)
+{
+	return container_of(dbm, struct xe_guc, dbm);
+}
+
 static void test_empty(struct kunit *test)
 {
 	struct xe_guc_db_mgr *dbm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, 0), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, 0), 0);
 	KUNIT_ASSERT_EQ(test, dbm->count, 0);
 
 	mutex_lock(dbm_mutex(dbm));
@@ -38,7 +42,7 @@ static void test_default(struct kunit *test)
 {
 	struct xe_guc_db_mgr *dbm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, ~0), 0);
 	KUNIT_ASSERT_EQ(test, dbm->count, GUC_NUM_DOORBELLS);
 }
 
@@ -63,7 +67,7 @@ static void test_size(struct kunit *test)
 	unsigned int n;
 	int id;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, *p), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, *p), 0);
 	KUNIT_ASSERT_EQ(test, dbm->count, *p);
 
 	mutex_lock(dbm_mutex(dbm));
@@ -86,7 +90,7 @@ static void test_reuse(struct kunit *test)
 	struct xe_guc_db_mgr *dbm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, *p), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, *p), 0);
 
 	mutex_lock(dbm_mutex(dbm));
 	for (n = 0; n < *p; n++)
@@ -115,7 +119,7 @@ static void test_range_overlap(struct kunit *test)
 	int id1, id2, id3;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, ~0), 0);
 	KUNIT_ASSERT_LE(test, *p, dbm->count);
 
 	KUNIT_ASSERT_GE(test, id1 = xe_guc_db_mgr_reserve_range(dbm, *p, 0), 0);
@@ -152,7 +156,7 @@ static void test_range_compact(struct kunit *test)
 	struct xe_guc_db_mgr *dbm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, ~0), 0);
 	KUNIT_ASSERT_NE(test, *p, 0);
 	KUNIT_ASSERT_LE(test, *p, dbm->count);
 	if (dbm->count % *p)
@@ -171,7 +175,7 @@ static void test_range_spare(struct kunit *test)
 	struct xe_guc_db_mgr *dbm = test->priv;
 	int id;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, ~0), 0);
 	KUNIT_ASSERT_LE(test, *p, dbm->count);
 
 	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, *p, dbm->count), 0);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 4023700ff2a9..092084b200b9 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -882,7 +882,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_db_mgr_init(&guc->dbm, ~0);
+	ret = xe_guc_db_mgr_init(&guc->dbm, guc, &guc->submission_state.lock, ~0);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.c b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
index 697bf8684ebf..f810692ad8fa 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
@@ -30,7 +30,7 @@
 
 static struct xe_guc *dbm_to_guc(struct xe_guc_db_mgr *dbm)
 {
-	return container_of(dbm, struct xe_guc, dbm);
+	return dbm->guc;
 }
 
 static struct xe_gt *dbm_to_gt(struct xe_guc_db_mgr *dbm)
@@ -44,7 +44,7 @@ static struct xe_device *dbm_to_xe(struct xe_guc_db_mgr *dbm)
 }
 
 #define dbm_assert(_dbm, _cond)		xe_gt_assert(dbm_to_gt(_dbm), _cond)
-#define dbm_mutex(_dbm)			(&dbm_to_guc(_dbm)->submission_state.lock)
+#define dbm_mutex(_dbm)			((_dbm)->lock)
 
 static void dbm_print_locked(struct xe_guc_db_mgr *dbm, struct drm_printer *p, int indent);
 
@@ -74,6 +74,8 @@ static void __fini_dbm(struct drm_device *drm, void *arg)
 /**
  * xe_guc_db_mgr_init() - Initialize GuC Doorbells Manager.
  * @dbm: the &xe_guc_db_mgr to initialize
+ * @guc: the owning &xe_guc
+ * @lock: mutex protecting this manager, or NULL to use an internal lock
  * @count: number of doorbells to manage
  *
  * The bare-metal or PF driver can pass ~0 as &count to indicate that all
@@ -84,10 +86,19 @@ static void __fini_dbm(struct drm_device *drm, void *arg)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count)
+int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, struct xe_guc *guc,
+		       struct mutex *lock, unsigned int count)
 {
 	int ret;
 
+	dbm->guc = guc;
+	if (!lock) {
+		mutex_init(&dbm->internal_lock);
+		dbm->lock = &dbm->internal_lock;
+	} else {
+		dbm->lock = lock;
+	}
+
 	if (count == ~0)
 		count = GUC_NUM_DOORBELLS;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.h b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
index cbe163fe7ece..e29e318e213b 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
@@ -7,9 +7,12 @@
 #define _XE_GUC_DB_MGR_H_
 
 struct drm_printer;
+struct mutex;
+struct xe_guc;
 struct xe_guc_db_mgr;
 
-int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count);
+int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, struct xe_guc *guc,
+		       struct mutex *lock, unsigned int count);
 
 unsigned int xe_guc_db_mgr_total(struct xe_guc_db_mgr *dbm);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 0850918c28b0..717cac854724 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -21,17 +21,33 @@
 #include "xe_guc_relay_types.h"
 #include "xe_uc_fw_types.h"
 
+struct xe_guc;
+
 /**
  * struct xe_guc_db_mgr - GuC Doorbells Manager.
  *
- * Note: GuC Doorbells Manager is relying on &xe_guc::submission_state.lock
- * to protect its members.
+ * Note: GuC Doorbells Manager uses the lock supplied at init time to
+ * protect its members. If no lock is supplied (NULL), an internal lock
+ * is initialized and used.
  */
 struct xe_guc_db_mgr {
 	/** @count: number of doorbells to manage */
 	unsigned int count;
 	/** @bitmap: bitmap to track allocated doorbells */
 	unsigned long *bitmap;
+	/** @guc: back-pointer to the owning &xe_guc, set at init time */
+	struct xe_guc *guc;
+	/**
+	 * @internal_lock: own mutex, used when no external lock is provided at init.
+	 * Do not use directly; always access through @lock.
+	 */
+	struct mutex internal_lock;
+	/**
+	 * @lock: active mutex protecting this manager.
+	 * Points to @internal_lock when initialized without an external lock,
+	 * or to the caller-supplied mutex otherwise.
+	 */
+	struct mutex *lock;
 };
 
 struct xe_guc;
-- 
2.34.1

