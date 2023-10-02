Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1195E748F0
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 16:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA6210E1D8;
	Mon,  2 Oct 2023 16:10:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A44510E1D8
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 16:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696263019; x=1727799019;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=ebYu4wyzYlBDofdcE7h62sp+dWKanRjDHIKmntPt3bs=;
 b=SWzzAqz2/kkK62sF9WKqmWfXwlY53XsFT+ti1BgC4cJAX4TVewM9XQOY
 tr0qSofylYNfDkvJ4lABKQ6Vt4xZL88Shj6Gvz0Zni+Rf6aDUw5lwFqh9
 fommE7spuHkxAh4LvRDz7EAg+8agMNcHIIzQZII1K8ylHMCiu3tDZWDtd
 tSVJVPlDYdHeDSPWjP59S+enaJfMzyxPySJLV9BeJVD/PYlqLyVJfxu2p
 3vusZssRuxYsvnmS+CodBfeA9MyB35jHDRwjAcY8k6QZRq7I3Vdb29tSl
 +3JMQm9oly9YE9HDceQCOWWGtzYI2WwVUvyf/kYTbkrRTaI1e8e4TtE0D w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="468954805"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="468954805"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 09:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="744159140"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="744159140"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2023 09:10:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 09:10:17 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 09:10:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 2 Oct 2023 09:10:17 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 2 Oct 2023 09:10:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKq2EG2TY9XiyO2b3X6mGYcKULcg8MoM/jb1e0wXyfySrXpnfYZAx+un1OsDiIJoaLdKIWTEzTfguyDl+/Ow2Y4pEYKsDqxqUK1aBboqHbZlBSy4KIUsVWAgv+afJdcQBTzetI4O/6B+/3mDFvcKpw0U47rs/qnXHwre7aY17EGFJWm4IIKXbBeyq10BB890tNnCRVO2cWU5gwCX0Z/DTdDoIYxDm7DzGpA0KuM+BDLwVe5e6h/IOuL755nvP09smoA0nVwoQU0nDJvc3lxGEaccN4STOE4NRqH6ifCelEibY6xDRCjvixnnHXAqx2/pWREmjC07suh24UcTBixULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1fM0L3WZ3Ii5SAw7U9IwLQ36IUEv/dXC4i16KcHh4Y=;
 b=gqGZzdwM9wTd1s6nuDyx3c3CRWEXvUcS5LTBV+VclOZC90GbNnXmOyp0lg8PhKwBY9IseLpGbKepJ9/CmTVcDoM61jSc4CmvCFPca9wX0gTzgwoy5daDej8w+ZKePRc7huIrOCUk4kAojFvuR4bDcOWtSnj3wLRKMI7Th1e5CBxkRLz2B0SJa41MPCGOh+b4VJHvLbU1nM98TaA1SbHa5XpasSUyZKBnPP7RQ7qTYw/9GYFNaczESmFWIHYtdloB0sWCFmEgGQ4/OTlT8ox4ote2xhg27Yi0RQhB+w+XKLTHq9fAcAzWOU78Apl2GtygC3ceHAWWSHf/wIzpIh9p1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6461.namprd11.prod.outlook.com (2603:10b6:930:33::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Mon, 2 Oct
 2023 16:10:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Mon, 2 Oct 2023
 16:10:09 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 2 Oct 2023 12:10:03 -0400
Message-ID: <20231002161004.1265254-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: 42eb9163-5c24-4e1a-3302-08dbc3620d10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B9f66aUDUzyblHc1cIOaxgFCsuj7rXVZr5xMZuK5Fh/vwFdTKXzbk1HffnJK6YVY72NZommiOnzBkU/tklxqTZM4cdk1Ots8PYJqea8BxYGLwSO9Ivnsokwb6hBGPQUUDiXQ3a2qYE9q5c5McF/3Csma3WF8hT0pVBjpvXsHCQ4XPonNiJfCd0sX4YO9W0yTZeSJLaqyamhe9TBsMy5xYFkYxfSNffSoGMdnOejDe7spcImAHSmfDa1/Y2NsCH6B6IRPppUTnO+i01efyNdjootsopJUi2zsrnmxhrxdK8tH5Sp3MRvtcn3eM6Fny5qAAmRIl45k49sAoKZJbbmgzVMjr4na8KaBBdloK8sGj5oB8a/eJxdGWKLh47Cc+I/AYB6rqNj/5ngvE0lOZhJhdR/N1lYv+uZcXmD/wXDAHbCzFuSDOmZUN9cMGNlhOxu4okNn88s0BOpnF3xgrV93T5o16z4/MB7mQTo+WQs0jjD1+HHWz3oo77IQ/lShT/67HN9zskXLC8OJkuCR/D8jiIFXkBK6/LOH11yWeavQTHK7N9Ga+5pVigjy4zidYsNs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(316002)(8676002)(66476007)(66556008)(8936002)(6916009)(41300700001)(4326008)(66946007)(5660300002)(44832011)(4744005)(2616005)(478600001)(6512007)(26005)(107886003)(1076003)(83380400001)(82960400001)(38100700002)(6666004)(6486002)(36756003)(86362001)(6506007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bk75T52GO/paX/fcIf180UVHrDlit9rXJ4BfFRQ251HSecRmAA0eFD4llsZ9?=
 =?us-ascii?Q?TUtKjflI5j2mY1su+P2fiuVx/KP9h3+UTgRcUT0eBm/ffgT4xkJ0lUKJ9dko?=
 =?us-ascii?Q?LUfoxkLFHF8Udra+KpwNgxnXAARgoBxha+FasWYezWVlnbPRnMitndEHjJ5b?=
 =?us-ascii?Q?88E4tf0V+kOVjFcanOTLxOXRUMGZIviYy8vzMl+BAGmULK2e2r244kX4X4n8?=
 =?us-ascii?Q?irqrePECRXaggsFhCRYEBkfNUXlwHZlcC+PSSBgvCKQXNloPjeEgEnII5Cb5?=
 =?us-ascii?Q?RSf0QPpPXpWk2aWXftVXtpAlzPULnYd86oYoakjzDDR7HncjZEUgJJPyC/ah?=
 =?us-ascii?Q?K/XnTWFE8u0NfUKwrc0LO8wtVjWN9XD2i3/AI7ia4EIfUSyRFFgKCR+qXa8u?=
 =?us-ascii?Q?d10iD2tCLK7LUr14ixw3CTsQundqVhJ2iTrajmPqeCtq5CdT4rHD8Tv/JXKl?=
 =?us-ascii?Q?Oyst+DBXHP0Z5X/2U3d7og3U4vYu0kvZpND2dHuImcB7K8tlnov9bPrIGb0i?=
 =?us-ascii?Q?4o5RpcWaDvjp2U/OgkmvlsWg1mXhoxFk8z+n9jF7CfTDW6WQMGWdG9NCFVB1?=
 =?us-ascii?Q?aNuj1zpH8Rim6/gB8K+6ZZfUjHbsp+adfVuO5HkDO2oz+tfQT7VKUziwyRYR?=
 =?us-ascii?Q?m+eU7e8CgWy7uZzeFLGNzM1mSZn/MC0sPcl0NHY36kVQ8+zjDzqbKGbEFQPF?=
 =?us-ascii?Q?mTbV00GySxWLEXeof7C83Cb184F882t8h41arXr8MEXwD2oG1WO9xwdksnHS?=
 =?us-ascii?Q?hNhAEbTohRx56kHuzVTNgLLUHi+hg111QNQ35rntTd/nF3TnW5vuMFNxAPWA?=
 =?us-ascii?Q?PYFTvgwq08KoKb0ujYCBCeHLTmfUB/TpHyFuwwKvnz4zBPYg+KoFFBXnVr5P?=
 =?us-ascii?Q?ek0JsU9qYjNicnPlMTIzZz+dv9lQ2NYUTHY4+b4kagcoHeSUswDyKMBse8BV?=
 =?us-ascii?Q?LxJFyOrVRzdQ1Mk6GaPlEg/xw1hqCn42kd7d0Lfoy3aYmfO8JX+QDg3gfKSj?=
 =?us-ascii?Q?yBcTTHInQVoSQ36cX09rLq4iUgt7jet31/BR40SNOCmxb5dRAi2+owqIlme2?=
 =?us-ascii?Q?FDkgkbrEG4VqGznkh3lnXQ60VwOOuBhPGLlVWItaIipzNWtrkVyHj2s9A+Ok?=
 =?us-ascii?Q?lIopSgRLdxb8cyb9jA5l3xOD7+36KUI5OpqcZddO8RBY4O1HoJv5kh3hW190?=
 =?us-ascii?Q?6pWYJql02k3zZVWk1sB2fuxFhVHGtR00ktDWOy73w4cQZe9WMLIG/+hvFN+d?=
 =?us-ascii?Q?4Rk0PtBNzFLL0E6iKy7P239WTCtKQtWvWjmizBCM0SJcl++Is0DkQRj7Fqln?=
 =?us-ascii?Q?swDviq0xc7OKpVnFlMSzfwYJUduvZP5R/RKdYPj8LnCLe+LJoAX5jj2MOFF1?=
 =?us-ascii?Q?A9Uswhypf+o3hqsutBIoT3PaIwsWyMzLjkjuTEc/swEwh1PZ8/ruoEhjWzEC?=
 =?us-ascii?Q?14bUn4JqLyMm1oI7E+Qh3OxTT/74imJoS6TEvv3QMemCdep7TVMH3Z6vpGYw?=
 =?us-ascii?Q?hGHkZwXXRdsWNrRNI/+FgeBPuYtzP3GRQ9hVj5ga1vJx3KMFrrLY/UgW9jep?=
 =?us-ascii?Q?2FRfXJy/f425B8rwzLSvk4d1H2qZ4AEuD1uLN6OK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42eb9163-5c24-4e1a-3302-08dbc3620d10
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 16:10:09.9205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tvDogWgHKHjBxGOoNOdygqwJ8I8AKXKzScbqtshStmqwtz98GvK4C/Xuo94Geeguut0FZkMwiEJ7bG0VOFjeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6461
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 1/2] Revert "drm/i915: Abstract display info away
 during probe"
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

This reverts commit 9532e38d04e5b72b37475ec4cc9ebd1b378d2785.
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index ce55b968e658..a6a18eae7ae8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -926,7 +926,7 @@ void intel_display_device_probe(struct drm_i915_private *i915)
 	else
 		info = probe_display(i915);
 
-	DISPLAY_INFO(i915) = info;
+	i915->display.info.__device_info = info;
 
 	memcpy(DISPLAY_RUNTIME_INFO(i915),
 	       &DISPLAY_INFO(i915)->__runtime_defaults,
-- 
2.41.0

