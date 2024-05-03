Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA5AC25B4F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 19:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1279A10F91A;
	Fri,  3 May 2024 19:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kLSytFIn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B84D112947
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 19:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714763606; x=1746299606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vtgTaYZ7J1jIYbAnlKRRxjZDf557EoLYSYtaafmolRA=;
 b=kLSytFInhJEo/MD+Hk8h+0Jx3yVjeyMFErd+TraGLuuQiXx2OSBDyoSb
 y81350RswBiqW/QW9rZ0biGdmlS7MTIcTy2i6PdwLpLlgzbPuywY7C+dX
 sJvJrgSVw9APQF0+MawZU/KX3VHBHnmhawBqPWPYAEmLz4/0dIbv9QN0B
 EcsQYaJZs/p4+jGknG++nmX2N1qVV18oZSuni+xnaYe4snI5ZPJ6cti5t
 giurL0cJaP73iEMThZZiX78rqB6E3sh2FT2Kprgcleu3UqFFmSck8/PEM
 L+sFdEWKY2Lkp7ImCLqKVyoa/YVZY2Z8pdO7SCLl2k76KpA1toWnlLE7A A==;
X-CSE-ConnectionGUID: SxCmf103SxOA4APSO4e9hg==
X-CSE-MsgGUID: QzlIlBP0QA+9NAp3feg+/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10708784"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10708784"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:13:26 -0700
X-CSE-ConnectionGUID: ak/aT8UcQ3eLL+m0oB7J7g==
X-CSE-MsgGUID: G20PO4OFR8yCKpwB6+gmPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27943480"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 12:13:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:13:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:13:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 12:13:25 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 12:13:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfXcqrki7DQH/svUKsgnP+o834+Zg1P7acF4kT3pMBRMtdOBd3IqZLDXIU0gLok3PchTJTBb7fOCVu4ttrXXagktuANCN7xE6qLOTHgUxq5Yi2v43M0QfhT0dvzLDb8k82TwZI5GxxPRwoO72Z1O6DTd62T8YQqgA2xBiVCg+36Nwbd1PLI4CJZT3FNJ9wD2K4k7BSV/8J2A/L9b5Ap26eXBShQeQQTR4QuhNFxs9FBnV8YHlYRwWtV8dSO6vgLnEg02eRzWMmObxHSuu1zh/YBQko/3I5t/E88UDzdIDAHQQlPDc69yy9tKoMaSDj/WTqh/R4wAc5End3LMwiVl3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTGhrEhIO7cb+UhbYr4/HAkTndpNOfxtj7vwdy/A+rk=;
 b=egTuGnjWZHDtJyYCG8py8DQsxG9g6Ym4lxRkZAYB7F2Suei+Rem8vZHxFjU5D28ktYE3VKLM3OxGRr3rVijjiH+uhVfQN74qO1Urn2M28Bq7m7rm8QGLvXQ2gVC/6SRrCKNul9mEBmAoyzyWxW9rienFwAxtzwrPoqLcQm/r614WSqze3hjIz7vH+LSEajEZJSaPNQC1hNLDzExmhJP/wDoOW1B5nRmktDGt4FbJGOWtt+yg6g24JjCeCZgbom688JBF5JCf2yUTrkWMX0sMC3BkikzCgryMgFJuYM30w8pZFBVQIihhUAYMPJzi5F7KFtA+JPbH+uti9Vkt4Zxv7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.33; Fri, 3 May
 2024 19:13:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 19:13:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <matthew.brost@intel.com>,
 <francois.dugast@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <matthew.auld@intel.com>, <anshuman.gupta@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: [PATCH 2/7] drm/xe: Fix xe_pm_runtime_get_if_in_use documentation
Date: Fri, 3 May 2024 15:13:04 -0400
Message-ID: <20240503191309.7022-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503191309.7022-1-rodrigo.vivi@intel.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:40::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c41293b-6d27-4aec-cc1a-08dc6ba519b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mF33E3j0fiYqrV8t75M8EEO4ocXbHsfoYzblzPw/fs7A7dgGpw8LQmYTjcWv?=
 =?us-ascii?Q?ERYdR/OaeM4HMb9JZN3uMwXITqKspJhj+Wb+skNOQLnwv5TidSiW2j/VAZ3K?=
 =?us-ascii?Q?WAki6hFDRv6lsylsOFY5uwECXco7biVwv6UemdbdaNhCLfQ0wotTJNebQ7QB?=
 =?us-ascii?Q?EHW48IBIp0q89crkMW95LGaNxIsEKBEkYxMVSEnruugdY/S00gdTdPzd1ZsC?=
 =?us-ascii?Q?+EGpwkM5BDOE57L717vFdto4ncj/RXYXSxLyXA0XxFDrGV3lGcIzkpX6AK5E?=
 =?us-ascii?Q?qNitsuyECbzARXEWiVSPviDAd3reprK3pB2j94FicD103DrMcwd7cIcz9H0Y?=
 =?us-ascii?Q?xBjDGAJnygbMGecF3z3rXJ6KbPBm6CBPFwXtOQAtMQY7k4eCkhjnJvBNQo2I?=
 =?us-ascii?Q?khR0lg78OlVmSQN+AZYqjmiHjlzhHmk5KADeXmvcnTs4NAQZE+/zubkMxBwQ?=
 =?us-ascii?Q?ZRXR7XPQUZn6nQhWl+qAq5tOk5BpddbLqhCGl/CYYBvUtkQyRRPORirK42MF?=
 =?us-ascii?Q?xpau6bZ2yhamzF6y4Sa5WxPsY4Kp307pHYXA9QXu8rTLNKfuP/ejKwiB2rwt?=
 =?us-ascii?Q?smekVgQnMx0djiSqp+9cWQj0cRAm4TJ0FExnDf3W1LyNo7eXUcUm+6+GFWMC?=
 =?us-ascii?Q?NZTkMk1ufht3JDXgob5EXhpvisMLSJH8dBsGbe0i1cgxrCKgm1fRKy5uDCxh?=
 =?us-ascii?Q?tudAF8pa0U+IW1N3iPbu47lvQCssSouNY6o2rWxx1Hmj+cXpproyhajZnrTh?=
 =?us-ascii?Q?VMR+EuUa6SZ0hkWYZt9GW9IDwFbc2m1Rt+6+G1Q+VCsB7+piSNKaGf9ieC4E?=
 =?us-ascii?Q?tvk4Um4DIHB10hRe0O78BRkE32NHfb6T7wXjDhkdV4TlsdxXQjKyQf30tMRw?=
 =?us-ascii?Q?G2651XKqj1owzbTr4V5oAuClkTtHLHIGXAT3pTdU4Libvh8FoazopE3CAwDV?=
 =?us-ascii?Q?hryxHnLx6wa1b8gCYOT8cQX9qGSmfuk8T+9IJtMm+oTkc7oQxA+hAW9yd9k3?=
 =?us-ascii?Q?1gq8ZUm9dt6jNtZaA7hxrkbgottH2hxZ2KtbPQxeOu9OeQMHcJ+6Xd34/nZ8?=
 =?us-ascii?Q?d49o/ir4K5wtyCQSZA46BSIndnfY+OnOTUuek8tMxoyDk+Gm3/nwQUfrDVRJ?=
 =?us-ascii?Q?87RSSLYXFCqfgx/QCD+GyW3zSus+5bo7wxFFkTMJfChLzYklfPb5H9GrzqAw?=
 =?us-ascii?Q?5f3RAOuNdPKXqZTaeZkAgzUnaABFH25vUHNNoAqWToR35wgGlN7I42Xq7p01?=
 =?us-ascii?Q?4tlTP3syCgdFkBVTJagPpf33I/3C8zEHMEMUksNvWg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UfqTo62G4rtDlBdMGQXTeK8M4q0V5O61Z7UUWLyHprXLt63lNO3s9Px4NuoP?=
 =?us-ascii?Q?EZhTByu/eWsgQSABE/OLdtIzSQouDkUczb6RWPcgxObgnuhXynzZ7Kach3r2?=
 =?us-ascii?Q?/+kMVrrSe6mTqnSGap+/80SjruWoeONEo4BbdXRuxEnd+AXEll+8kn5XzVKi?=
 =?us-ascii?Q?D52A3zVgc1+yuikZtZ79mqo/WfEB8rQRj8JW4azaTN4onblFPByH+uB2M9Kh?=
 =?us-ascii?Q?Cb5O4V7pr5w0HVgFX8Cjm7iNgVGzmmHqC1a8Z3hE4boKqD/VIwMqQL2KwmVt?=
 =?us-ascii?Q?epJIh2hhhPCLfS/r+uLXMYUzGCL9pV/mXMatn7S3n0U3feXHjFKjjDCB+V3U?=
 =?us-ascii?Q?J+IAOfCm5OcHitAzNcy6xceb9ApdyH0NbYRLC5ECvEO21jNHoP/LxpS/YIw4?=
 =?us-ascii?Q?f95Ml4p711h0Ax1xcCSqvy2Nchp1y2Ufd5FiOxSH4W3zyegIBQwQy5nopIa4?=
 =?us-ascii?Q?16AL0Qdx2HL0ff+Qc31LeeDkLq70V/3qMyz+KJblu9o5NTbZAcdb/YqJRupa?=
 =?us-ascii?Q?+20mDxtCT271ENT4k1wRSnZ+7W2eenNKGCT0nuqPxTl6raltaQzY9cSlwyQi?=
 =?us-ascii?Q?2B9B7rpWvzpcKQ41a1p6wyxZH3lDON/RvGLFlhIiNjxBls/nPOFHeElW1IHs?=
 =?us-ascii?Q?eIXWem4rAbOHjl4OWVMfHvAmhGJ9PVTnBh+NoV7OoEODpG0d6RZ3qSaDL43k?=
 =?us-ascii?Q?RRyABU8YHWLj1KXRkesGCa2Fe2FAyVpvCReY9P1ZHl7Y7uNLCL614LGaa2F9?=
 =?us-ascii?Q?QipjxJBXCxzKdkaoo7yTWPA8hEdcqzg7dfjfeKYLM/YNDRLL4fmzPosLFp1N?=
 =?us-ascii?Q?lUlg4UJ1bkC+PnQ/Zd7bf2xPdm1yORtmdwI/p1opHcuZwBtq/D0zu9A0PUv/?=
 =?us-ascii?Q?7gDAVE2QhNLzWUww1ysYc/trl3n4RR2l4JXm/EbKZHGyUA30yXkaOJT1/BIJ?=
 =?us-ascii?Q?UtsNvXRv1g+NImkiKOhqxwTedoQPOSCItQ5sEh8ThLuNZdBrfDj0MVr8TFFL?=
 =?us-ascii?Q?C6rlu/fmhk/OFX5IlHqrlf3ec/7bho9GRhHhG3Yu/1Q4f1oJG9gi2M9U3Im2?=
 =?us-ascii?Q?gCIsvJeG8DwAKt0iwouD5Q0RgJ0gnRi6WjOVLhgh77jSWOE/HjWKWbqz4eYn?=
 =?us-ascii?Q?RephYOCjpvJzdV6MNBXmxqZxU8p6f41+Ur7DsxR8Q05FWAEtlkYmVyN2+IBj?=
 =?us-ascii?Q?ofVoVucnIL5jo+WQJjvKcjXlVdpzJAiJ9YZt/oSPP5wOd1uRTYP1Em/xdsR3?=
 =?us-ascii?Q?7M7TPp8A2np/3TrK1D9d1mtiYiFhlvG78+6PBLzRnW9yxiWWacE81vV2Jf5/?=
 =?us-ascii?Q?Db/7riPG40Sws6Qf2FWnJ5TpwRcmUC8zwkrb2ExFFdRKjpvmCKZiOR31yHLz?=
 =?us-ascii?Q?dI7WBVBAfxZA55SOKZTmUAOuuHJtJJ7oVQRk2WRwFicYtIxW5OMwjUxAqQ24?=
 =?us-ascii?Q?Q7Dq6ixVvBu/7n31QC+G2+1uvDK+xcl4bvba44oLLJQdfX6lm1bnhVMXbuLh?=
 =?us-ascii?Q?hUKhXvBWSPf2Vqq7Hzwpygtwj6QXWAXguJ2pNbAbPDZ3XKyi9YjBa+XPBZFA?=
 =?us-ascii?Q?JL1tvaUrGcvIjsgKQcXDYzMFyr1T12jpwqEe9YOY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c41293b-6d27-4aec-cc1a-08dc6ba519b1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 19:13:22.6803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6xtwQo0rAHcBESpEZ8zabpMqZVFGcFw3fVx/YZhqTBCuc0bgnJ0gmkxSsO1PtawGCRzxLpqn85Mfa2xI9royg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
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

Let's be clear on what it is actually doing and align with
xe_pm_runtime_get_if_active doc style.

Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index eca977d1e1cb..c3adcbaba223 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -514,10 +514,11 @@ bool xe_pm_runtime_get_if_active(struct xe_device *xe)
 }
 
 /**
- * xe_pm_runtime_get_if_in_use - Get a runtime_pm reference and resume if needed
+ * xe_pm_runtime_get_if_in_use - Get a new reference if device is active with previous ref taken
  * @xe: xe device instance
  *
- * Returns: True if device is awake and the reference was taken, false otherwise.
+ * Returns: True if device is awake, a previous reference had been already taken,
+ * and a new reference was now taken, false otherwise.
  */
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
 {
-- 
2.44.0

