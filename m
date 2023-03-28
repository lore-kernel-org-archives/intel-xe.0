Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D063C761AF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 16:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA35F10E487;
	Tue, 28 Mar 2023 16:11:14 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FCE10E475
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 16:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680019872; x=1711555872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RAl1Fk1SiJD6lMIAIxZxlAJ3eOHTWHsWaM/SLmN/LDg=;
 b=LBlly7LR84ZCb/3iyXSrn/L2rAPhzIpOzXfAQR/lxZvvidh+nHpvIITt
 pZ7BE44115jO7cgvj7BSoIaDtLbyWSoyPl9Xp0XW6EN9sZgmj9GcRARLj
 ypidC1ACBCWrK0207U21sGcLmTQ1CDe0Bqfxphs20Tc0v/Tsu2ldVoh2r
 brRwxZ7p3Sf4Drp9epPomMRSCU8lPzMFhYCFVk/NF8ySZC9QKHpjNCwje
 bNAK2A8Wy8saxR0X0+pPLmUTRYy3Sm0bz9Td+NnnTg8xAaCZJhBSD2H/o
 GTrnbJL0qSGzYFOaU8Xn7VElZ3ql0qLF6B3uFn7UttwQ7CEEiTQak+bTQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="338115991"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="338115991"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 09:10:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="807896519"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="807896519"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 28 Mar 2023 09:10:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 09:10:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 09:10:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 09:10:50 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 09:10:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrCBen+eJOEFOf5+PK83+Yb/K3QUXwvC5SXo8KTHdFfjg8+TpSpSeZz0Jl8BT0HvNu5N23hCVTZpRrzmoyHlVnMRxqEyzYOxJAbbIYCINbwTcslgbVWybqd31YXqfhTniS6q9v0kRKXk3/VXO41JD63sie5AK6XbXlxpUQaz8NgdGyltfwpbd3rQ6rQgUlOKkudoBOv4H1BgTPUKqiGl7J0slYUgMNUbuigJ68oPClO366CkhrA+1u/uZwV6VF0frjZZW9ZWTENDjDwJJsIb9eoAt6Td2YpSgo4Ed8tRrr3vXVWqKR3oWMAqVGCYltYH/OPmeXFINVV/zfhJS8vthg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dlp0pwGqsAX4MWt1hzmhRUAnrtXrHOSeJebJRZGvFY0=;
 b=IN1FB1QXSf8Jvr5HWWTjMRhRyVyU6BNKVW/upR4wA39VySYsZe6BRf82oJSxS47mkbswlpcOLPBIGwqoXVyj0RBG9u+wtiDv/JLVj5pYpKFcn9ocJOv2v4eT+cbr+LghBqHQKaY3899esgbiR9na25lkxPlAnR78MDRpJ4M06u/QAlJZMJDWx7kXG2ahJxr/03CVoI395U4pk87abRv6I8lK+VAdqLrvDbSgaJCfAtuItonvJ5UGk/1+9tp953YyGMUqVwkZqNd5sxLDrShxSqXhX1rcSzSdbWXt66pS3w5Ha8Q1fH8maN6H4T9oO+ziVvCISzVdn9FCnTJMeiq/RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6870.namprd11.prod.outlook.com (2603:10b6:806:2b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 16:10:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6222.032; Tue, 28 Mar 2023
 16:10:49 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 28 Mar 2023 12:10:21 -0400
Message-ID: <20230328161021.669017-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328161021.669017-1-rodrigo.vivi@intel.com>
References: <20230328161021.669017-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0131.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a820571-efa5-4bb5-64d3-08db2fa6feec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HiBbYsHmsBBcUR03udRM27yBoA9/xQHgYU5vrqJ0IilFfZ7TWo9Tvr5rgchIE6BySBfU522weCtAUjUBewtdO7J9LM9TzozPCLnYLweXnbcEFbaoYAVGxh3nKSknxV2Hl6VFNbJehs4jIQ1ZRdmFHbDQUnluMG2PYjxfHSu6OnwuTPyXhV4lkWiZy99lhD9uz2YDWiDq1He5wo/1KjY2O0T+LUthK9X8xDhSHsDX2dwkjRKc7lIP3XuIW8IG1nZLyKZ2Gws6b7YiA8jT/ZaWTbBi+DTq7zFOS1TBuDDhG0XN7atb/AIxHEArYsa4sDkfoeGMpOIAbDqUfhyHGVFbKGaQVo1cp4EwD5XeR93VGj2LxLTvrwQAJN4WFN+GwPf/37/hieZi4PN7wwSKCcyr7HN9B3Nh21VziovtC31KQxuQFF608tZOhwYCEkt6UIE+nq5y5Z5qDu07GRbdy2JnZPZqAMwGXLqm1gQNz9tIikprEuCECioaHuW+wFliZGuBdvOhP3a96CMedHMlcz/q/xJ5hsOvGw/I27TTLZkyaP7iNtcbWbqMbqvkqTmBdwHM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199021)(4326008)(66476007)(6916009)(8676002)(66946007)(66556008)(41300700001)(82960400001)(36756003)(2906002)(86362001)(5660300002)(8936002)(44832011)(4744005)(38100700002)(478600001)(6486002)(316002)(6506007)(1076003)(6512007)(26005)(186003)(107886003)(6666004)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bDzRoXjD2+s0obVzxGukr4Dh+6OGbnYN3kAqAzIWDpZYCDr6M4g2xpZU6Lqf?=
 =?us-ascii?Q?RNjfQwVapBnekY2LyUDvnN9qhkgurLHjuVGvT1k8svLqWUVBoThUrc3cjtCG?=
 =?us-ascii?Q?FAcSCJFMrjKpsmEK4ayzEg6jcavkDG8kXlqXC1Y/IbBf7LFFrXZ66DlwLzD5?=
 =?us-ascii?Q?UfX1NGWD0TShvUztkaKOUbjXNa6E5f975Cde4MCef3eYklfxRDeupX1+4fxO?=
 =?us-ascii?Q?0NRwmvY9SonUFHCqv8G9keYHIqvoLUj1JdMzfNWvV00n+NWBQp+0bHQccXyy?=
 =?us-ascii?Q?VoQklNLXoU/9/QtXf8Iw5ABGs0rnednVSs/XvxjwF58nS/3H+B9+2fSTXWvI?=
 =?us-ascii?Q?nvYyj2C2KfcqMY4Sfp0f+QSCXSqLEu1QFFO7rY4i0cOWJfl3sXjRfuaCZlBQ?=
 =?us-ascii?Q?HoLTNwxYmrVcXN0z3Ijn4OBWp7qSPqGb9wGZvnoPXwTFFYRnalrVfmqKrf4u?=
 =?us-ascii?Q?o9VeccPG3GaN52gB7b0icnr/H7RAc9SVnQJ70ozBD/Zaq2ivo33oh10bHyOC?=
 =?us-ascii?Q?ZioHmp/cl5eMS7AWLIYrnB5Y6WRXdp12hjIqDGbLUFdg6KkXFi9QVXYv/cqp?=
 =?us-ascii?Q?5dOk4hsVrRnZuqNeSfY0lwO1Z5+SFhYJxuXxf0SoKZMtr/t4eRdhWlpOq8CC?=
 =?us-ascii?Q?LX6i4aVMq4NMOtfzwwasjSyzUBMJcI9T+GblEIB0naNR0ieahq3pO9Zn8tEf?=
 =?us-ascii?Q?F3l8dI/g7mcuKSqcG+yoTriFNooSoqDazy+EpYdR1SAMtpDo26MXXY8XU/Ko?=
 =?us-ascii?Q?F2SNnHQ3Td3GKu3k0DoNq6uHzXfW3RqKxjM4z2d/OGPjPqi0+Q4ErhkcBP10?=
 =?us-ascii?Q?OSeT042URHhN9blWGEpzefK8FTq/OSuMwiPNe/IFs55QOVtBIlqI6SYk8Qb8?=
 =?us-ascii?Q?88vSHqXAgqi+J4fhMrksVkuHFETTDx1OFUOp4sU2p2zluyFeeJPmL+FLdS3L?=
 =?us-ascii?Q?sS9QaLy2Ql2MSQUqSwcWoht22xmZOwT4cdKH0DPl3QKbb2vOiz8692penlIy?=
 =?us-ascii?Q?BCYSmmtiepFbQad2aIy7YYMrXqz5+XmSYbgP3wMjCdRKolDS194gVt0cL9cX?=
 =?us-ascii?Q?38DI4w4Jh6lIgYjuAAhtjzmPUOHsmslckCD8yEMZbjdWVPXzsGr1qx8dxwMs?=
 =?us-ascii?Q?lSvmZe8aajmjC32gLDLdyykqb9fJMLB9/19CoJqMXBCK3NVZmB8wCKLMlDZI?=
 =?us-ascii?Q?hkFWM+kkhEImCk8/t3OMxSkdUt7y1ntx1NZf8a3DkPa0b/rUdFYo/Tf30Eg5?=
 =?us-ascii?Q?9EcW3vgQ6q/CCpXax1UabWsdwrbRzFriJ1Hu24+bEB7Th/QK+QMabC/P35vG?=
 =?us-ascii?Q?BGlRfGb23ZzBSNT68J+V7mQDFj6vewYFrKSbxtle1IF9eKt7XsH2iNuyuQCz?=
 =?us-ascii?Q?gbiPxCvdrIEeZPfkS4IlSkLLwLi9wA2Va3G/qOgg/cCqZUUTcCR3pxLNEdFn?=
 =?us-ascii?Q?BeuqeuAUSSAX6/1+RjFmWZHdDj42JlWwV0nxYWxcYJK5yKV9G77MldlTXOuA?=
 =?us-ascii?Q?/+K6Za6ETFQxp4dXw19OTutZIXHlrdhXNCj8uog6KHZMYT9gEsd+wDDLA1NE?=
 =?us-ascii?Q?Jxn8EdgipianGD0bZs1LfdNp8YhyElSqBZEXcWaU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a820571-efa5-4bb5-64d3-08db2fa6feec
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 16:10:49.3043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/55Bw/s5kuVtABU/ZOJtUBJBKCLcyZGJQL9L2+o0ELUDnGhKtdJkZVxNqMFr6br5hUR8rXd0aQDMOyhE7Sglg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6870
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC 5/5] drm/xe/xe_macro: Remove unused stuff.
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

We can easily bring it back whenever/if it gets useful.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_macros.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index 826759d0fcab..9efbaafcc99a 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -8,8 +8,6 @@
 
 #include <linux/bug.h>
 
-#define XE_EXTRA_DEBUG 1
-
 #define XE_IOCTL_ERR(xe, cond) \
 	((cond) && (drm_info(&(xe)->drm, \
 			    "Ioctl argument check failed at %s:%d: %s", \
-- 
2.39.2

