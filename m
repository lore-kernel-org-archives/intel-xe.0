Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21ACACD98F2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 20:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3ED10E04B;
	Fri, 19 Jun 2026 20:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sucbs5pg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3CA10E04B
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 20:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781900991; x=1813436991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=P+M6/01fm+c0izjyUa9akFgE3DdGI9jrCbh0GwS6/xs=;
 b=Sucbs5pgrHqFrCQ9M5WyHPX+SJpylHnRgNJFYuHubcjEYsCYZPNrKcgJ
 +CoATbj+5FB5qPryN0I4CeBrU709kZAZgE9n9SnbxW9d4i8ouYLryHY6q
 YU9zzDKFd4x8MrQvyihbUQvw3HttiglDeB5ir06Lcncza9CnkJI/eQODm
 uq5++p76L2bIbT6U2TdnoA7Loi3y3AzmQEQuaVbrtN49iFx/+4GczXJMc
 /5CfW4hY3XIVlObBP7YFGry6Jhdzrqo1MhlR2EzuDq7fc+XgnQYjCDGpd
 tr80itDvB1PLwatVgCPxXif4O8M/gUcQ4fAp5oGuUpuL0haFXNxuRUFiK w==;
X-CSE-ConnectionGUID: yZ0nXX8PSOW6aIgKWZYzCA==
X-CSE-MsgGUID: +D0Oc4drQpeqIXjY0if4mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="82837380"
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; d="scan'208";a="82837380"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 13:29:51 -0700
X-CSE-ConnectionGUID: 33jNuy4nTRyZtuyCj1s82A==
X-CSE-MsgGUID: yl4A+i3HRVe2sTA2WmGkWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; d="scan'208";a="248764088"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 13:29:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 13:29:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 13:29:50 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 13:29:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRKMnzfVpJNKjua71ADVUVRVWumBE21uc74ZGTv97qZldrHqladkiFU1d2tozawMffskjhfPqP/H0H0Y1W3QQKWt4kERGQb7AmvVYyXdLJ11Cv78VMH81VBFKUQmzhixaxYc5Tz4h9/gbOfk8rhFziSbxTQ8OySVRKnQqlnJqiNZl3QXVVAAceS7hrW8JOYW55zTS4/RdZSUK11OBmA2tZ3umItTyx7tfmZ87o9oBdwtu/q7C0J8bOeBPyqIMPSHibwNqMCQ0qNuTkmqQtx8JrOo1KpPQOQJObj0tm2o9zhWNA2NQ368AGItBPf6uOdsB9p8M3s8DOWZVMrMNYByoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjxkjVQ2+qEQKeX0o2tiqbMjWR/tdo3RpEfkAaoEWjo=;
 b=el3JNszYnvEFefUN3FWc4pP2z60t2stnQRKpMMQTP/5eYZjdpDt5eZ+IsLSMldqL/rUJg5p/68L8s90rFNSS3f8Hztt6Xyff1ci1c9tb0UBtrq7MOlS6X7ziAh2ZocTZQHCe6u4CICTvQ/d6YhhsFV1EesACk+MkoGA/mhEobuwNLqa9OR7MzgmN7l5qNfhzOdm3FcjUDjP1AGaoQjP4w6YYaA27WO3vxQenQSaYGzcdcdkiGcO/Zp9UbynMldPTx7lQN4yOkTLoODm86dBKQtNUNz2mKSxHRDjXvUPwRIdpXwwMWtQ6D8fz5sgEVofFwuneGhXPCcGzxzVGiurCKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Fri, 19 Jun
 2026 20:29:45 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 20:29:45 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v2 1/7] drm/xe/guc: Use ID manager to get total number of
 contexts
Date: Fri, 19 Jun 2026 22:29:29 +0200
Message-ID: <20260619202935.2701499-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
References: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0055.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::19) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SN7PR11MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a7bd725-b666-432f-f7fe-08dece418059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: UeqLyy7BVHj6v1ggH023y/UkZ4iltAhejZ9OWlImt//vC5q78LAC2Q832neCGUvGWe8Eh14fJv1lXtu47/I3L7x9yn46XLzZUGyqGTu/CzW1sa/c0RsJ+mvlDbHTGslLlUXla5HvVPllSZLyxVSz+WjH3gu86Oq/OaROq9Ecvk4tQn27+WhyC3ualGprdXjRsj8IN5AAM6y7cdhZtCyyIrD+xoGrSFxuTYq8W5AI72DjUPQYkz5DlvyD/LTv7R93lOd6qPR6sbHF8UF+ktc4fcY/PzABeT7U0CqUwyAUWO/InPJj/ZKdUXNJOYBCK5QE5kIqab9ur66DUdsgXp/uKLQtRSnf3WbfNI4Dj7NwsQ6PuqNSyFpng4LkYNTjdiu00ArdkdTfUVyNmlW6W00Q7tGv86/lR0l8sV8YZxl8Ooj+8Z7dhibYIcWm6770lJIclukClPv8EJfqyomT8WTWG7HWJZB6JxDSm9FrIWmmXuyTYis0iYsojEWmNfHPt2A+Kq52ctpIIwCp48sPANEvJtojH6VpXfnaOP2SiXe3p1p0/i7lRZmwbDjwCqgd7/zFxhD9lKRQ45iE/LaGCCDEZOlwaA5R8fokZ9zktDJdtDVYFJupY9bb/iI9wSwzVnczzI8jHTQqAKsvCoONMTQ6XKdiRraJBznLIEy3c9Xf+ME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ditCMWtUTFRIRjkvTC9NK1dZNWtEUnI0SzFPNmJZNEtBNGsyLzNBK1FsUkdN?=
 =?utf-8?B?eWErTk5OVDNqQzF6amN4U1BMVldnbFVWWWF1WkNid0ZMWCtOL2Y4dS9zMTB4?=
 =?utf-8?B?NGI2Z1lRMzVWeXZtbHRaSHc4NWlsbFBMR3prVGdXZkxLc0lhYnd2ejBuc09O?=
 =?utf-8?B?RkFNSHhsaFF1eGplNGgzTzRib2JLZW9FcnJWY3UwUVNqajBLR1JEOEZoTWFu?=
 =?utf-8?B?cHZmQTZ1YTlRYVZDN0w0OXRRNlZpTnpENXRtaXlLR1pVTkV2RVBtc3dCdGhi?=
 =?utf-8?B?TXRSdmxhR0M1dU1vUUF6QzZLejJERElaM3p6Qno0a09Oc2t4ZEljTjlxR0x6?=
 =?utf-8?B?MU90L3BsTjVHaFhCdTVSRC9qOG9iN0F6alNxTHNNc3g1UW85RVNNejkwajRr?=
 =?utf-8?B?UmE2TmNXL21aMjlWT2xSRDczMTVSSldGSXhXRGNUYnphTkg2ZHdWeG1IR3Jj?=
 =?utf-8?B?UjQyL29MNzBVUXp4Y0o1ZHhDa3VHMzNpeUlVVjdLbUc4eVFoK0prRWJPMldC?=
 =?utf-8?B?OWplelZhbnNpSEhjd1B1TWFwT2NZSml4RHFWeERFU2NYNWE0WkJIRjcrSEZo?=
 =?utf-8?B?M3A2WmMzQmZQRCt5cDBWanFucGxvWkMyMlZRV0crVXZ3VDg3OXdMRU1IQlBV?=
 =?utf-8?B?dUliUEcyaFo2L1VtQUY4a1ZCNm14YjJ2NzJGS0IzeFFaNXJaQWViRHp6c3Fr?=
 =?utf-8?B?dmtaaGNyaW9OVTdGSzhBNWhNMlVCWGdESlVUZ1hQTFlmVFordXdvWHY3czVn?=
 =?utf-8?B?YXh1Y0VyWTRXZkFQb2h1RWZsVllua3NQb0FSY0FxVHJTKzVYOUtsNkpRZ0JT?=
 =?utf-8?B?dFFvQXUzdzRGa3lMMFoyZWwvUnpibDJyUnByTGpqT2pXNDV2U0t3SmR5RTVz?=
 =?utf-8?B?UFlVMmpsaWEzeW1Ybjczb1RBWGhXN2VNa3JMM3l4bmJWWmFBcmFKdHdlcGhv?=
 =?utf-8?B?RTBjYk12TFczd2xTL2dFeHIvOUM2cXllTXNGUVoxN1lQdUc0NjRINUQ2MnZ3?=
 =?utf-8?B?YStlcmJJem9oVmJDbXAwcHBzeUxYREtzaVpzRjVYNVRadGdLZkpUVlI1cmlS?=
 =?utf-8?B?Z09VV04rcjJjWkd1TDhFWW5CL2dVeTdpOUQ0ZWhwUU5wQ1ZmdENUL2VLaDB3?=
 =?utf-8?B?SzJDdzUxYTcwTU9leGM5b0VsNGtLdE5aNVBIekQ1UFdaUTBUcmxWRFp5MVBs?=
 =?utf-8?B?bk5wMW5ocnJYRlRKc2Nld1Y0eXZZTS9ITzdJTkxwUVdmQ0V6NXFQcE9PczVn?=
 =?utf-8?B?MVJ4UWQ4NXp4VVl4VlVzb2lWVlN5eGFYS0c3S2NIbE54NFc2OGlhV3h2TzBh?=
 =?utf-8?B?SFlBWS84V1ViVFErMmc1bUlpVUlwVk9qWFVSL2hsQlNjU0lQMHk0ZUhCcERw?=
 =?utf-8?B?M2pUeGU4SHMyYUFVZG5KQzVKb3EzNU9YWll3elNuRjNJU2Juc2duWE5LSTA2?=
 =?utf-8?B?MzlGRmRIaUZ4SzRubWFBSTNxTmdoQTNNYitTTlp4Rk5BS2l5Y3laaGZuaGkx?=
 =?utf-8?B?SFV1MHpBNzlKNnRVWWd3dEhDWXYvR0RtWmwwcHZWaWpOVklJU0pQcUZabVRi?=
 =?utf-8?B?ZEpKR091VEFqa2lieWh6QS9FY01BOGd0NDdwaDNITDNHcnNJLzF3YlN4Sk9r?=
 =?utf-8?B?NEF0cWlkUzl1UExpamlXejIvY3kvbTJoVlA3dzFiVXAxOFE0dVdrOUNIbVpN?=
 =?utf-8?B?MzV1ekQzS0VXUWNpTzBmOGlOMFI1bU1ZM0pkVHI0aERpdkN1UnBERjdRZkRU?=
 =?utf-8?B?WmxyL3pzenhhZTZidlgrSUJ5MG5wY0lyQTllNlVFRjZOQlhRaUFtSmV5Yll0?=
 =?utf-8?B?REY5d2E4N2NCZlpZY2J6Ui9YT2kyMEtjcENoamFkazNaNmJtR3JUNitpd2lM?=
 =?utf-8?B?OThxa2FuU2lZamg0N2RFc1FKdDRZZnplSFJtaTBWeEMvWFE4eDI4OFl5VndT?=
 =?utf-8?B?b1RYOFhxZG8yQ2NGUkFMZFI4aEROdmRBdlN0N1BJb2VmUXZ6VXdWbjY5S0dW?=
 =?utf-8?B?MUdCRzZpTUxBSFoweFpYOG1EM0hxeXR6bFpOL0dxd3RFVGwyVXBMS3RiSGxC?=
 =?utf-8?B?Y21DWHFNRG44TE9TZmxJblBJUkpHb2RYU09NNDd0c0hJcW90blIvblZqRXd6?=
 =?utf-8?B?aGltK0NaS3gvalE4c2hiTUExeVVNUllJRVQ2dXJDR0QwaEoxbkUya09md0JO?=
 =?utf-8?B?T0ZFZ0NWTVcwM1o4UkJjODRhUkZReWRneENGVkZqVkc2b2RPQ3pUZnVDemJW?=
 =?utf-8?B?WEtnaUNrb2JqZ1NMMmRHYWxINllHWCtEN0t5NWpYZVFiL0JGNy9Fay9HVmRW?=
 =?utf-8?B?bDQ1d3FNVFM2VEt4eVdaWFdUY1NVKzNKMkFzOGg3R251K1NyK2l3dVEwcE0z?=
 =?utf-8?Q?oJMgQhq3wYNpndeg=3D?=
X-Exchange-RoutingPolicyChecked: FPCMs8mPF6MccJqllBTXIqBcLxyoWH2XyXppvgW0xp7Ltg6Z1LcmsM9VStbTkdAzFpL1I5tzsqIFLTlaOKcfvZPK6SMoyX7HTiWmbNmwz/OshMgseQ1KJyV1qBpXtZijbR3obBUFbUhwzBgoz6l5SFN92i/0KVnHeLibpQKG9oWJSbrWCIb84IV51Eq7jfpTHVNAWWc5mKqAB1SjVkmOUHHpwamgVnIchMQhRxAS9DJcOPhSQdzlDqVk+/qobEdt/1iweRUAGCop0zl8+ZDU3rrjbqSieT6GhxmKWjEiFJGosos1qJrtV98qb5BmaKo6gSU1X/emJZEVeVpeom5c2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7bd725-b666-432f-f7fe-08dece418059
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 20:29:45.5789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RIlsyO9zQrZgNwSEyqqyPU3Ta9uH+w728VUFXSLB3yxk5+J4HrjEae6HdKLA7awyfg5cscE0kOYiOvgtTrY8RGQgO8KGHs3rYnPJ1eaPgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6897
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

Add a helper to return the total number of GuC context IDs
managed by the ID manager and use it instead of the fixed
GUC_ID_MAX constant.
Update code to use the actual number of available contexts
from the ID manager instead of relying on a hardcoded limit.

v2: fix kunit tests

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c    |  3 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c            | 11 ++++++-----
 drivers/gpu/drm/xe/xe_guc_id_mgr.c                    | 11 +++++++++++
 drivers/gpu/drm/xe/xe_guc_id_mgr.h                    |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c                    |  2 +-
 5 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index e6eaa94d4d30..debe4b7bdb03 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -7,6 +7,7 @@
 #include <kunit/test.h>
 #include <kunit/test-bug.h>
 
+#include "xe_guc_id_mgr.h"
 #include "xe_kunit_helpers.h"
 #include "xe_pci_test.h"
 
@@ -101,6 +102,8 @@ static int pf_gt_config_test_init(struct kunit *test)
 
 	pf_set_admin_mode(xe, false);
 	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
+	KUNIT_ASSERT_EQ(test,
+			xe_guc_id_mgr_init(&gt->uc.guc.submission_state.idm, ~0), 0);
 
 	/* more sanity checks */
 	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 2c9b85b84b1b..aa77bd4cbca3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -872,7 +872,7 @@ static int pf_set_spare_ctxs(struct xe_gt *gt, u32 spare)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	if (spare > GUC_ID_MAX)
+	if (spare > xe_guc_id_mgr_total(&gt->uc.guc.submission_state.idm))
 		return -EINVAL;
 
 	if (spare && spare < pf_get_min_spare_ctxs(gt))
@@ -916,7 +916,7 @@ static int pf_provision_vf_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctx
 
 	xe_gt_assert(gt, vfid);
 
-	if (num_ctxs > GUC_ID_MAX)
+	if (num_ctxs > xe_guc_id_mgr_total(&gt->uc.guc.submission_state.idm))
 		return -EINVAL;
 
 	if (config->num_ctxs) {
@@ -1136,18 +1136,19 @@ int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid,
 static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
+	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
 
 	if (admin_only_pf && num_vfs == 1)
-		return ALIGN_DOWN(GUC_ID_MAX, SZ_1K);
+		return ALIGN_DOWN(xe_guc_id_mgr_total(idm), SZ_1K);
 
-	return rounddown_pow_of_two(GUC_ID_MAX / num_vfs);
+	return rounddown_pow_of_two(xe_guc_id_mgr_total(idm) / num_vfs);
 }
 
 static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
 	u32 spare = pf_get_spare_ctxs(gt);
-	u32 fair = (idm->total - spare) / num_vfs;
+	u32 fair = (xe_guc_id_mgr_total(idm) - spare) / num_vfs;
 	int ret;
 
 	for (; fair; --fair) {
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index e845425d670b..0738fc277bd2 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -102,6 +102,17 @@ int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
 	return 0;
 }
 
+/**
+ * xe_guc_id_mgr_total() - Get total number of managed GuC context IDs.
+ * @idm: the &xe_guc_id_mgr to query
+ *
+ * Return: total number of GuC context IDs managed by @idm.
+ */
+unsigned int xe_guc_id_mgr_total(struct xe_guc_id_mgr *idm)
+{
+	return idm->total;
+}
+
 static unsigned int find_last_zero_area(unsigned long *bitmap,
 					unsigned int total,
 					unsigned int count)
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index 368f8c80e4c7..25c6f026449a 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -11,6 +11,8 @@ struct xe_guc_id_mgr;
 
 int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
 
+unsigned int xe_guc_id_mgr_total(struct xe_guc_id_mgr *idm);
+
 int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9458bf477fa6..537985f4d3b7 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2753,7 +2753,7 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_exec_queue *q;
 
-	if (unlikely(guc_id >= GUC_ID_MAX)) {
+	if (unlikely(guc_id >= xe_guc_id_mgr_total(&gt->uc.guc.submission_state.idm))) {
 		xe_gt_err(gt, "Invalid guc_id %u\n", guc_id);
 		return NULL;
 	}
-- 
2.34.1

