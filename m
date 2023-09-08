Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B1BEEB56E
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 20:33:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57A110E949;
	Fri,  8 Sep 2023 20:33:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20B910E949
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 20:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694205192; x=1725741192;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=uMh9AWZzkOr3rbpC+HDJiYBI5dAPow9Lw6LF5r9UJ6Q=;
 b=TH11/jLHQtk2IRgJs33IJWdlznkmq22fpmIp9tcqd6zHG4/Ue1fln4Gs
 OuTAg6qsvS/FJ3osDazKly6pJ+ZowJoSaRH1lZoYgLxtExXme0PTEy/Q/
 aHco472FaWHcIBGRPtchPx08LcKBA1XJzlb4Rsf1YM2ryCfihp0eFulLM
 vxDE+7Hg4+tVv2p649fGnAyBMjB26yKZuVDJbPTMFwUZKdOp6cmjFFPuZ
 /aVo9/1zRZS5S0XLbequPvAIeo1V3KLk1SwjmD6tU955apd7+33GDuHt4
 K6aTnTtpSn6mLCSEXqOtldlS4B6r6laFA2ESGsJhACvdxMRlft+4j3fD7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="464110316"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="464110316"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 13:33:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="989395862"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="989395862"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Sep 2023 13:33:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 13:33:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 13:33:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 8 Sep 2023 13:33:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 8 Sep 2023 13:33:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qlx/LJB5aw/j14jknCnU092pBnP+fadX8H6o+Elamo3+mOpIZ5lpy7LgdOG81XhBZp8fNouIi2Pf4x9yqUCTXp/Ebjdgvsvk6xipP1Lgd2tbx1+o3RZvd09hiXGjIWdWgzBEIkA5hTVOgvkgS8Qe8vlxQO6h3E5KigH2GaNWsbMC4hFs6OwH1Nge4EIPlKRk1t4sYBbWKG5uhB7nycmtntnj1NEGRpVfWUW2TQnqQbCemMZ1RWX9jXYdCy8syqkyTqQkBMUt/GQ8HTupgGGi5HGYhov5Fh7AhZ8Mi2w8pJly4iKUCzBCTuMvvulyb5ii2n7olHg4j8nYQIn8b4qxjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfOlENNOa+BAEEtqcODCgUhHDK4GyVEPtDpPwV+MUAQ=;
 b=mFcoE/kU0H1nvDjq+lJUfd5PsoFh/VvI0xA+96KUfYeckvhbVXF7eKgs+sS4pz/S6gd6X9ztEr2Z4HU2bd4JbrOg5KDrJYoVt7FpCF0jmGYX8zTltclugI1btY+jnu5dzveGv5+eC20OqinHJnIMU5NKNfpJO4GG/6cIzyKwunlKybTK+sv47En33DZdIVgG8fypxoeG8QxhAYl8x2rcGh4kyhAjwyg5GJe7ff4tZKM4QcYtbMq0PpjA8fo/Fzl/G/+RfCFApXARE5jYmRxmvqQUrV8H3xJv2WbokKRXWxDMfzYvlqrrq966yM/GA/ZgH+U38N2Z8QhTrov/S084Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by BN9PR11MB5226.namprd11.prod.outlook.com (2603:10b6:408:133::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 20:33:07 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c%6]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 20:33:07 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 8 Sep 2023 16:32:57 -0400
Message-ID: <20230908203302.449041-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0115.namprd04.prod.outlook.com
 (2603:10b6:303:83::30) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|BN9PR11MB5226:EE_
X-MS-Office365-Filtering-Correlation-Id: 8affb08d-01c1-4ee2-3536-08dbb0aacf1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dxrkp5MQv8aH999SLIL/NYgkgiZCcisMbQM4Hm2Ciuw+E3v+ZSCFV7QGn2/2tUk8EchuSGryBUKErxLsB0xRww6tKYCMf6n4GWmBH6D5bQRjURcdtAto5RbM4LG1wM6I0mOlViUY9FXsNwFmxAMCExG494WbdC+QzeGIIYC6/D3npZd0D1VhNyZrKqgl70BXV2qasGqxAYXRcLQTnPDYQmFo57BmkUX31gOT4hhV2XgVdnR47b5P69vcQ27smiMw96Y3Ai7JSnn8vL1hpi5+omDXhD8zHvU9hqdQu+lfH8O746zjbqKRrcMpMUHFju6GdD80QaXFuRy/O2GvzUy5MPPGOnQ8jZiV/MGE2O/d+gCg4ZuwN/2IUP+ESt9WFxUNaERYIUsTw5W0f5RDOfXXq5o/JW7JkBNVhOWwTReSPpDPORTNLmR+7YrwaEUbtiNeqHHrjkYG1rst6MD0NqjAZWMWJ0ejARzZgQREIm5q8a6tTBCQKveWaJTs5T23hOEsDUNEeH9e/aIkVPF8nfrUUxFY8gJbtxax98fcodMfGMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199024)(186009)(1800799009)(6666004)(6486002)(6506007)(6512007)(107886003)(36756003)(82960400001)(38100700002)(86362001)(2616005)(1076003)(26005)(966005)(41300700001)(83380400001)(478600001)(5660300002)(8936002)(4326008)(8676002)(44832011)(2906002)(66946007)(316002)(6916009)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pIKy2wgVwjH2wNBKtKAbB4ljU6LQ+A85gwwFEmccr3hzrS7uUybYmM88edyY?=
 =?us-ascii?Q?/fwrwPcE7tCnLPe/2Dc4kUV5xR1M70EWjN9/nZvVJ0Eg4bwBQmRhdo1xuEVu?=
 =?us-ascii?Q?EBWhEGY4NKxEUrZGBGi6XBMckMsGXMH4doeHgF7MVofIdX4MjMJCtMY9PTSP?=
 =?us-ascii?Q?STsVjbtFTlFc8KxMf9P1sQynSSryFLc9JEaR8cm2Z94GTWe0FT5nlYzA9S6i?=
 =?us-ascii?Q?UVA6pNhKKfBrLI6A6xW2Yjip96R8sfL/W05cmzl+2ArkGiw2quQ6xeasnUb3?=
 =?us-ascii?Q?ZCZ7ZcsLdMulbTKyfUv2TKdOxB6wziT4lhC+NFtPeri76aFDLetH3+JnTTJc?=
 =?us-ascii?Q?mWf2PDpQ5WfjC707HvoIPuhD9NeBk1BWLTPUwNe9lwU2RTJZp1l/HauNZOwl?=
 =?us-ascii?Q?RYNWaPrUpGsIAkVWRetHkAHEcyELTO0OEoht+al+8bdUwNK2FjdBvgsC/4ys?=
 =?us-ascii?Q?T2mnJWRSAIwgMgeUtFrd4t60KLyZLtJ/XSv4uQJVXtqtPJuGuol6mKTkOVzG?=
 =?us-ascii?Q?ZiIikU8NGH2eJyRPdhW3UgsBDc9Sgpm+C/VpOphGB0q5jevs/yIxMNwXWjC6?=
 =?us-ascii?Q?i2oHz43CBIrdejhFRdyBzZuIR5xtQWwh3bgiCwPCnxK9ECzg3dG78Oq1NQeR?=
 =?us-ascii?Q?6fLSfUB0iL2rHxJpX7tdm86f2/QxeBUKf05LSlLyn3OBeDrA5coyMsaJ3mGb?=
 =?us-ascii?Q?9ydcxl/xPZ5T30BBk0/1EGq7u9Moduv5URnEeR0b/eDlNh4tfScp6GShUX3H?=
 =?us-ascii?Q?HFVLRph1BH60NSOB8jLsa+Mu7kmQ8Ba1dPO+9HTLdU3olzLe8mqLuNDvAoGK?=
 =?us-ascii?Q?RzriRo3Xckt9nu4jcJAHuK7qZ7IWIYGeZFsYIm16VUja9Mjmw+oTCi7NK9gr?=
 =?us-ascii?Q?EbMSf5WF3MtTs7reXLuTeH9s+g6KEUzgmMEVVWQgzsK3tWPcp6ARtgtomHHA?=
 =?us-ascii?Q?U3AJBw2bPDDaFD79jKsTv+DqKq/9a8Sf72H7KGiWpkbfXN6Qihk2+X20SuJe?=
 =?us-ascii?Q?3VAzlw5cAPrikCa3xBzDupI2ncH/+eFCFbjlkNNXVIvoxyAWsKbg5aOE91/Y?=
 =?us-ascii?Q?+rto4tq5vBpjCi77+OnYpXOPFeDYtU/Nn7AmfF3xSrZ8wDiAqkm8NxN/0bLN?=
 =?us-ascii?Q?YEY5cUQolyTf0/0DGvlF0m/nsdYnHUGnk0qhrvdoMYlREh15lwvh3liB4l+H?=
 =?us-ascii?Q?4jJskEunpg1IAbfeW5q/yzQrn2nDWC0OF9MnhmfhZDAeNjaet3pUqTs0Pqgq?=
 =?us-ascii?Q?ojxVFczNA1krZCjJFfrqGhWn4bnj3uUUuaY/msRkmmPK4GeyoAOQPs12Zjc9?=
 =?us-ascii?Q?WGpaT2aia6rf2abvJZjLAr1g8DybcCgWfBH2/mw205xhs78riXA19MhMlyxz?=
 =?us-ascii?Q?uNOZoRbtGxaFZ4eF1K1Q9LMZ4/Yobakl0WaZ2A1TGIwGPnfOw8u9Qqllo5vm?=
 =?us-ascii?Q?P2kaBPCfHrazKulI1yfZq6lf9vK7rknQb4e7jgICZAqsdXcs10x2ORCYJFFU?=
 =?us-ascii?Q?7d2b6acJGlU9z29PF9B6ID9jpnYKyMSGnz14XPgL6xxL5cW6KQQNPJ9B86oO?=
 =?us-ascii?Q?7QrJ1dxVkyd72LWbWLuVxmqE+6zx8lg+B9WszSQl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8affb08d-01c1-4ee2-3536-08dbb0aacf1f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 20:33:07.2755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3TqyMRdlSb2XnsbSSg8YY1XjEV2BU/a4ATEAIHoLrNyhVzHrAh0wRT/6XfoOodc5VaW0mpPXkx5jybkIRbnRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5226
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC 0/5] Some uapi alignment in response to the uapi
 review
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

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Link: https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@linux.intel.com

The most intrusive in this series is the s/gts/gt_list. I could live with gts,
but it looks like gt_list is preferred one.

Another one that I'm looking for inputs is in the consolidation of the gt_id
as the unique number withing the PCI device, i.e., regarless of the tile.

so we might have
tile0/gt0
tile0/gt1
tile1/gt2
tile1/gt3

instead of the other option
which would be the gt_id per tile:
tile0/gt0
tile0/gt1
tile1/gt0
tile1/gt1

After this consolidation I'm planning to go and even remove the tile<n>
from the sysfs and tile would become an information file inside the gt directory.

Thoughts?

Thanks,
Rodrigo.

Rodrigo Vivi (5):
  drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
  drm/xe/uapi: Document drm_xe_query_gt.
  drm/xe/uapi: Replace useless 'instance' per unique gt_id.
  drm/xe/uapi: Remove unused field of drm_xe_query_gt
  drm/xe/uapi: Rename gts to gt_list.

 drivers/gpu/drm/xe/xe_gt_types.h |   2 +-
 drivers/gpu/drm/xe/xe_pci.c      |   4 -
 drivers/gpu/drm/xe/xe_query.c    |  40 +++++-----
 drivers/gpu/drm/xe/xe_vm.c       | 129 +------------------------------
 include/uapi/drm/xe_drm.h        | 116 ++++++++++++---------------
 5 files changed, 72 insertions(+), 219 deletions(-)

-- 
2.41.0

