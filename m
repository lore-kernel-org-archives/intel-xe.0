Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5606AC5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 09:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E662110F29C;
	Fri, 21 Aug 2026 09:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iva5isj1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B18210F29C
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 09:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787305582; x=1818841582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+Y+Miyxd2azguVPP1KU9K425HaI4rLtSAvn/wM7F8MY=;
 b=iva5isj1YVwy7dmqM5LSGu/0bFuEktqoFKxFY3El7P/rrF2Y+Ll595ew
 42ls2qYrbAZJLGnF/QBFTucpDC+pBk/fw//cv9OX5ekpajQaf9rqn5/fz
 rs6FKu9DirsGIYeaqkCT76JuRJJVergUA+1V/n4vJ0FySL22F4hiGIGTp
 ZZC3NqFAshO/Qd/6ybC0pcVGAtFWUn+D+5EfBC//9qGS2T+K5aDYK8y2t
 feGDXkKyEu2CSMy9ysH6t6GabZV6Ef2wDHwiDJxiPD3dun2zQNseZAZoH
 PX6DUkA1QdnjqvgbwlC3A3e4aR5x8TnSa+3AwqKJ9pAkYqmGqSqC6hu38 g==;
X-CSE-ConnectionGUID: 6zpFmOd+Qy2G8nc6rJQB3A==
X-CSE-MsgGUID: /oh1XU4iQjGuVh+J9zlbhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87770398"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87770398"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 02:46:22 -0700
X-CSE-ConnectionGUID: QUqh5AXZT5+7Cj7I3qKOWw==
X-CSE-MsgGUID: XFHLqKh6RUuTE1hMO5odrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="270521619"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 02:46:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 02:46:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 02:46:21 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 02:46:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5b+1jCoBiOVEkWt/OafIgwj/5glPY9nWBGYH03tCFKd1u6WN0fYuMMzkTUhMSZ4FH/ZpF2rw+9xIhg1XH7NTIr9PvoLq/FFLUyc/ikPUNbUbrkqJm/OLVf+Z7AdNA8XVtsgo9e0vVH64j+b3R9aGOLxeBxn2Piw4ZflNYOM+Cdry/o5m9Gpt/gitn+2iCbLoOBKc2bYW/Rq+L9+uREF6EyqZB/7p5iUaUMgPw+24ezdnyMX88Z8Bda61ATKzZbUwNybZ+3xY9bXdMUBWC3s2RskIW3DBZrvuTMbQSWPRj8fYx6a/20VltoNncC7+9b5uocD7s44yidlNtSptjex9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybZ8vnEQKDag4uDmZ5QBjaLliEFSLLkhErWJlBbDhSk=;
 b=mvIjCdqnFRuSMIRWC/LdAHJgfIYZjeRt2x+KDj2ucQAYgn5i7qQveNBcdSge2naQXkWQJrRNL1qVhAopdX8fBc+MFOxL4JiID8beeoc2wLAVnSl4XvELmG69/xEo1iA92dzT7X1Z4C6NyqeO45z8PCW3RpABFZf1j/kxJOq7IwuGzs2jxOfqan1XtXR+iJIz8nnbvpfOHn6mngYBtGlMrMOkjO3lZVUqp8jd7bomfpeY8rmyT9OouNtO0OzuakM74c636GNnkUKhWAc0dE+famptf0OB8VLbiiJZvqCxAQ3O85wae9rfm+j1mImTPJ1efLn/zWWdYilxs3p9t2Kojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB8454.namprd11.prod.outlook.com (2603:10b6:510:30c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 09:46:18 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 09:46:18 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 1/4] drm/xe/vram: Add binding information to VRAM regions
Date: Fri, 21 Aug 2026 11:45:58 +0200
Message-ID: <20260821094601.607060-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821094601.607060-1-piotr.piorkowski@intel.com>
References: <20260821094601.607060-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL0P290CA0007.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::11) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1f4d57-4743-40d1-936c-08deff690cb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|56012099006|10067099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: PFXCSCKygog65BQcHLnAGS8tgH3kK0L7e6jaB1KNkvEhs+T1KU6Q4ylJorTaJ/4NRzlKUMrckyXYBXYPf4Mw65rhjxmh0DHJ0rE/2UhQvXS1/kSDwexpTJQUJ6Mp7Ll40weYG8Ga0OHbQJJFji1yy8mpUwOJKKosUJR+uKILbjpAhGhV8uhV58vS30e9dAkenySSI1W6taWWLt7DmfUNR3EVcYcg2t/nJmJsm2b/I6TgVzzpwZibdCflP260QjTwEloryRO1YYc38ZRdm2MHaqH2DB62lnmgwQYbvqGwUohXS5WrdjTveP43LTL4jBAc5Pj5myQJQETdFA3Og6E2aQAnK6SlAkmO2viWi0g4jiJcIgO6NAocgvEbkdqWaAGgRL60q4oXJMOgbzctvgFx7sRDQ7xZF2GE91/rNFiXLu73PstyACD+wKmyS9g/hWHjwqnI+kaPJCEpADwVBHWwkfghYaXU37zvL32wW0HLbsmOHLRye3mqJbNlhD3EeP1zVq4buHxEkksKqNtIXcxtD4zw84NLDVFAvSUzHHPH9IpIbZYifaUEgJGqAy1mvLRcAgxtAWdK8+PbqX71WxFkzAiKTMPtAyIZ/+7H2Pd7qSL5nuaGCzKZpLE/034O5/MtLUGfKo20DzZp2RCFH4fQ6S/M86jg5Im9ay3UCSXRM4k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(10067099003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekw3UXdBZlV3VU1FV3Avc0FjQ09VTlhZSnpEVlh5OWlscEpEVDRWTDFJckxU?=
 =?utf-8?B?Vm9rZmV0eWV6REVnaWtJQXUzbWtVWEhQSXE5Y1dxazJtZ2N0RnhINldMajlW?=
 =?utf-8?B?Mk11OGxTZXpNMlNRRDVtRmhPUzBpRkdGK2syUDVkM1p2NjRYUy9EdDF1QVNU?=
 =?utf-8?B?M2JybENFR2ozMFpSTndtSGovanl4NFBQNlYxT3dBTlNvNUMwOW9rYlVndE5G?=
 =?utf-8?B?bFlvNVVXUDhVS3RlMjk5OXVkY2VIQjVTZUl2RDk4UkxESVJUYjMvUW1CdDVy?=
 =?utf-8?B?emthWitpUjhGV1BLTlByNnNTNGM3Rm9MOGo3cFBMaHNPb2srMkI3djV2b3Fm?=
 =?utf-8?B?bkNoKytBMEdyWXFRaVQ0SlRhUXFRaFZFNGhhaXJSSXk4RzZ1SHNYWjUzSEsw?=
 =?utf-8?B?a3FVSFRNRHNGbTlLcy9RVlNOYU5JTjQwektZRXpBeVFsTnFBcjhldm8zbndk?=
 =?utf-8?B?WnlmL2VkUHh2VDRLQlFWRm5EZkdBVXIxenJ4OXBWOVcrK25SWjI3RWlqWXJt?=
 =?utf-8?B?K292c0VSVGoxWWxWNWRyL2ZzMTlyWlVqcnBkRkNnQVcvaVpFUi93UEF6Ylh5?=
 =?utf-8?B?S3BlSXdxMG1lOW90Z2pNWUkrdDZNVWtnTW4vZ3h0R3JDTjBWTG9UZXhvSnpw?=
 =?utf-8?B?WC9oV0Foc0ExL3R3TGpNemIzRy94RVZCOURWN3o3OTczNC9WM3RqaUdiYWgy?=
 =?utf-8?B?NjY0UHZYbG5qQjUvT2pGYS9HZ3hSUzI1M0MzeGg4UkRCdk51djJvTmp1NmNt?=
 =?utf-8?B?T0cvUE1rck9nYVdWRUpPdUVqc1lVMko5aXJ2Y3QvcTExR1JpUHpXY200RUta?=
 =?utf-8?B?ZW9Ta1lqVG5QTjJyR1ZVMGhaUDFUaVFKWE5ISzJyb0pjdTBmcENZYTFCRjZy?=
 =?utf-8?B?NmZ2Sis3bFUzd0hDUERIUUV2OThiN29ZRFJTY0JXQWlKazh4aWYvTENoa3Fo?=
 =?utf-8?B?S0VIWUpPKyszc1RxUEJyZ0JMTmdjSzA3VkpFUzB1TG5vUHVvYmhvcXYzdFUw?=
 =?utf-8?B?YWRxZGhhVWZ3bXVMSGtIN1Z1dUZ3amFRZ1Z3V240YlhqbmQzWWdETHVNeUw5?=
 =?utf-8?B?UFppWlN2dEFnc2ZLSWR5WFBzZjlpY2oxdHJ0d0hkTytCSVQ0NEExN3lDSjh6?=
 =?utf-8?B?L3ZXYVFXQlpPamx3L1lFbmtEV2tQVXJ3MHUzUEtKdGRsWTA2ZnlGdFhXU3lQ?=
 =?utf-8?B?dHV0UDVNdURRY0xwdjdkbWtwUFNPdUZYRFlLenE3NHpiaGxuTHNUUTk3OU51?=
 =?utf-8?B?Yy9lN0VvaThRL3N4ZjdHd20zdjgxRXlGTjRkTmxoMUpJeU5uQlhxTi9ta3gx?=
 =?utf-8?B?Rk5hUXlLTFVtVmorSjFhL29ZMGtSdDRJT3AvaHhSSjdwQ2pPaHNUcnNYTTMz?=
 =?utf-8?B?bmRPQ3VWN0ZkRmJWQzJIbkd4d1lPdXZGNUlweURTZ3JvUEZ0Q0wwWHhDZWgx?=
 =?utf-8?B?cVRjQXMxREs4SzF2OFFvSXNaQjBYSTR0M1FuR1lubjQyNWh5ZS9zVSs1eEQx?=
 =?utf-8?B?RmdLR1dOaG5yYUkvUTlSNS9NMmtBZUdldHVzbmU5Z2NPR044SHdYdmw5QXE1?=
 =?utf-8?B?L01xekQxUDNoQUd6VEE4WDJOOTIraFVYSnBYZFlIRWpTRTRxWnFMZXowVG1w?=
 =?utf-8?B?UERIYnA4Sll0VkNkTzJVVTRIb1hQTU5VNGlHQlZ6SVVaZWZUVGNpUXVtVks2?=
 =?utf-8?B?NGlEM0J4Nll5NG5xQVBUWkNUa3BBd3JyeGZ5Nm1KRTFuQlZGN3NNT05HaUZF?=
 =?utf-8?B?RjdTeGpFVmJoUDVPaENPK1l5VkVWRGRxSHZsQVBHNlVoczFsUlE1V0RvcjVP?=
 =?utf-8?B?TmU1K213R05pczQ5RWFLbUhabDBJenc2Smdaay9ybTdpLzgxdW5tVXJ5MXRw?=
 =?utf-8?B?QzlBNDlObU9qZjVZMXByVkhuZFJkdUZrZVo3MmFmcFk0NmMrUUlFSktid0FG?=
 =?utf-8?B?cEd6Z2hVeTg1RUZPWXU5L0M0Z1Y4VUlmdXZDZ211N1FYMnRSb1RWb3EvL1FW?=
 =?utf-8?B?Yyt4TVU5SktSRWFWOEF1THUzTDRpN2FGNndMdWlmTmNsb1A0MncxY1ZIMmQ0?=
 =?utf-8?B?S3VIanZEdVptQTBZZlAvNHJaZHFjRU13enV2ZnBZM2VtR0hoQ2h3YjlDU1BB?=
 =?utf-8?B?UVR6b21qOG5qUzJOMFRobUgwYS8rVFdjUHlDYVJNU01qUjVxS2xVdUxaeFd0?=
 =?utf-8?B?LzdYdVVRclA5WDBMbmUvUDZWQ1hiN1JHTy9pblNVQkMwaWVCbVRGNFcrd2gw?=
 =?utf-8?B?RjVhSlc2RDlHbkdudGNQMU40cGduQUExdEtrZllzaWE0Yjh3QVNtYzZDakIz?=
 =?utf-8?B?L3ppT0VzS1hyUDhDeFJ5TFhNSkMzY29JZ2xFdy83RERjaVdvUUYzNmwxTjFt?=
 =?utf-8?Q?dOuRfy5jBN8tm+GM=3D?=
X-Exchange-RoutingPolicyChecked: nwpaN/UyrxqGuMi6RJ1b/tsiyPlJe7F0rEa7jKptDI31NuajprXBnr+Kqsq0yR10CfEhbmJAMVW2Ube/zXm/nDweqnBtmVueHgRxxCYDD1QpvTI/ZUmrnTioGQ8CMeojLPCNgbdMMRQpXnUKaappCHD4iVHyJAAaKt/sRy9gsn6QOpWGE8AhlYIa49Po4WxwiimoD40Pvg+JmXm+H38cYiHRGrWbnbx4Q2R7bXVfkC4a83U7e9lmU5Ofd5w7kbxM+uA/+hA4BY5WVzKfPd6tUbZw4gwIltJ1dF2Y4ZLNo9XadvrBwfaPf0vEbQhlEaQw9IDqdqA6Qb5gMILJQoMWyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1f4d57-4743-40d1-936c-08deff690cb5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 09:46:18.4083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: up8oiGQVAAiK+y35T+V9cQ44pJiE9KZdKKq0T7ISJ8dp6QP1R9Xeb8MDh1j0OVSkg+u9f5Q//7dH1G1qLKUy0Qh8qjPvirtbTae9OZPVcjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8454
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

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_tile.c       |  2 +-
 drivers/gpu/drm/xe/xe_vram.c       | 40 ++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_vram.h       |  6 ++---
 drivers/gpu/drm/xe/xe_vram_types.h | 12 ++++++++-
 4 files changed, 48 insertions(+), 12 deletions(-)

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
index 23eb7edbdd57..e5f83df98826 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -24,6 +24,16 @@
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
+static const char *stringify_vram_binding(enum xe_vram_binding binding)
+{
+	switch (binding) {
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
@@ -189,7 +199,8 @@ static void vram_fini(void *arg)
 	}
 }
 
-struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
+static struct xe_vram_region *vram_region_alloc(struct xe_device *xe, enum xe_vram_binding binding,
+						u8 id, u32 placement)
 {
 	struct xe_vram_region *vram;
 	struct drm_device *drm = &xe->drm;
@@ -203,12 +214,25 @@ struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 pla
 	vram->xe = xe;
 	vram->id = id;
 	vram->placement = placement;
+	vram->binding = binding;
 #if defined(CONFIG_DRM_XE_PAGEMAP)
 	vram->migrate = xe->tiles[id].migrate;
 #endif
 	return vram;
 }
 
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
@@ -217,11 +241,13 @@ static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *
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
@@ -237,7 +263,7 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->io_size = min_t(u64, usable_size, remain_io_size);
 
 	if (!vram->io_size) {
-		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		drm_err(&xe->drm, "VRAM region without any CPU visible memory\n");
 		return -ENODEV;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index dd1c8bf17922..87088ffbfd5e 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -8,15 +8,15 @@
 
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
 resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index 646e3c12ae9f..51884e7a679d 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -15,6 +15,14 @@
 struct xe_device;
 struct xe_migrate;
 
+/**
+ * enum xe_vram_binding - VRAM binding types
+ * @XE_VRAM_BINDING_TILE: general-purpose VRAM region bound to a tile
+ */
+enum xe_vram_binding {
+	XE_VRAM_BINDING_TILE = 0,
+};
+
 /**
  * struct xe_vram_region - memory region structure
  * This is used to describe a memory region in xe
@@ -26,9 +34,11 @@ struct xe_vram_region {
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

