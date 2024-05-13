Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EDBC25B78
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 18:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A0810E8EC;
	Mon, 13 May 2024 18:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aAD76mnN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5553610E8EC;
 Mon, 13 May 2024 18:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715626557; x=1747162557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vRQCPMhdM22HKldRARZ3Xc+s2llFtuTFnrrgz4TgFAY=;
 b=aAD76mnN2XyXQ+4RG/7isK6k66NU5gVrFDdLAsMGyS6BD80cRr2FwvXD
 EPaGjPRgUpA/XR3ZlZNN0yadb0jnqk7o3qxr1X1novEfeHVp3zquD6+Xi
 M8Fiv3kKLXywVMw9KELcZmFX8cLH7fKmPSTMiPuu/iar3P7LFuwwhxzB2
 b/r3q6pX6NkVcxYqNF2Bz5kUk3CWDw17lvmDQ0WURFTnwkxwRuvkmTHzq
 5cT43zJ5+hNDH784L/jYF8SbpiVlIKKg/GD4eJQ1NQW15ggeAP3Y/Y4f2
 AyGE3RgPqV9gnlWNcnomiDIOaZ/uFcAiVS18FQLe670kefJC+rT/OdbZr Q==;
X-CSE-ConnectionGUID: B27ZoosJQDmEEYbATxXQ0g==
X-CSE-MsgGUID: 1qskMgoPTCi8RthHOHW67Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="36957243"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="36957243"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 11:55:57 -0700
X-CSE-ConnectionGUID: tShXQiNMT42iNqznQbf0/w==
X-CSE-MsgGUID: fpo2KhJ1QQqgkje0kwwbcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35311519"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 11:55:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 11:55:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 11:55:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 11:55:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAV92pwnJocIGX09DYmpZbq7CTs4q8z7/gqjM0jd80H9qHTF5PkTytpwuzeW9PM+NrdKszBE3umAUgcvjP1pqdQI20MphfUUUgetepb7R0xUgfnHFUOi2X/3NP2mGRsXPgB1tVY+Ye7gj1Oe6RxAF0/U8unH20c7UWk38djvxdyjEdlohike/97HOsk17LHGQ6V0AcvYtb0b8M3rJY1aYp/5GbObgSyEjnYyVPOSFJA0m/8GGECVivALDt3PZYBVccinxp7/uHPh10T0/1Mw8v6271plK/pMgVhNAUW8px7vPL4Lnf9BdplEm9ZO+E7D68WisfgZLDE4a/nDFPfFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnao+21pCFpOJfvgiXl8JsKypiHZW1/FSqISU+YbJ04=;
 b=J3O9O/0XuG7dN189prK1mCGeYtYh1hioPrvxOTmPnMp3mVNwiLg2jSa3yl0mIKpxb88nFhXV/VVZuoXya5Cds4ytRqDlVQhb55GAQ6wfieQjPCqRrEgd2fSyL9WhbQOQAjGnotBbCZD3RuvdynB4qfMCPZN5C8s1Z+0z1KY4itYPd6w4pa9eZtgiobcn9EvC9Kv+qtZxUZOOYEEo0dju1S45AOBPTmteaioyR1gaN3eXwJhQy/9KYh1/bezJf0mbvzT6ypZYawgkDe7sfndCk1Zha2ltrjBW5UlHk9AGsBgTvagoq31Ppaa/ztoK+fyI4X9zLx0wpiHPo+Mk8P5UiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 18:55:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 18:55:53 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 3/5] tests/intel/xe_pm: Also disable display for
 mmap_system test
Date: Mon, 13 May 2024 14:55:16 -0400
Message-ID: <20240513185518.772398-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240513185518.772398-1-rodrigo.vivi@intel.com>
References: <20240513185518.772398-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 90db2014-b6d4-47a2-35d2-08dc737e505f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GpDQkHsgD67Tr4Zly/E8v2o+2ypmdNJWavt5JNTZTIg76IkRkFlztjFN4bLc?=
 =?us-ascii?Q?8Sj5rTpToxMUgr/1xdm9A4me+y4DF9FpvhOM3VNbwLZzsJ/60pyVvZ3zMZEH?=
 =?us-ascii?Q?C1+lsBbjiv9RKg1bgodIGNTIznxECp+wdfnVb0i3WRMAdIt2debffmHtGgNY?=
 =?us-ascii?Q?TXiW2rKvzh8pkRXfmQeM17Exq0+5kFnRfiYkkx4EinWq2kAsGQ+HMRndUjiv?=
 =?us-ascii?Q?k+Xenmwx/oviD4lffYaPGvlBfQ3xx8Ovh5LmABNRfu1ytM5132AaMAc2R8v3?=
 =?us-ascii?Q?htu4QyldnWyi+GvPhLgtcOx5lPuhjC5qZJW6bjxfV85ld9OxKSeS/YF9J6yZ?=
 =?us-ascii?Q?oGnI21bDXixaTVT8YYt0hGnGZpV485lrAkiABb5eb+VIxukZPUKKzEKFwOFi?=
 =?us-ascii?Q?O35qL9FqNUCc4zjwhWXtZffqoFhiqdTjJR4B46x+yJW91+Ek2JElp8q6aXgc?=
 =?us-ascii?Q?Ge5FZBuIBe+WYiyuUTCR0a3zK7zziZlKhxASuBCUoDhKUeljPqeNdfw4sJ4P?=
 =?us-ascii?Q?4RDB9lcbsD8gf0pH8+RUOFE5MkK6nwST0/n7eL3diQ2hVWtA3GSel44SZ6z9?=
 =?us-ascii?Q?x87cXoal3Usv0fsQLo4jbwUDLWQ8R2qfaocqjLRJSyf0icpfWY+J8BuWnU+Y?=
 =?us-ascii?Q?YZQNFFz+ybM02OH3oR9s1K7PlAIhFlIk55VBs3WQ5YV3TA1wRWMp41mlyEZJ?=
 =?us-ascii?Q?EudhsxG0DpyKtMZsJoWVZdUgu0kovonqxO59zooEfwZWtP8MQ2Ytbc7ilmuW?=
 =?us-ascii?Q?Ic4MvaxYKAsY/Ft1RUPKNxL4G7+1PhMScxV11Sxo4PAHKC26C1OIIWMeG2kF?=
 =?us-ascii?Q?J6c+BUzjHJuGCvJlXhKVvlpEaw/bGRq6m2jMZCZH0aRfzj85bPhsWuqIdK+8?=
 =?us-ascii?Q?1we5j2Lv2dv4KREbKzT2J1i1/pN/fh6odB6PCx5T/jxJhYC0F5yQ20eKGhIf?=
 =?us-ascii?Q?88m2gAaeRtzDRSNRXH5/24JI7vCu1a76xNrIN8Mr+KeWkJfle3TgO9g3Tgdh?=
 =?us-ascii?Q?PItxyYSZjOCeFJV2haG9w8FztpfvmBS9FwAYt3Kn2/ycWHf4Fa/WtsmaFnlG?=
 =?us-ascii?Q?Q5/0bRMbd4lEqol/wOzz1wLBytJNjkOKlj1vHQM6X50SWxPgHX+v8JZPF2AA?=
 =?us-ascii?Q?4kKMJo1iu/c5ZJEW51MoIAAlhVHfkMBbFsU2PbSVwczfg5eqgOtmkku/h7Va?=
 =?us-ascii?Q?BcTyvoB1qSEqtJGmtXz5A8HY9NaSsMHQTy6JA/27GlVPXpt2jmMGKHyBqE+9?=
 =?us-ascii?Q?x3F81m602D2OJ7z4+YAHUxQTK36xz+35WKeGJX3YNg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uGRXDMVbBLJprgc7I9KbWIJZuFzAUto89mOr4pQPXa96MrwjVvQC559qXeM1?=
 =?us-ascii?Q?VizyopUFPyEn6F9c6NFd2iSgT0SCGiWHKItyuxice54E+PTpgjCyadWCcILc?=
 =?us-ascii?Q?10IpB5ZKf9IB1Ky8K3qr8OmBvDXik4dPwHK0pKCE9NcnSMqER5i5XuoOAQmq?=
 =?us-ascii?Q?VeHU+0TqV2PwU4Nm8SVvEWQ9wgYMc416vYZX1vE5wy2uJXFgaEWMo8e0YhfO?=
 =?us-ascii?Q?tpXIIhUm+U9O+Qiui8uTAHqHyzew2cb7SJ5k9Ve2nxxUgmIxMeR8ZKaPYv4/?=
 =?us-ascii?Q?3KaM40LuG0i0qEuUlj7xPmlkhCC3ArXHt8vzejWd74BUJ/qu0Kce/YyjBCnf?=
 =?us-ascii?Q?i5XV7nPX9zLykWxiSc3dNRjDilSIEGvZYhhHAvV90WBY3di8kCMa+uqodQxE?=
 =?us-ascii?Q?TgmcvDAAfLKJwckj0l9xlGNrZgHdUzDHTuK2Idlmh83nkPOVO/UEi0PFHANu?=
 =?us-ascii?Q?bIwO3Jp4cBlormkQjkaN7Sq5vmLL0hoRJXUnR7/3OO1olGlc2B+plRkcJJ6+?=
 =?us-ascii?Q?QC0cdNXBtqYcOOjuOCNTKmCQAD7JwMCtZvrHp9rZ0mxGh02lGSqOguOxwAlP?=
 =?us-ascii?Q?FwVlBhKAisEbB3QFNDRIDXqCItVDzHTQlw64xK4ZjRTanfW2lTL4hOk5MjVs?=
 =?us-ascii?Q?uXxH4MQm7w9IGGAYszOe2XTs8+wsLA1xDI04Ao9m8UPtbByTvQHghOVbWoPi?=
 =?us-ascii?Q?DSPR9ftBOLUfaL35SIisKfabg+sqWc6ntiUmgeTmSPZurbe2GIwYFuoESrbZ?=
 =?us-ascii?Q?zYwZcStfZbxDcOP5Ql6hyv4YT0bs+nT8EuZOngik7jTKj4URGcSA0f8VAIj/?=
 =?us-ascii?Q?RVqYL+b69JDLr6M0llXirbX3jEokfxWDctLfB29/G2nmYOn90iUDgS1DbKcy?=
 =?us-ascii?Q?hZZmmlVAoR6Lu+62fE/fhhyqvJubpvZkcOimjUDAXncR66iOMml0K6w09LtW?=
 =?us-ascii?Q?Jxsul7p0BoFMiuNsh60+bbmy7oMLHfh4+J4tjTu0ByLED+G0u2mySvfUzWR2?=
 =?us-ascii?Q?8qqGUO9eTlrKI/jDkWWNWLoYtJicoQMGSz1Yf8WkKYVz2mbx2pIbRYMj6vCK?=
 =?us-ascii?Q?fZ7nIBK6/9Roh0yH8NmyGSb+8noMUHQKOYfy/c9KWpc6jFMljzmHuvMKAcls?=
 =?us-ascii?Q?nY2Jwh3NCOwWl/O9Q+yiY3ICHzrttYeL0KeW61gCsKOtZ5WJ6gqLmI9PR0bx?=
 =?us-ascii?Q?KBwS/6RxCa4Nuz0HdxNEvgv0O+O6Pm1dlha+q5DUwrWeo4jOqHvzJYUpMLiT?=
 =?us-ascii?Q?rIAfO2WhnaPE6CyY/pP3YgNnU2BQSf4RWA3Q0+Vr9BXYh6oy3Abs7e0Nrov+?=
 =?us-ascii?Q?ViKEAMx2qN2P1mNbbesHuh8BWcktU7yt0Lw7QapURHRZJmNHC1Ys7ss9uBc5?=
 =?us-ascii?Q?CQiNvmWpj23HDoahYT7CHrnm9+V66p7YGnmpC/fJBGaDPGftcT+YOD2llR/a?=
 =?us-ascii?Q?f11/MWdUGf1a/taViBOrogQD5uJQrw4RhPH6BkQ+B5ijKZ5DGlXI3JKR5Dog?=
 =?us-ascii?Q?QHRNBoiw12/jPEGnFFdiJWqzvbvmbeSD7AvtrYF4xaD0oZ4l0Ewt0y9lpGhp?=
 =?us-ascii?Q?JS2Zcdn3XTH/JJuXusOTAwA8hCdhKzW0W/s9xllc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90db2014-b6d4-47a2-35d2-08dc737e505f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 18:55:53.2487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJpPoQiEUiZDJzJ3nuBMZ/cx1laOLUnOeS50bP+fgFT7coCA2ef+oGpsG+2oyyHPk13gUBDtTpa1VEJGj9LTiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
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

If display is enabled, the always-on components will always
keeps runtime pm references, unless you put DPMS_OFF.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 3f963bd9b..72d484163 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -780,7 +780,9 @@ igt_main
 		igt_describe("Validate mmap memory mappings with system region,"
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
+			dpms_on_off(device, DRM_MODE_DPMS_OFF);
 			test_mmap(device, system_memory(device.fd_xe), 0);
+			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
 		igt_describe("Validate mmap memory mappings with vram region,"
-- 
2.44.0

