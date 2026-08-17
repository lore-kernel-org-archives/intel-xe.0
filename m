Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A695DC5DF66
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 14:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4073D10E7E8;
	Mon, 17 Aug 2026 14:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQO8jHBe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5CA10E7E4
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 14:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786975447; x=1818511447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yj6dklEeSB1BK9Jv+iCxmnjjN+Vixxs9+ITSt2XsWB0=;
 b=SQO8jHBeqQ1jHYmr4dZrW2PGea8QVjMwHJNbMywI/6EUj368QamDmxul
 SNYCYWxusXG6esdLRfg3pqz9H3FHJsS5L3YPxpTgQo7psOpS4/dxSISss
 BTcRoPcqvYDtq7z7xq/DR2Xtz9Ngi+jATQqtZk61kopvAU7qIG0qZeNp1
 8HAxo22Uj+YF/sww5PzfP7XXM9p2xxtSrM98Nykq8rJ41yD6TpJ2s+TUe
 jkttOtzPeO3/TgAv37jR3h1rcDJHQtJWnFLDKOBVFUNeoUPi86zAvU0Z6
 C6d/CtIQYw911qnW2eAtLNLV+apmfhR7FzW5Yx0rJ8/7HsIRI91yeTCPA w==;
X-CSE-ConnectionGUID: 61V4AqH0RTmE48CbGBUfqA==
X-CSE-MsgGUID: lH7HepiTThqwaBY5v0ZhoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87517031"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="87517031"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 07:04:01 -0700
X-CSE-ConnectionGUID: jYGimPkGTxKnSpjf8WeSNw==
X-CSE-MsgGUID: e4zIGJdpTqiK0d1Ao7mtmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="269198637"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 07:04:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 07:03:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 07:03:59 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 07:03:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pov7pR6WlEl8dFhkUXEX8LPqrJVgAo0ON6Io2xyYPVMgBpVJT5bocLn5/84NqrDKJywLS14VKfuFaSaWa6HJL8oEM5jmq9im4FrbOycM/D5OOoJKcq5Xsv631bBIW7WMsZOQ3dXmQYXWRW5DKA83sjMLJrpOp6wokbnO/8/z14OGleCFLApro/4SIKuMWFALLtwOe8MuLpsRzZD5TRvHOQ91M2DoNMrqP3LgdjTvh6P4yTZOkp+JiY/+MyBKzoq5ZaP76/JIkCkguoyNa+KlsDgYBa6yiM4wOM+AWvppu/O0xs7hPtffIJcIW/MWwH8gAAb2eBzKtlvYpaTn2s/3BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/PHMLaq6IxuGfcBuiuEKwidkWT4uAG0FiNYyhnaCwc=;
 b=tp6YZe7f8FgWhL3zh4akHXebwwN41wngoqFpHbAFuQb5Y7j67yCci2c3WaBnpjOXJ6PVoor8ajqlBnfq4AN6HsXId/BcoBE+Q3Sp4wiN6ZfztitLPmlHVEHQLMdoR7cSiULoqVu9wjxm9gLJAKN+x+5yu3lGqe2yUHu7VXgRSyk675H0nLtvV4PrUo/NFPjM39SW1nLTh3LCclWNxt/x14MOZkU9SRodAm57o4as7I/xugR3JUsnXUMNmIwd3gJar6twAJSleLdCWHMPqp9Fm71RHe6kbBHIeIAgbkd0eMcFp5ZbVxX++XTRMIW97wNMRqG1imAqPEbmr0jtKd63gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DM4PR11MB6551.namprd11.prod.outlook.com (2603:10b6:8:b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 14:03:55 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 14:03:55 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v3 1/3] drm/xe/ggtt: Split GGTT into usable and shareable pools
Date: Mon, 17 Aug 2026 16:03:40 +0200
Message-ID: <20260817140342.415803-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260817140342.415803-1-piotr.piorkowski@intel.com>
References: <20260817140342.415803-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::9) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DM4PR11MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b7a8a5-2d42-496e-ccc6-08defc686033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: RYbBMtrJLa7ePnzUtGvWGOx6kpmKki+ddUxE6F36gXZVXHfTsF5ITiE3sMl2a5FDubEXbzWhGBV7rYYpIuyB48S4i80qvUhqo4goklhkjMHKEeuaC8kYIuRN+8qYz3k/Zy0lMFFTpjbaoJB3zEdO4PULMA4S1OmJ/j20uoSb3ra9kAOT31RNrIDRvj1iCNjJq/WwTblMIo+WHxWlP6aDq19r3AfqzDUnHpuEPtNYuLYzCpFcypf2qrCsqp8Nmj7ZRzbPKZckefB9Qd+xpdsKGIMn2N0r9zKmCCZdONzFZawRZ8JYJJaR+9VcpgsDBq9XKSQBxzxEK0WOLhDoNuqk9+6nhAeAXYhJt+k3g+k3ZF3s6DoOSUMI7xiZXznRLpxQHBf4qFamBTGMsPUgxcaTz8oVyrpClo4DeX2Y/OJqf41RNhTaKQJMsRm9TMEjOFVb46Mq/Xy75nS6coiiIaENZCjGUNHWRX0JxyKdnwuKJISyeOUGXEXfwbzReeIIn9tZLUpWhFoHuFAwGVrij6CanRuKY/x1Y9dfooSaak4P5g2W//b7u97Ozx6qzgF50PffzRldWE/efdRm6TCHMxPYtg5rBmepgCMY/VHutk5VNCCORQpxqk9MANwMdEbqB9sgIm3hUT2yz+FDm34sBjf5cYx7Y4te8CIAJ2t2Xb1tqzk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFA1Vll5UEx0SnllTTJFejZ1UW5KOFJwb0VpMDAxbm5WbHJIajhGZ1o1L3hn?=
 =?utf-8?B?M2hDVSt0TmNLRGhobHcrVEZLVlp0V2ZkR2RvYVd5ekc4THZ5bXdnL3dIVDdw?=
 =?utf-8?B?QkNuZkxXSmc4dUUvM3NTTXZwbUhMQzZyTGhCYmhUcmlWZVRzTHJYdXRkV2t3?=
 =?utf-8?B?L2syS3lTdmcrOGdsMHl2SXRYQ280MHRzcStqTW1YRWRpM0oxcGY1TTJQOHpW?=
 =?utf-8?B?bWorYUhlZnppNTI5UXZOSWZoZU9FaG15eGtYVGc0Y3ZSd3A4aml3dHhxMWF5?=
 =?utf-8?B?elRnTG55OUVwalUzeHRSMlg4U1lmVTlFTE5WckhkdFNReERvbzREajVlb05V?=
 =?utf-8?B?QUx6aUliS09sNmVoZFRBRlFWeFhWUzZZQS96dE80Q3pvTWw2dktTMjZzU1ZL?=
 =?utf-8?B?NTlFMjZIOFd0ZUp3SXpsVDlTVlJoWGg0UklGYnVUVWtVaGRNUnFFb25XWWZE?=
 =?utf-8?B?Tk9MTzdTS1BDQWtaa3M3cE1tRkE5bURZWlJ3c2JEOXFBNm9ZN2kvK3FNcHd2?=
 =?utf-8?B?aGR3aWMzVFZENmpxOGlzVXpUUHdNQi9FaC9CdUx0dTZIK25YcEtFbDJwMThP?=
 =?utf-8?B?T0g0R090aEExcDFZb0xmWUQzeXBaM2orQnBZeHd6bVkvMlVyVTkzRERBQlA1?=
 =?utf-8?B?b0M3dFdIL1J2WTBaNWNqanBQcFN4RnBpRE9xcG9MR1htT3MxZzhKRit2RmtV?=
 =?utf-8?B?Zy9jQk9veGQxeTdhMG15cjBYRURrTjlCQ0wwTm1ZNk5SWkZULzVwQndzZHZD?=
 =?utf-8?B?d3RSSnBhdjk1REE5S1VFc0lmZGxVKzFrTUUzNGFtQ1dqZzNVejB0eGdRbXUx?=
 =?utf-8?B?MEIrOTBpdWlKQUUvYWNSRDF6QjRzdVBHVUlJeU10VlFlU1BadVc0YmluZEZj?=
 =?utf-8?B?czNXc05QUDYyZDVjblBNM1pCZmpZQXJ4dUdpOGVaYTM1Yk9OYTNkcnZYNity?=
 =?utf-8?B?djhydFJuUzhRZk8zNi96WmFGWkUvbGJEckV4VkF0dzcvTHJlbVlVWkxTTENQ?=
 =?utf-8?B?VE03RWVTbEZ3N1VvcEQyTGtIRE8xTGxNV0JoMzVIQTFZNWIzNVBBYURFblZL?=
 =?utf-8?B?ZnJxQlV3VVRnSGdSUThkcjN1c3lwdnoxRzlsTVptYWRweUp2QklsU0w0TGlh?=
 =?utf-8?B?SlFkOWkwSEF0QnpGWmlvZ1F2SjB1V3B4NkNuTWpqS2FNYlFYU0NHVEY4THdn?=
 =?utf-8?B?TU1IaWdxWmFDeitlT2pwY3gyYlhlTmE2ejBtYkFOamxKSVlONHFKdkRkUld6?=
 =?utf-8?B?WGsydDVZU1M3MnNCbXhzQStwZWZKOVBWUjhUY0E2TWdwSFFZclo4YUlzVm5o?=
 =?utf-8?B?QmJTUkpGVHNmMzJ1SlNuekw0dWxneWp6eHNqWFRzUVNxZnY0S0FRSGtCQjVo?=
 =?utf-8?B?SDNKOTMyc0NKMUg3OUlGVnBuc3pOazhmWTY3TEwySTV3SkpKNk9pTTJtTVIz?=
 =?utf-8?B?Y05oNDBKMno0M0xJT05nTUV1dXg1QWlQWWZOdWhtV0FMNE83MTdyM04wUml2?=
 =?utf-8?B?N3ZtQzNVK1g2bll1NTFnTEJhamZSV0dnMERydGllN0JRWS9XakcweXFLZllr?=
 =?utf-8?B?TVdkdTZ6TFBGQVl4UGRSQncweDNLT1N5SzloeEljTDg4dVVHWnZsbWJSYjZh?=
 =?utf-8?B?L29GakhhSW1TWGFRV2V0ZkluV0hGL2ZPaXlBaHNPV0xuZkEwZTNIUEcvTDlL?=
 =?utf-8?B?dUVYdlZxNTU2WEtrMkF1eTZhbnE0MmY5N09wWFpHQXFVd3RmUXUwL0xXS0FH?=
 =?utf-8?B?cG1LY0FEazI0K1FvcU5QblpKSHdRZkRuT052aHV2M2FoUlhYd054UnhHQnFE?=
 =?utf-8?B?eGlUdHBJUFY0emlYTExHWnFhNGpLWVgzMDdVbFhVd2QraUdwYVMyaVF1bWR5?=
 =?utf-8?B?cDdSRUZFTEFka0dydTBNZXBRVjJTVHI4cWlyekxRaUwzR085elhBRHZ5Tm9W?=
 =?utf-8?B?TDV3S2dmUXcvajYvalBuRzl6VExQdWNRUEZiK25sTVlRekJWbGxGQlJJeXp3?=
 =?utf-8?B?TzJOcncwNXA0VGJCWE95OUdFLzc2MjNkL0swYkdnYlhmb2NyekVDeDE4OHpK?=
 =?utf-8?B?dUFQTXJhR2RuK05XSmZYVW04aERydVpQaG5VV05OV1k3SWtxZHEyb3JUZ1Vw?=
 =?utf-8?B?RTZBcFc0TDRhVDFzOG8zVkpGMi93Qlo5MWZ6QkMzSXFsU3lFWk45cXhoUVNN?=
 =?utf-8?B?TzZNUTlpdWI3SmRqYlJvbDM5TmtORGxRU0VieWg0ODJiUDI1QUl6SUxoRXky?=
 =?utf-8?B?OEJuYjM3OWJCaHdjZWlnVmpxWVphVlNwLzlPdmpYdUpWUVI2b1F4THJxMnlj?=
 =?utf-8?B?Q1VHMEprZnhNUjhpRit1N3NFWE9VVnFOVk5aZjVZaEp5c1Y4TCtWa3ZXRjJH?=
 =?utf-8?Q?b9kmTNn3F4WtMjp4=3D?=
X-Exchange-RoutingPolicyChecked: TLvAh9YduAZNxEzDvMQa8vK1rZLpiPhw+/Gpgl2a6q1iZ2KPFB8m0rlVGs/KDNpSuuDa7PTfFJnsdl7RTjMMDdt/rHnFyBIK5VQL4Db78h2xkwIzL6IshwwSO3h6aUCmPrvlS7/Qoba+F+CaQkFnym30jMAo34+Zrb3yGfIGFqHNCekrUVGdWTBRxo7RywAoJP771YDQ3Bs2URVTjwdjmM7WJmE02Tphx4OH3JL52yNltl7jgsbaH1yVpZjpgFeY6wGICSZxWLV5FOAMNRULEl9QyQopIyxHm6Yh5sOEu4k4AZlW8d+4TtntS9UF1mYLDKR4gvR8OBRCc+vA8wQl5g==
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b7a8a5-2d42-496e-ccc6-08defc686033
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 14:03:55.5455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNcG+i1xFJlmiJoF8vjcXo899h8x/wBRf7aj6lJWtLGzu47qVhcZ0Nsvc8+xvQaQSpuaGSJu/9yE0QqBqiIaWREFVNUM9o0TZIICLcaI1gc=
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

Driver-owned GGTT allocations and VF provisioning currently use a single
GGTT pool. Split it into a usable pool for driver-owned allocations and a
shareable pool for VF provisioning.

The pools are separate logical ranges and may overlap, but allocations are
limited to the configured size of their corresponding pool. Allocate from
the bottom of the usable pool and from the top of the shareable pool when a
shareable pool is present.

Add separate insertion APIs for the usable and shareable pools, together
with shareable hole-reporting helpers used by SR-IOV PF provisioning.

v2:
 - Rename ggtt->usable_size back to ggtt->size.
 - Remove the ggtt_insert_node_in_range() helper.
v3:
 - Introduce the hw_size struct field instead of the ggtt_accessible_size
   function.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 175 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h               |  14 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  12 +-
 3 files changed, 168 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ec23862477f..c7e1cb1b1ccb 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -113,8 +113,10 @@ struct xe_ggtt {
 	struct xe_tile *tile;
 	/** @start: Start offset of GGTT */
 	u64 start;
-	/** @size: Total usable size of this GGTT */
+	/** @size: Size of the usable allocation range */
 	u64 size;
+	/** @hw_size: Size of the GGTT range assigned to device */
+	u64 hw_size;
 	/**
 	 * @flags: Flags for this GGTT.
 	 * Acceptable flags:
@@ -141,6 +143,15 @@ struct xe_ggtt {
 	unsigned int access_count;
 	/** @wq: Dedicated unordered work queue to process node removals */
 	struct workqueue_struct *wq;
+#ifdef CONFIG_PCI_IOV
+	/** @shareable: Shareable range within GGTT */
+	struct {
+		/** @start: Shareable range start relative to @mm start */
+		u64 start;
+		/** @size: Shareable range size */
+		u64 size;
+	} shareable;
+#endif
 };
 
 static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
@@ -238,7 +249,7 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt)
 static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->hw_size);
 
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -252,7 +263,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->hw_size);
 
 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -354,16 +365,31 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
-static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
+static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 usable_size,
+				 u64 shareable_size)
 {
+	struct xe_gt *gt = ggtt->tile->primary_gt;
+
+	xe_gt_assert(gt, usable_size);
+	xe_gt_assert(gt, usable_size <= ggtt->hw_size);
+	xe_gt_assert(gt, shareable_size <= ggtt->hw_size);
+
 	ggtt->start = start;
-	ggtt->size = size;
-	drm_mm_init(&ggtt->mm, 0, size);
+	ggtt->size = usable_size;
+
+#ifdef CONFIG_PCI_IOV
+	if (shareable_size) {
+		ggtt->shareable.start = ggtt->hw_size - shareable_size;
+		ggtt->shareable.size = shareable_size;
+	}
+#endif
+	drm_mm_init(&ggtt->mm, 0, ggtt->hw_size);
 }
 
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
 {
-	__xe_ggtt_init_early(ggtt, start, size);
+	ggtt->hw_size = size;
+	__xe_ggtt_init_early(ggtt, start, size, 0);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -426,6 +452,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
 		ggtt_size = GUC_GGTT_TOP - ggtt_start;
 
+	ggtt->hw_size = ggtt_size;
+
 	if (GRAPHICS_VERx100(xe) >= 1270)
 		ggtt->pt_ops =
 			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
@@ -438,7 +466,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
+	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size, ggtt_size);
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
@@ -610,16 +638,55 @@ void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
 
 	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
 	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
+#ifdef CONFIG_PCI_IOV
+	xe_tile_assert(ggtt->tile, ggtt->shareable.size == 0);
+#endif
 
 	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
 	WRITE_ONCE(ggtt->start, new_start);
 }
 
-static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node,
-				      u32 size, u32 align, u32 mm_flags)
+static int ggtt_insert_node_in_range_locked(struct xe_ggtt_node *node, u32 size,
+					    u32 align, u64 range_start,
+					    u64 range_size, u32 mm_flags)
 {
-	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
-					  mm_flags);
+	struct xe_ggtt *ggtt = node->ggtt;
+	u64 range_end = range_start + range_size;
+
+	lockdep_assert_held(&ggtt->lock);
+
+	if (!range_size || range_end <= range_start)
+		return -EINVAL;
+
+	if (range_end > ggtt->hw_size)
+		return -ERANGE;
+
+	if (size > range_size)
+		return -ENOSPC;
+
+	return drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align, 0,
+					  range_start, range_end, mm_flags);
+}
+
+/*
+ * When the shareable range is present, allocations start from the bottom
+ * to leave space at the top; otherwise they start from the top.
+ */
+static u32 ggtt_usable_insert_flags(struct xe_ggtt *ggtt)
+{
+#ifdef CONFIG_PCI_IOV
+	if (ggtt->shareable.size > 0)
+		return DRM_MM_INSERT_LOW;
+#endif
+	return DRM_MM_INSERT_HIGH;
+}
+
+static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node, u32 size, u32 align)
+{
+	struct xe_ggtt *ggtt = node->ggtt;
+
+	return ggtt_insert_node_in_range_locked(node, size, align, 0,
+						ggtt->size, ggtt_usable_insert_flags(ggtt));
 }
 
 static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
@@ -641,7 +708,7 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
  * @size: size of the node
  * @align: alignment constrain of the node
  *
- * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
+ * Return: &xe_ggtt_node on success or an error on failure.
  */
 struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
 {
@@ -653,8 +720,46 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 		return node;
 
 	guard(mutex)(&ggtt->lock);
-	ret = xe_ggtt_insert_node_locked(node, size, align,
-					 DRM_MM_INSERT_HIGH);
+
+	ret = xe_ggtt_insert_node_locked(node, size, align);
+	if (ret) {
+		ggtt_node_fini(node);
+		return ERR_PTR(ret);
+	}
+
+	return node;
+}
+
+#ifdef CONFIG_PCI_IOV
+/**
+ * xe_ggtt_insert_node_shareable - Insert a &xe_ggtt_node into shareable range
+ * @ggtt: the &xe_ggtt into which the node should be inserted.
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ *
+ * Inserts a node into the shareable GGTT range.
+ * Allocations always start from the top (DRM_MM_INSERT_HIGH).
+ *
+ * Return: &xe_ggtt_node on success or an error on failure.
+ */
+struct xe_ggtt_node *xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
+{
+	struct xe_ggtt_node *node;
+	int ret;
+
+	if (!ggtt->shareable.size)
+		return ERR_PTR(-ENOSPC);
+
+	node = ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return node;
+
+	guard(mutex)(&ggtt->lock);
+
+	ret = ggtt_insert_node_in_range_locked(node, size, align,
+					       ggtt->shareable.start,
+					       ggtt->shareable.size,
+					       DRM_MM_INSERT_HIGH);
 	if (ret) {
 		ggtt_node_fini(node);
 		return ERR_PTR(ret);
@@ -662,6 +767,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 
 	return node;
 }
+#endif
 
 /**
  * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
@@ -745,6 +851,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
  *
  * This function allows inserting a GGTT node with a custom transformation function.
  * This is useful for display to allow inserting rotated framebuffers to GGTT.
+ * Allocates from the usable range only.
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  */
@@ -765,7 +872,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 		goto err;
 	}
 
-	ret = xe_ggtt_insert_node_locked(node, size, align, 0);
+	ret = xe_ggtt_insert_node_locked(node, size, align);
 	if (ret)
 		goto err_unlock;
 
@@ -832,10 +939,13 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	else
 		end = 0;
 
+	end = min(end, ggtt->size);
+
 	xe_tile_assert(ggtt->tile, end >= start + xe_bo_size(bo));
 
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
-					  xe_bo_size(bo), alignment, 0, start, end, 0);
+					  xe_bo_size(bo), alignment, 0, start, end,
+					  ggtt_usable_insert_flags(ggtt));
 	if (err) {
 		ggtt_node_fini(bo->ggtt_node[tile_id]);
 		bo->ggtt_node[tile_id] = NULL;
@@ -906,24 +1016,30 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
+#ifdef CONFIG_PCI_IOV
 /**
- * xe_ggtt_largest_hole - Largest GGTT hole
+ * xe_ggtt_largest_shareable_hole - Largest hole within the shareable range
  * @ggtt: the &xe_ggtt that will be inspected
  * @alignment: minimum alignment
  * @spare: If not NULL: in: desired memory size to be spared / out: Adjusted possible spare
  *
- * Return: size of the largest continuous GGTT region
+ * Only holes within the shareable range are considered.
+ *
+ * Return: size of the largest continuous shareable GGTT region
  */
-u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
+u64 xe_ggtt_largest_shareable_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
 {
 	const struct drm_mm *mm = &ggtt->mm;
 	const struct drm_mm_node *entry;
 	u64 hole_start, hole_end, hole_size;
+	u64 shareable_start = ggtt->shareable.start;
+	u64 shareable_end = ggtt->shareable.start + ggtt->shareable.size;
 	u64 max_hole = 0;
 
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, ggtt->start);
+		hole_start = max(hole_start, shareable_start);
+		hole_end = min(hole_end, shareable_end);
 		hole_start = ALIGN(hole_start, alignment);
 		hole_end = ALIGN_DOWN(hole_end, alignment);
 		if (hole_start >= hole_end)
@@ -939,7 +1055,6 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
 	return max_hole;
 }
 
-#ifdef CONFIG_PCI_IOV
 static u64 xe_encode_vfid_pte(u16 vfid)
 {
 	return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
@@ -1078,27 +1193,32 @@ int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
 	return err;
 }
 
+#ifdef CONFIG_PCI_IOV
 /**
- * xe_ggtt_print_holes - Print holes
+ * xe_ggtt_print_shareable_holes - Print holes within the shareable range
  * @ggtt: the &xe_ggtt to be inspected
  * @alignment: min alignment
  * @p: the &drm_printer
  *
- * Print GGTT ranges that are available and return total size available.
+ * Print GGTT ranges that are available within the shareable range and return
+ * total size available.
  *
- * Return: Total available size.
+ * Return: Total available shareable size.
  */
-u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
+u64 xe_ggtt_print_shareable_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
 {
 	const struct drm_mm *mm = &ggtt->mm;
 	const struct drm_mm_node *entry;
 	u64 hole_start, hole_end, hole_size;
+	u64 shareable_start = ggtt->shareable.start;
+	u64 shareable_end = ggtt->shareable.start + ggtt->shareable.size;
 	u64 total = 0;
 	char buf[10];
 
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, ggtt->start);
+		hole_start = max(hole_start, shareable_start);
+		hole_end = min(hole_end, shareable_end);
 		hole_start = ALIGN(hole_start, alignment);
 		hole_end = ALIGN_DOWN(hole_end, alignment);
 		if (hole_start >= hole_end)
@@ -1115,6 +1235,7 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
 
 	return total;
 }
+#endif
 
 /**
  * xe_ggtt_encode_pte_flags - Get PTE encoding flags for BO
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index c864cc975a69..c441e39fdd47 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -24,6 +24,16 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt);
 
 struct xe_ggtt_node *
 xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
+#ifdef CONFIG_PCI_IOV
+struct xe_ggtt_node *
+xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align);
+#else
+static inline struct xe_ggtt_node *
+xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
 struct xe_ggtt_node *
 xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 			      struct xe_bo *bo, u64 pte,
@@ -36,12 +46,12 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo, struct drm_exec *e
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end, struct drm_exec *exec);
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
-u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
 
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
-u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
+u64 xe_ggtt_largest_shareable_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
+u64 xe_ggtt_print_shareable_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
 int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid);
 int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index be0a413ee17c..a5f4a3d27c3e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -531,9 +531,13 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	if (!size)
 		return 0;
 
-	node = xe_ggtt_insert_node(ggtt, size, alignment);
-	if (IS_ERR(node))
+	node = xe_ggtt_insert_node_shareable(ggtt, size, alignment);
+	if (IS_ERR(node)) {
+		xe_gt_sriov_dbg_verbose(gt,
+					"VF%u GGTT provisioning failed: no shareable range\n",
+					vfid);
 		return PTR_ERR(node);
+	}
 
 	xe_ggtt_assign(node, vfid);
 	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
@@ -729,7 +733,7 @@ static u64 pf_get_max_ggtt(struct xe_gt *gt)
 	u64 spare = pf_get_spare_ggtt(gt);
 	u64 max_hole;
 
-	max_hole = xe_ggtt_largest_hole(ggtt, alignment, &spare);
+	max_hole = xe_ggtt_largest_shareable_hole(ggtt, alignment, &spare);
 
 	xe_gt_sriov_dbg_verbose(gt, "HOLE max %lluK reserved %lluK\n",
 				max_hole / SZ_1K, spare / SZ_1K);
@@ -3549,7 +3553,7 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 
 	spare = pf_get_spare_ggtt(gt);
-	total = xe_ggtt_print_holes(ggtt, alignment, p);
+	total = xe_ggtt_print_shareable_holes(ggtt, alignment, p);
 
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
-- 
2.34.1

