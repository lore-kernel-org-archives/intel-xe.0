Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E88C44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 17:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE0510EA03;
	Mon, 20 Jul 2026 17:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRdhzoMJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BE510EA03
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 17:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784568851; x=1816104851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Gm0W4aW2pr+jSPfu/Ut+6YNvAi0bBSfsKBpBbXwbM/A=;
 b=nRdhzoMJWPL4cB1zCnobW1kpJvTwvWJ1KjL8V+lKyhFn0voiPWPWGg5p
 dmPi7BhCfF1qzu+yLlLHrbBATrrfBUkksI09QA9evbNq2bz8ziHg+laxL
 qMXwomAD/L/zpbw8gOAw/10BVoyXyF9sqTtk553oh8crayb5cn/icmVFo
 e+Y/PFyoJ7YBjUldTcFcMWy7K3+Pdu4tHbud4RosXrbl6lyx3XLHpVMWB
 qru/4b96AW8FBTTyjVi0WRDrTUp6pm/E7g9VAghrBuChFfEwy0Otq6U1k
 EeUCm8A+Ql8wzQAFUwrtfUBGB1a13qN1yMuBJPXLRXxNRdFYvRLXftC1N Q==;
X-CSE-ConnectionGUID: q2PTutnjR0mPnFXbRDr/Hg==
X-CSE-MsgGUID: DoWzxRvURoWFklB911s7uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85276151"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="85276151"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 10:34:10 -0700
X-CSE-ConnectionGUID: r91zv6y9RD+Hk+ddktR9fQ==
X-CSE-MsgGUID: o10cW9yNTva7Z3cSyNTO7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="254890198"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 10:34:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 10:34:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 10:34:05 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 10:34:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCLIAdHnoswAINDsXMIzEaq+dh/E+rDxYiiATNqQkvpPVHeScPoR69n+8fz8cZjlx8Av80o2mq4BhOseeYA+Yrn0Yd+HaIrSk+6uIapDmhaXqLqICncMEpjP0jPTzGQOJHfTWwmWurxpOVeeaYylzTFZHzPXsjIriOiKsWh5qdfeUqHdDO3azj5s8E+8gO905Ei6QtR82zAC9d2m+TzK+LPKgqJAW+SNP60oeBQ7NMsBp6OW+xY6w4JK3Rs1sx5qOr9drj5mQHKXkuDnJiRnFnnLB5SOTZTOeMJVczKN5VlOgAW1bcRLu/bx5DdNCDJJbieYDTXu0MOfTLRvO8W+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xo+gCWqnpsrQCLAkwy9fGHO8anrhdUppS+CAEK2J33U=;
 b=uhEsY9v1+GIRuxVhN/W7lzYVnftnzFa5qu3yqyTwxc2P34uOA3zAlnfhQgKrJzxvJfeV5g6MOPONKhnA7LWM1Kdq3OmnUES7NDAsTsQQ6yO3YMyw13jM4wWzqtesMXLez4Os3eneS4WIJtcX2/CsVSCU3Cdm/eavUyaXhMnBPeoOCPa/I9EDDuonG6icKSYy2MQcu5n4nWRip9gekJQvyJq728n9b7bZnP5CrNcNN6165K1eR6NaNyU0wznQ76P+gKsIngFzBL4Q9M/ZyLWko9co4qSGc1QsXf/NJXbGUcY38G2EnA/YRK94fszmM07HoLpWPmD5nSuQp3/LdVTouA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH8PR11MB8286.namprd11.prod.outlook.com (2603:10b6:510:1c6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 17:34:02 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 17:34:02 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v1 2/4] drm/xe/kunit: Extend GuC ID manager split-pool coverage
Date: Mon, 20 Jul 2026 19:32:42 +0200
Message-ID: <20260720173244.3935848-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720173244.3935848-1-piotr.piorkowski@intel.com>
References: <20260720173244.3935848-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::12) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH8PR11MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b676ddf-3235-4292-c849-08dee68516fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 0XyxJW89E10ngnFTtVrLNxQufWNDOjY0ZP0+TO74B4zF1cU8r0phP0HevsHwHO1qH85zYIAFsRJxte9+9YKRUGhJWgoDWwB9U09zHSEfZykJkuRvVVKYrp+Ad0MnmuH74jk8mUe8a+yaqNiIrAYkNOqmc6s3kDIPTcbFev7U3wIvS53ljqFIZ/ftuVrcMF9qzJfd4mYNbURkl13UL5Y4b1aigMTBM/qVY0iM4g85/xgZZ5sO5TK84zdYp3R1pWVQqLhiB+m9uebjs8RRdJ0z1zCFNi+sB5Oi+zbYGQowTeQowrA3IH/s/f2oWAhjyEtbh4jW/3P7o8INmHKbo5DipOefUFqUQuiDdbOXdVIR9SObMiVRK71dXuA02I2WhUtTVYtZlq6Pp9kT+Eyy1OQ5TXb/S917432eHhx8W+HqsTjPBYA9BZ3rS/u7KXvLni+/SNrAa09UGTZ9aNmh3UtGRb1+ip3lzJshxUVbzCSGM35CLyxCBwy48p8RbcrYWsOfBCbkuzsxrMCOU7Pb0iAq5zxhWohyDc9iktz1dLtgiCfEmeB7VCGNGLXumw+x1S3YXdGxggH7bxiK7q7Vl2qicaypTh+fNfDUUmEmyOBj0IPccZblB3kPSODuAVMPwDnj5ZK1XtYPq9PFnc7TxFWh8ZvV5w/oYNiTWbsm8lAOrqU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VklUV0FSZGUrdGRwclV4bjdza0lOUGFvS2FiM1lNc09iMzM1Mk5pcmJiajMx?=
 =?utf-8?B?M1I0Umk0RVNWbzhVQjNjYWQ0Z0N0SUVEU3pnQlZNZEZtR2ErZUJUY1hLZVJY?=
 =?utf-8?B?cVErblV0OEdId1pBNkdEaVM1eUsyV1g0REphaTdiV2lhNlpQUXFIOVkyVVJZ?=
 =?utf-8?B?cGhoZldhUTFHUnZ2SHRpcnJhR3VkRW9BV29LRkhwend3dlE2YkliQW1Ra1V1?=
 =?utf-8?B?MzVhREdQVnU2d1lSRkZnL1Uya0swRmhNQVY2Z0pqMi93R3JvNy9sbm84REd2?=
 =?utf-8?B?OHZERDlRWG1CWU5EOFN6eEhISnJ0bllkMDh5MkI1bXZzTDJJaHRlUFNVaWI0?=
 =?utf-8?B?K1Bsa050T1ZRb2kwb2txZ0lBWlU0SVJhR25wblBtcDVLM1FFa3hvQmVnNGRO?=
 =?utf-8?B?RXpzUUFkZXhYSHN1bWsyajQ3czRER1ZxN2NDTUxMSWpTL0g3ZXd4R2RGSys4?=
 =?utf-8?B?bVB3UGJvUkR1RTh2TTZLcVc0NTdXMXZ0VkM1empYV2ZLVk0zeXFTVHVBcTRG?=
 =?utf-8?B?ZEZ5WU9WOEFyUGI3NHV6Szl4ZHpkcDl2QVpBK0ZJLzlNTUgwVmpFbHhmY1lT?=
 =?utf-8?B?QXNpcXNFWGJKZWdFcUF4dXdSYW4vaGNKTUp0aE1BdlM1cFhTMVl0TVFzWjM2?=
 =?utf-8?B?UTZhTkJ3Tnl4VXJYTnU5TDduZEZZYmZLWWh1UWpYQzVZSWJ3MDBDNGluaXFk?=
 =?utf-8?B?SkorbkNIMFpFMmlxNCtiUXFDZk5FbUVNaTRqL3ladEdPUE5Gc0Z0SnlWMVBD?=
 =?utf-8?B?RTF6SERZNFFBY28zdW50NnNIK2trRjM4Qm4rcmpaSjZzUUlqeHBIZDFFWFp5?=
 =?utf-8?B?a1lBeGJGd2ZJbDRPNTBQSllOZzFGZC9XQ3Z0czRpS0dQT2tCMGRXZEJhRVZW?=
 =?utf-8?B?QlcvQTJpOVFmay9tVThCK1lVUVFFMTZ4QVBQQWdDM2o3WE9GTCtLMFhWdyt6?=
 =?utf-8?B?WUlBR0QvcEdPOVl3TzZnZmNhbUxuUktwOHg0eFU4RCtoOWpFcU41VUVyRGpo?=
 =?utf-8?B?M2dsQkJqV056RjlLVmlwV1c2eGQwaDJRNjRKUnlISXJxLzZqWmVQeEkwR0Jz?=
 =?utf-8?B?TktHRkpXWm9MZFE1VlZIdW9Fd0lqRFBCWFhxRDRqNHY2YmE2UlhZSCthZEhx?=
 =?utf-8?B?K3BHQkY3Y1lieWQwRmVrZVRLcFNtNGZYQU1yQXNtOEpnb3F6L0J2SS9waWJZ?=
 =?utf-8?B?Y3RnRWJnekVGdVFwVm8ranhOK2xuWUpnL2hNMlQvR2s2OU8xTUhiZExHa0FP?=
 =?utf-8?B?S1NRMUFqTm1mRnhFWWNwNWh1TXkyS0haNDEvV3NPUitSVDhhVndqWURPWWU0?=
 =?utf-8?B?ZS9LWnNuZHdoaUNzTmY3a2phRVBOVlBhalBwbHZuWDl5MFQwVDBJSkpyY0Ir?=
 =?utf-8?B?YmZEc1M2YmdIYTlXdVdWUDhTbXI5Sm5xc0JzMk12SFBZUGU3bUlUQTVaWWl6?=
 =?utf-8?B?aVh3dmwxbzlDU3RLZFNNNmk5aXhQZ3JuU0RMV29IT2JSRElyYjRwbmUyWWFi?=
 =?utf-8?B?N1MvaE11UnZZbjY4aTFJdmhHSi8xS0ttVHBGdHZtZVVET0s5bENjc0NoMXNW?=
 =?utf-8?B?VW9JeEV1YXVzR1VMd2VGc2c0VEFVV0xLREY3RUhnOGJ6eHcwNWV1cERwNkZV?=
 =?utf-8?B?NHVXSHh4WmdqTkdOb2hGR2dBNHpDN2ZLcWV4RGMwbnRDdTNybWdjZVROQTBM?=
 =?utf-8?B?U1pOUFRYTzR2WS9vY3lqTnFTSExwVU5qU09yR05Qd3ZCcG1waEJ3WWlmVUc3?=
 =?utf-8?B?Z1JCbHlWdlJ3V3plVHBaWDJid3BncGVEaEtKd3JuRHY5YVFvVncrd0l2azEx?=
 =?utf-8?B?NmhjUzE5SGhlS2oxQ3ZYRTFybmxidDNxNlgxeVJQYTBwL3BHZG1DSG9vS0dW?=
 =?utf-8?B?ZjUweTk2dTdKVnJmZzVQc0FYLzRYbTIxOFVaa0tpakx3Yy9xQ1pDRmNCRXVE?=
 =?utf-8?B?cWlpZjEwcEQ4bmRmME5lVjJKS0pGWHBQL0c5Ny9Kbzk0THZNV3U5emhxRzIx?=
 =?utf-8?B?bEk3VlliTzJlR29lbG15NDV6eXhqaGJ0NDFseGhpdnFESVgrY01RWFQzRGIz?=
 =?utf-8?B?OUsrWmVUbTdsWmNHbDN6YU41UmRjNVBCL2k3NmZXdmxVQUhEcGwvUGptdER6?=
 =?utf-8?B?Z01TYjUrM0theWJIV3NCNVR5UXdVRDRUZHo5aHdIdnJ4cjl1M1E4R0pYTmZj?=
 =?utf-8?B?aWJuN0J0ZzVUMHlsWDNublhZbnpEL3oyNFhWMW5LbkhGZ2Q1STRYRVZtd0Z6?=
 =?utf-8?B?VjNaanZSTnNQU0Jwa3h1R0F1OFBVb2F0dDUrY1JQZkJGLytWME1QTkhSRm54?=
 =?utf-8?B?NWttcHptaE1XMFJGQzlqd2piV3FkSHhTU1VHUGtnKys0cWxURFZNU2liZWtw?=
 =?utf-8?Q?NGvKHOTkNrspJw40=3D?=
X-Exchange-RoutingPolicyChecked: khTefTGGeBpn7bJMEMboq0aSlbkHsNikO2bilPoqD9b9VISbcbG6HKaSiou9hVU9a56nbdDyH2i1jsbQKD/QvMnxkPF+Wj3pzF/ipPXlfiWZx+hLUv8eeK6iHzKaPZitD9rC5GinXQcxv44TCbZee7CxymJqpyb0a44zz7xhPt1kffdX5GiizGFpcY9lq7Nh0dKmb1oLjF3nt1RcolrrLKUiCKVBMmL4pCvohb/z4bHrOIIuPckKU4fZWq8DgmOrq9+hzbVe07NDRB1wUWb6nKgtlOnqGsTUpT9jEuFyWMS/oJIK+UaTxzn0syYByQlXHSy6nzNWTZ9rQBRnx/pHlw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b676ddf-3235-4292-c849-08dee68516fe
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 17:34:02.6460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvSEs4aOIhFQhyIwrLHo2HQD395gXXtoSQGg4BQylMWO+6hploiFsg+yCRE+WtiL8hmnTOByKOG3oBRby7f6rlSkEnsTTDXhRIVoADHDzVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8286
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

Expand the GuC ID manager KUnit coverage to exercise the new
usable/shareable pool model.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 383 ++++++++++++++++++
 1 file changed, 383 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index 103ea82d278e..056e4fd8f1ab 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -119,12 +119,395 @@ static void check_all(struct kunit *test)
 	mutex_unlock(idm_mutex(idm));
 }
 
+static void check_limits(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 10, 20));
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), 10);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), 20);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), 30);
+}
+
+static void check_overlap(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+}
+
+static void check_overlap_alloc(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int total;
+	int usable_id, shareable_id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
+
+	mutex_lock(idm_mutex(idm));
+	total = idm_total(idm);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
+	KUNIT_ASSERT_EQ(test, usable_id, 0);
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
+	KUNIT_ASSERT_EQ(test, shareable_id, total - 3);
+
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 5);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 5);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 5);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, 2), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, shareable_id, 3), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_overlap_release(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int total;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
+
+	mutex_lock(idm_mutex(idm));
+	total = idm_total(idm);
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
+	KUNIT_ASSERT_EQ(test, id, 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
+	KUNIT_ASSERT_EQ(test, id, total - 4);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, 0), -EINVAL);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, 0, 0), -EINVAL);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_overlap_partial_init(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
+	unsigned int shareable_start;
+	unsigned int rest;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
+
+	mutex_lock(idm_mutex(idm));
+
+	shareable_start = idm_shareable_start(idm);
+	rest = idm_total(idm) - pools_size;
+
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), pools_size);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), pools_size);
+	KUNIT_EXPECT_EQ(test, shareable_start, GUC_ID_MAX - pools_size);
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, pools_size);
+	KUNIT_ASSERT_EQ(test, id, 0);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, rest, 0);
+	KUNIT_ASSERT_EQ(test, id, pools_size);
+
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), pools_size);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), pools_size);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, pools_size), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, pools_size, rest), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_overlap_partial_shared_range_blocking(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
+	int usable_id, shareable_range_id, shareable_overlap_id;
+	unsigned int shareable_start;
+	unsigned int nonoverlap_size;
+	unsigned int overlap_size;
+	unsigned int total;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
+
+	mutex_lock(idm_mutex(idm));
+
+	total = idm_total(idm);
+	shareable_start = idm_shareable_start(idm);
+	nonoverlap_size = total - pools_size;
+	overlap_size = pools_size - shareable_start;
+
+	KUNIT_ASSERT_GT(test, nonoverlap_size, 0);
+	KUNIT_ASSERT_GT(test, overlap_size, 0);
+
+	shareable_range_id = xe_guc_id_mgr_reserve_shareable_locked(idm, nonoverlap_size, 0);
+	KUNIT_ASSERT_EQ(test, shareable_range_id, pools_size);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, pools_size);
+	KUNIT_ASSERT_EQ(test, usable_id, 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, pools_size), 0);
+
+	shareable_overlap_id = xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_size, 0);
+	KUNIT_ASSERT_EQ(test, shareable_overlap_id, shareable_start);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, shareable_start);
+	KUNIT_ASSERT_EQ(test, usable_id, 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_usable_locked(idm, usable_id, shareable_start),
+			0);
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_overlap_id,
+							       overlap_size),
+			0);
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_range_id,
+							       nonoverlap_size),
+			0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_used_usable(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
+
+	mutex_lock(idm_mutex(idm));
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
+	KUNIT_ASSERT_GE(test, id, 0);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 2);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 2);
+
+	idm_release_chunk_locked(idm, id, 2);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_used_shareable(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int shareable_start;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
+
+	mutex_lock(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
+	KUNIT_ASSERT_EQ(test, id, shareable_start);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 3);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 3);
+
+	idm_release_chunk_locked(idm, id, 3);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_used_mixed(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int shareable_start;
+	int usable_id, shareable_id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
+
+	mutex_lock(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
+	KUNIT_ASSERT_EQ(test, shareable_id, shareable_start);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 2);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 3);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 5);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, 2), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, shareable_id, 3), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_release_usable_range(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
+
+	mutex_lock(idm_mutex(idm));
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
+	KUNIT_ASSERT_EQ(test, id, 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 4, 7), -ERANGE);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, 0), -EINVAL);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_release_shareable_range(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int shareable_start;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
+
+	mutex_lock(idm_mutex(idm));
+
+	shareable_start = idm_shareable_start(idm);
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
+	KUNIT_ASSERT_EQ(test, id, shareable_start);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, 4, 7), -ERANGE);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_start, 0),
+			-EINVAL);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_split_boundaries(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int shareable_start;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 4, 4));
+
+	mutex_lock(idm_mutex(idm));
+
+	shareable_start = idm_shareable_start(idm);
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
+	KUNIT_ASSERT_EQ(test, id, 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), -ENOSPC);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
+	KUNIT_ASSERT_EQ(test, id, shareable_start);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
+
+	idm_release_chunk_locked(idm, 0, 4);
+	idm_release_chunk_locked(idm, shareable_start, 4);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_shareable_spare(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
+	unsigned int shareable_start;
+	unsigned int overlap_size;
+	unsigned int shared_tail;
+	int id_tail, id_overlap;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
+
+	mutex_lock(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+	overlap_size = idm->usable - shareable_start;
+	shared_tail = idm_total(idm) - idm->usable;
+
+	KUNIT_ASSERT_GT(test, overlap_size, 0);
+	KUNIT_ASSERT_GT(test, shared_tail, 0);
+
+	id_tail = xe_guc_id_mgr_reserve_shareable_locked(idm, shared_tail, 1);
+	KUNIT_ASSERT_EQ(test, id_tail, idm->usable);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), shared_tail);
+
+	id_overlap = xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_size - 1, 1);
+	KUNIT_ASSERT_EQ(test, id_overlap, shareable_start + 1);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), idm->shareable - 1);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 1), -EDQUOT);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), idm->shareable - 1);
+
+	idm_release_chunk_locked(idm, id_tail, shared_tail);
+	idm_release_chunk_locked(idm, id_overlap, overlap_size - 1);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
 static struct kunit_case guc_id_mgr_test_cases[] = {
 	KUNIT_CASE(bad_init),
 	KUNIT_CASE(no_init),
 	KUNIT_CASE(init_fini),
 	KUNIT_CASE(check_used),
 	KUNIT_CASE(check_quota),
+	KUNIT_CASE(check_limits),
+	KUNIT_CASE(check_overlap),
+	KUNIT_CASE(check_overlap_alloc),
+	KUNIT_CASE(check_overlap_release),
+	KUNIT_CASE(check_overlap_partial_init),
+	KUNIT_CASE(check_overlap_partial_shared_range_blocking),
+	KUNIT_CASE(check_used_usable),
+	KUNIT_CASE(check_used_shareable),
+	KUNIT_CASE(check_used_mixed),
+	KUNIT_CASE(check_release_usable_range),
+	KUNIT_CASE(check_release_shareable_range),
+	KUNIT_CASE(check_split_boundaries),
+	KUNIT_CASE(check_shareable_spare),
 	KUNIT_CASE_SLOW(check_all),
 	{}
 };
-- 
2.34.1

