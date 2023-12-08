Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EE3C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946FE10E9D9;
	Fri,  8 Dec 2023 06:46:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA5510E9D7
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702018015; x=1733554015;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=yf2451FufAI7FoBlZhIieF5uzJELFaC6e/ROpqJklms=;
 b=myu0Tvr9PouqTk4wDTVRf4Y/geU0Ot4Ubfr9lukj6mAVCMPC5IIVV8Jc
 EOj8r+u2SlDOs9ufBhRwMPsP2txYBKp7ejvOJuOcAfYsnwxeu1g2IvBjx
 I1Yn0LJEM7aclb9Ndm9xQdqXu41ioQbxceja8aRf43Ex3qbMk7vnMk5ZS
 JhH6X60skX8WsFf/RfKVngZ4DQAI/Atv/YwoUkhpplpAZsYAUXgb47dZz
 o2UfbUNxnf0qru6icEQ8bgWQPBicEhxYR9JSdY6U0Suw0NjCeWpxmJ8v8
 X7kLDZQfpokAvsnZKUmKdKAwCkrVaQus/HzeB4NtKQ5vdBcnmOc1qU+Fk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460844132"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="460844132"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:46:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765386932"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="765386932"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:46:54 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:46:54 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:46:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:46:53 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:46:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFmshEGzSmpLoZg2RrokuH6BV773EMXk4VlN/S0biKHnGx04HX//G/ugKwpVpACJAYB+ZgbP9j3xiubzyq56BgA3woxe+XBmRpRevTFccNWBLEl3xUto65Gyn013vY6j9GR3dqv8V2faEhFoj+WX8JuxQ58G578R1+Jn2GCihcJGeVgL6/WRRBEbfg4NDSiQJ1qdrUke8DTdu9I17lJpkTNyN7qIlE3wA41iJni46EuTroLxIgTTzMgLpB1N7MefpTGCNb+55e6N6HlMs9Mu3K2ogHe1GfRT39VAeEuptz6zHJipCbJV8If5ADwq4Wj2Qo+4GevJXfcNDlopqmBdLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwmGepWIzoW4XqVjQ15SMDIyx/9kWzOS2RtRmyByM/Y=;
 b=OHOapvEPfC/t0RIs8wCDEIlc+asfOBizi8iM25HBhhX0DxfP336w3BxGLS0wZiHS7WMZheObI//6+O+kvV4y5OrzGlk3OyDfSTXW64TFwKQoIyyuSEcbP0/Ygknt4wHLS5Re4p2llofmY3LdAYaTkd0OyCUt3ufPtqg4BIfHKkM2i4BZNkAaVqjlpu69JpMPL5sd9QqZ88iD5h+s5MEYMypsGSETw0ORPCDQ6nCt1NUUYKJvel/F56wj1k9Vx9NIiaYzv2sXvqaQ4mBQTCF8RQ8ooc3UXdD7mtu9uiRo6jQou21uk3Hfj9VUMwdSBO1bAmieflqu5A1DYrItennGlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 06:46:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:46:51 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 02/16] drm/gpuvm: don't always WARN in
 drm_gpuvm_check_overflow()
Date: Fri, 8 Dec 2023 01:46:29 -0500
Message-ID: <20231208064643.877688-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208064643.877688-1-rodrigo.vivi@intel.com>
References: <20231208064643.877688-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0010.namprd21.prod.outlook.com
 (2603:10b6:a03:114::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4831:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5f548d-a450-4580-cb8c-08dbf7b97584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: piF5RhN+3wjJ6HCvx/YW93bYarcJxngQiXugIz5ugGK9TGDSbVEWAwwTT1CLrJo21Riy0wol4yvg4Uq6j3VZAUbNdOH89AoAuTTw2F+Ld0PaFCNAJggs8mUpXp8E+Ks/s3uiibBMSaJ+004CSVe1xM+F9L0mfQfegmvGj18xkUO8xZ2FvFabn5Nsv3x/i2FIkkP+RgMC/+Nzjd+2xXKlC0EeKGueFqMWts/P5SEhpmYXBe9B6YFZsI1MP0c2k4IeDypXgeMxPGst2NIxOjugGMYvC66Z3eQXm0szBWV0kqYg1PGYVRXNK2pYUKfdFajpHPZBdUYyocdhMic4CRwlfzlWrV+1akDG9AT94hxQuX/J8FlPMYbbcjxorVH35x+7/zqYlSVqPYYjXtiC7AiAhMP7AhL4psByu5sdZZ0F+EY/AxyA2WQAD8obvp7qGv708iboD0nKaOb5vd0l2BtXsCBgivwzr0l8mhIBQ3+/NHLF49naiBO8DqeORnGPBocHQmdU8rjWiUlSEurNxep5ctaB9rBa7r6DCPM6d6XLi8urkxec68ozQUNVtCROJqeC2uqAaGz2aeEQw0oguxQu32qN4TJRT/+Yb6FZF1pAi2c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(8936002)(8676002)(36756003)(86362001)(44832011)(41300700001)(82960400001)(83380400001)(6512007)(26005)(2616005)(1076003)(66946007)(66476007)(66556008)(316002)(38100700002)(6666004)(6506007)(966005)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFZuRkswSHdrcThFVlFDcEZQWXVyTGhXVFliTW9ZaXJPWWZXeHZ6VW9HTWxj?=
 =?utf-8?B?a2ZPS1M5WlVneUVGM2owbDVTTWpLTFRad3daTkM0U1hic3NPcXN1NmNtYytz?=
 =?utf-8?B?SGJvTWZ0U1ViVFVqVkdnZkMwUnJCNGtaTVhGeHhYR2FJeityZGJickZmRUV3?=
 =?utf-8?B?dU1XaHFUaW56VGwxd2Z3Q0wyV25HdnhYRCtwQ1hUUUMzTjgyVTF3M1F0Z09j?=
 =?utf-8?B?bzh1dUZVQnY3SkJrM01sYVJvd0M0ditwVEJpM3l5djlYbU9vbkY1aHNqQzlO?=
 =?utf-8?B?M1Y5Y1dDREhIUmtRbnU5S2tsQ0NSc3JYMFRPQmpjSlVudWtXb1FKbk9SZ284?=
 =?utf-8?B?eWtZekY0QlFqR3UzOVkzV3FTZThEUCtncitMUGVVNENvTkZLMjMyRmVncDRa?=
 =?utf-8?B?aGljeXhzcm4zZ2QxODArNFFxbEEvOC9WT1lsQXFhSEt3TWdacUZ5NnZocGxW?=
 =?utf-8?B?eUpyYVFqbktJN2VlQmdsa2d6OG5VT1M1N25lNWNGLzltTDBHNFo0SVV5TDRD?=
 =?utf-8?B?cjFZL1AyZTkxczFPMlhpY1dRbzRRcUZFLzRwR3RyaXdOUXhrTDdyZnhNZkJG?=
 =?utf-8?B?OWFxMmhVam9oNTZ0TDRUcGhQMVNCSm9NVEE0ZEJpV01jenFYajd6VXhHQ25C?=
 =?utf-8?B?U1U0eVJzNnkxVlZvVkJKaXE0TzF1cnNzTkcwTW9taUJNc2lkWEUvYUlaMDBm?=
 =?utf-8?B?bWZtajVyMXJnaW9kUlg5NFNGaHZ4MWJJWXNNR2lZbE9mZGl2MU4yRU9ab0pw?=
 =?utf-8?B?bTRkeDZ6YzJQMDRBcjZnalBFNW15WUtaNS91RVBMWEdURjhCd1I3S3h6NWR0?=
 =?utf-8?B?ZzJ5TTdiVWJVVElFZWpwSzJHdkkxWEJIRVZhNGtCQkMwZnQ3ZFNzM3Nzbk5V?=
 =?utf-8?B?VDRTcTJCV2Rxa21zZ1NjcmJMSWxrRmQ3K01KNjNZRXpLc3VEcEJIeFNFQ2dP?=
 =?utf-8?B?cW85VnNBOWhsYitIKytXUi9mK2hOckFTVTIzZlJvOFBZNUs4Z2ZwVVM3aHJG?=
 =?utf-8?B?czdYRkF5UmNGZ3dGQkh5Zk1VS3VZaWQ2dmdXQUFSaVZ1cHZmMWdUaDd4a29B?=
 =?utf-8?B?MVlxUUN3WXdXMTlwVDROVnVsVDVVK3pzdmVUUzErNTF4eUVwb3hGcWVKbFc4?=
 =?utf-8?B?cWZRUHRnUzdYajdnRExoMnp2QjI0UjdBNEVHM3FuUUxVZGhoY1Z3L0NadHd2?=
 =?utf-8?B?T3pUMHBWbkJ1WXoyeWx6RjMxazVJblFBdldCUlV6VDBlUWhHalJxT3RkZzJu?=
 =?utf-8?B?aTRMTHQwai92Qy9aaTJuQVJPWksrSlNhTGxCamZoWVZjejlOdUhTL1RINit6?=
 =?utf-8?B?OHVHeHBPa2ZxQjd6NThnSm9mV2NaeGVQUnJIUDY0RE51K2NqaVBDdUliLy81?=
 =?utf-8?B?MDJxSVJYaHJ6U3NUWDZhS2JIa0RLbjhBMERDMnlBNElESDZTK1lkZTdmWnd5?=
 =?utf-8?B?bHdISVIrT0ZhT1pDM3RzVWJiTkYrT1FTMW00bTN0RnAzREUxSkxMMzRPbVVp?=
 =?utf-8?B?MmkrdWthMVpOV2ppaGV3WXljdkQzVXFVOXlpeVRSbE8xTnpwNDB6SFVoeXNI?=
 =?utf-8?B?NEdvZ2pFSmo1c096TjE5ZjhrQ1hyY2NOSG1Vak92ZnFVdGJweEc0R0VjZlJQ?=
 =?utf-8?B?RGNPcmpSekVvMUV0eVY1WTVtUXNTZ1BDb0tndkg3N1JLNkFsTHNZRm9GQ2ls?=
 =?utf-8?B?ZG40cVZjTGRNSkFIWkNUa1RUQnIxYzc5dnJZOC9CU2J1eXVpVGRVUHdsUDRM?=
 =?utf-8?B?allmc0NBN3FmNVFCeHdUVngzNGZicDhPUnErODh6akpsQ28yUmZWTjYxUkY5?=
 =?utf-8?B?K1F3ZzUxTkdPbkE4MStjZnZBRmJmcEdReWZTdkh6bUxYODRpVGpzdzdyakph?=
 =?utf-8?B?WUQzSGlZTS9iSG9jUXZ4bGRka3prTjRXeWpiSnNyYmRmQWs4dVpsdEtiVkF4?=
 =?utf-8?B?enE4TzNpOEwwejNLS1lBdFBvWXBJa1c5MVdLU0RPRG1zNERRUWx5bTA1eEJT?=
 =?utf-8?B?RXE1UmtiaVVIMWhlNDh4MXl0VFZiYURtbGFsYUxFdTEvZFV0bGpLLzF4Y25n?=
 =?utf-8?B?NDVOMCs2WnBabG10RGRRWUpDNzRKem9CcTRYV3puN1E3aGxQWkVRNU4xUmpn?=
 =?utf-8?B?V3RBbThwbzhob0oyazN3TXRHV3YxQzkrbnFUaUJNcEFqeFNKZE51NlVIK085?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5f548d-a450-4580-cb8c-08dbf7b97584
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:46:51.7463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4EWXeNirK7qNEo6JuRJJL3bUAbNYHvehgkPgeoPnQo9/z7eCd6lyhEkt5MUNgSIMh0Uv7n/Z1ZwjE1j4HilYTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4831
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

From: Danilo Krummrich <dakr@redhat.com>

Don't always WARN in drm_gpuvm_check_overflow() and separate it into a
drm_gpuvm_check_overflow() and a dedicated
drm_gpuvm_warn_check_overflow() variant.

This avoids printing warnings due to invalid userspace requests.

(cherry picked from commit d1adea27d0c8a08031b075f1bf4c5ce6f135ad7c)

Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231108001259.15123-3-dakr@redhat.com
---
 drivers/gpu/drm/drm_gpuvm.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index b378554b81ac..1cbeb4169f9c 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -614,12 +614,18 @@ static int __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 static void __drm_gpuva_remove(struct drm_gpuva *va);
 
 static bool
-drm_gpuvm_check_overflow(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
+drm_gpuvm_check_overflow(u64 addr, u64 range)
 {
 	u64 end;
 
-	return drm_WARN(gpuvm->drm, check_add_overflow(addr, range, &end),
-			"GPUVA address limited to %zu bytes.\n", sizeof(end));
+	return check_add_overflow(addr, range, &end);
+}
+
+static bool
+drm_gpuvm_warn_check_overflow(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
+{
+	return drm_WARN(gpuvm->drm, drm_gpuvm_check_overflow(addr, range),
+			"GPUVA address limited to %zu bytes.\n", sizeof(addr));
 }
 
 static bool
@@ -647,7 +653,7 @@ static bool
 drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 		      u64 addr, u64 range)
 {
-	return !drm_gpuvm_check_overflow(gpuvm, addr, range) &&
+	return !drm_gpuvm_check_overflow(addr, range) &&
 	       drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
 	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
 }
@@ -682,7 +688,7 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	gpuvm->ops = ops;
 	gpuvm->drm = drm;
 
-	drm_gpuvm_check_overflow(gpuvm, start_offset, range);
+	drm_gpuvm_warn_check_overflow(gpuvm, start_offset, range);
 	gpuvm->mm_start = start_offset;
 	gpuvm->mm_range = range;
 
@@ -691,8 +697,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 		gpuvm->kernel_alloc_node.va.addr = reserve_offset;
 		gpuvm->kernel_alloc_node.va.range = reserve_range;
 
-		if (likely(!drm_gpuvm_check_overflow(gpuvm, reserve_offset,
-						     reserve_range)))
+		if (likely(!drm_gpuvm_warn_check_overflow(gpuvm, reserve_offset,
+							  reserve_range)))
 			__drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
 	}
 }
-- 
2.43.0

