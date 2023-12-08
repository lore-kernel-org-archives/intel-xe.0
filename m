Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4046C10F05
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 19:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A51710EB05;
	Fri,  8 Dec 2023 19:44:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9E010EB05
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 19:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702064668; x=1733600668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DFxXyRDkjCqwAoBBQZkZ7VbKzntEPYY4XRQiBM3L9WQ=;
 b=P8PLZJLZ+c1uITUyKPfgtXTtccYeOY027ELcVQXJcnW4aQw125kjRNpU
 FXIGK4S8/qI9Qv0Y0pF6hsqoVj6kCPyDxusKAmXiBMBbbvZq3RFURUno6
 goHmhSgY7XdEmseOFF7eLztT6Htw5DyVWRK8a+yocJpPJYwAVupuhvteP
 bXVfJtTDkj96+q1M2h+wvTJg4EyUAsGhgliBNz/Ndn8t4PY1ZqdLh0Z5e
 mScUuAt/GMhq25GknPoTXm1uHIzt5++oXX0TGtK41BUDMVbfgI/tVQLrY
 wvrlyFTRo1v3683M/J7jZr/1LbsxqHyuPrONIxhHKd/d3T15LSN26z8L/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="480648460"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="480648460"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 11:44:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="721967929"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="721967929"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 11:44:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 11:44:27 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 11:44:27 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 11:44:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqrtBg1O+5etI9vMrgtfxD4yd5v/1wyzskKFYjsJZsGN3dw4pTWaDEYQWLvegPz1WFutALIpuORZIsOJP9KT/HJc9Jjgwq6K2QNr2xdI5BMnlEbttZv+mJbqVtfkLOXawI64BwIgGu/6ohSdVszmE9QxIPMt4iQZBFFz20PTTH0wPIPf4fpfyxN5RGdb4aDCfC7GJyoc8Plc9Sku005k+EOy4pqKXZP8Fi0Ac7lWVSJJA/wrN5RntBdJm7mA8VwAvts0rTJLmmfSZPeZFSYkxT89P50kOdgRpQL+2tFAheEdMOFaAlmrsV2wmDiTBXA6S8H84sc4NKIDyCxfkjWr+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjJ0EJZBtWsF53O+FAbyykN4eV4RGeo3RSNPTLSu28g=;
 b=KBz3IRCUGXMBc4YQ8FsmKBYEHXxytfavm2C9It6zad9cWJj44bIR/ui5kEhSPvZ9rl7E+Z4MkJzkVs81fxXxHHUNREfJAzB26RnRu7ZugvpoNePUxwJQ/r3j+KoPaKt4WXKly8TxtdsYxM5kWJLfleMogoMN3ol1qM+Q6oNZfHTIGlmIPAhYdgkduOZUXqNWbPlA2Kfacf5Ru2Ybx3bMWDRzVjMKsxQk1GaQL6ZDt9AN0Y25tdMaXlAXrdVOFowD9/Zr19CddyQ6Y1L9qr4WX3FALZVdDYsZCAIsRNiEDk6vsmxnseblCfuEkNEgUZVM2G7Ik3zm98Qs7xq6FOBdRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6927.namprd11.prod.outlook.com (2603:10b6:510:225::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Fri, 8 Dec
 2023 19:44:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 19:44:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <ogabbay@kernel.org>,
 <daniel.vetter@ffwll.ch>, <joonas.lahtinen@linux.intel.com>
Subject: [PATCH] drm/xe: Add PVC's PCI device IDs
Date: Fri, 8 Dec 2023 14:44:09 -0500
Message-ID: <20231208194409.914314-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208171316.901795-4-rodrigo.vivi@intel.com>
References: <20231208171316.901795-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e14bf58-78b3-4413-c22f-08dbf82611e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LO/6SGCBtvum+xhEAfUjYk0vrdWqcq3KAIQnVSzp3WuE23dR2wlCX2TZztjDMwe0aXQn2tT8SqUvpebb49Ul298HNX2WcME36eti8w+wJJHVoVTyVPdv+nXqZdhAWbscSTsLrJycMewADlTqwWKF86IiycYRGGK5PUpsgLDhWe3T2Vp/mZ0AHVlUKaBNK2P/ujeqFrhvsZ3uHir9r9IbetHRHFq2D1Wqap8Xn3ofPxRlGiM0L5JQpuvYIBpG9KZBUAe4/fcA4ZT7lZ+yxVJY3Em7wDjA9fLDIPSs3qfzynoHPQgeC5jQReqAtipKoNtsny+9aj+7HdoBIiAtCgaNqO8gkM8i4tMNguW9dyec73vHiGa8k4yyGihnhoWhRJICOg0B+R/bmwoh/D9b+tMd7RGgBuSwtKv9zLVfCNHSDiIilZV5n0Cv9+c7qSPWi9d8orWf7XoDYHIkrplgQN7NlzKyK5ctSLJVvpNKvzjld0W0tmpQ3H4BIw4FB+E0T5NrgRYlGGrxVTXnr/BQzBzxUK2YfVx69BOoAtI0PrU90TtFGwDFhcbV1VdwOdraUkeH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6512007)(1076003)(26005)(6666004)(6506007)(66574015)(2616005)(86362001)(36756003)(82960400001)(5660300002)(38100700002)(8676002)(8936002)(41300700001)(44832011)(4326008)(83380400001)(2906002)(316002)(66556008)(66946007)(66476007)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0ZORlZtRitJN1NDb0cxT3dSemdOclk5UWtuWGtuWjlSTkNWREhYVGNacGIw?=
 =?utf-8?B?ekM1SGZQdVoydER6UXBUYTBiejRZempkUkFsNFFKWmhtWTUxbzlIaFFxZXA4?=
 =?utf-8?B?WDM2V29TSWxCTVN1cHlXS1RiY3ZaaW4rU0txSDlOTFBianJiMytlV3Jra0pm?=
 =?utf-8?B?SzFKQlF4WFQ1SVBKVUJGZ0hxSWVPNHdWcGZvS0RNQ1lGMElldFhtOEU1ZFpN?=
 =?utf-8?B?TFo5RVRLMkVucGxBK1hMVEZBMGdNRmt0RTlDNC80blNlU3c4ajY3bWlUVWxU?=
 =?utf-8?B?WTREaHpSMTRNbGZULzRTU3BtK1daNjREYVA5S21Kcm9mNTJiSGlOVmNJSDFt?=
 =?utf-8?B?WStiQ1pFVW1aZlpyd2gwWnQxbVZsei8rbWpReVpJVHkrckp3cWQ0UGhTVnRK?=
 =?utf-8?B?VVNzTlRoL1Q1d1J4R3RWL0JSTjE5ZWsyc3pLRG43a3g5UUkzWURwR09tT2dW?=
 =?utf-8?B?MVZXeGdac3Q1cHVaNUFobHR2MFl6UkZnVTAxalN2TXZRaUFEd0t0UC9zUG0y?=
 =?utf-8?B?VHBzK2dwblBYY0FXMG1yUlYyYXpPM0xFMG1TSWZLRHAvaDJ1NzhkcU04ZGdm?=
 =?utf-8?B?aEgvTUVnTmM0dGtOKzByN2J3NGVUUlRjd1BjK2tHYXFyaExXOEhKL0s5RXlK?=
 =?utf-8?B?NjFVMWhxeW9PUklLcWNiUFo2Ly9naHp1Y3laV0MzUzZHdDZzQTl1VjR1VmF3?=
 =?utf-8?B?S2xuT3Y5N21MbWwzakt5V1lwYzdVTndhUzZKaVFxU0VGa2dUdWUyUWJWbTJL?=
 =?utf-8?B?TmhyZm43b0VDV2xHZGdGSXd1dTVEY3k0Ym9qMXBraGlTZzZZL2ZuRXNGMUth?=
 =?utf-8?B?UFNqeUZGc2xCN2FEWk1OMXZkN21mWUt6Y0M5cXBNb0pzejE2MS90MkJjNWN1?=
 =?utf-8?B?cURRQ2RnK3d1Y2xhTDYwM1NuQnN4RnJ1cVhHWkhaYTN0QjBYNlpZNXVFVVEz?=
 =?utf-8?B?UWl1alFjbWFjMzhNbVg5WWlrSUtSUmdrOTFyamJUSW91b2ZWd0xxTUl4VXhP?=
 =?utf-8?B?cnVFSml1ME1DQ3h1amF5QVN6ZFdiTG4wTnY2Q0FyV0FNV1VaQlYySE5zRkEw?=
 =?utf-8?B?NE9EQkF5Vkd6V3Bycm5uTnkrYnVjT1JpRDgwem5HYXpaTlg4TUVySWRxSHRU?=
 =?utf-8?B?SHhuMXdyTldHOHpiOFhaWnd2VFFzUHY0dEkwb3ZJN1E0eE1GeGhLbTVBMm9n?=
 =?utf-8?B?RTJuRTF6VXdjLzdZUzVEQ3VUbS9qRzhVbTJmcTVNTmFTRE1LbTJ6MWZQbHp4?=
 =?utf-8?B?dFFhaFk1V3hsVFZJWGpPWitPS1laOUltdmZNcXFlb2lybHdRQ2hpVDhOczA4?=
 =?utf-8?B?Q21pSWw3RTdUdklpd29yYXFHb2ZSY2VyV0ZXVmJEeWNlaDdUVmt3b1BlUnc0?=
 =?utf-8?B?MFJXMHNMcWFGZm9rT09yODM2VGwrZVA1UnhudnBPM2FENzQ3bVlCMTlnenJl?=
 =?utf-8?B?R0Jic2pBQXpGUmJnVTlGbis3Q1BoV0p1QjZyczY4M2JZR3VuNmt4SHBmdGln?=
 =?utf-8?B?Uzhsb3UxV0N1SDZnRFZwQU5XdXBHemVZT00zbHhiZW1RaEJXL0xNaUZqNDNz?=
 =?utf-8?B?Z0NBVlJzbEQ3cFBIdStFbGJpb2E0MHM0bWduZ2Z6bnNBb3VhS00zL2Rpd2xC?=
 =?utf-8?B?dm1sNEpZK3lQMGlUenZ2OHJtQWlndERSV091MEl6Ty9pclo2NDN1RmhTd2JD?=
 =?utf-8?B?aGovcU80VjhveWdvRDB0U20zazJzTGJveGZaWkl6dmptVzdWQzFJZWExSmNC?=
 =?utf-8?B?OGdQcVhvVnliSURYb3RSMjBsZy82ZjQ0VHFwRnpTMWpjdW5VSTB3QkV2dEZE?=
 =?utf-8?B?YnRHcnVnK3FQNlVON0psSEFPZ3hROVluUG1DSlQxNC9sM0IyYU9nR1dha1J0?=
 =?utf-8?B?NmNUekpQZURaWkhWY2l5aklwL2RtT2xIcHdRZ0hQYnB2VXgycUFraVRsSlor?=
 =?utf-8?B?bXZiaXNnZ2lEUUUvS0pINTBhY2lXYU1PWXhOVjlieWsvajVUZUFvYmNaWXpP?=
 =?utf-8?B?YXIvOTZla04yWnYySU55dkE1NW9jSWg0d3l3cGJTcUpGQ3FsQTlUSzFrZjZ3?=
 =?utf-8?B?MHE2YW13amJUaE13UzM4d05QSmdWR1FZK0cxeHNXeTBxWmRlWXJxYUJyMGc2?=
 =?utf-8?Q?srYETZeWv797Ix7h7YufjYmrg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e14bf58-78b3-4413-c22f-08dbf82611e4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 19:44:19.8950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lc3XV1LBzHeQk/EHIhuFlpeZUng6zFRrUNsaSZscejOqo3kSXpCLIGgAXfCL1r5Dr4wgoXrO5IsjCz7h9S4Bpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6927
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This patch introduces Ponte Vecchio support in Xe driver.

Please note that besides this patch, likely the force_probe
still needs to be used in order to actually enable the
support for PVC.

This patch was separated from the rest so we can ensure
compliance with DRM uAPI rules on compute platforms, where
there must be an open-source compiler to be shared among
different vendors.

v2: Add more info about the missing compliance (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm/xe_pciids.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index de1a344737bc..3011d99a05c5 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -182,6 +182,21 @@
 	MACRO__(0x7D67, ## __VA_ARGS__),	\
 	MACRO__(0x7DD5, ## __VA_ARGS__)
 
+/* PVC */
+#define XE_PVC_IDS(MACRO__, ...)		\
+	MACRO__(0x0B69, ## __VA_ARGS__),	\
+	MACRO__(0x0B6E, ## __VA_ARGS__),	\
+	MACRO__(0x0BD5, ## __VA_ARGS__),	\
+	MACRO__(0x0BD6, ## __VA_ARGS__),	\
+	MACRO__(0x0BD7, ## __VA_ARGS__),	\
+	MACRO__(0x0BD8, ## __VA_ARGS__),	\
+	MACRO__(0x0BD9, ## __VA_ARGS__),	\
+	MACRO__(0x0BDA, ## __VA_ARGS__),	\
+	MACRO__(0x0BDB, ## __VA_ARGS__),	\
+	MACRO__(0x0BE0, ## __VA_ARGS__),	\
+	MACRO__(0x0BE1, ## __VA_ARGS__),	\
+	MACRO__(0x0BE5, ## __VA_ARGS__)
+
 #define XE_LNL_IDS(MACRO__, ...) \
 	MACRO__(0x6420, ## __VA_ARGS__), \
 	MACRO__(0x64A0, ## __VA_ARGS__), \
-- 
2.43.0

