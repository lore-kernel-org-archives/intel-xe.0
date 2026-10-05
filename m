Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13940CA5FF0
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 08:52:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C248510E247;
	Mon,  5 Oct 2026 08:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWx1+98A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D788210E247
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 08:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791190328; x=1822726328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UbGV1jPnlIskCv+bJlDvCPFp1wYcBjGdSOgmuFQcFfg=;
 b=dWx1+98AZwIXSM+/SPVDdqcAL7TuDed18Db+8tgwNZGyBE3tIN0W+3t1
 kRRlRx2E1F+9on2qhnqOlDl6Ij7eUjZ3qnN2CrXGvfO3/SsxkhZalpRjq
 eriHjs6sVb2yZeASSDS35lXXRewlJCUB7Clf6fYaR6ntywFCKfly8kxUf
 d2jeIximmFfEemXU7NUbJOuY2ECONVOTjGGMsdKSq+Y+Ac8zlX7G1vbzP
 H9sh9DDYbwtePqaVlU8WkTlUi5EGx1F93CIUrSgmAVFWydRbDVD1rnPOY
 yk9bF6ziFwS+V4kzqzugXTMWyMyWpz9qTSorrwYmd0bqOlp/JnrThQHF0 g==;
X-CSE-ConnectionGUID: k5bnvtnWRXe4PGl/m6y/3g==
X-CSE-MsgGUID: I4uCtCMoQDicFDxrsVYLbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91717691"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="91717691"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 01:52:08 -0700
X-CSE-ConnectionGUID: 4O47gSTsRlmq8v6gKzGEbw==
X-CSE-MsgGUID: NolLNZQEQhapRprWX8O1Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="314773002"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 01:52:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 01:52:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 01:52:08 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.53)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 01:52:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BK5wbiGANSDRbHzuJHFDIaHinxJQhRyibHBDnFBZkKMHwp02TCxC+0Pr5DHua8GubtQ8yk8ah2P4tXagTkmad89hpR168ts5Bve6kZjkIQ787DznfLltB63dau8T2tK7RL0l9nDSdzswPplitY5C3wMNCfJhLAjmY8SDihCxgfhQ02D5xqYFRE3puu5LlbYRSqxjUd4MsnMhSTx6Pe4oRmCsxeXNHRz79qMEgFwdZRR0GTTXrb3Kzyh4C42VxQXWBF8fGTSTfObDJiIZmF5AS72I09Hoa27hp41qa2vwTtJIdHSI3JMxB8kU2G23VTNKh7r9Dy4HvZoEeTO01xPwBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmZIsqt+T7oT/UmobAWWaWC3sH0XOQZrHLeScXQHRns=;
 b=SpFyiaxSxPT4HXONUKbQVsCgjGzSpigAAdQ2pfTVMUPD80DVJzBaoZ40XuidOyxUBwXZrV84Pkv2XRRgx8jKNqklZkuhnQHLZfmCWFzMQI+wl7milIeRSPmv5VPMHEqc4HGncE8pX6/zUymr8A1fzkxTg+dyQQmA+IrG3iitUX+7IYOLl99+xxVT0Z31wn1zZUJ1d2eZLutVjNNTJtjxQARx57BewlZYnYQ5GTk9Em8MNG6RYfRhKizEH4YfWkXRIeYkm4ywLhAX3SM6Mmkr/ZNYuIlFOLT9GvTVg3vs+nBNjM7Q6ASN4SXf3ySTr8L+gZlW1ubqP0I0iwzvkAQmWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS0PR11MB7851.namprd11.prod.outlook.com (2603:10b6:8:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Mon, 5 Oct
 2026 08:52:02 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 08:52:02 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v5 3/4] drm/xe/guc: Start use explicitly usable GuC IDs for
 for submission
Date: Mon, 5 Oct 2026 10:51:31 +0200
Message-ID: <20261005085132.3720685-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005085132.3720685-1-piotr.piorkowski@intel.com>
References: <20261005085132.3720685-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL0P290CA0006.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::9)
 To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS0PR11MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: b8baae83-b294-4406-4073-08df22bdec49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|6133799003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: K8qIyDM5IhVSTutCi5e/AS8UH03JTOKrNyiWH3w5khClGaP6Cmzf+HR3ZM2Wu6e7M5RBHrC7wLpun5CHEFvYT6rlVxnJYt5pw7UHjNgUFN+IHd2BTaehslEM2lTVdEyj/+OBAyZOzSWZ9aiKLvdXU4+cAxSx+nqlWcSeMIt26B09UE4TDVKxf35tGbm1YUP9uZQ1g6RcvqRjZRCEyE19h4LV1I+/gU30lSTbQ2wi/A+gdm8KZquta7Gx1Nb/DqgTdJfu87/V28NWGi1J7C0VBKkg1/E4IKekrRKhq8BxRjCvErrBa36mcsU2jdEQvkSfIuB7qBWdVIlV3/eQMRmba12qNzxcVB4ndfTaexLci1Sx1KAroQ6d5ak5aVdzddpSqldPAp9dWADPGA0k5QsvKFofgYcgojy/nxSxIy2gaF4ixwUoxwtKdyYPasgyM1V+O/TVhHONrOImwjgu0rKx+9TqpWmALtgo+nUF9p5BtfpnOPGcSnMIN2ZRiycJvCzx9mxq7e5AN7aUFk1o1YVhwt9PRK6SHKibJ88y8cEVX2Wcq0bCEt1MWwhwWkpfSahD6n6hLL7lkLBnYL4a4iVIIfEFtOzrFKgw9UUW2K/xqzNPl86PFuP8isKkZFRfTCmDpSlxuZag/XKTaA0yIyS7Noux+pzBBpNXY/L99tSXx0s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(6133799003)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjFKb2VlWXNaNUxGL0tnMisvWjZObzduNGxwZDdVTXB0RDFnNk95b291K2Fp?=
 =?utf-8?B?eVNJTmtuSnhWa3hNbUdrNXlwYXdRcmVKamNtVjZVRGxJMm5oaUh0RGdrNmxu?=
 =?utf-8?B?aGpMQytaQnJobm14YmpKNUNXSTZIWWxRaVhhRE5LMWVPMUFtQ3pSTk9iMWZK?=
 =?utf-8?B?TjI1dlo0S3Eyb201Wi8yVFZBZkFVS1FVQldsUnU5MW05aVJCOEN0QlhiZllh?=
 =?utf-8?B?dEIydS8yZTdFUTRRbjhtSkhZcFVQNFU3endscElLS0JWUzNIbkF3SW5lUUJ5?=
 =?utf-8?B?MXVKSFgxV05ZMldGcytZaUJ0MWFUUGFKTjR2Q1J6Z2h0NnhWR1I2SFZTR1ZS?=
 =?utf-8?B?cjIrZE50bHBYWHdWdGZ6VkRmTDZwZzQ0eUxIL2JVZTN6M0pYM1JhL0sxSTQ1?=
 =?utf-8?B?Vit4VVhlV0xqNGxpdVdoYnByUFk1TkhzejRzTDQvSklNaGcrSlkwT3c2RnlC?=
 =?utf-8?B?dVZsdEtWMWlxMmlYU0MxTVE5NzNNdkc2UnJNMG9rMmFVb29oU0IrS1pnU1Uv?=
 =?utf-8?B?UDZVTUZaa2lQTU9mY0JWUU1vdTJoL04ySDRaMmhCZDhwNW5lS2ZxSHpUQ2xs?=
 =?utf-8?B?aFpVWkN4QysrOHZka2svWkFDWGdjdlQyRVg4emtydVJTV0tyd3paejVkRC9W?=
 =?utf-8?B?d051TURxcWV4czd1c2M5N3FGczM1MTRJTXJqRGtoSmNSUzR4T1VoK1lQaHVD?=
 =?utf-8?B?RHM5UWREeGNrRThpQm5zaVE4MUg1V3A5T25RNlF3RVVtTDRqZnppb2hJK1pU?=
 =?utf-8?B?TEhqeUhqa2tMa3V5WjJaalNFekJ4ZGUwTklhS2xkTTdTL2w2OUYzU05zS3h0?=
 =?utf-8?B?aVdBYUxtU3BmOFpWR29PWTRJdWtpUG1pUzlZWHJ3aTFKSGx1Q3Z1SU5IZENM?=
 =?utf-8?B?REkzcWxwdWg1QjFHMjJoU1lodDVqeXFLY1JhdUVQbHFhbkE1dUhTa1VQZGU2?=
 =?utf-8?B?QXRmR0hIa3ZuOVNJSjdYNStmRnBFN2J2NmhWK2N6UkMxM1JTOHdwSE9xZGd3?=
 =?utf-8?B?Vmlwdy92aVB6UVRrVkVYTkRhT3VIMWEreTNrckJLVVYxbEQ5WExsTnVPMkZk?=
 =?utf-8?B?b0lnS0diU3EzMThvUXZjNlVOckN1SWtTUWdWTGZ2emNwM1V5dXNZMkxSZXZn?=
 =?utf-8?B?SjJmVGNjTzF6c0VHSjlBckEyNXVSNGpORytOK2JwTm15dFBtNVJ2OEdwaWRU?=
 =?utf-8?B?QXg2bEpQZnljd3BndHdpREhZcWw3R3dDZmtPaVhtMkx2anZTYkl1T3ZUTFdo?=
 =?utf-8?B?TmVWVXd3TktERzVBRnhCVXI1MndzZ3dIMkE0dit2elRWL0wzSGFZU0oyaVlv?=
 =?utf-8?B?RGJTYmVqRHNGcDJ2aUJBVUZiYUJ6WVBCMFUyMXJFTlQ0d0FlVnFycEN2eXRt?=
 =?utf-8?B?MXRoQXg2am9qdjRVRW91K1dUUjdxMTIwWjhFcC9tYjUxbGYvUmMzbFI1eldX?=
 =?utf-8?B?Z2VHTEplR2ZZREg0RUVzSWtKZ210MzljOEZieTdTa3NmZEVscVZnNnB2UURn?=
 =?utf-8?B?QmdUUk53SGpkRU5BQXArMHp4anJURy9WOVc0MUJ1SkY1cWVxQS9mNWxtQTNv?=
 =?utf-8?B?YVRGLzMrQmk3dE83QVRaL2xDT3RLUEtrMnE2bWVyMDR4aEg4dE90bXMyWCsz?=
 =?utf-8?B?VkFMMzdzcmdwY2NleklWZ0l0ejV1VklYa041M0pNY29lN3c4TVZtOWJ0dEQx?=
 =?utf-8?B?czBpZ2ZGcmlnT3JiazhoZVhiNWpNRlRsd0M0VU8zZ1g3YW0vMll0Nk42Qm51?=
 =?utf-8?B?aWxXeVVyM1VxUENWb3J2YUg4R3JyQnI1MnA1aHhHTkFKcGZ0VWVuUXBNMzNE?=
 =?utf-8?B?WTBQeWxSYjV5VllNUkkwcjNCV0NSYWpCV24zOHZBVTNzNWpsVVk5cGF3d2h0?=
 =?utf-8?B?NllwdlpXSnJNRVBwK2ZYeXVlYkNDSUtUdGV2Z2J1YUNBN0M1d1lKTmIzaHNU?=
 =?utf-8?B?QzdJWjlwUmhYN3U0cmNQSXo0YmExZGkzV291WW1NV1VDQm12MUxGNHBUZjEz?=
 =?utf-8?B?S2t2Mzg3T0IxLzJLSDc3QlZsc3VRUisrSXZ0K3h1dGN5clRHT3VZWkVDMVVK?=
 =?utf-8?B?b1JCRUVqRUZLMGQxN3hzOC9WTkY2ZEE0SlM2ck5qR0YrZFg5MGl3ajczOHZL?=
 =?utf-8?B?eE02SGhWODVYTGRtY09aRUM2Y2JtOElSSWZNMGRqZ2JxUnlxYTdYb1lBaGlJ?=
 =?utf-8?B?bDdkVHJSVExSUEY1clJJOHJ6b2tXcHNnVzQyTFhFWjQrdjlnRXlxVGk3RHkx?=
 =?utf-8?B?Y0xpa1ZmSW1rbi81c1VxVVZqSzJwdDMvNWFCU0dBWGJSRXNFR0RXSkJUaFpm?=
 =?utf-8?B?dGsxWFFEMDlwUlRwbG13ODBMSjNDSlpqanZmL2JpejgvLzc5bGo2ejJtemxS?=
 =?utf-8?Q?LGfiNKPoQ9b3jLjg=3D?=
X-Exchange-RoutingPolicyChecked: Wg/YUmw2eeGw9pTpa3DTHOberRBNSypOxR3Gl+kxthWaArK2F+guqC/g3lsDFmIOihe05yrYpSR4G16nc2Qv6i56aZ8HTls5EANowPnjQ5WqvcceGBVFWa2H5fTfZ98byQzACwIgLQZwaG22JHmWnuHI2Ik68gWv2k5zzAAXOfzoTqDog/AIcPnoE7wftNlpF6cOkOEz8N76Dtv8WyIauUCAggA/MIp8s+HG08CLWcSsrrk/U8aQYX5a97T3kabTNXCgIgVclxglHNg2FOHM/TP/H6rodS3WlK37LcfukxneXt+KfhMJ4w2wmHF7V+VhU6cl7DM5Q26FsdJ1bIBvaw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8baae83-b294-4406-4073-08df22bdec49
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 08:52:01.9303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+o7TwyM+kLYKc8acQU30a8KurDbjP5s1tji1HkKlpKhel+aCg6mcc0ODRoSfLy6juFt56aExHHoGUWrQ1DRmzscSRwrkZTGDlD2lNB+XvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7851
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

Switch GuC submission to explicitly allocate IDs from the usable
ID pool.
Also lets configure the GuC ID manager according to the device operating
mode during submission initialization. Use dedicated initialization
paths for native, PF and VF modes to expose the appropriate usable and
shareable GuC ID ranges.

v2: Use xe_root_mmio_gt() to get the primary GT so no NULL check is
    needed (Sashiko).

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 33 +++++++++++++
 drivers/gpu/drm/xe/xe_guc.c                   |  4 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 49 ++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            | 13 ++++-
 drivers/gpu/drm/xe/xe_guc_submit.c            | 27 +++++-----
 drivers/gpu/drm/xe/xe_guc_submit.h            |  2 +-
 6 files changed, 105 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index 5fe71eac2e380..2e62809b4d4c5 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -65,6 +65,23 @@ static void init_fini(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
 }
 
+static void check_init_small(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int count = 8;
+
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_small(idm, count), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), count);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), count);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, count), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, count), 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable(idm, 1, 0), -ENODATA);
+}
+
 static bool require_iov_config_or_skip(struct kunit *test)
 {
 	if (!IS_ENABLED(CONFIG_PCI_IOV)) {
@@ -75,6 +92,20 @@ static bool require_iov_config_or_skip(struct kunit *test)
 	return true;
 }
 
+static void check_init_shared(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_TRUE(test, IS_SRIOV_PF(idm_to_xe(idm)));
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+}
+
 static unsigned int test_idm_used_total(struct xe_guc_id_mgr *idm)
 {
 	lockdep_assert_held(idm_mutex(idm));
@@ -671,6 +702,8 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
 	KUNIT_CASE(bad_init),
 	KUNIT_CASE(no_init),
 	KUNIT_CASE(init_fini),
+	KUNIT_CASE(check_init_small),
+	KUNIT_CASE(check_init_shared),
 	KUNIT_CASE(check_used),
 	KUNIT_CASE(check_quota),
 	KUNIT_CASE_SLOW(check_all),
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 3ab4cb9e4964c..6c35474ab843a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -853,7 +853,7 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
 {
 	int err;
 
-	err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
+	err = xe_guc_submit_init(guc);
 	if (err)
 		return err;
 
@@ -897,7 +897,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
-	ret = xe_guc_submit_init(guc, ~0);
+	ret = xe_guc_submit_init(guc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index 8f90a5337fe4c..dc918221b78de 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -120,23 +120,56 @@ static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int
 }
 
 /**
- * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
+ * xe_guc_id_mgr_init() - Initialize GuC context ID manager in native mode.
  * @idm: the &xe_guc_id_mgr to initialize
- * @limit: number of IDs to manage
  *
- * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
- * context IDs supported by the GuC firmware are available for use.
+ * Can only be called when the device is not in SR-IOV mode.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm)
 {
-	if (limit == ~0)
-		limit = GUC_ID_MAX;
+	xe_gt_assert(idm_to_gt(idm), !IS_SRIOV(idm_to_xe(idm)));
 
-	return idm_init(idm, limit, 0);
+	return idm_init(idm, GUC_ID_MAX, 0);
 }
 
+/**
+ * xe_guc_id_mgr_init_small() - Initialize GuC ID manager for small count.
+ * @idm: the &xe_guc_id_mgr to initialize
+ * @count: the number of usable GuC context IDs
+ *
+ * This function initializes the GuC ID manager to manage a small number of
+ * GuC context IDs (0..count-1) for use by the GuC submission code.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_init_small(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	return idm_init(idm, count, 0);
+}
+
+#ifdef CONFIG_PCI_IOV
+/**
+ * xe_guc_id_mgr_init_shared() - Initialize GuC ID manager for PF.
+ * @idm: the &xe_guc_id_mgr to initialize
+ *
+ * This function initializes the GuC ID manager to manage the full range of
+ * GuC context IDs (0..GUC_ID_MAX - 1) for use by the GuC submission code.
+ * All GuC context IDs will be shareable with VFs.
+ *
+ * Can only be called when the device is in SR-IOV PF mode.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm)
+{
+	xe_gt_assert(idm_to_gt(idm), IS_SRIOV_PF(idm_to_xe(idm)));
+
+	return idm_init(idm, GUC_ID_MAX, GUC_ID_MAX);
+}
+#endif /* CONFIG_PCI_IOV */
+
 /**
  * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
  * @idm: the &xe_guc_id_mgr to query
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index 209f99831f1b4..ed9970829a939 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -6,10 +6,21 @@
 #ifndef _XE_GUC_ID_MGR_H_
 #define _XE_GUC_ID_MGR_H_
 
+#include <linux/errno.h>
+
 struct drm_printer;
 struct xe_guc_id_mgr;
 
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit);
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm);
+int xe_guc_id_mgr_init_small(struct xe_guc_id_mgr *idm, unsigned int count);
+#ifdef CONFIG_PCI_IOV
+int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm);
+#else
+static inline int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm)
+{
+	return -ENODEV;
+}
+#endif
 
 unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm);
 unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7ce73489c35fc..cef59d5d82aa5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -286,20 +286,26 @@ static void primelockdep(struct xe_guc *guc)
 	fs_reclaim_release(GFP_KERNEL);
 }
 
+static int guc_id_mgr_init(struct xe_guc *guc)
+{
+	if (IS_SRIOV_PF(guc_to_xe(guc)))
+		return xe_guc_id_mgr_init_shared(&guc->submission_state.idm);
+	else if (IS_SRIOV_VF(guc_to_xe(guc)))
+		return xe_guc_id_mgr_init_small(&guc->submission_state.idm,
+						xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
+	else
+		return xe_guc_id_mgr_init(&guc->submission_state.idm);
+}
+
 /**
  * xe_guc_submit_init() - Initialize GuC submission.
  * @guc: the &xe_guc to initialize
- * @num_ids: number of GuC context IDs to use
- *
- * The bare-metal or PF driver can pass ~0 as &num_ids to indicate that all
- * GuC context IDs supported by the GuC firmware should be used for submission.
  *
- * Only VF drivers will have to provide explicit number of GuC context IDs
- * that they can use for submission.
+ * This function initializes the GuC submission state.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
+int xe_guc_submit_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -309,7 +315,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 	if (err)
 		return err;
 
-	err = xe_guc_id_mgr_init(&guc->submission_state.idm, num_ids);
+	err = guc_id_mgr_init(guc);
 	if (err)
 		return err;
 
@@ -415,8 +421,7 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 	int ret, i;
 
 	mutex_lock(&guc->submission_state.lock);
-	ret = xe_guc_id_mgr_reserve_locked(&guc->submission_state.idm,
-					   q->width);
+	ret = xe_guc_id_mgr_reserve_usable_locked(&guc->submission_state.idm, q->width);
 	mutex_unlock(&guc->submission_state.lock);
 	if (ret < 0)
 		return ret;
@@ -3298,7 +3303,7 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_exec_queue *q;
 
-	if (unlikely(guc_id >= GUC_ID_MAX)) {
+	if (unlikely(guc_id >= xe_guc_id_mgr_max_usable(&guc->submission_state.idm))) {
 		xe_gt_err(gt, "Invalid guc_id %u\n", guc_id);
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 29abf07d8f041..7a81d0aa19bb2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -13,7 +13,7 @@ struct xe_exec_queue;
 struct xe_guc;
 struct xe_hw_engine;
 
-int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
+int xe_guc_submit_init(struct xe_guc *guc);
 int xe_guc_submit_enable(struct xe_guc *guc);
 void xe_guc_submit_disable(struct xe_guc *guc);
 
-- 
2.34.1

