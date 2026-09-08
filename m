Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42FCC79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B1D10EAEE;
	Tue,  8 Sep 2026 10:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbUhwdaJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9BF10EAEE
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788861976; x=1820397976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YjmPM/CdgTuvykjpnU8/27qk8SwLgUnCJZ+0KtdgjzY=;
 b=PbUhwdaJ3ZWcq/kjMUX9WK5+F9PUD3HfjGPW8Xn0G1+ermciOmFzTO9D
 yJhU/I/cla9NQQiQqRltlpF6rymaqq27NrLGzvfppOpgUILhL2Vilv0iK
 Jcr9E4qlpqg+RLP2jfbXj4315jds8JiuXJhgYlmRfFHfGcbz+1AFKZDhk
 0ffnlpdIe/5YFtKJAa7Of7f63wVdTioIZR5sV6LdZfvb+08Z1RzNTtZGK
 zuWhjBRSof61pQYDKxCIPgQl9ChyriQHlVj8ZW2Zw1QjlcwYL8/P2D6sC
 f7Hxg1IkDllkc9MmwdaDlw6z/xM7GHJ2CYkfDCCe4ZaKiyZTqUMtbho5C A==;
X-CSE-ConnectionGUID: mbmuf2U0Stqegxoxuyr2lg==
X-CSE-MsgGUID: xx5zUI1iT9exaInABd6mkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99920479"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="99920479"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:06:16 -0700
X-CSE-ConnectionGUID: a/ZuX9WlSYucgEybPHqqGQ==
X-CSE-MsgGUID: YN76IDDtTqOhgsAkwzJyIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="270455075"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:06:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 03:06:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 03:06:15 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.13)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 03:06:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYYlj2yhZHrvMgemho2hxjn7B22PZN1zWjGQeSQoKm5MnxvhC96lMevfUDaalwJi3zkVNGszyohXBgZ1PJjWnbFotooM2Ar+QFMCqd2dYdCtt5ybktxNncXEFCp7icaOS4QCO4bwH4eP9VpgDnE+YkOXO3oBrH5cBb9ewhNBt7Gj7qN85pGoDhFU3pM6mT7x7SUKjlR1ISXXAFZz2LB6TO4pRirgxfRmfuiJtxoYjrzIqSDveAM23HiSS2lgxly+lWi9M5X0KK/CVWAb/MmqH5uZlB/3js4T3GyhRhCmEDiMSEYnt2Mc03i15Ry2d1sZuDxaH64vxxnzOlv4fybuWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRCMZzwTlc+YpdmaWdE2cHUwzbEMZYuhkAi2JP+DpVY=;
 b=p2buyR8AqWrWmeYntsvUw4AJ4LoLLMWXbyZ+F8qvHPAOpgYR0sx8FIvqNpK0Qb5LGlILqm1PIHfjjkvlOpBbQz/tZ42F/I/pQGRtT1VbWDR0bBuUPff+9h4Y/x5xrvtAIuqSvI3RQRXKd9OAVAjaNrmkau7/DX8qtmkjRJ0mPeEKnD1e3KU7OAt2PD38Qf9B8X/5ObsHbModdMjQxKTldzRoOZXGuV+7q6hJXr1C1QghViMk319NrYYNfp1xXDtwvoJzQuz2hxTeH5VwUnECuu07GjzrBy1cgdwrayTmI8Ra72ny3GN2MAP/Ou/FFrTY1hNZps59PHCgABwOn89XKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SA1PR11MB9827.namprd11.prod.outlook.com (2603:10b6:806:4d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 10:06:13 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 10:06:13 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v5 1/4] drm/xe/ggtt: Introduce full GGTT range size
Date: Tue, 8 Sep 2026 12:05:59 +0200
Message-ID: <20260908100602.1626556-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908100602.1626556-1-piotr.piorkowski@intel.com>
References: <20260908100602.1626556-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0327.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::17) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SA1PR11MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 407eaedd-b452-488d-3524-08df0d90d046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: VlIEOa+841VZRd1+8DRT75P+tY7Kmzs8QYKleIuvVIdH1RjhsBiGhbmS6nvAKbLBt2mXULfbfhIQpsEkHc64XgyDmHZzet0GkmSOQ/lvDvrdIGE54rk2zE3U1foaEuNjFDQs2W00wT9uQK/uOMzZmUk0qvkbkwzw+pHE5MFPQPvaTh8j6jHTWheuMc5bZBUxmH11VbkecuVcXSYCxN0qjKmoeG/iBRVKpGepuPwEWlNYO0QGSnzQn2MueGRm0GmM7UhOIaJkPDb1XA0Pe5t1sadZO4sKtm/pNsuox9Y7K/7lvVXiK45T7eSaA91JQwbNofEFYBDFPTItCXvm/exz72Z48xNxBs53+oHLRPCMLsYwnvhjuuvSHJDhgdXCdkujpXS+4AexajgGenqP2KgxRKopHhnaJKqluWK4le9cskAIEWBj32wAZrd4HKPYJU52FnAkG08CMQPhngXYd9S5keeFTKzu0LLbIpbkIo0AA1pPHx4Pr4Xz9yFStsCAcGpa7LwvfHprE0V3c8k9itDlz2Ez8UKY48RuFS/K0AeNS0lGjVoEOIODOg/9Qo3TJ4F1DMeIrLUOMtrzGzJAvN9JXvtevFkUV+Ax7RFi+g/SdCYNRmEis4+Oat0dJbprlGStPgdjhHGmzgDNJVE75wmJqJ8HYaLmQ+dAqxfUenAN+/w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTVtaGh1SFU3bjdwZjZuOTJHVkVadU5XRXhsZUVwTE5CRGNMdkM3cGFpRW1X?=
 =?utf-8?B?NUdjcm5DbE0zemsxMzlORVlZNUFQM3BTOTQvS2dLTzErMHBqWkp2KzlDL2VZ?=
 =?utf-8?B?M3VQVFVXaTNwSzMyYk9rdDFqWmtGRjh6a0pTY000MVZIeGJsZ2NvdTVJOFNH?=
 =?utf-8?B?UmVCNWVYVUZPY3grd1hqWFJaa0Q3RUtpRDFWeUxUeTVMN2gxKzVaYUhMRDN1?=
 =?utf-8?B?b1hnN1RiejFmaXl5R0tUY25VaFdCdDVUQjg5bEpxOCt3TzE1T2F3Vk1GeUt0?=
 =?utf-8?B?YkpRa3lVN3E3RHpoL3NPbVJEL01PQ3JGbUNUTDBpQlI4S1BQQnQwczUwMHJk?=
 =?utf-8?B?MHVnTkt6Vk1pSWVjdTFhQ0M4a0ZZSnd3ak9Vanp5c0NDbTNkVVpsZXVDQ2Nh?=
 =?utf-8?B?R2tBYkhFbkZsMFZMdjE2SHNSaWVrUXpKdnJBSTVSb3RZVWNFWE94aEFtYWVI?=
 =?utf-8?B?VTJyb2xGcHJsSW9lSXdZVzUySU9XVExHVmtPdmU5K2ljTkFqWFJndWZyTysw?=
 =?utf-8?B?dER4c0ZJS2xVYkFMRHBQdlJnZGJYWG9GZlp3YkcvSmxObEZwbHpDL3JDTk5a?=
 =?utf-8?B?bTZRSzBBcW9aR0dCdHJZWExSNUh6bFBTZ1pEZ2dMdFJhZGZFZG56SUxzNGU2?=
 =?utf-8?B?a2JDTU5XK25zV09EM2ZBUUNoWDRka0RtdGFUeHFDK0hySW1TYklXZGhscThV?=
 =?utf-8?B?YUs3Rnd6dGFaZU5iREtxV2phRDNqN0RXVlJLTU1SbDJ3ZlZ3ZStZNVNjWXRE?=
 =?utf-8?B?SytTbkJBbGp5dzcvemRQVitYVkhQYyttTWx5MW0zSkNuRTlJMGY2aWgrVFpj?=
 =?utf-8?B?N1FIL2RlMFhwQ3BKQVJ5Qi90bnc2NzBDaE41cnBLYnRvcDliYjhNNTJNYk0x?=
 =?utf-8?B?ZmJnK1haQnJ0RXFHeHZSMFVkdUE1MmsxTEpKOXVHaXRURDlEY0c4eTZWWTVj?=
 =?utf-8?B?RTZFZFdrQWhiQnExdDZCemJULy9DVmZ6SmZqUXlubTJMd3ROY05ZTllOOTVw?=
 =?utf-8?B?REtUeHpPaFlSbG9HcnVHdm5VSXVSZ25BajAzMTVtblBlVnJ4bVhkaERBaFlK?=
 =?utf-8?B?enZTTkNVQjNFTTI4TEk0Um9PYkVPZ3MxRmJIMVRtM0NMOXR3UjZ4RUFuK0dk?=
 =?utf-8?B?dW1rOEwxdW9TVk4rRE5JdlppK2NaMjQvVmRmeEkzbUc0NmxqN0pHYTF5U0Rj?=
 =?utf-8?B?NCsvODIwSGNpTTlheG5FeC8wZEhPMUtTK3gzb1VydHJjQ1VFbkh2ZDArWDNj?=
 =?utf-8?B?b25pQkFkb1c1S0JHOHJxM2NFdEdBVEc3cTlPQXlSQWR1Q2h5VW40Y2MySTFK?=
 =?utf-8?B?VjgwcGVQYnpkUnp5a2hkajJGbGJ5eWRBL1dyVnpiS1dUMG13ZXhoZFI1bm91?=
 =?utf-8?B?a2FLVmpuWWsrd2xpR2VXb2d6bUVZWWhiN3FBL0t6ckRkS1NBTnk3V2l3VjBI?=
 =?utf-8?B?WVlDcVpkTjFZcmx1aUJBSHBlN1Q3RVVmUHRmMHR5OXAxd3NYeDhQTkZpZkky?=
 =?utf-8?B?aGR3V3JOdWwzYXNVTHhyZFMrNmtVK1dKUHJKUjRVTUV2U2F2dFJOcXA3b0Qx?=
 =?utf-8?B?TWE3a2xLaVB6dmJqQ0ZiRjJmS214UDdnWDZtQlpaeGltWWpvcGlSdmQvN3p4?=
 =?utf-8?B?NnBjWkM2eDdJS25KTXpMdS9NcUNlSFJ1TDMrdXFBQm1ibVkxWGRiUlZxUzZY?=
 =?utf-8?B?S01PNUhhZC9zcUtFRTRZS2FsYlVuMkJHMklVT3kwemdVRlJ0RFB6YnNhU0RG?=
 =?utf-8?B?VTNhc2NNZVY1YWYra04yR2w4U3dybVpmZ3dPL2FLVy9oTFpGVGh4UXdjd2ZW?=
 =?utf-8?B?ejkySzB1djZPeU9aTFhxM21nY0c0azVQVDVGVy96MWtCSG4wVlQ2TkxBNzZ1?=
 =?utf-8?B?d0pKYk5TMitkN3I2ZmJ3bTZUelN5TEZ2Q2ttYk1sUk8xQTU1aTJONTI1Q1h3?=
 =?utf-8?B?eUp5Z1Bya2JrSTdoWEZtUTBYK1Y2aHcxcXRzT1djMTIwOXVFczArKy96N3Ri?=
 =?utf-8?B?aGxjNWhMV0Q3Q2ZENlRubThaai9FRjd2YXQ4cXlXTVk3RkVkb3lYMVdsSFRw?=
 =?utf-8?B?dmJnMEpzRDhYVHpkd0NlYkJxT3RWclB6bUVNdldkQkNvWm42UkY1RlJsTjFB?=
 =?utf-8?B?RDJ3SlZTNWJqbVJYUGlVWkRQelh3cWIrdlR0UGdaUjFKVjNUeEdidUVmREU5?=
 =?utf-8?B?REI1ZlV6eEZzd1dSYVFMVEtTZFA2bk9qbkJENDZSandTbVRteURPRUNjOFVX?=
 =?utf-8?B?UytJM29wTW1XQ3c2eHhvaHdqTjFVU1pyaFovQ2hGNWJINXJnQy8yZk93bG1q?=
 =?utf-8?B?cWNLejIzeEh1V0VodTB3QkxmYy96b2F4T3oya2NjVFNVaTBtRkJpZHE4bXVy?=
 =?utf-8?Q?3lHBDNi8P8NtkvEg=3D?=
X-Exchange-RoutingPolicyChecked: WwpUL8pes+6BSJo0fW+30W8LwwO9cTOoQXbkalW8AaqQOc+uUCecwLIeVmIipHL2HjdS1k93FCWQZ6Qbj3OBjbbxSXk4+uKY6tnyN2U233vzZFNP0j8RkvaKqn7tEitNw4svjlH7PHEsK0LzvlT6kQPtADJo1x8eW0ZXBqbTJEaKuAvK36lqF9knEhJWa6dEtKJnx/v9Uim4IVdFR8kUqO3u8M2oLAjEkU41yM8G2vwpdSLewa+JnsYbv5aXW3w/opKk89hal7wQXLMRPASY1VJoePBmH9m+oLzfBAIKIvL1NXDo/D2HXzK7rarYBAI3cwAV5DbNDSsNm6kiMagrhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 407eaedd-b452-488d-3524-08df0d90d046
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 10:06:13.1735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7t00dfk3exWjLHyEblHfpdU5Rg92S8+2RKxI3S0bsuJ9gaImF0Jf4a2jjNeTfjiYW2zUXf0b7M5uGAoD9SB1hlhJwg43TY7H/m+JXHjrW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9827
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

Separate the full assigned GGTT range size from the size available for
regular allocations.

For now both sizes are identical. A subsequent change will reserve part of
the full range for VF provisioning.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 63e8bf1936058..c54a4cf967df9 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -112,9 +112,11 @@ struct xe_ggtt_pt_ops {
 struct xe_ggtt {
 	/** @tile: Back pointer to tile where this GGTT belongs */
 	struct xe_tile *tile;
-	/** @start: Start offset of GGTT */
+	/** @start: Start offset of the assigned GGTT range */
 	u64 start;
-	/** @size: Total usable size of this GGTT */
+	/** @full_size: Full size of the assigned GGTT range */
+	u64 full_size;
+	/** @size: Size of the GGTT range for regular use */
 	u64 size;
 	/**
 	 * @flags: Flags for this GGTT.
@@ -239,7 +241,7 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt)
 static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);
 
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -253,7 +255,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);
 
 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -358,6 +360,7 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	ggtt->start = start;
+	ggtt->full_size = size;
 	ggtt->size = size;
 	drm_mm_init(&ggtt->mm, 0, size);
 }
-- 
2.34.1

