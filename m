Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E047C3065A
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 19:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F19510ED38;
	Fri, 28 Jun 2024 19:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVFSaMwa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CE510ED35
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 19:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719602896; x=1751138896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CwH6G1X0k1TWyR2UeAsZXhDT0JPHhJkaJcDvWjf0jgg=;
 b=MVFSaMwarVlfJSMVfL0f/zZNXnUenNeXVUWaw81OHWlgAeTd9L9EyoiR
 N8pLZOaIEv06tpD22c+HCD6znQKKOzKB3MHxzITdzorTVUzd7LyDV+yEz
 SE3snNHYH2BIlKYoNqKb4anhKvKMPNmofIZju2yzdGa+EI5XqAmS7BX6s
 5bnrYkf5++F4fSPZRm20XdVzDWeiLfVl9nphcI1Sg62gKE/91YAFqI0f7
 RegwkLxFG2ERzhAC25HHrQzEeEXodZ1nPssboz48j8Rxu3JdnnW9rXJRJ
 doroYojHixzFCaaAHumkM3tu0D6at0sx+rxtnaUzrEcZifv08RYCtb6DF w==;
X-CSE-ConnectionGUID: mWpWRm9mRAS4SYT9v12LsQ==
X-CSE-MsgGUID: wXBT9znvQw2YwakxGq4gIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27930968"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="27930968"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:28:16 -0700
X-CSE-ConnectionGUID: 0weCoL/nRhu4IvcHL98ukQ==
X-CSE-MsgGUID: Ec7kw2wIQwC+UfRGtSJgAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="45498224"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 12:28:16 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 12:28:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRZK4LkKDu3oWryyfUSp0v0vDyYm54Mobx90MeUCrB1x1EPP/K8leb1OrzixiQcFcCWlIYdOJq6rvPpIkjKRjbl/JIfy9z6w6QTaQJRi/HNRO+U/8siV+4gBZcFkNSzBxCRjnHyxDCPTQ8PvqiLkp3fNwRE/a6tlqG2O7QTLYPlptSiGjAPKPdHSP1T8mf6PrVr15sYh4wAGAzGAxVrrqjfjfRKxiw3Vxl91DkQTFO5Q7jG+INzMUDZ6WV5QEi4WNC66StO4SUPlQQsB2aN2ZUJDkaKXPCbmLPCYDAV7Oy3us3EdokCS0kdbhTUbMcsMZJie0ehye8cGwDZc0ejIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/b8EjTSAc1ddcpSUcL1nEdjNtcz3KXUkNiwuxY56Bg=;
 b=TiHfnC3SBGy2Ji7YUhOQKZjT9Ujzl00Xd76pmFTNkVkjyZfnHnJUeF7Ug7gw3aYrY76p39weX2QsJAo6M156mSWOhMdk1s/Gm/C1Oy7gJ4jISoULhlo/Nn3WBCyh6rM2IJyNoa3As0hOxf2tvaBC9IHQxn7T+DoF6OnVQZltZjBpoHtd8Ueyzja9wv2qOHxpUNV+mC1DYTEXlyrmUtmOlziaBoeuOjYePRlECtpLyql8ihGrma0CHUJox8CtN2R9f2MQsUNLmrigMeM+XCCAz6tYw+Tc9yXt0rRr8OuzFCWG03pyDL7zuVg7LDAg5Gn0oS1wPijTGGLx5uboVI2yLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 19:28:13 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 19:28:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>
Subject: [RFC 04/12] drm/{i915,
 xe}: Avoid direct inspection of dpt_vma from outside dpt
Date: Fri, 28 Jun 2024 15:27:45 -0400
Message-ID: <20240628192753.386137-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240628192753.386137-1-rodrigo.vivi@intel.com>
References: <20240628192753.386137-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:a03:54::30) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: c72146ec-3b24-4ad7-051e-08dc97a873d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Diz0NgV7kHmKTde207SoAjik/iUiBk88SHbRZssn2uTmBubdE9znpIAvD9TV?=
 =?us-ascii?Q?6cvK3fAP2e/5HtUSqpxkQKSLQP6iuYf9nn7HuyZi/XGAYjHnq8RF+UL7M23p?=
 =?us-ascii?Q?lJkKQNSmIjguRe7HeVxXdpNMZXbst9uZh8c3FxdihMArr56IGrNpGYAKFbXi?=
 =?us-ascii?Q?SsvuhjlkyS3hTjOKNncHl8c+IcDx8C5wC9smm/asLJ6f8PTwksR81PCW/9LY?=
 =?us-ascii?Q?hHjbpd2aL7Zooc2iwKZP6886Kep73IiX+oEcXyaFBU6q2N1w9BvsA3485hla?=
 =?us-ascii?Q?oEKQUmA4Bd+JtejjGoo7dC9Wz1XGuG42e5SZnAzRr+lGaj3umJZ/5MbgUyGq?=
 =?us-ascii?Q?kXIshyl6lEIam/pGnQSWoBiVBo8IVWtUebkYq8u3YFpJTMccDGrBhLMNJncf?=
 =?us-ascii?Q?P97C0OzJkJx3Sd/mFUu7bYopVMMHr+wCZCBxLEga8Y0pXzDk2iMu6s3Mkjqv?=
 =?us-ascii?Q?VSwWKk+QXiyRTLyX7X9kt1+OryuTgL43P98hDviME/SuLl/jTV0acHMOsY/Z?=
 =?us-ascii?Q?J/803jm9Iiw2e16doulbREMEXhZJhWa8ib/3YaNl6KAuNAYcx7a4eIkrv5MA?=
 =?us-ascii?Q?UvCQCw1WyxEidVbRHa52bp+KsqqkBBHVkzh5Wrt2uHi8/iW8+B9nCw/yjJg9?=
 =?us-ascii?Q?PzEOBWwSOGZnks5ocLXHMpWEJfnXvtORke4ecO1/pTSCTh8lyNB21eZVz60A?=
 =?us-ascii?Q?HZ32uJocIbtciLt+7dDhuhO08aejQqbKVQXDXwHOSsywR+sjyJV5Xmpj70Kj?=
 =?us-ascii?Q?nelRdibmEPo5MOYsCQ9UTElguQoIrWWOV7Rnb7BaAbFNLbc2n1i2hav+CM8I?=
 =?us-ascii?Q?vhv274/D5q9S9eO/ZM/JzM3gzUJogEbmVlLXtd0cZ5D8IKnDBQNVEynDtWst?=
 =?us-ascii?Q?BR33eXQ8OIyzZOr5CBs7OYAFAoA8S3jkw9SVlwu/x8NjwIWBSCcpW0HhKysQ?=
 =?us-ascii?Q?Fg23JVifkD0LLPHuv57aTP/HRg4m2kgCWkKPg+3/6gVpzOKXeLD4pn98anPK?=
 =?us-ascii?Q?rCipDoKCNEitzUUxtlkunypjC0OYko152+UzlMpvt1IwC8R8+rKo9Kej2gr1?=
 =?us-ascii?Q?zWC/QC7WoDRjfQEQISG7G+H7ujNwdQSLOSvntdLw0WVLaPOxl/699UVja6JN?=
 =?us-ascii?Q?cUnVRtvT3nLjo/L9gVhQSfyAX7EAuoG9ZgiNTOM8ql37ZRLZuqBM9l+AaxqS?=
 =?us-ascii?Q?ncjlu7S3FVFu0qw8UgojULUJ1UYqjCUdYUP066v8CR995Yg6CPFxXk6b8CUo?=
 =?us-ascii?Q?pp8ui+M6GR6H+ZUbVXbTlE4AdlW1Ic4Y5LNgDmXO63c6y4ZFfbRHhhA5B5Iw?=
 =?us-ascii?Q?88u6ev6hYg/qQ52bK+DD6SelaN4V9yy0lrTBaPP63oT4dw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C8oevbVLql18LznDFlRKrIWyHIBausYTmvCn+u5Io7KXEh5v+4KGyrEzdHn0?=
 =?us-ascii?Q?LzHywNUVOfI1PhCfe19R1THh5JHc4ksxikHrEA07BZRxo/wu360Ey/YRlmQI?=
 =?us-ascii?Q?FGrJsnxNgIooCrgCeXrAqnO+qswxSuxMJ+jM8V7J4FmM56fZ5ATpodwZctQi?=
 =?us-ascii?Q?WSDR8k4JtrPbnp1jZ4C6kR1nlb1Dnwv1WVjQT7nFtQwcKu6dDAikktgRzP/q?=
 =?us-ascii?Q?9K21Ib0fuOpRMCOoM+YCssdGudiD5znezpnP+m/LxfDq42ryEPjEWF6AMnJi?=
 =?us-ascii?Q?j1E1EzjMgTJxB+P4OfJ4sfaLMeZH6o+4MiUa/0Td4/vFOMacwSjrvLNJ3GTt?=
 =?us-ascii?Q?A5XV7rFEa3lXKIp7wCaYpMyzOe7N++RSAcf6qsdRiS9JGqoGvwvllGrk0E1K?=
 =?us-ascii?Q?qtOAQHfNfHf9ps7b1BRHvrF9m/yOjapfHN9W629dRuG+b7jOR6WVdqG+wsT+?=
 =?us-ascii?Q?Iind4bml/c0zR8gD4WfvuSfGDZ7R1RYGm6/31HT4/g4H9pqBwQmrLmVYTddx?=
 =?us-ascii?Q?EI3YRGdbmfWdVgaO2DMKQxOTC+LqVX/WIRNjImdRyYo2ZEkUlY2d5raCwrnp?=
 =?us-ascii?Q?eyDgTVxdW1mi48VjuyFByHL3GmsDKAm1FgOyQoUzNrspiv0OKhciuv6a9bhI?=
 =?us-ascii?Q?TmMloVHd+ebNnmY2rzKUt2vpVDQcnwsCr5mtgbGIlowVkFIBSrKQ2txclWeb?=
 =?us-ascii?Q?JjxBInJh5toD407plE6dGdhXk17GVnsSmraRATXVPWLkSgb2dMErwm0OlSx8?=
 =?us-ascii?Q?MW6nyCLjr+OW5TQOXv7ZDEm6VVbPCd/uvto52rJmCOcWoLngxjYSQci+2JUk?=
 =?us-ascii?Q?FYe0wsuPw2f5Zi0Dadfi+H5rYIvBQpJYBcCqrJJvMCjGoENKQfymx2+GCXNA?=
 =?us-ascii?Q?7CEoMTPGl+DT9DZoHLvcaE/aNo7PSVsphWcRa56C40+2dpEWu+mGGRQbjBTC?=
 =?us-ascii?Q?4nMuBh7oywupNEXpe9KGByayG4vcWjFYZVbm+5CJ9AFjp58JOKAbxmEggp4E?=
 =?us-ascii?Q?4hwsDAST+0svsMCDZ1prQiIg21PEiDFOc3SgpdG7EhIlQNnKnDyJrnB/SJEl?=
 =?us-ascii?Q?0Ax0j5ehjXDr+JivGTOy9/aibmGNv6F87OdwhuS2BU4W2buDICLJ1VRAkXKx?=
 =?us-ascii?Q?0PqD5SZpiEWsTfVzQkCEhl1uHc/2DHqnCB9VKxXTupL4U8KW58OVb6feGZ8/?=
 =?us-ascii?Q?UDc4bHgTwnlcPmg46sB43mXyY1vQhZg4V6MY5ikmNKddpsyUOpsQ395JmVwT?=
 =?us-ascii?Q?1+NnJBY97kDI8DMrO7jSydEY/aTiXhfE3LUJbPj/SeHw7W4wxROE8SfHa5P+?=
 =?us-ascii?Q?0IsJW4PPCT/kNRT0A49wyz8/XtHIdtNtfFx1ZUo08gJKp81XJHKQh9E6aHdu?=
 =?us-ascii?Q?fIpajbO6Np1sKsyv6C0t6+Pg95JygLtpKFhCI2JmueOJrz3zH869TllAYwTJ?=
 =?us-ascii?Q?HWNKwNBo1eQjlg4BGK5ywpGA3vynkIaaylUGZ9oXnYEB2quXJT2cHf08xH9P?=
 =?us-ascii?Q?+HZZjNbsreZBLE9Nk4p1xmoy6ZxenYY33ggpAuvOU4zNliRC0ss+qZROD+kY?=
 =?us-ascii?Q?K/Wa9OMDLOzcdlGwjgnk3yVHSX8Ipj6cl9IEy8TgCAx1Zc3P05PKwIC9XVXC?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c72146ec-3b24-4ad7-051e-08dc97a873d3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 19:28:13.5194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QeL2TeU7527T0w7vwjmZ5AFNFZRm5Tc5PccnNwE35idu6EHBBT00eAXg4zyjplTadE4APIgkJ/UTWtfY8ktJQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7483
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

DPT code is so dependent on i915 vma implementation and it is not
ported yet to Xe.

This patch limits inspection to DPT's VMA struct to intel_dpt
component only, so the Xe GGTT code can evolve.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpt.c           | 4 ++++
 drivers/gpu/drm/i915/display/intel_dpt.h           | 1 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 ++-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             | 9 +++++++--
 4 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index 73a1918e2537..3a6d99044828 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -317,3 +317,7 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 	i915_vm_put(&dpt->vm);
 }
 
+u64 intel_dpt_offset(struct i915_vma *dpt_vma)
+{
+	return dpt_vma->node.start;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.h b/drivers/gpu/drm/i915/display/intel_dpt.h
index ff18a525bfbe..7336e905142d 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.h
+++ b/drivers/gpu/drm/i915/display/intel_dpt.h
@@ -20,5 +20,6 @@ void intel_dpt_suspend(struct drm_i915_private *i915);
 void intel_dpt_resume(struct drm_i915_private *i915);
 struct i915_address_space *
 intel_dpt_create(struct intel_framebuffer *fb);
+u64 intel_dpt_offset(struct i915_vma *dpt_vma);
 
 #endif /* __INTEL_DPT_H__ */
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ba5a628b4757..1cf1d5c8b9dc 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -14,6 +14,7 @@
 #include "intel_de.h"
 #include "intel_display_irq.h"
 #include "intel_display_types.h"
+#include "intel_dpt.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
 #include "intel_frontbuffer.h"
@@ -1162,7 +1163,7 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
 		 * within the DPT is always 0.
 		 */
 		drm_WARN_ON(&i915->drm, plane_state->dpt_vma &&
-			    plane_state->dpt_vma->node.start);
+			    intel_dpt_offset(plane_state->dpt_vma));
 		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
 		return offset >> 9;
 	} else {
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 423f367c7065..77dd1a96c4de 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -374,8 +374,8 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
 }
 
 /*
- * For Xe introduce dummy intel_dpt_create which just return NULL and
- * intel_dpt_destroy which does nothing.
+ * For Xe introduce dummy intel_dpt_create which just return NULL,
+ * intel_dpt_destroy which does nothing, and fake intel_dpt_ofsset returning 0;
  */
 struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 {
@@ -386,3 +386,8 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 {
 	return;
 }
+
+u64 intel_dpt_offset(struct i915_vma *dpt_vma)
+{
+	return 0;
+}
-- 
2.45.1

