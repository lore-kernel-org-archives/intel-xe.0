Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B4BC5DF70
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 09:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61EB10E6E8;
	Mon, 17 Aug 2026 09:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFA57NhQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B7C10E6E5
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 09:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786957848; x=1818493848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Uxz/DWPu+l+at0PTy9i0zzeujBAxaMVzzsuUGHro1XY=;
 b=fFA57NhQ80t5J9FE2gHWt91y6ymBomB90lkd+1N03LYiLhohRi/9rQa+
 TsyUIDV4DzPQtAFqZo/OYRu4SR/6u+1WMWFxwIar8EaODNG8l2J20bie0
 n7Ju3a3+GnluWCxRKbWAQQYUxnSt2O2DL+8uzixncgfJFWbBW+8D4944c
 8Rcj1L4ISrDilz8Vv613p8znk6jnYDZWGc+RQ7l9/iOmDK4nu5DF9pmJ7
 mtd0lmnpZZipsdTK7vt33F+LVzCJTZ4iMybeRQwfYuFvNSUBTFdlhqwX2
 NCaC8EvQ6XnmKtzvqma8nFvAyOgXpYwj/zdAdlBvS/zZ2oZmt6qZCOdJQ w==;
X-CSE-ConnectionGUID: gQL6f7S3TwmZjxbfEgJGgQ==
X-CSE-MsgGUID: ZnP0DoSaSPi+02Omul1jHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="104962881"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="104962881"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:10:48 -0700
X-CSE-ConnectionGUID: 6sWX635fT4y2ytzSpbw9Gg==
X-CSE-MsgGUID: UeNK7u0gSB+zKH3hBOYijg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="268703741"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:10:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 02:10:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 02:10:47 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 02:10:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7SJNfI529qQUrSA1eVPUplqPAsVc394OtctJOQZD+IgteDzjuxeHcgjEg2Bd2OBbOKRbV+KMJe5mNKNHp90K6gH6RPOj9N/d1NnYVC1moE85Jr/0rOR1xLHAkd4lrMcaEeDBsTP4RgIhyhQePLoD3DrT3f/Ca+Pa15/A1SIXEfCjMo8vgAPFEX7yGMnnTATpRiMUNVrih8SIp7B4RiSk90bPXoRqTeMq1r2HblFD2rsTzW8wntN5EZcUIvoqcwbdQBltdDLva+2CZTAjWeByVNZY0EVzfT7Te+lzr9DA7qAFxS8eZ0Lkq9XPp4tBFzIFe0DZO97j1HG3ib9gu8tbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfZ1V10Sr61U7xO51X2wF2RC5aXpI0r6/p4e3FRyq1g=;
 b=ZS9vmBAAv9DGeJB/YeiO9tevRU9OBQf8pbDVcuAxHUbn0LPTZnizjmFNedH1GWwNVTer/wkyDPiJVLfwNY0voU0h/4c/TimmjEbZYv7HKXTyXZjExZCTA2fEDKR9EJtIP/IzRG070WvK6c1JTKgbesIEbXJdwphxZK37wqJQe50j257PO81C26XHyg+LDmmOAEWiMROo/Cynt25EgzE1iFdlE+PuZS5N3hlDtz6RZruIXHjR0D9+RbLTBZO+Md0se7RtTuwjNI8WQdTjpGV5BmPNgAi9odGBDrv8YFzrO5zOOcot7ojKrXo6586vGheLKNIRaXal/u/C+PhrxCRgiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 09:10:44 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 09:10:43 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v2 4/4] drm/xe/pf: Explicitly use shareable GuC IDs for VFs
 provisioning
Date: Mon, 17 Aug 2026 11:10:13 +0200
Message-ID: <20260817091013.280173-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260817091013.280173-1-piotr.piorkowski@intel.com>
References: <20260817091013.280173-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0136.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::34) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV8PR11MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: f103129f-8780-48aa-c887-08defc3f6aad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: QKeYpnTCGPi8BEud8skgGDQjAhnBKf2mz9PLgYV3mSaTEoR5I0PQ5RYLssaSQiAnraEj2ErmbPK1yJOiGL0ovygmcx5ftv5daykZdoWmUGhAAatNE8YPvqVML6r+xW0aEvYbeq76MaW7IJiCZczbZJEvEutLzrWpqd3qksU+TgpCEFt/kMgt1jpo0hMmh9hJxIkNvBBf1941K1VPbZ/PWATZ9w/hYj0jzY/dCJYFgIU34pvyTBqpPzhCQYhdA/LShWjlWpTB9tU6Xa7oxVBwzPNJ4RZ1uGD5tZx5+RT9pt3OaBdQqpKxFtfhLCVYsWa14EZ/7N1t/gUfF34ecyyJ2mQZRqXUUjowrWy+ve7viBaupHYDYnZNEkqN8qWobxpS7kEpi0HRdC8va5YhYyVqpJP5tuIMpfHCqYA8nX9zLa59tIfQ6UscyLdyTw5I3BBWFacH4ioH3+rXbcYSI/MRaK4Q0aWmcv7aOMKfhBjP4uT/29E3YIEcjTspltceFTz7BX6TIifASr3CPCIcweI5lMIA6mcnNRCYiyRKqUhAUdvurUs5bkrqbwYt7e1saj0iUR09XfzcEwpuHGCjBr6fUeX36SPJ6zPhWtZbqXF4GZL+Meleb0IiqlS5Aa0ZpxMOoa2w80exJ/nlcv41QhDPhfhJ3S7y0w3hBhuzar+BfBU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkxybXd6VjBOdEs5K0Z0eitVS3BCVzlYTFNxVEJOdGpqTVlBY2ZEV1dhNDNi?=
 =?utf-8?B?T2N5Z0JWMVFsaWE0bENuekREdFJQM09ydjBTOXJUOUJLbzhpdzhNU0JVcWdR?=
 =?utf-8?B?elNzdDNWYmtwUEJDM3Y1dHJVc2NnSkJUUXJmWnFUV0dUdnlFYXIxckdQRytF?=
 =?utf-8?B?NDNNeklTOEpvdGUwZ01xZXJVQnVOMUVqaXM4V1gyZ0hDU0dPREkwdUMxczZJ?=
 =?utf-8?B?cXo3eWtHcWF6dnlNbFQ1R2F4Z28zcDYzMlR4K0FySjJkYyt6Z3NFSDA5TEox?=
 =?utf-8?B?K08vMzBTZUFiRU44WEt1elExL1JBMjB2YStxdExhNjhUZ29MeEZRekM4NlZI?=
 =?utf-8?B?L2JwUjA3UjIwNDlWVmY2OS93UDhYTWdPQ1N5b2tvVUdNZStYQThJUnNpdExr?=
 =?utf-8?B?aG43YnpLRU41K1p1QkorMzBaU3I3dDBLSU1IRGQ0S25rZExQdXQ4Z2NQYzZR?=
 =?utf-8?B?N3EvVDdPa0JIclhxdU1kQ1FheE8yR3NLVW9RcEZ0TnJrRUMyL0t2c2NqaVpy?=
 =?utf-8?B?Mjg2R2pncXRRaFpnUW9VbWRXYkxrOHBmN1NGVnZrMW9reFVUZzlkaHJoZW1W?=
 =?utf-8?B?dmZmanZzZUZlQ1N2M2FZSkVadUpZNVdBeEdjRVpIcmtFSUFBVzdKSTYzbDBp?=
 =?utf-8?B?dFNpVmRJK05hNE8yaUZRM1dTUzJHSjJNY29PQmxuWlBNdXZqV2pSTmFHOTZB?=
 =?utf-8?B?Slg0OXZObE9maGNtcjJnYis4a2RBMWxZNTN3NW9PenN0bjFOQmpQc0JNUnc5?=
 =?utf-8?B?ei9EV2tuWnhjb28yczRwaVNjMUVKck5BL0ltcUo0QTZLT2NwZnBWK2prbGM2?=
 =?utf-8?B?VXBDVGZSRlNWVWZXRnVtaFZDa0dZZkFNZnRPNSt6eWU1ckx3cWhITG54aEpw?=
 =?utf-8?B?aXdwRExpeUF1cjd2cVptcWdsWldKc0xXM2NFYmpyU0diRTFHRHlvaXgvVVNV?=
 =?utf-8?B?dkFLcUcvTU1aSHR0cytqVEY4eWl6bDRJdGJNNzFuaFdQeUJKTDd1LzlFR2xu?=
 =?utf-8?B?RjA3ZG5zSUFhYmpTaW51U281U1lMU3prdi9DSXFwSEszZWlIMTdZQk5pcDRP?=
 =?utf-8?B?L1Z6enB6eU5xMFp2bDlkL09wMWtLWk9jUGREZ3cvcUNUK2xWZW5Td3JSbktw?=
 =?utf-8?B?VlMzMjB4ZG55bjJGOFdqdU5OdzJiZHdzUnU1dFhGYXVNbnVtYU9SbXNFOXN0?=
 =?utf-8?B?Q2NXMHBHeEgrUlB0YXZFS0xpeGsxMDROUjhyYk9JSW9OdHFvSTBtLytqL21i?=
 =?utf-8?B?S3JpV3lBZm9YV00vZWpScFMyR0E0YjFpZ1hnL1NXL2VsL2NYVUpvOFdCSG9I?=
 =?utf-8?B?UzRPSnZIQUlPVTY2QTZSR01KRWpQaC92UU1iODk4WGI1VCtBT0hWcC9oUTNS?=
 =?utf-8?B?dmJpRVVwQXlUbnhqd1VWcUVPQ3BKdEhjdlJHQS9vV29PMXRMUVR1VW1VMkFX?=
 =?utf-8?B?UUVIVGhPQVJxUXJFc0FYbEovYU1ta1Rxa1hrclNSL2lSd1c2YVJUcXpXMVFD?=
 =?utf-8?B?T3lGUmU4ZEhTa3A2eFNvOXdtUDNRN2JZWmNKS1BoRzU1SE9PY1FYSVg1cFYr?=
 =?utf-8?B?V0dQL0JDdE5UYmR3MjVXVnZRRnJONDlFbGNmM2sycS8zRjJDWGg4U2ppeWY1?=
 =?utf-8?B?cC9QNzFoV2FEZy9xNXE5UDFsSUxSZmxIZzlWS2szbHgxTjVyMmlIZWo2NkI0?=
 =?utf-8?B?M1c5aWpvM3hYNFdkNSt2anNleEdEUTR3N3ZJV0hWWXZ2eUtOcDQ4WDYwT1VL?=
 =?utf-8?B?UWFnU2VDRlp6SDRZQ05Ec0FmZmxqeFNZSU41VlhiWS9LUlFSc1NnRG4wU3g2?=
 =?utf-8?B?aGhZL0Y4S0NBSnZRRE0zVFJBbHJrVGVjd2s2NEJuRzBXQTVhSUJvaTZ6a2Rz?=
 =?utf-8?B?NWFRSDZ5eWlrTHlVQUJNcG95bkdGZmRjbE1obGwyNHJWd0lsNnRqM1lLTUFP?=
 =?utf-8?B?Y3hFLy9RQ3VOQmRVYXZCSFNjOU1hZ0JyS0gzdHFhUVJNOC9rVTlHRTNhbWor?=
 =?utf-8?B?bW9SSldYWXlqa2N5R0dVL3lnemhSblp5Q2RncTdMQTgvajZJb2l2cFRmamZz?=
 =?utf-8?B?Zk5UcUs3a3k1WWJFcG11dUljc01lL1cwNkc3UnVCbTkwYmNya05MK2pSNSt3?=
 =?utf-8?B?eGR5NlRSMVZNdFl3TWJZLzFWbE10L1pkaHBZa3c1bWxiclFaa2FpUHkzK0xY?=
 =?utf-8?B?WHN5Y3N1TkpXbkZTR09TRUFLN2pLV0gxZWFLNVlkVy9GMEs1dGRwdUNLQThh?=
 =?utf-8?B?Y2YvalVVK0VwSkxLLzJMUlNuYXo4cHBqTjk5S0JHZEc1ZW9YTTV2R2JQOGpD?=
 =?utf-8?B?cUZpVWtSTTM0ZGdaVGVOSUtaTEZSampTSmNtZlpvRWxXVC9pK1BqUlBHZTV3?=
 =?utf-8?Q?wmwfMQptXPU/CGKQ=3D?=
X-Exchange-RoutingPolicyChecked: U5/2wbd8KPFZs1Pw9wfmVFCAADO/dZG7ljQAohsDXr3EoVfFnSwUQQSG2Sajcp1U2pxVLkgsTWW5PyvyzSN8JUgIINBXpCWI6dulg4bJESfA57I+ZHn808D3wHdkEdvHMWF9vCBS/xdy8JPu+Eh+UnJGClGmKdWVrIxf3AdhHPkG/Wz0ribV1ETAkXCeLDdY2RAnYQmllixi+dz2AMM7KaQlaMul/sKnwzisXQOuNh8BU3fVgMQD1B3u08HQ96AYdj0SCnCFpWZ0JNfatRkUok8fsOYP7vNWY1bFCc14WTPQIutNSU6ziENIu8Fs3hcrTzLK7go9piAM8bfWkJKFig==
X-MS-Exchange-CrossTenant-Network-Message-Id: f103129f-8780-48aa-c887-08defc3f6aad
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 09:10:43.9296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0VhyDJ5P4Q6KsKb9f2nNh94siT8C42bkaA9ogwtZNJyd5ws3PzKBMLZfiqoXivtsC89kC75FflDg5ctruIZ5DtD24oF2QdnhcGYyNNmhqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8485
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

Switch PF VF-context provisioning to explicitly allocate IDs from
the dedicated shareable ID pool.
Also, lets remove the legacy GuC ID reservation API now that all VFs
provisioning paths use the shareable allocation helpers.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  5 ++
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 36 ++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 14 ++--
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 71 -------------------
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  1 -
 5 files changed, 37 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index e6eaa94d4d30..4d72411cd570 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -68,6 +68,7 @@ static int pf_gt_config_test_init(struct kunit *test)
 		.graphics_verx100 = 2001,
 	};
 	struct xe_vram_region *vram;
+	struct xe_guc_id_mgr *idm;
 	struct xe_device *xe;
 	struct xe_gt *gt;
 
@@ -102,6 +103,10 @@ static int pf_gt_config_test_init(struct kunit *test)
 	pf_set_admin_mode(xe, false);
 	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
 
+	idm = &gt->uc.guc.submission_state.idm;
+	mutex_init(&gt->uc.guc.submission_state.lock);
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
+
 	/* more sanity checks */
 	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
 	KUNIT_EXPECT_EQ(test, GUC_NUM_DOORBELLS, SZ_256);
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index f21d3341b503..3e6d289f7d7a 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -59,7 +59,7 @@ static void no_init(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_usable_locked(idm, 0));
 	mutex_unlock(idm_mutex(idm));
 
-	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve(idm, 1, 1));
+	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_shareable(idm, 1, 1));
 }
 
 static void init_fini(struct kunit *test)
@@ -127,6 +127,13 @@ static void check_init_shared(struct kunit *test)
 }
 #endif
 
+static unsigned int idm_used_total(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm_total(idm));
+}
+
 static void check_used(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
@@ -153,26 +160,31 @@ static void check_quota(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
+	unsigned int max;
 
-	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 2));
+	max = xe_guc_id_mgr_max_shareable(idm);
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm_total(idm) - 1; n++) {
+	for (n = 0; n < max - 1; n++) {
 		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm_total(idm)), -EDQUOT);
+		KUNIT_EXPECT_GE(test,
+				xe_guc_id_mgr_reserve_shareable_locked(idm, 1, max), 0);
+		KUNIT_EXPECT_GE(test,
+				xe_guc_id_mgr_reserve_shareable_locked(idm, 1, max - n), 0);
 		KUNIT_EXPECT_EQ(test,
-				idm_reserve_chunk_locked(idm, 1, idm_total(idm) - n),
-				-EDQUOT);
+				xe_guc_id_mgr_reserve_shareable_locked(idm, max - n, 1),
+				-ENOSPC);
 		KUNIT_EXPECT_EQ(test,
-				idm_reserve_chunk_locked(idm, idm_total(idm) - n, 1),
-				-EDQUOT);
-		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 1), 0);
+				xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 1), -ENOSPC);
 	}
-	KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
-	KUNIT_EXPECT_EQ(test, idm_used_total(idm), idm_total(idm));
-	idm_release_chunk_locked(idm, 0, idm_total(idm));
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), max);
+	idm_release_chunk_locked(idm, idm_shareable_start(idm), max);
 	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
 	mutex_unlock(idm_mutex(idm));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index f4725af59fc5..01b8463693c7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -889,7 +889,7 @@ static int pf_set_spare_ctxs(struct xe_gt *gt, u32 spare)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	if (spare > GUC_ID_MAX)
+	if (spare > xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm))
 		return -EINVAL;
 
 	if (spare && spare < pf_get_min_spare_ctxs(gt))
@@ -906,7 +906,7 @@ static int pf_reserve_ctxs(struct xe_gt *gt, u32 num)
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
 	unsigned int spare = pf_get_spare_ctxs(gt);
 
-	return xe_guc_id_mgr_reserve(idm, num, spare);
+	return xe_guc_id_mgr_reserve_shareable(idm, num, spare);
 }
 
 static void pf_release_ctxs(struct xe_gt *gt, u32 start, u32 num)
@@ -933,7 +933,7 @@ static int pf_provision_vf_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctx
 
 	xe_gt_assert(gt, vfid);
 
-	if (num_ctxs > GUC_ID_MAX)
+	if (num_ctxs > xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm))
 		return -EINVAL;
 
 	if (config->num_ctxs) {
@@ -1173,9 +1173,11 @@ static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
 
 	if (admin_only_pf && num_vfs == 1)
-		return ALIGN_DOWN(GUC_ID_MAX, SZ_1K);
+		return ALIGN_DOWN(xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm),
+				  SZ_1K);
 
-	return rounddown_pow_of_two(GUC_ID_MAX / num_vfs);
+	return rounddown_pow_of_two(xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm) /
+								num_vfs);
 }
 
 static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
@@ -1186,7 +1188,7 @@ static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 	int ret;
 
 	for (; fair; --fair) {
-		ret = xe_guc_id_mgr_reserve(idm, fair * num_vfs, spare);
+		ret = xe_guc_id_mgr_reserve_shareable(idm, fair * num_vfs, spare);
 		if (ret < 0)
 			continue;
 		xe_guc_id_mgr_release(idm, ret, fair * num_vfs);
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index 31425011a311..ddf4338f742b 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -62,13 +62,6 @@ static unsigned int idm_used_shareable(struct xe_guc_id_mgr *idm)
 	       bitmap_weight(idm->bitmap, idm_shareable_start(idm));
 }
 
-static unsigned int idm_used_total(struct xe_guc_id_mgr *idm)
-{
-	lockdep_assert_held(idm_mutex(idm));
-
-	return bitmap_weight(idm->bitmap, idm_total(idm));
-}
-
 static void __fini_idm(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_id_mgr *idm = arg;
@@ -345,43 +338,6 @@ static int idm_release_chunk_in_range_locked(struct xe_guc_id_mgr *idm,
 	return 0;
 }
 
-static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm, unsigned int count,
-				    unsigned int retain)
-{
-	int id;
-
-	idm_assert(idm, count);
-	lockdep_assert_held(idm_mutex(idm));
-
-	if (!idm_total(idm))
-		return -ENODATA;
-
-	if (retain) {
-		/*
-		 * For IDs reservations (used on PF for VFs) we want to make
-		 * sure there will be at least 'retain' available for the PF
-		 */
-		if (idm_used_total(idm) + count + retain > idm_total(idm))
-			return -EDQUOT;
-		/*
-		 * ... and we want to reserve highest IDs close to the end.
-		 */
-		id = idm_find_last_zero_area_in_range(idm->bitmap, 0, idm_total(idm), count);
-	} else {
-		/*
-		 * For regular IDs reservations (used by submission code)
-		 * we start searching from the lower range of IDs.
-		 */
-		id = bitmap_find_next_zero_area(idm->bitmap, idm_total(idm), 0, count, 0);
-	}
-	if (id >= idm_total(idm))
-		return -ENOSPC;
-
-	bitmap_set(idm->bitmap, id, count);
-
-	return id;
-}
-
 /**
  * xe_guc_id_mgr_reserve_usable_locked() - Reserve one or more GuC context IDs.
  * @idm: the &xe_guc_id_mgr
@@ -499,33 +455,6 @@ int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int coun
 
 	return idm_reserve_chunk_shareable_locked(idm, count, spare);
 }
-/**
- * xe_guc_id_mgr_reserve() - Reserve a range of GuC context IDs.
- * @idm: the &xe_guc_id_mgr
- * @count: number of GuC context IDs to reserve (can't be 0)
- * @retain: number of GuC context IDs to keep available (can't be 0)
- *
- * This function is dedicated for the use by the PF driver which expects that
- * reserved range of IDs will be contiguous and that there will be at least
- * &retain IDs still available for the PF after this reservation.
- *
- * Return: starting ID of the allocated GuC context ID range or
- *         a negative error code on failure.
- */
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm,
-			  unsigned int count, unsigned int retain)
-{
-	int ret;
-
-	idm_assert(idm, count);
-	idm_assert(idm, retain);
-
-	mutex_lock(idm_mutex(idm));
-	ret = idm_reserve_chunk_locked(idm, count, retain);
-	mutex_unlock(idm_mutex(idm));
-
-	return ret;
-}
 
 /**
  * xe_guc_id_mgr_release() - Release a range of GuC context IDs.
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index f7ab753070da..844d68440b0a 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -31,7 +31,6 @@ int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned i
 					   unsigned int spare);
 int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
 				    unsigned int spare);
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
 int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
 					unsigned int count);
-- 
2.34.1

