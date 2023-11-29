Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8627C07E98
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40D310E5D9;
	Wed, 29 Nov 2023 01:17:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCBB10E5E2
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220670; x=1732756670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rTlNtVBJWm7bSyiMBLgHrXR6dyZS9GWPaw9xiuAGNYA=;
 b=LMAWuuWbiNyoUKBMs3gs9IRSdVsdH6xJiyiixfnII58A+sS+z82i/7Ju
 Ya1PcIZmQlY3veXfD2qs6y5p63U4xouEW77Vgy9GcgFzQ1/gbH8K6ABxb
 tp+wxR19vjTxYqwjTbVzgWx/vp22zXSpV+hQ3VMelCwIGOf8Ntl8Nfdd5
 8cTQ1JoB67HoHEn5Spqq8tejppoasDXQbFnse6kEKMLz/qE4NbCB73H8L
 M5X9rADuv380/EftGG4M6/7CALm1aWrqbJKPxFSOBK7AC0WKgc4/gPXli
 xBl39a9LO9x5j5ASfSU4TQHDQdGTb92zu1t38DSwdvRK87h95iXvbW2Vy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372436692"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372436692"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892272887"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892272887"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:17:50 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:49 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:49 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:17:49 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTUhXWChwAkP/1AeoD6fBnQlk5NaqB6e/Sa31N5YrENstLfVZkS5wOOl23sYl7aNZgEYn8eG1XtPih3OmlJN1E2Dlui7syphwMS/b2fRIpe05l/IsPfZXrCYI++6387t4hQQ1cb6u1vGTDLeDXsJuusJ72HqoznK3FN/f/7dSrI43aiuUyRTQxHGJ9LJY7uDbOC/AD3FThr9gWzeNqhNPOcB7BsfpFvXBUH0ptCaa8EdcRX2jZ8F4LYBGqpBHH4LXPPlYxBNrq8Pbna7sUm5LTvxZUgAR/f2n1rgApnx35ellY8sqXUE4p7U/K4kP/MAXULAiIHLnC0wEA7I46Dqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZmmVeqt0QD+2h4vJYDcqhDNNKvobu3ael8LB/UC55o=;
 b=CK0eKNNII2NxeKRfqeP/gbP2IjKPMTsY5VQqYjmQPe7DNDYJWwOYflggNC3gXWel0mNVAYRDOHYjn2/SCK+inhKfxBOouykiLtySAiYvffF7jrKd1ZLAVELE0omR8g5lSdNGUS1hhtMtzepcsGb/aJ4zgYrYS9uMMsiDjr9tX2FJwSggUOjGrPznPeqJv3fUayG46aGnIQvafvfdFa25Wx1Hk2ig4+TdQgWut00WJdwZN3d6M1MJh5VRovybaMUSmavCMkTfIsvREGfmEkbCOLviSlAws28mFnhx6yWdi/w4ScquZxL3i4W+idDBOqGahpXryKHXmjwuKsNK/BiG5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 01:17:47 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:17:47 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:22 +0100
Message-ID: <20231129011624.836843-21-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::26) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a254ed2-a738-4e67-ca4d-08dbf078ff2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LLJypCIagIOhRWn7eZh3lb2AxuVku2mpl1oxbxvq3jwSeapZhpETK/gKXvc56Wl4cAqDip+JV//zhpUasYi5L5MZTmLP7cWyUfG9s0nusfMRwjEsSz+RuzYCHEGqFDGHJixPe55TWQfWSmcMW/xXGjKjKtu/rERir7xEYuWss039EH0gROvh0+Il+rqa2mn+jkO4CDY0ge5wFPNnH8KJCH+JUawG6YdSx/4CdNClh6z6hBlZW+bUe+Ec+ZtbFzN7oTNVSbDtnBx7OXX5RAQW8jG+5Ff2b/e2vdB8GGxeW13b3Bgh2p0gMlMyfL9UrgIUmeZaX03cgCscVsapG5I4cxPz/wb6fsOGBGJKQWrKYYaIxStKvBFPsIZgF2Dw8a9SiRw1Y9YYSkuOJxPJmAteB6qzn1ngJpITEekabcL1Vq/QRS6OWpWppydXO1wQiCAaTvkv6hNj6MUkjSo5Jg9q6GGTlW7K1eP6MjRWJvD7u3yMBJOiCU7s8xZSbicc15VWK7/IYtT/NSAkbBRnb3EweSpFsAgb7TNBOHyQ0QUVAl+9TdPNbdeFGQ+pn7AtTNoeyazTW+xi5rUB8RRNrLOE1aQHCc57kJ5x6qU9JxXAeCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6666004)(8936002)(4326008)(8676002)(6512007)(6506007)(54906003)(66556008)(66946007)(66476007)(6916009)(316002)(478600001)(6486002)(41300700001)(38100700002)(86362001)(1076003)(36756003)(2906002)(26005)(2616005)(83380400001)(82960400001)(5660300002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnQ5c0R5NHdKbW9IMHBmVkN0eDZUb0pYaDM2UkNDcVowZlBibXprSytLWHND?=
 =?utf-8?B?NDExQVg4b3h6M3Bta2NRU21PYUlkemQxZjBzWlB6Zkpad1pZVG1IVEhzaUpq?=
 =?utf-8?B?MzVkcGVxMXdMSm1yMCsvVmlMR0UwRnRWV0hlT1d6Z2NKa3prRm1EYjhadll1?=
 =?utf-8?B?YnFrcHFFMWE0L0Q0Ym1kZmZBZERITEpQa1FKT1VURXFOeHdBaWhJeEUvb25t?=
 =?utf-8?B?YjVXRVJSTnhoTXAvY0MzTlliTE1MWGRUUXhUYlFiYkJPb2NrWUl1enVwQlZB?=
 =?utf-8?B?N0ZOc29YaE1rTmhYWkUyZ0RiakprWGpjNUp5L0lXcVRzQWxCMXNmazNRTGl6?=
 =?utf-8?B?eDhjU1JWT0ZUS2dyandBOU5FY3cwTFdXdzMybEJaNFdGdFFEN1BTdEcxeXRW?=
 =?utf-8?B?ZVI1QjRkY2pibktMRTMrdTZqbHdNb2ZFRXhuTFVPbGU3WllUc1NSQzVTUFJK?=
 =?utf-8?B?Nk5zQ0ZmOU5sZWFtRk42R1hLUUhYKzFiSHdNbnBqV2NaMFBDVWVFWDYvYS9P?=
 =?utf-8?B?VXJlUWs0bVFUdGlTUnRqbXc5MWcvNzJJN3NiSk9hSU45SUhXakZmSlpMNkhw?=
 =?utf-8?B?NUszYXVFM3dlRE5ZUlJ4Q1czcDd3bXlIT0hjRXB1d2dCOXNxa0JEK3NFOWRP?=
 =?utf-8?B?MDIrSVpIUTlHZFcvek9wRnZSZlUyN0tEVFRwejVDYnl2aE9QaEVWNnF4bG5R?=
 =?utf-8?B?TmdzOVJuNW82eVVxbUFHQzUwWTBPcHk5NldNUW1QbUcwRVpsRG5vRkNsWi9v?=
 =?utf-8?B?WGoxL0x3cEp6dTl6ZXQ4U2dGeEU1cmUrUTRPR0JKNS8vTXRlOVF3LzNta3Fp?=
 =?utf-8?B?NXZkRjRaSnNKSEdvSVJWYjQ2cC9Yamtaekh6V2FGNXlUK1RONXA1V2RQKy9u?=
 =?utf-8?B?OWhJZjlydW9tTUhnbUhlbGJ5Z2JxTW5wOFc3eUIyL0M2R1lDWEhSNlBlQUNv?=
 =?utf-8?B?eHYzNjB6eFVTdFZNNTNUZU5OWXpXNWhvNHd3clB3NzVWTnJlTDNpc2JYNzBQ?=
 =?utf-8?B?SThON1RxSG43UEkrYnYrNEZFSHdIeDk4WG9EQklqbS9SeXkrd00yb1JkVjMy?=
 =?utf-8?B?NzZDbnZJenNUbFlGRlEraEp5ZlNxUEEwL04ra3FYaEF1OUhDVjVHanhoVWxy?=
 =?utf-8?B?OHJnUFYwWm5CTWQzL0xRZDU0VzZmSGNqWVRiQldGbG8wQlpLRWQvbS9OUFU5?=
 =?utf-8?B?OUJXRE9ZNDdBZVRYNUZFQUhtVXNwN0hYM0hlWGJ3ODBMWjlDVUhmN2pLVmk5?=
 =?utf-8?B?MG1oUXQwVkxMKzYzM3hyS0g0T0ZCWGRwbGc2bVpCSmJyN1V5RmZuUENoU0wx?=
 =?utf-8?B?eEFkYlo1bzZ0WG5KRHZpSm42YXJ6VGJUaFloRDlOaVhaaXh5c2h3aWtPaDZF?=
 =?utf-8?B?VjU5WnNEd3kvU0hyaytFN3d6U1JyaFBMeDVvTE1ma3R6T0ZENjRqcVdwVzI2?=
 =?utf-8?B?cmNjNTh6bGcrcFA3djZLekJvNmdFaXJkZnNQOFlPY0t4WW1zdjM2cWZ1Ri96?=
 =?utf-8?B?Wm1kRmpVY0ZvdExrOTRhaE8yYklFNmtQSlV6M2UrZ3VFV3plWTFDMWFTQ29w?=
 =?utf-8?B?Zm1NM1R2eVFCelBsWHJPZE5PR3NMR3Mva1IvUnY4Q29BNS94MUR6cUZEa0Yy?=
 =?utf-8?B?TGJGd0JwR1Y2VjQrR1JBL1hHYld3Z3B2d0kzZ2pNRGxmU1kyS2R6YjJublZ2?=
 =?utf-8?B?alZmTy9ZUE5Zak4zL0NmcE9yRnJ4cXorYmJwQ1M3M1VpOE1hZnF4RjZhRUlS?=
 =?utf-8?B?Y0NrM21uZ0czVFRmMGwxSlFVdDhwOFhuUVYvZzE3YXVscmpjeUQxQ0ZjYk1P?=
 =?utf-8?B?T3lkU2t1OW1QYll2NXU3Z2srOGdqejVyaGFubkVBdmJqSG1LZVlUaFRpaU5n?=
 =?utf-8?B?QXRqM1NuWEgvM1RneUlUY2ZvVGtNbDIxK1Y1L1hJNWk0cThaTmFUY2tTTndF?=
 =?utf-8?B?cGgybFIxK1pjYWFURU0zcTBRdSswZmp2eU9rdzFKQlpVQkM5UjVMZDJINlJ5?=
 =?utf-8?B?NlRod29BR0ZJTGlVYmFDSzVVZHFYK29tdnVNWFNDci8vNDBLS1hFZWhKSTB5?=
 =?utf-8?B?bE5PY1RRTWZpL2Y3U0F0MmpLUURCOUxsYzFWeDh2SDNqUkJaMTc5bEk0ZGZu?=
 =?utf-8?B?cXNldUZOd1JTckpNVE9CZURaODNpaHpjSWZHb1ppQUlHdFl0STN5WTJPWVhG?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a254ed2-a738-4e67-ca4d-08dbf078ff2f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:17:47.2046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFiAfPibldvTz13kM51TS6N7CEWnViUNvqkBzp2feZWc94tZ1WpgJLXdBxm6xApp6ucUnVwhvmBRiROV6TMu5N+1ADHP3vF/WhS/oOl5R9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 20/22] drm/xe/guc: Allocate GuC data
 structures in system memory for initial load
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

GuC load will need to happen at an earlier point in probe, where local
memory is not yet available. Use system memory for GuC data structures
used for initial "hwconfig" load, and realloc at a later,
"post-hwconfig" load if needed, when local memory is available.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
v3 -> v4:
- Assert that realloc transisions from RAM to VRAM to make sure
  iosys_map API is used correctly (Lucas)
- Fix GuC resource realloc by introducing drmm_release_action

 drivers/gpu/drm/xe/xe_bo.c           |  5 +++
 drivers/gpu/drm/xe/xe_bo.h           |  1 +
 drivers/gpu/drm/xe/xe_guc.c          | 48 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ads.c      |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       |  2 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c      |  2 +-
 7 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7f5b616a7bbeb..0a6d782c90d41 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1526,6 +1526,11 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
 	return bo;
 }
 
+void xe_managed_bo_release(struct xe_device *xe, struct xe_bo *bo)
+{
+	drmm_release_action(&xe->drm, __xe_bo_release, bo);
+}
+
 /*
  * XXX: This is in the VM bind data path, likely should calculate this once and
  * store, with a recalculation if the BO is moved.
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 2cf32713bde9e..772e448692b17 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -113,6 +113,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
 					   size_t size, u32 flags);
 struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 					     const void *data, size_t size, u32 flags);
+void xe_managed_bo_release(struct xe_device *xe, struct xe_bo *bo);
 
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 			      u32 bo_flags);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index fd3396ebd3edf..36457477616a6 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -239,6 +239,48 @@ static void guc_fini(struct drm_device *drm, void *arg)
 	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
 }
 
+static int __guc_bo_reinit(struct xe_guc *guc, struct xe_bo **src)
+{
+	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_bo *bo;
+
+	xe_assert(xe, !(*src)->vmap.is_iomem);
+
+	bo = xe_managed_bo_create_from_data(xe, tile, &(*src)->vmap.vaddr, (*src)->size,
+					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					    XE_BO_CREATE_GGTT_BIT);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	xe_managed_bo_release(xe, *src);
+	*src = bo;
+
+	return 0;
+}
+
+static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
+{
+	int ret;
+
+	if (!IS_DGFX(guc_to_xe(guc)))
+		return 0;
+
+	ret = __guc_bo_reinit(guc, &guc->log.bo);
+	if (ret)
+		return ret;
+
+	ret = __guc_bo_reinit(guc, &guc->ads.bo);
+	if (ret)
+		return ret;
+
+	ret = __guc_bo_reinit(guc, &guc->ct.bo);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 int xe_guc_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
@@ -297,6 +339,12 @@ int xe_guc_init(struct xe_guc *guc)
  */
 int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 {
+	int ret;
+
+	ret = xe_guc_realloc_post_hwconfig(guc);
+	if (ret)
+		return ret;
+
 	guc_init_params_post_hwconfig(guc);
 
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 2f5ff090aa6bd..61b443981f99a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -272,7 +272,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	ads->regset_size = calculate_regset_size(gt);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
-					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_SYSTEM_BIT |
 					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 93c886ef6fdb4..9f5761cdaaeee 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -146,7 +146,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	primelockdep(ct);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
-					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_SYSTEM_BIT |
 					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index 8e3db5d7192c3..ca59a0d8df825 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -77,7 +77,7 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
 		return -EINVAL;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
-					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_SYSTEM_BIT |
 					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index bcd2f4d34081d..45135c3520e54 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -84,7 +84,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
 	struct xe_bo *bo;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
-					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_SYSTEM_BIT |
 					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
-- 
2.43.0

