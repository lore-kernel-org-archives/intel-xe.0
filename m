Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8912EC5B572
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 14:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207F610E7E6;
	Mon, 17 Aug 2026 14:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bp7zG2lr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1D010E7E4
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 14:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786975437; x=1818511437;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=VZw4PIByijfk6/qHm+CR7HxrXymoQdKJFswRzfCJzic=;
 b=bp7zG2lrocAo9MkrsTICBP4ejPZvmAib1hmtCLSKilAJqJ9DhtPP2x5V
 qmz1/YVav9Y5yNQJZ716Bh1N4S3mUmdeZ2obIr+7Lq1wm6tAJRArENRFa
 z05Q2u8MxxlO+2XaiHFrx05aZHEj3s0WcgT3BbiTdUOlYxw77/bQbKMJO
 UEKd4p672op2Wx38wS/PDMgea/bZHkX1eoVRKKfyMmYlSmdFq1rIgX9gQ
 1QnMbx11LupoFTXKsAQTwGcpiRmzViTSG2b2PxrsZm1nVEBr9EuQ8nlEa
 j/1bH8KumPe0IdXirOMA0Fph7rc8OKPCTD84AU4fpH8wUyQ57crC4pQiS A==;
X-CSE-ConnectionGUID: 5uL/3rXzT46Q4DpPRdyUoA==
X-CSE-MsgGUID: skHa+ljPRGKgXczg0aeVwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="104833406"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="104833406"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 07:03:57 -0700
X-CSE-ConnectionGUID: aa1H2e1SRhaNTdCrPMiZyg==
X-CSE-MsgGUID: XpP5W96KTTyS/jE06IteMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="263168717"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 07:03:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 07:03:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 07:03:56 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.39)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 07:03:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0fZEtnoA4g+QTeT7PHUvMz8rjdRJUIV/cnEoHQolGRUvb950mTty6gdwsT10exPMuH6hkpILB5FjKC0leWvWf7IU7/bFi2wrDGhnMZvFsy/MG5NnQp/Iz2uOpQn0RmV+8o7at94yJGY7Md9zaT6VrzTxsUCLjfpnxLcJV0t7XqX5ZXEBVeABcI9N+2kUU7gBSB2IE6/6fSWVlMSVqWunZoe5Zu7gXm3ts1Do8gtJP/P6WhqPOt49aVOZSjLuV8yELYEhjKreONJzfJ81nhhtWqMxzD99rpGzPg1QoQyoWEpUV/F7TVYwQZ4TXdivFmIFJxnA6ICWAjvalyeTplCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrMIFz9iNIA0pY45OIqCX83jtgXEgCVhAnkts864vUA=;
 b=ptOafuDd0AIg0JfA99Bn5Kz6e6TEa0wNEa/ypPkoGDEzRcZQBzL+B3/Vqrc2mpz0bc93d19YGUo2Yvl9N6GiOyreTjmibJB4KOaZaM4F+gEkLeM+XATir73oMCAOmYcuN6pxGEzlKLNVb4kvJVEs56X20uVKJlKIv9LPVJE2WjM4n0HkbRrTUKO+MsuMTkvFjR3AFStLC5M+vEUBsTzS+0JlD9K5w85odk4GQCFeS4WfsFX8jrG1FxOL355M7vYDLF7dAsvQbQJA4+qBUmLwaVEr40ZQGFg4+NzDoAufazzBrXhlO3X7is1u6D3lqfBpkoQlUybLJjtzKA/ayfgmaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DM4PR11MB6551.namprd11.prod.outlook.com (2603:10b6:8:b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 14:03:53 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 14:03:51 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 0/3] Separate GGTT pools for submissions and VFs
 provisioning
Date: Mon, 17 Aug 2026 16:03:39 +0200
Message-ID: <20260817140342.415803-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0028.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::13) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DM4PR11MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: 862c99b3-7238-45f7-dedc-08defc685dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: b8OPhnWoMcSQzjAQZBnPxlAsNWkYYaui+4CeFVti9XMd2g5AoBrEHBrcg3iGEhUYepllb+d1kGLSWS39VhTyymjz5gI/j5mUAdxL8TOpdqw/KCDfpJKWziW2vXk0lXAmdBQJdczxSqKWN0qbwT79r/ORH95DMY3DhbVoR7ZqGBhks3prQn8+OmnxLve0rJ6HRu0cV+3gn/zWLLOXFouBFfAGE1CQKmGiW5BJbT5DJMAb+uETqtKSWJz+cc6ukWUvMlqTm6PF01shBEprGcPgIpKlgncIZB86QEVXzk0i6J/1SvExQJikFysNcUKtSxcuWDwkzkVpAICKhQPIEPcOoQrnq+g8IK2Mn6n6p7EB5R/NXT48AiDJmh1uuXtc9ZZY+xehFJcdyaNxotFGcz9Gd+wDtGhLPcQk0xR1Z2wUv9nFloYYhL40H0ueBa49RO2q/PmmO+mhP66D+M8AHGcfyLunOfLs0rzaMJHiL69ABG4DNpbZp8yDIJxAhWUoSgSaORuwjoiPqo4f26nzqERIj7xZXjHBjs0gqsvODpIf0FvktZq2TUbX/KfTFvWJ00do6B6JvKzgSwsVHs6RgMH8W2xPqTju3bkeAroHy2wDKBkyeAlC88btm/T/bEiY7foZsBtWNSznqmLdRNXdCDdGGdlslAdfn9VJg7pZqxfr4wc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFRIK2V2aUJlS1lmeVNnSTJjUHA5K1FiN2RJdWpFTGJYd1BSbVVoWll4aFdn?=
 =?utf-8?B?V3RmT1I2dXhTNzZZTmcwR3hzbG9hYkw4azlXTDQzSG5NVVQvRmp3NTdTU1Nm?=
 =?utf-8?B?RkVRQmFOS09OOG1XWVVaTUQwdWJWZ0kzMGd2TkZrWUtlNmlBQTRBOFFPOEpK?=
 =?utf-8?B?YVQrZTVHeGVERHdsWTVnYWJRcVlHTDFmb0cwOU01SnZFalRUc1E4b1ZJL0lV?=
 =?utf-8?B?YUxMakpMRnlkYXo1T3VyaG5tRzhMNnF4enI2TlJZVVZhVjkvcWdEM0wyQkw4?=
 =?utf-8?B?dFNuUW1kVjA2eVJXT09JWGVoa2w5OTA5ZmNUUXB1S1FvYkxDc0FNOUVIOExw?=
 =?utf-8?B?ZDQyUDdXakdhUmU3Uk9UNHlMcjdybkFra0I1U3Jxa2xEK0c5bmNUTHkvSkVM?=
 =?utf-8?B?MHFwOU5iVWVYL3ZKbzYwZG5jWVFZaHc0a1hIUUw1czV1bDFhM0NjNVhpR1lZ?=
 =?utf-8?B?ajg2ejJxa1pYc3dRR1RGdStkY1FZUEZ4T0M1NXp4VkJyNUgveWxIZGo2RlVp?=
 =?utf-8?B?OWhiTkxjN0dPTkd2eDZKcnE1dVBnQ3lXZGErbnM2bll2MVEyM2RuQ2ZWV1pj?=
 =?utf-8?B?aUhCMzhkU0svRXZERFBWVHR1R2d3NDhTQ0dkOE93cmRsaHNIYU0wQzdsMmVP?=
 =?utf-8?B?bUdiRktvWDBUM1g1RjNqSWRyZlg3bVRBVktxa2JjK3pna2NEZEx1WGlucXF3?=
 =?utf-8?B?Y2VTdVh1SGt0OHdlTUZqNzFVOE9RbzFUVHN1emtVY3BscWVIVTk1anBqcGhH?=
 =?utf-8?B?YkEzcGZiUzg1ekVzemdwWFdJRGJERitTSXhCcUhhQm1NSU1ha05GdDZKR1FM?=
 =?utf-8?B?QXdKN0RmdmMxczk5NlhGM1NwYStlTXF1RW9TVXFYUmRPKzdHa1Npc0QxdWVX?=
 =?utf-8?B?cm56WFhSNUpVc3JZTWJtemYvUW5qbDBYNVZ6VkFTMS9kKzI1UFNIQjM4eGND?=
 =?utf-8?B?UUYwWGdrWWxsN3J1YzhENDZudzlHOXVyNHZmTlVzbnIxVE1oTEJpUlkzSW1m?=
 =?utf-8?B?YS9PUXdXeDVJL1cvSC8zcXVMZTNNcHU1VE9YL0JNeStiYXlLMytWUkpwWXd3?=
 =?utf-8?B?cHkyc0hYWUJVRjNzZUN2bmRibHZBRjdqL2xJM3JibVBaUm54bXd2d1VCMm9x?=
 =?utf-8?B?cURKYzFtYXBKZ1dpMG1mS2FUNTZ2ak9GdVJTZmZud3FWU1hOUmhuSDdDMjRF?=
 =?utf-8?B?UXo5THloajNkK21xcGZjbW9sbFNuZERienExc0dRYnBJd3ZXSms0cHBnN2Y1?=
 =?utf-8?B?WCtlelg1VkVZYUZiUTRHYndHM0loSVZKeXdkZWN3c0M0VzUvV2NoenE5RC9J?=
 =?utf-8?B?aTJkakhQK1ljS1krZXVTenpwUWxpUUs5TjRVR1ErR0M0Nk9CNngrVDZ6dzNZ?=
 =?utf-8?B?ZmwxM08wR2diZ2NlMnhUY0ZuTnpONzY3NnhzV1RoQXNmN1prN1JhbVo1TFBG?=
 =?utf-8?B?cU1HbnB2cGxVSk96clFnOE1HeWlRSExpbHAvMGJzeWVXa0FpaDV5bFZQeXVL?=
 =?utf-8?B?UjA2TkxFSXNjcFptdHllSnM0S1FiNDBucG9kQWJPQjcyWTNweEtFVzAyS25S?=
 =?utf-8?B?bnZaTitXNU53YmNnRjRCT1Y4SFpaNmdGL2ZhK1JOMDMyclFMQ2ZnVFpwR3M3?=
 =?utf-8?B?Z05wWU13M2VWV2hvOGZmZ1ZrS0lYRnFCVEJMME1iL3hHNVVWK1RLaWtxQUdl?=
 =?utf-8?B?dTBld1ptcGdhK1hKUGo0anR5NnhIeGFVa0NiS21JTW9Yb3JPSkNHRGNRU0NE?=
 =?utf-8?B?b0Jta3E5ME9lR0VPNUtodDVEUVBsT2x1TWlYMCt3aHh2U2FZK1BEZHhtQTNJ?=
 =?utf-8?B?OWdUdUpLQ2pJa3dzdDVyckhUZitlelMwNWFlWlBtZ3NET1pibDZnZG1WRS91?=
 =?utf-8?B?N1RGTU5SOFo4eTVXN204OFFLeW9HSVYyOURsYVFHQnlkTG5vRnVWeXdidHJk?=
 =?utf-8?B?M28zWUIxRFZHdmVCN2p6ajNLa3ZaUGlXUVNuSWsyOUJDWVRBN0NmVTFyaGNt?=
 =?utf-8?B?d05WZm91TzdjQjg5SjgrZlcwQXZwL2NCNFR0ZzZLSHBlZmZCcjJ4TXVYRzBG?=
 =?utf-8?B?aFFwUzhraTJoanRpMlpYTEpycGQ2ZFZjNHk1dVNpbWFMQjlTQUp6U1k1bkdu?=
 =?utf-8?B?TjFQWUYzdXE3WU40RzBLb1J2L2hYQUdVcHJ5YW9WU0w4bERKUGV4dm9lUG4v?=
 =?utf-8?B?NDlxdHYvWWRXTzYySjFXQ3QxRGFQWStkc1N1a2lTcHRUTWpCeDlSVkt6YkVs?=
 =?utf-8?B?RzBSVUJpQ3dhdERkclVWQ1JqbVFrUVp0QVJwbUx6MEtHY21ML0szRy8xbVY5?=
 =?utf-8?B?Tk5hdVZXOVU4ZU5iNmorSlcyZk9UOWFaVUw2c2pYNm8rd1JYQnBqSXVTRk5V?=
 =?utf-8?Q?L/8nbujQfTGtmwxc=3D?=
X-Exchange-RoutingPolicyChecked: lWD8II/x1LxPEnOsRmiPfqaZAbzCc+5CTRQEPEZO9i0vXI3dZXrfCPfqDgiMwe2lrxL61M4LUZO+q0Jg8HJoVVAqYGupaLKVSEedOytZTDagYS+Y3Kwo5ZIYviITUgMMYlWsGojsJApxFDY4076HDhDGV+dFQNhEYsY9CFJraxvPL2HZjfrgIpkQAmoZgnZRQ+b8lpdNNZYtKD3dnK6LjcalosA6z6jdDzKQePIH2sRWLPQpFviEAcMFbMmXaQ5i8ko/AdlbVJP5yl68Dw61s3jcz/3Ix926fERDtOCGjLoP7EyqPPezn9AZ/SyE8MJTgCYgJwzGPFfYTUaSXOlaSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 862c99b3-7238-45f7-dedc-08defc685dc8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 14:03:51.6252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPHUI0i8gOj2W1d7dlQPgM1Tj2SA60LWiv/VXAUIWLVa5SSN+2TSnYLovd8urukzzn159nBx//yvXk99ameMZEkhi5lLBVCQITFWLs9VJ+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6551
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

GGTT space is used both for driver-owned allocations and for provisioning
GGTT regions to VFs. These allocations currently share a single pool,
which does not allow their usable ranges or allocation policies to be
managed independently.

Introduce separate logical usable and shareable GGTT pools. The pools may
overlap, while each allocation remains constrained to its corresponding
range. When a shareable pool is present, usable allocations proceed from
the bottom and shareable allocations from the top.

v1 -> v2:
 - Rename ggtt->usable_size back to ggtt->size.
 - Remove the ggtt_insert_node_in_range() helper.
v2 -> v3:
 - Init ggtt.lock with mutex_init() in each test.
 - Introduce the hw_size struct field instead of the ggtt_accessible_size
   function.

Piotr Piórkowski (3):
  drm/xe/ggtt: Split GGTT into usable and shareable pools
  drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
  drm/xe/ggtt: Add KUnit tests for usable and shareable pools

 drivers/gpu/drm/xe/tests/xe_ggtt_test.c    | 336 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c               | 298 ++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h               |  14 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  12 +-
 4 files changed, 599 insertions(+), 61 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_test.c

-- 
2.34.1

