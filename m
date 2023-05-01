Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63E7C77B7C
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 19:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824F410E274;
	Mon,  1 May 2023 19:03:27 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3201910E274
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682967805; x=1714503805;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=QP2WD4Eb39XJyuVzNfpCpaofa/YnOco7fNZ8XDojHjs=;
 b=QIP2kgFOZzzPYTDl+cvyVqolbLHVbBqsM1KR7IoQCNB7QLdtMwPyY6ij
 YAnciZG0jjpCUFMX8Rs4sqBb/3p7qjAKrhMcTIksJstfFbnZomCUgfTcb
 L68WouRvGErf32Ii4xFLJGHBjGos5EFLr2hBEyXSwhjJ8tUFZWFWFZFcA
 WRsFul2tDkofnkgkeM5AnVKPWQvua6tNswZICT2F9OTrz8RqgDKeUI7t4
 SA/uzOZBJq5PWeE0riDPuQzUJdU8PqN3+wwXkWytxZR1A2bWhnITLVpcH
 Pp4z3thIvRJMMhjDiiRZt+3NJsKPEhSiAOVkCyHKKcyHIl3bY79RI2P74 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="350292817"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="350292817"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 12:03:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="942152500"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="942152500"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 01 May 2023 12:03:23 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 1 May 2023 12:03:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 1 May 2023 12:03:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 1 May 2023 12:03:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipUg56j77VD19mt5CZezFSt8A4I5gT7FLQd3tS/YzrSUtvs9rT+093e0bsdVRLTq9a6GFEIpHsbhVK8ol0lVRbZw034eFrGbZfbwMTxTvggcQcK6i0l71s+yOcFADfWAPhW1kx7DCGfMgIxw2f4Fm3i3I1jZXtaihdVgcRkeZE1jslKqmLe1aqLK/8rw9wwuYAYzEg3AZu/t88AVYAPjfnvFMw/uv1oWFPo+VEna94+8fB6yBgE6NxDYWsigxRa5XsPGXdN7on3nO8cPx4SotMbhN9bZRG1NyJhxLaPMl6wKQZ4lTaIx4VWagLAJhpUdmwy3zu9I5X3Nb5DPEHVaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4c2P3Eo3phyGoymYygNWb6nIFkDHx821n6iVOZM6KU=;
 b=iecLAgNNPwoZG12i9P0XPTOfJmQ5DwLWomwmTYo25+r5bZuMueoGzGxLQp4Yx7Oft6NGIVXsEkGT1UrT1R6PoNBB+OgeQ0XYa/RjEiUuqPTyXyy03epfjSmrhiP01jVuWg9Bhyoqojq9skFpGZt0Ez5nskCAMUhoMzmflAQiIrZ4tP8ZnACmv7TJiEOxnBeigGE3oO1JEhQjEpkSaFMott6qKaeMXLD8dc8Pu1a/Iwx12QVf71KU0Ebnxtw+pOsytEJI4xSNC9z9lGQT6MJKCiitrQ3B8WZyGSm8agjuY03AMSE2ScIJNT50JWDQTWBZDaowGrChHr+TpRxrRHHv4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 19:03:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 19:03:20 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 1 May 2023 15:03:12 -0400
Message-ID: <20230501190314.609261-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0053.namprd11.prod.outlook.com
 (2603:10b6:a03:80::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5550:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b434e2-cac6-464c-0368-08db4a76bab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qMV6XUGVU/fX4CajmoNI4UXLfhxn70WFAXzaTSXEvVfCxIYyqy0lQmaDo0nwKhSTHzHOAcc48Owqx11BO9y67DBa/Hlv1UE17E+mhp0UYp+5535d7Wd8R/p0J61d90ymDvF9+FugNaOf9M9Elibm1/kvz8/QxK5S1IVLjm+dnzgWEc2R1IS/tI9yV95ELR0jpYZV9FriLd0uHtSeVCr9ImegZRAFT5I9ENaztgx3KQHaPD4m220XfS19bOY85QVCbZWyu6dpEFgj4jV0FO0Itr7qjLtLXZ1/4Bf/4JbyTMo8xusBnUcJ+/ux23vDJnBjXjctXf1ec8QErToKEDUkJOUj1gXWdbj2Ud1rFXiABSW1l4cuTPr2r+d/sFvb5NqK4Xe3UdxzutzBCGgMGC4D9/j7Dbf7eSekIrmiAlomEdWItuGTJj5O5FFj33BLmbiRyyHtWEArNWmmqYjq6O8JeErbyT8MXlsezF75OvHHYM1TVeVEIIRjeSXgQOeZ+o7ada5XLdldFur53UejSxMUEvj3pGvOSVj9y+3sShvLNUI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199021)(86362001)(6666004)(966005)(2616005)(1076003)(26005)(6506007)(6512007)(6486002)(36756003)(186003)(5660300002)(83380400001)(38100700002)(44832011)(8936002)(8676002)(2906002)(478600001)(66946007)(66556008)(66476007)(316002)(41300700001)(54906003)(82960400001)(4326008)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lM6VHkSTDhrN+a3aO46fLvIoBeYSzZs91oJdS4WCQ6+Pofk33YzlXmEHWvRb?=
 =?us-ascii?Q?AlHuXkPcaoDTjap3iB5xqAiJvw6Q+GUwLCzx2BALGvXu+QGNqVrAD00yTlpa?=
 =?us-ascii?Q?a7qHHI179dIfe/qCr3GHDPr0GqgP/9ojq6J5YHN/lcy02d+dLSCPRXxqR916?=
 =?us-ascii?Q?QTtEk5gTHOI0plDVdblvA7W8BiCsz6foLN1dQm/CZWUea9FSdDg3iAjc+ahQ?=
 =?us-ascii?Q?wXJkdRAgdzogXeDsTKc12uS1TbPDxGvP+krFAainwJPQ2DXtVIMpr2weXrEx?=
 =?us-ascii?Q?zaxRjYllUM9v99sUP24LbYyCklQN8JH2yogDBXVjdprcWK7u5X05fZQJQoFZ?=
 =?us-ascii?Q?m5KLQHFncsyHS+95OP44w04rLgZRe1Q0zldwFDIzqWg7RpRfhnu2vNHa0BSm?=
 =?us-ascii?Q?JQiinoucMUYFlAMOLH7XjZPdgzGmtM3cc/On+VwAfRoWzQMbrBetbDg9rtYg?=
 =?us-ascii?Q?+/wo4BqBgETqSakAW4zkTnVkBahQlYwA3Mm7ZEBWG+5WJXP7P4Fs4K8PFkwo?=
 =?us-ascii?Q?qQi46DoZw/AHFGag+/4CWOu/fCbbAnQ68WO8alrIxxV6d3h2LevFlFZ4vnxk?=
 =?us-ascii?Q?PLkUOsdsKeNWaywReGNrop1JpUDmCyNgJl1bUjq7TTONaFbMEDQRphfUE6jo?=
 =?us-ascii?Q?9qiY+4Y27HAjgLYw/m2UqccBV9WfiMSuRk8SxESvxvBJD0MrlZ2lCDICn8Ue?=
 =?us-ascii?Q?ulesOL97k7q+Lgt+0GTKoK2GjmCpdd9MkDaMT2zqFfXt/x2zv9kvMxhSIpS/?=
 =?us-ascii?Q?oJyyj4SCaplZzAvIKx/OlEqTTnH4zLMWDK9LM16vN5Y80f8q/V0cHeFC6FC+?=
 =?us-ascii?Q?m+/o7dIZ0yGGNwRZwrCBZpboa53hDq6t+ZlhafiK0GZQVN09Vx5JwQwWVmkK?=
 =?us-ascii?Q?D5Y7mpDlEzZo0jHD7rJyNLiA9lFisNG8qa2UqpmaEastAxFPBsYo17W5EmPu?=
 =?us-ascii?Q?lFxk6zIjBDjSEMaosbdacB7qk8mzAb2MwrKePkVVHNeohZefTewhoXMdJqXo?=
 =?us-ascii?Q?kebagPeFeFdeG8dEd1Lu8+qPpGEt5xqhAnrlFTYDDx4KDePAaifO68DZddzE?=
 =?us-ascii?Q?VraS/6peJKdgA9kjJX5G7VnL3+YwZrVgzpYlxPtyQC6sTZvfWeS0njlbzLXp?=
 =?us-ascii?Q?+iNhLq1KeBectrEy08oxvsPrKy3J4jA5+XatZAkmg/OVzCnbf1k2YRFZv3CE?=
 =?us-ascii?Q?IdF9RHebS1ajYiZrWaijTC0H0ltgK1mtJ7NZnSkYO8gGw1+hPt692oH/0P9C?=
 =?us-ascii?Q?AE8nuI7DuTmCYLcQ9XizzbUowzsK7UjMQPK8Aobb7uuoKF7ZlcIQ5G/Iz5kq?=
 =?us-ascii?Q?CBXXweD6cWkP39kwpXD4tdLpibnx9w6L08do3mqavzHHZ/Fu2B4Z7Zl+ALgN?=
 =?us-ascii?Q?A1sKbGhk/7hCZU3yX7hI0cfEEdImuxQZFQGAzLKaMVSXPe94ZYeNzxhX606P?=
 =?us-ascii?Q?EfTd4Pm+17bO2KGPHgufUubtiCs4++UOlUZWrXFOLFZS0hh30MoXpkviPVem?=
 =?us-ascii?Q?g65ofJTCdGXsNe17IpbFuIStvCMIcdc5p4E5njPiHcHat8B1W/c3ZJGx49V8?=
 =?us-ascii?Q?R/ODb6LcVs4enN8KeqE+id+twYCR9gX3phS/3Z8D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b434e2-cac6-464c-0368-08db4a76bab5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 19:03:20.3546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4eq4Jt9BbI/NsTCUHa0XNgHWZfVGBj6T26I1/3MGN7L87oNCB7Pju/XDQLoIsa8FzdYXjRGVoUSoEIcFxE2oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5550
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 0/2] Killing the undesired drm_pt_walk
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
Cc: Oded Gabbay <ogabbay@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This work was done by Thomas, but was stuck in our backlog:
https://lore.kernel.org/all/20230306131738.197862-1-thomas.hellstrom@linux.intel.com/

I'm resending for a quick CI, although I have validated locally on my DG2 here.

I also reformated it to be a fixup! that I can autosquash on rebase.

Then I'm going to push and do a clean-up rebase today.

The goal is to minimize the changes in the original Xe patches so Oded
can start the broader review.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>

Rodrigo Vivi (2):
  Revert "drm: Add a gpu page-table walker helper"
  fixup! drm/xe: Introduce a new DRM driver for Intel GPUs

 drivers/gpu/drm/Makefile         |   1 -
 drivers/gpu/drm/drm_pt_walk.c    | 159 ------------------------------
 drivers/gpu/drm/xe/Makefile      |   1 +
 drivers/gpu/drm/xe/xe_pt.c       | 110 ++++++++++-----------
 drivers/gpu/drm/xe/xe_pt_types.h |   4 +-
 include/drm/drm_pt_walk.h        | 161 -------------------------------
 6 files changed, 56 insertions(+), 380 deletions(-)
 delete mode 100644 drivers/gpu/drm/drm_pt_walk.c
 delete mode 100644 include/drm/drm_pt_walk.h

-- 
2.39.2

