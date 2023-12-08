Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E98C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB3610EA0A;
	Fri,  8 Dec 2023 06:47:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D913610EA0A
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702018058; x=1733554058;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=pPjobZ4AWpsNb/WQcjLXfLxpeUUurcL7l3gw8SWzkYU=;
 b=jEIW1Bjb9i9l++LbDPsfMx/eHTZp96hIG8+LNSLKybVDT7EjmcqvyzXN
 mSbDfeQgXiVWJ05osT/xBeGIFfYNqKAX200+oRxPiQc5X0atGk2UBo9FX
 JX3Ce6SNR0EmswgrwSpwOoWEO1qhaZzrfZwMRff6LJMLAVGy2PIvvUN8x
 nZnPZca/CQE87RLqKDnIOiMTo4YeJUtkUK2wpqngo4f2ADHFMXBiaMdyI
 eTIdLckTflBkVlI3mRvkv4dS3tXHFzRYyd8aK8CiKaPIH2b9gNilIolFt
 ZV81N2O46InF8rc9a+nk9NSqspNBsDsQsi6nW2+FGEEZ8NNdAkZRf3LSN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="397154043"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="397154043"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:47:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895421191"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="895421191"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:47:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:37 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:47:37 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9vL1m2YSSw2eThp/fPUbDA7GK48f0up4i2Qm7nKo0gG1iJsrsR3IoAbvCb+OFefYvpPv0jM59oeaEds6YblMQwBVEBzMS2F2G/CD5XHgaoPdfA7nGH10elCrBsTlLe1QlDwjzS8L+V53KEnxxXUhb1kpjEEpq5yjKtkMPThC+a94iA4Z8XC1CsesNPbu/KPGaKp+2k8zPATO2G7a/I85IPe9hQ+Kx843CQoUnBXKVABba9fuYNk75GqdGVwgpgfHMOeKfORph0DAS9RRF9W2MxCj57cOKeUljOrR9kt/3jNQv5ITWdAlLybqjoP7bPfuoaPog/Felnw3/9OnN/BVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJCkMLbhS6aWuRPQvMVlQ6YML+twSRSk8uDU/98qs/Y=;
 b=MPHh/qKzJDJM2Opz+OlXIhkIAC2t+2ajiay809ouJI/RebvbMWJmQQHEK2buWXAKd8YaOTrdry64pu58Yi3TQvKobpT9Nx5zkN6C4NGg2dFcj+ZIB/duXIQ06Ar29yLvyCekZocodPifkSOy053muEifxTmQNal7wZEDRch3Ps9V5dqYtwFFRSlO+eMyw7TNnNsrRv0upPUbb8SJKEnnrd1K7lSfV7kPtrUL9R4gOerPFtwKKKynLiFwLCpAjIaFn6KwCWCwkTd2/RZF7CtWe+j3gxumJID9XpcKiWOMkKy4ooZ/DlGUfs99TAkxLq5mOd4ixY3dBUe/b2Lr/vcU3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 06:47:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:47:16 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 10/16] drm/gpuvm: add an abstraction for a VM / BO combination
Date: Fri, 8 Dec 2023 01:46:37 -0500
Message-ID: <20231208064643.877688-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208064643.877688-1-rodrigo.vivi@intel.com>
References: <20231208064643.877688-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::43) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4831:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c39a8d-a5fe-4fe7-84b4-08dbf7b9841a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v3ANZ2W5Pv+2WTGw8rz6lck/5JjciQ7F2gqGj9eNLbIdWm3ynJHqvCocqi/pUL+2glTHPWT9jxYJhUj+mlSMUcXqkU1zNXwWNPlAJMoPmfbWH5hDmW7GxF4lIksuCMH38zFUMJ+uub7TuGydg8pCbQUBdocDRYQHShSzmqEVtRTU5UABgspvxAaEuBlgmEZDdDDrKzOcZ8hsVyCyAcm0S45LitUUh9MVVK1SEug62UmmbOX2TBoLdXRboE49KxcMHicjr3fA9gb4oyT8iFUvGHzwFlYd7i3G4yK3QRxqGXqKikYEAB+pRSHai72e6abDZN+SJPtGr4rLRwAPL2MzVCm016XCYEa7dCbdnBJUR13RbqJd5mzVg+qy5tQxhHqfV3sB8TcaWQ1aKIRxqvLyej+7XxFuo7pTkIFlG4nGoJN78wgp/qqdVwzxl8JF3X2tUEJX3syKZ0GkZjdLOC+6Bd34yZFx1hB858uwVWtsFEbHBbUbU0V2L1H+napRz6/W0i3PCleQ3ZrXqywbEj7VwogPlZFpxwv6vuspTVvnFsRQZ+Ho8tu53V7bcMb+6bgSNNmnKnUUgGwimxWwgi4YL/cdU8pzM75H/0d7F1vqoi4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(30864003)(66899024)(2906002)(8936002)(8676002)(36756003)(86362001)(44832011)(41300700001)(82960400001)(66574015)(83380400001)(6512007)(26005)(2616005)(1076003)(66946007)(66476007)(66556008)(316002)(38100700002)(6666004)(6506007)(966005)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlZETCtveU5tR21icTNoZ2x2ZXdlK01VMnJod0gyS1lCY2dYNitQYkE5TFFG?=
 =?utf-8?B?clZtRHFaUGN0SDBDOFZoeFJmdDRsQWpUbXNMc0MxZ2NIYnZkSXhIKzd1L0RT?=
 =?utf-8?B?aTBIajlMWVp0ejJWdS8wcExpK3luUkZTKy9HYzQ0MTN3ZzVpZktpN2RST256?=
 =?utf-8?B?UEVYTVdoSjhlbjVUMC96YjlkZE1IWFlMQ1lDUjE2bFNGbGNpeU1neDdlU05w?=
 =?utf-8?B?bTNybVVtMlhka0NJRUY0dytvWUNiRXZiUWZuUUZnTEhiYitxTXlGM1FQWWpH?=
 =?utf-8?B?dVphN2Y0RFFIZmt3V1NQVjdOdWhHaG1HMWx2UlR6c0xDV2tMYzdZd1dOWEg5?=
 =?utf-8?B?UER6bTV5SkxpNTQzemxIQ1VhQXNCQm5RaXhNcmRud2psS1lrVE55K2o5ZE0w?=
 =?utf-8?B?a01BWWlzMjV6ek9wNkNiTmFpbmJNNFl1MTdCa0tPZ25wTVhhNjBMbGJGYWhP?=
 =?utf-8?B?MStuSWRwQ1ZTTTBrVkltTWx0b2dkYVF3eWFDVDVlTEc1cnovVnZWc2pJeXFi?=
 =?utf-8?B?b1lLaUMrQUpmWm0zSVJUNXRLS0xkWWo0WHozN2NoVjVZeFVtU00wUzFjeDFx?=
 =?utf-8?B?Skp1cXl4T0QwaVNDeEZrRkhjU2lMREJoM2xXYjg2QlhhZnMxVUxXN2VpdE9U?=
 =?utf-8?B?bmVNbHZacFY4Snh3WHlleXJXM3hHY0Q1T2E2dlE0WklLNFNOTkhhd2FWOCsz?=
 =?utf-8?B?VWRVc1hOdnRXRHBBV0VkRkEwNklmRjFQRmN1akFmVHJqT3QwYWluY1ovenU1?=
 =?utf-8?B?Y0NYUWd1TFUyQVBjZUREb2JCNkJ3a2R4ckZxWWRic3MxSHA1c1B3bzV1Yklz?=
 =?utf-8?B?Uy8vTStpRUlFR0tHM3NYb1ZVU05QNlBDL1NaUVdFYVZXNzNuZ0t3VmlwSU96?=
 =?utf-8?B?TXM3ZEhvTjR3NHYrbUc3RDIydjNGS3dDbkxMeVVlbENzbmNzNzZPem5lVi96?=
 =?utf-8?B?bUxEMlFuYkRZaG5NR2laYmZOWkNQQ3hrcE55czBJbEprNEorTldiRmtHRDdY?=
 =?utf-8?B?SWt4b09iTDFmY0x2K2tFL1hOc1pqZ0cyL0hnaWdMczhjU25hSGx6dXlDWmRH?=
 =?utf-8?B?YXlSaVJRa1pRK3ZrUnk4bHBDWWJTYUV6dmU4RFBsRmtKN0lQYmlwVDJGb2tu?=
 =?utf-8?B?SjRUN1RYNCtKU0k1MGN2cmVJdGNTbk8vUStwTnpTMERsRW16anpSbEFMY1cz?=
 =?utf-8?B?eWN3R0hjYWQ4OHV6akNuQlRiTldwaWhFR3FDMDJKd2xhbkx2Tm5Sdzd4bVFN?=
 =?utf-8?B?RjE2ekliNlJNSkJqc3ZVRUQ3d1FwRkh2ZVZNdWQ5NXV4U2U1ZTEyNnZabmp4?=
 =?utf-8?B?TTBmbVJVeHE4QkxpMkwrMlo2djdGcVlCdnQzbEYyRHEvRDdUTDZIbHpZbVc3?=
 =?utf-8?B?LzlaNkc5Tk0vQWovVGMySDB4L2hBcDFKOXlmcDJJNGRnWS94Z2EvUXJOS0Uv?=
 =?utf-8?B?eW8wMGVUYVhZZGExMHB6dHV0Z01LYjVQQ3FReFIyYmZMb3hUYURZY25RS3VX?=
 =?utf-8?B?bHlCempIWVpPMGltQzVsc2FLYUhPS2M4eFlUL3FXNEVsL20rMkZJOGhGYlo5?=
 =?utf-8?B?RDZrOStKVENNazg2Q2NHOWRlM3orazR3U0lINHZWOXJZUS9IbkhjSkQ5aUly?=
 =?utf-8?B?dVNvaTdpOEIxdFQwNElhMmt6cTFrekRNS0xWLytXSDdlSmY2TzFpVWNLQU5F?=
 =?utf-8?B?WmxUdHlEL2h1WkQvM01RbGpMTTJ5TVhjVTY5TkFlTlRsTnNDMEFBemZtWnZV?=
 =?utf-8?B?bmFTbmUrb1RCVEhKRnhhRy9xc2xDcU5LUXRxRlY0b1RlY3lWK3VMOGVJQUhu?=
 =?utf-8?B?Uy8xQUVhRnZ3QVlBV0RqbG10QkhUU3BySGJpYmMyNUpKV3h3dG5nQzQ1ZGYr?=
 =?utf-8?B?SUdUQUppdG13NzhJdVdvL1lOdlhPUHY2ZmIveGFIbkhNVGR0N2hjdGFTYmRD?=
 =?utf-8?B?RWljOFRtb3hQTDVuQld5UW1EeVhrSklsTGF4RGhDa1FMUTFtTFhKSllaUXd3?=
 =?utf-8?B?NU5sd1pzeUZGZGZ2QnhqVVIrV1J6aEcwZ1YrYnJMVklUdW5kVEs0dkxEN3kr?=
 =?utf-8?B?YWZ0MU9yeXp0ODNLYWFlZmRZUGhwYVlwNGZSU1g5R2h4UGQvSlRTUDVLdS9n?=
 =?utf-8?B?Y2duUkxZK2lzRGNESUVuZVRNVW9EMXppcWFjcWNJTU5XN1BZTHRzblpXOGtV?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c39a8d-a5fe-4fe7-84b4-08dbf7b9841a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:47:16.3247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHEntvIPDoriGeS0aYn+QSDPqobnDTAbYTxDtkd1x5+oFLdWrlmlOsywu3DArxBzCg2sP/bsagdIIWbIPHlOUg==
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

Add an abstraction layer between the drm_gpuva mappings of a particular
drm_gem_object and this GEM object itself. The abstraction represents a
combination of a drm_gem_object and drm_gpuvm. The drm_gem_object holds
a list of drm_gpuvm_bo structures (the structure representing this
abstraction), while each drm_gpuvm_bo contains list of mappings of this
GEM object.

This has multiple advantages:

1) We can use the drm_gpuvm_bo structure to attach it to various lists
   of the drm_gpuvm. This is useful for tracking external and evicted
   objects per VM, which is introduced in subsequent patches.

2) Finding mappings of a certain drm_gem_object mapped in a certain
   drm_gpuvm becomes much cheaper.

3) Drivers can derive and extend the structure to easily represent
   driver specific states of a BO for a certain GPUVM.

The idea of this abstraction was taken from amdgpu, hence the credit for
this idea goes to the developers of amdgpu.

(cherry picked from commit 94bc2249f08e141fb4aa120bfdc392c7a5e78211)

Cc: Christian König <christian.koenig@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231108001259.15123-11-dakr@redhat.com
---
 drivers/gpu/drm/drm_gpuvm.c            | 340 +++++++++++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  63 +++--
 include/drm/drm_gem.h                  |  32 +--
 include/drm/drm_gpuvm.h                | 185 +++++++++++++-
 4 files changed, 534 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 10bd15822b9b..02e7cfcb8063 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -70,6 +70,18 @@
  * &drm_gem_object, such as the &drm_gem_object containing the root page table,
  * but it can also be a 'dummy' object, which can be allocated with
  * drm_gpuvm_resv_object_alloc().
+ *
+ * In order to connect a struct drm_gpuva its backing &drm_gem_object each
+ * &drm_gem_object maintains a list of &drm_gpuvm_bo structures, and each
+ * &drm_gpuvm_bo contains a list of &drm_gpuva structures.
+ *
+ * A &drm_gpuvm_bo is an abstraction that represents a combination of a
+ * &drm_gpuvm and a &drm_gem_object. Every such combination should be unique.
+ * This is ensured by the API through drm_gpuvm_bo_obtain() and
+ * drm_gpuvm_bo_obtain_prealloc() which first look into the corresponding
+ * &drm_gem_object list of &drm_gpuvm_bos for an existing instance of this
+ * particular combination. If not existent a new instance is created and linked
+ * to the &drm_gem_object.
  */
 
 /**
@@ -395,21 +407,28 @@
 /**
  * DOC: Locking
  *
- * Generally, the GPU VA manager does not take care of locking itself, it is
- * the drivers responsibility to take care about locking. Drivers might want to
- * protect the following operations: inserting, removing and iterating
- * &drm_gpuva objects as well as generating all kinds of operations, such as
- * split / merge or prefetch.
- *
- * The GPU VA manager also does not take care of the locking of the backing
- * &drm_gem_object buffers GPU VA lists by itself; drivers are responsible to
- * enforce mutual exclusion using either the GEMs dma_resv lock or alternatively
- * a driver specific external lock. For the latter see also
- * drm_gem_gpuva_set_lock().
- *
- * However, the GPU VA manager contains lockdep checks to ensure callers of its
- * API hold the corresponding lock whenever the &drm_gem_objects GPU VA list is
- * accessed by functions such as drm_gpuva_link() or drm_gpuva_unlink().
+ * In terms of managing &drm_gpuva entries DRM GPUVM does not take care of
+ * locking itself, it is the drivers responsibility to take care about locking.
+ * Drivers might want to protect the following operations: inserting, removing
+ * and iterating &drm_gpuva objects as well as generating all kinds of
+ * operations, such as split / merge or prefetch.
+ *
+ * DRM GPUVM also does not take care of the locking of the backing
+ * &drm_gem_object buffers GPU VA lists and &drm_gpuvm_bo abstractions by
+ * itself; drivers are responsible to enforce mutual exclusion using either the
+ * GEMs dma_resv lock or alternatively a driver specific external lock. For the
+ * latter see also drm_gem_gpuva_set_lock().
+ *
+ * However, DRM GPUVM contains lockdep checks to ensure callers of its API hold
+ * the corresponding lock whenever the &drm_gem_objects GPU VA list is accessed
+ * by functions such as drm_gpuva_link() or drm_gpuva_unlink(), but also
+ * drm_gpuvm_bo_obtain() and drm_gpuvm_bo_put().
+ *
+ * The latter is required since on creation and destruction of a &drm_gpuvm_bo
+ * the &drm_gpuvm_bo is attached / removed from the &drm_gem_objects gpuva list.
+ * Subsequent calls to drm_gpuvm_bo_obtain() for the same &drm_gpuvm and
+ * &drm_gem_object must be able to observe previous creations and destructions
+ * of &drm_gpuvm_bos in order to keep instances unique.
  */
 
 /**
@@ -439,6 +458,7 @@
  *	{
  *		struct drm_gpuva_ops *ops;
  *		struct drm_gpuva_op *op
+ *		struct drm_gpuvm_bo *vm_bo;
  *
  *		driver_lock_va_space();
  *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, addr, range,
@@ -446,6 +466,10 @@
  *		if (IS_ERR(ops))
  *			return PTR_ERR(ops);
  *
+ *		vm_bo = drm_gpuvm_bo_obtain(gpuvm, obj);
+ *		if (IS_ERR(vm_bo))
+ *			return PTR_ERR(vm_bo);
+ *
  *		drm_gpuva_for_each_op(op, ops) {
  *			struct drm_gpuva *va;
  *
@@ -458,7 +482,7 @@
  *
  *				driver_vm_map();
  *				drm_gpuva_map(gpuvm, va, &op->map);
- *				drm_gpuva_link(va);
+ *				drm_gpuva_link(va, vm_bo);
  *
  *				break;
  *			case DRM_GPUVA_OP_REMAP: {
@@ -485,11 +509,11 @@
  *				driver_vm_remap();
  *				drm_gpuva_remap(prev, next, &op->remap);
  *
- *				drm_gpuva_unlink(va);
  *				if (prev)
- *					drm_gpuva_link(prev);
+ *					drm_gpuva_link(prev, va->vm_bo);
  *				if (next)
- *					drm_gpuva_link(next);
+ *					drm_gpuva_link(next, va->vm_bo);
+ *				drm_gpuva_unlink(va);
  *
  *				break;
  *			}
@@ -505,6 +529,7 @@
  *				break;
  *			}
  *		}
+ *		drm_gpuvm_bo_put(vm_bo);
  *		driver_unlock_va_space();
  *
  *		return 0;
@@ -514,6 +539,7 @@
  *
  *	struct driver_context {
  *		struct drm_gpuvm *gpuvm;
+ *		struct drm_gpuvm_bo *vm_bo;
  *		struct drm_gpuva *new_va;
  *		struct drm_gpuva *prev_va;
  *		struct drm_gpuva *next_va;
@@ -534,6 +560,7 @@
  *				  struct drm_gem_object *obj, u64 offset)
  *	{
  *		struct driver_context ctx;
+ *		struct drm_gpuvm_bo *vm_bo;
  *		struct drm_gpuva_ops *ops;
  *		struct drm_gpuva_op *op;
  *		int ret = 0;
@@ -543,16 +570,23 @@
  *		ctx.new_va = kzalloc(sizeof(*ctx.new_va), GFP_KERNEL);
  *		ctx.prev_va = kzalloc(sizeof(*ctx.prev_va), GFP_KERNEL);
  *		ctx.next_va = kzalloc(sizeof(*ctx.next_va), GFP_KERNEL);
- *		if (!ctx.new_va || !ctx.prev_va || !ctx.next_va) {
+ *		ctx.vm_bo = drm_gpuvm_bo_create(gpuvm, obj);
+ *		if (!ctx.new_va || !ctx.prev_va || !ctx.next_va || !vm_bo) {
  *			ret = -ENOMEM;
  *			goto out;
  *		}
  *
+ *		// Typically protected with a driver specific GEM gpuva lock
+ *		// used in the fence signaling path for drm_gpuva_link() and
+ *		// drm_gpuva_unlink(), hence pre-allocate.
+ *		ctx.vm_bo = drm_gpuvm_bo_obtain_prealloc(ctx.vm_bo);
+ *
  *		driver_lock_va_space();
  *		ret = drm_gpuvm_sm_map(gpuvm, &ctx, addr, range, obj, offset);
  *		driver_unlock_va_space();
  *
  *	out:
+ *		drm_gpuvm_bo_put(ctx.vm_bo);
  *		kfree(ctx.new_va);
  *		kfree(ctx.prev_va);
  *		kfree(ctx.next_va);
@@ -565,7 +599,7 @@
  *
  *		drm_gpuva_map(ctx->vm, ctx->new_va, &op->map);
  *
- *		drm_gpuva_link(ctx->new_va);
+ *		drm_gpuva_link(ctx->new_va, ctx->vm_bo);
  *
  *		// prevent the new GPUVA from being freed in
  *		// driver_mapping_create()
@@ -577,22 +611,23 @@
  *	int driver_gpuva_remap(struct drm_gpuva_op *op, void *__ctx)
  *	{
  *		struct driver_context *ctx = __ctx;
+ *		struct drm_gpuva *va = op->remap.unmap->va;
  *
  *		drm_gpuva_remap(ctx->prev_va, ctx->next_va, &op->remap);
  *
- *		drm_gpuva_unlink(op->remap.unmap->va);
- *		kfree(op->remap.unmap->va);
- *
  *		if (op->remap.prev) {
- *			drm_gpuva_link(ctx->prev_va);
+ *			drm_gpuva_link(ctx->prev_va, va->vm_bo);
  *			ctx->prev_va = NULL;
  *		}
  *
  *		if (op->remap.next) {
- *			drm_gpuva_link(ctx->next_va);
+ *			drm_gpuva_link(ctx->next_va, va->vm_bo);
  *			ctx->next_va = NULL;
  *		}
  *
+ *		drm_gpuva_unlink(va);
+ *		kfree(va);
+ *
  *		return 0;
  *	}
  *
@@ -815,6 +850,199 @@ drm_gpuvm_put(struct drm_gpuvm *gpuvm)
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_put);
 
+/**
+ * drm_gpuvm_bo_create() - create a new instance of struct drm_gpuvm_bo
+ * @gpuvm: The &drm_gpuvm the @obj is mapped in.
+ * @obj: The &drm_gem_object being mapped in the @gpuvm.
+ *
+ * If provided by the driver, this function uses the &drm_gpuvm_ops
+ * vm_bo_alloc() callback to allocate.
+ *
+ * Returns: a pointer to the &drm_gpuvm_bo on success, NULL on failure
+ */
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
+		    struct drm_gem_object *obj)
+{
+	const struct drm_gpuvm_ops *ops = gpuvm->ops;
+	struct drm_gpuvm_bo *vm_bo;
+
+	if (ops && ops->vm_bo_alloc)
+		vm_bo = ops->vm_bo_alloc();
+	else
+		vm_bo = kzalloc(sizeof(*vm_bo), GFP_KERNEL);
+
+	if (unlikely(!vm_bo))
+		return NULL;
+
+	vm_bo->vm = drm_gpuvm_get(gpuvm);
+	vm_bo->obj = obj;
+	drm_gem_object_get(obj);
+
+	kref_init(&vm_bo->kref);
+	INIT_LIST_HEAD(&vm_bo->list.gpuva);
+	INIT_LIST_HEAD(&vm_bo->list.entry.gem);
+
+	return vm_bo;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_create);
+
+static void
+drm_gpuvm_bo_destroy(struct kref *kref)
+{
+	struct drm_gpuvm_bo *vm_bo = container_of(kref, struct drm_gpuvm_bo,
+						  kref);
+	struct drm_gpuvm *gpuvm = vm_bo->vm;
+	const struct drm_gpuvm_ops *ops = gpuvm->ops;
+	struct drm_gem_object *obj = vm_bo->obj;
+	bool lock = !drm_gpuvm_resv_protected(gpuvm);
+
+	if (!lock)
+		drm_gpuvm_resv_assert_held(gpuvm);
+
+	drm_gem_gpuva_assert_lock_held(obj);
+	list_del(&vm_bo->list.entry.gem);
+
+	if (ops && ops->vm_bo_free)
+		ops->vm_bo_free(vm_bo);
+	else
+		kfree(vm_bo);
+
+	drm_gpuvm_put(gpuvm);
+	drm_gem_object_put(obj);
+}
+
+/**
+ * drm_gpuvm_bo_put() - drop a struct drm_gpuvm_bo reference
+ * @vm_bo: the &drm_gpuvm_bo to release the reference of
+ *
+ * This releases a reference to @vm_bo.
+ *
+ * If the reference count drops to zero, the &gpuvm_bo is destroyed, which
+ * includes removing it from the GEMs gpuva list. Hence, if a call to this
+ * function can potentially let the reference count drop to zero the caller must
+ * hold the dma-resv or driver specific GEM gpuva lock.
+ *
+ * This function may only be called from non-atomic context.
+ */
+void
+drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
+{
+	might_sleep();
+
+	if (vm_bo)
+		kref_put(&vm_bo->kref, drm_gpuvm_bo_destroy);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put);
+
+static struct drm_gpuvm_bo *
+__drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
+		    struct drm_gem_object *obj)
+{
+	struct drm_gpuvm_bo *vm_bo;
+
+	drm_gem_gpuva_assert_lock_held(obj);
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj)
+		if (vm_bo->vm == gpuvm)
+			return vm_bo;
+
+	return NULL;
+}
+
+/**
+ * drm_gpuvm_bo_find() - find the &drm_gpuvm_bo for the given
+ * &drm_gpuvm and &drm_gem_object
+ * @gpuvm: The &drm_gpuvm the @obj is mapped in.
+ * @obj: The &drm_gem_object being mapped in the @gpuvm.
+ *
+ * Find the &drm_gpuvm_bo representing the combination of the given
+ * &drm_gpuvm and &drm_gem_object. If found, increases the reference
+ * count of the &drm_gpuvm_bo accordingly.
+ *
+ * Returns: a pointer to the &drm_gpuvm_bo on success, NULL on failure
+ */
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
+		  struct drm_gem_object *obj)
+{
+	struct drm_gpuvm_bo *vm_bo = __drm_gpuvm_bo_find(gpuvm, obj);
+
+	return vm_bo ? drm_gpuvm_bo_get(vm_bo) : NULL;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_find);
+
+/**
+ * drm_gpuvm_bo_obtain() - obtains and instance of the &drm_gpuvm_bo for the
+ * given &drm_gpuvm and &drm_gem_object
+ * @gpuvm: The &drm_gpuvm the @obj is mapped in.
+ * @obj: The &drm_gem_object being mapped in the @gpuvm.
+ *
+ * Find the &drm_gpuvm_bo representing the combination of the given
+ * &drm_gpuvm and &drm_gem_object. If found, increases the reference
+ * count of the &drm_gpuvm_bo accordingly. If not found, allocates a new
+ * &drm_gpuvm_bo.
+ *
+ * A new &drm_gpuvm_bo is added to the GEMs gpuva list.
+ *
+ * Returns: a pointer to the &drm_gpuvm_bo on success, an ERR_PTR on failure
+ */
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
+		    struct drm_gem_object *obj)
+{
+	struct drm_gpuvm_bo *vm_bo;
+
+	vm_bo = drm_gpuvm_bo_find(gpuvm, obj);
+	if (vm_bo)
+		return vm_bo;
+
+	vm_bo = drm_gpuvm_bo_create(gpuvm, obj);
+	if (!vm_bo)
+		return ERR_PTR(-ENOMEM);
+
+	drm_gem_gpuva_assert_lock_held(obj);
+	list_add_tail(&vm_bo->list.entry.gem, &obj->gpuva.list);
+
+	return vm_bo;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain);
+
+/**
+ * drm_gpuvm_bo_obtain_prealloc() - obtains and instance of the &drm_gpuvm_bo
+ * for the given &drm_gpuvm and &drm_gem_object
+ * @__vm_bo: A pre-allocated struct drm_gpuvm_bo.
+ *
+ * Find the &drm_gpuvm_bo representing the combination of the given
+ * &drm_gpuvm and &drm_gem_object. If found, increases the reference
+ * count of the found &drm_gpuvm_bo accordingly, while the @__vm_bo reference
+ * count is decreased. If not found @__vm_bo is returned without further
+ * increase of the reference count.
+ *
+ * A new &drm_gpuvm_bo is added to the GEMs gpuva list.
+ *
+ * Returns: a pointer to the found &drm_gpuvm_bo or @__vm_bo if no existing
+ * &drm_gpuvm_bo was found
+ */
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm_bo *__vm_bo)
+{
+	struct drm_gpuvm *gpuvm = __vm_bo->vm;
+	struct drm_gem_object *obj = __vm_bo->obj;
+	struct drm_gpuvm_bo *vm_bo;
+
+	vm_bo = drm_gpuvm_bo_find(gpuvm, obj);
+	if (vm_bo) {
+		drm_gpuvm_bo_put(__vm_bo);
+		return vm_bo;
+	}
+
+	drm_gem_gpuva_assert_lock_held(obj);
+	list_add_tail(&__vm_bo->list.entry.gem, &obj->gpuva.list);
+
+	return __vm_bo;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain_prealloc);
+
 static int
 __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va)
@@ -916,24 +1144,33 @@ EXPORT_SYMBOL_GPL(drm_gpuva_remove);
 /**
  * drm_gpuva_link() - link a &drm_gpuva
  * @va: the &drm_gpuva to link
+ * @vm_bo: the &drm_gpuvm_bo to add the &drm_gpuva to
  *
- * This adds the given &va to the GPU VA list of the &drm_gem_object it is
- * associated with.
+ * This adds the given &va to the GPU VA list of the &drm_gpuvm_bo and the
+ * &drm_gpuvm_bo to the &drm_gem_object it is associated with.
+ *
+ * For every &drm_gpuva entry added to the &drm_gpuvm_bo an additional
+ * reference of the latter is taken.
  *
  * This function expects the caller to protect the GEM's GPUVA list against
- * concurrent access using the GEMs dma_resv lock.
+ * concurrent access using either the GEMs dma_resv lock or a driver specific
+ * lock set through drm_gem_gpuva_set_lock().
  */
 void
-drm_gpuva_link(struct drm_gpuva *va)
+drm_gpuva_link(struct drm_gpuva *va, struct drm_gpuvm_bo *vm_bo)
 {
 	struct drm_gem_object *obj = va->gem.obj;
+	struct drm_gpuvm *gpuvm = va->vm;
 
 	if (unlikely(!obj))
 		return;
 
-	drm_gem_gpuva_assert_lock_held(obj);
+	drm_WARN_ON(gpuvm->drm, obj != vm_bo->obj);
 
-	list_add_tail(&va->gem.entry, &obj->gpuva.list);
+	va->vm_bo = drm_gpuvm_bo_get(vm_bo);
+
+	drm_gem_gpuva_assert_lock_held(obj);
+	list_add_tail(&va->gem.entry, &vm_bo->list.gpuva);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_link);
 
@@ -944,20 +1181,31 @@ EXPORT_SYMBOL_GPL(drm_gpuva_link);
  * This removes the given &va from the GPU VA list of the &drm_gem_object it is
  * associated with.
  *
+ * This removes the given &va from the GPU VA list of the &drm_gpuvm_bo and
+ * the &drm_gpuvm_bo from the &drm_gem_object it is associated with in case
+ * this call unlinks the last &drm_gpuva from the &drm_gpuvm_bo.
+ *
+ * For every &drm_gpuva entry removed from the &drm_gpuvm_bo a reference of
+ * the latter is dropped.
+ *
  * This function expects the caller to protect the GEM's GPUVA list against
- * concurrent access using the GEMs dma_resv lock.
+ * concurrent access using either the GEMs dma_resv lock or a driver specific
+ * lock set through drm_gem_gpuva_set_lock().
  */
 void
 drm_gpuva_unlink(struct drm_gpuva *va)
 {
 	struct drm_gem_object *obj = va->gem.obj;
+	struct drm_gpuvm_bo *vm_bo = va->vm_bo;
 
 	if (unlikely(!obj))
 		return;
 
 	drm_gem_gpuva_assert_lock_held(obj);
-
 	list_del_init(&va->gem.entry);
+
+	va->vm_bo = NULL;
+	drm_gpuvm_bo_put(vm_bo);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_unlink);
 
@@ -1102,10 +1350,10 @@ drm_gpuva_remap(struct drm_gpuva *prev,
 		struct drm_gpuva *next,
 		struct drm_gpuva_op_remap *op)
 {
-	struct drm_gpuva *curr = op->unmap->va;
-	struct drm_gpuvm *gpuvm = curr->vm;
+	struct drm_gpuva *va = op->unmap->va;
+	struct drm_gpuvm *gpuvm = va->vm;
 
-	drm_gpuva_remove(curr);
+	drm_gpuva_remove(va);
 
 	if (op->prev) {
 		drm_gpuva_init_from_op(prev, op->prev);
@@ -1747,9 +1995,8 @@ drm_gpuvm_prefetch_ops_create(struct drm_gpuvm *gpuvm,
 EXPORT_SYMBOL_GPL(drm_gpuvm_prefetch_ops_create);
 
 /**
- * drm_gpuvm_gem_unmap_ops_create() - creates the &drm_gpuva_ops to unmap a GEM
- * @gpuvm: the &drm_gpuvm representing the GPU VA space
- * @obj: the &drm_gem_object to unmap
+ * drm_gpuvm_bo_unmap_ops_create() - creates the &drm_gpuva_ops to unmap a GEM
+ * @vm_bo: the &drm_gpuvm_bo abstraction
  *
  * This function creates a list of operations to perform unmapping for every
  * GPUVA attached to a GEM.
@@ -1766,15 +2013,14 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_prefetch_ops_create);
  * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
  */
 struct drm_gpuva_ops *
-drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm *gpuvm,
-			       struct drm_gem_object *obj)
+drm_gpuvm_bo_unmap_ops_create(struct drm_gpuvm_bo *vm_bo)
 {
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *op;
 	struct drm_gpuva *va;
 	int ret;
 
-	drm_gem_gpuva_assert_lock_held(obj);
+	drm_gem_gpuva_assert_lock_held(vm_bo->obj);
 
 	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
 	if (!ops)
@@ -1782,8 +2028,8 @@ drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm *gpuvm,
 
 	INIT_LIST_HEAD(&ops->list);
 
-	drm_gem_for_each_gpuva(va, obj) {
-		op = gpuva_op_alloc(gpuvm);
+	drm_gpuvm_bo_for_each_va(va, vm_bo) {
+		op = gpuva_op_alloc(vm_bo->vm);
 		if (!op) {
 			ret = -ENOMEM;
 			goto err_free_ops;
@@ -1797,10 +2043,10 @@ drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm *gpuvm,
 	return ops;
 
 err_free_ops:
-	drm_gpuva_ops_free(gpuvm, ops);
+	drm_gpuva_ops_free(vm_bo->vm, ops);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(drm_gpuvm_gem_unmap_ops_create);
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_unmap_ops_create);
 
 /**
  * drm_gpuva_ops_free() - free the given &drm_gpuva_ops
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index cb2f06565c46..eda7bb8624f1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -62,6 +62,8 @@ struct bind_job_op {
 	enum vm_bind_op op;
 	u32 flags;
 
+	struct drm_gpuvm_bo *vm_bo;
+
 	struct {
 		u64 addr;
 		u64 range;
@@ -1101,22 +1103,28 @@ bind_validate_region(struct nouveau_job *job)
 }
 
 static void
-bind_link_gpuvas(struct drm_gpuva_ops *ops, struct nouveau_uvma_prealloc *new)
+bind_link_gpuvas(struct bind_job_op *bop)
 {
+	struct nouveau_uvma_prealloc *new = &bop->new;
+	struct drm_gpuvm_bo *vm_bo = bop->vm_bo;
+	struct drm_gpuva_ops *ops = bop->ops;
 	struct drm_gpuva_op *op;
 
 	drm_gpuva_for_each_op(op, ops) {
 		switch (op->op) {
 		case DRM_GPUVA_OP_MAP:
-			drm_gpuva_link(&new->map->va);
+			drm_gpuva_link(&new->map->va, vm_bo);
 			break;
-		case DRM_GPUVA_OP_REMAP:
+		case DRM_GPUVA_OP_REMAP: {
+			struct drm_gpuva *va = op->remap.unmap->va;
+
 			if (op->remap.prev)
-				drm_gpuva_link(&new->prev->va);
+				drm_gpuva_link(&new->prev->va, va->vm_bo);
 			if (op->remap.next)
-				drm_gpuva_link(&new->next->va);
-			drm_gpuva_unlink(op->remap.unmap->va);
+				drm_gpuva_link(&new->next->va, va->vm_bo);
+			drm_gpuva_unlink(va);
 			break;
+		}
 		case DRM_GPUVA_OP_UNMAP:
 			drm_gpuva_unlink(op->unmap.va);
 			break;
@@ -1138,10 +1146,17 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 
 	list_for_each_op(op, &bind_job->ops) {
 		if (op->op == OP_MAP) {
-			op->gem.obj = drm_gem_object_lookup(job->file_priv,
-							    op->gem.handle);
-			if (!op->gem.obj)
+			struct drm_gem_object *obj = op->gem.obj =
+				drm_gem_object_lookup(job->file_priv,
+						      op->gem.handle);
+			if (!obj)
 				return -ENOENT;
+
+			dma_resv_lock(obj->resv, NULL);
+			op->vm_bo = drm_gpuvm_bo_obtain(&uvmm->base, obj);
+			dma_resv_unlock(obj->resv);
+			if (IS_ERR(op->vm_bo))
+				return PTR_ERR(op->vm_bo);
 		}
 
 		ret = bind_validate_op(job, op);
@@ -1352,7 +1367,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 		case OP_UNMAP_SPARSE:
 		case OP_MAP:
 		case OP_UNMAP:
-			bind_link_gpuvas(op->ops, &op->new);
+			bind_link_gpuvas(op);
 			break;
 		default:
 			break;
@@ -1499,6 +1514,12 @@ nouveau_uvmm_bind_job_free_work_fn(struct work_struct *work)
 		if (!IS_ERR_OR_NULL(op->ops))
 			drm_gpuva_ops_free(&uvmm->base, op->ops);
 
+		if (!IS_ERR_OR_NULL(op->vm_bo)) {
+			dma_resv_lock(obj->resv, NULL);
+			drm_gpuvm_bo_put(op->vm_bo);
+			dma_resv_unlock(obj->resv);
+		}
+
 		if (obj)
 			drm_gem_object_put(obj);
 	}
@@ -1752,15 +1773,18 @@ void
 nouveau_uvmm_bo_map_all(struct nouveau_bo *nvbo, struct nouveau_mem *mem)
 {
 	struct drm_gem_object *obj = &nvbo->bo.base;
+	struct drm_gpuvm_bo *vm_bo;
 	struct drm_gpuva *va;
 
 	dma_resv_assert_held(obj->resv);
 
-	drm_gem_for_each_gpuva(va, obj) {
-		struct nouveau_uvma *uvma = uvma_from_va(va);
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
+		drm_gpuvm_bo_for_each_va(va, vm_bo) {
+			struct nouveau_uvma *uvma = uvma_from_va(va);
 
-		nouveau_uvma_map(uvma, mem);
-		drm_gpuva_invalidate(va, false);
+			nouveau_uvma_map(uvma, mem);
+			drm_gpuva_invalidate(va, false);
+		}
 	}
 }
 
@@ -1768,15 +1792,18 @@ void
 nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
 {
 	struct drm_gem_object *obj = &nvbo->bo.base;
+	struct drm_gpuvm_bo *vm_bo;
 	struct drm_gpuva *va;
 
 	dma_resv_assert_held(obj->resv);
 
-	drm_gem_for_each_gpuva(va, obj) {
-		struct nouveau_uvma *uvma = uvma_from_va(va);
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
+		drm_gpuvm_bo_for_each_va(va, vm_bo) {
+			struct nouveau_uvma *uvma = uvma_from_va(va);
 
-		nouveau_uvma_unmap(uvma);
-		drm_gpuva_invalidate(va, true);
+			nouveau_uvma_unmap(uvma);
+			drm_gpuva_invalidate(va, true);
+		}
 	}
 }
 
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index bc9f6aa2f3fe..7147978d82d8 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -571,7 +571,7 @@ int drm_gem_evict(struct drm_gem_object *obj);
  * drm_gem_gpuva_init() - initialize the gpuva list of a GEM object
  * @obj: the &drm_gem_object
  *
- * This initializes the &drm_gem_object's &drm_gpuva list.
+ * This initializes the &drm_gem_object's &drm_gpuvm_bo list.
  *
  * Calling this function is only necessary for drivers intending to support the
  * &drm_driver_feature DRIVER_GEM_GPUVA.
@@ -584,28 +584,28 @@ static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
 }
 
 /**
- * drm_gem_for_each_gpuva() - iternator to walk over a list of gpuvas
- * @entry__: &drm_gpuva structure to assign to in each iteration step
- * @obj__: the &drm_gem_object the &drm_gpuvas to walk are associated with
+ * drm_gem_for_each_gpuvm_bo() - iterator to walk over a list of &drm_gpuvm_bo
+ * @entry__: &drm_gpuvm_bo structure to assign to in each iteration step
+ * @obj__: the &drm_gem_object the &drm_gpuvm_bo to walk are associated with
  *
- * This iterator walks over all &drm_gpuva structures associated with the
- * &drm_gpuva_manager.
+ * This iterator walks over all &drm_gpuvm_bo structures associated with the
+ * &drm_gem_object.
  */
-#define drm_gem_for_each_gpuva(entry__, obj__) \
-	list_for_each_entry(entry__, &(obj__)->gpuva.list, gem.entry)
+#define drm_gem_for_each_gpuvm_bo(entry__, obj__) \
+	list_for_each_entry(entry__, &(obj__)->gpuva.list, list.entry.gem)
 
 /**
- * drm_gem_for_each_gpuva_safe() - iternator to safely walk over a list of
- * gpuvas
- * @entry__: &drm_gpuva structure to assign to in each iteration step
- * @next__: &next &drm_gpuva to store the next step
- * @obj__: the &drm_gem_object the &drm_gpuvas to walk are associated with
+ * drm_gem_for_each_gpuvm_bo_safe() - iterator to safely walk over a list of
+ * &drm_gpuvm_bo
+ * @entry__: &drm_gpuvm_bostructure to assign to in each iteration step
+ * @next__: &next &drm_gpuvm_bo to store the next step
+ * @obj__: the &drm_gem_object the &drm_gpuvm_bo to walk are associated with
  *
- * This iterator walks over all &drm_gpuva structures associated with the
+ * This iterator walks over all &drm_gpuvm_bo structures associated with the
  * &drm_gem_object. It is implemented with list_for_each_entry_safe(), hence
  * it is save against removal of elements.
  */
-#define drm_gem_for_each_gpuva_safe(entry__, next__, obj__) \
-	list_for_each_entry_safe(entry__, next__, &(obj__)->gpuva.list, gem.entry)
+#define drm_gem_for_each_gpuvm_bo_safe(entry__, next__, obj__) \
+	list_for_each_entry_safe(entry__, next__, &(obj__)->gpuva.list, list.entry.gem)
 
 #endif /* __DRM_GEM_H__ */
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 4dc83a27506a..dbd69f621499 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -25,6 +25,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/dma-resv.h>
 #include <linux/list.h>
 #include <linux/rbtree.h>
 #include <linux/types.h>
@@ -33,6 +34,7 @@
 #include <drm/drm_gem.h>
 
 struct drm_gpuvm;
+struct drm_gpuvm_bo;
 struct drm_gpuvm_ops;
 
 /**
@@ -73,6 +75,12 @@ struct drm_gpuva {
 	 */
 	struct drm_gpuvm *vm;
 
+	/**
+	 * @vm_bo: the &drm_gpuvm_bo abstraction for the mapped
+	 * &drm_gem_object
+	 */
+	struct drm_gpuvm_bo *vm_bo;
+
 	/**
 	 * @flags: the &drm_gpuva_flags for this mapping
 	 */
@@ -108,7 +116,7 @@ struct drm_gpuva {
 		struct drm_gem_object *obj;
 
 		/**
-		 * @entry: the &list_head to attach this object to a &drm_gem_object
+		 * @entry: the &list_head to attach this object to a &drm_gpuvm_bo
 		 */
 		struct list_head entry;
 	} gem;
@@ -141,7 +149,7 @@ struct drm_gpuva {
 int drm_gpuva_insert(struct drm_gpuvm *gpuvm, struct drm_gpuva *va);
 void drm_gpuva_remove(struct drm_gpuva *va);
 
-void drm_gpuva_link(struct drm_gpuva *va);
+void drm_gpuva_link(struct drm_gpuva *va, struct drm_gpuvm_bo *vm_bo);
 void drm_gpuva_unlink(struct drm_gpuva *va);
 
 struct drm_gpuva *drm_gpuva_find(struct drm_gpuvm *gpuvm,
@@ -188,10 +196,16 @@ static inline bool drm_gpuva_invalidated(struct drm_gpuva *va)
  * enum drm_gpuvm_flags - flags for struct drm_gpuvm
  */
 enum drm_gpuvm_flags {
+	/**
+	 * @DRM_GPUVM_RESV_PROTECTED: GPUVM is protected externally by the
+	 * GPUVM's &dma_resv lock
+	 */
+	DRM_GPUVM_RESV_PROTECTED = BIT(0),
+
 	/**
 	 * @DRM_GPUVM_USERBITS: user defined bits
 	 */
-	DRM_GPUVM_USERBITS = BIT(0),
+	DRM_GPUVM_USERBITS = BIT(1),
 };
 
 /**
@@ -302,6 +316,19 @@ bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 struct drm_gem_object *
 drm_gpuvm_resv_object_alloc(struct drm_device *drm);
 
+/**
+ * drm_gpuvm_resv_protected() - indicates whether &DRM_GPUVM_RESV_PROTECTED is
+ * set
+ * @gpuvm: the &drm_gpuvm
+ *
+ * Returns: true if &DRM_GPUVM_RESV_PROTECTED is set, false otherwise.
+ */
+static inline bool
+drm_gpuvm_resv_protected(struct drm_gpuvm *gpuvm)
+{
+	return gpuvm->flags & DRM_GPUVM_RESV_PROTECTED;
+}
+
 /**
  * drm_gpuvm_resv() - returns the &drm_gpuvm's &dma_resv
  * @gpuvm__: the &drm_gpuvm
@@ -320,6 +347,12 @@ drm_gpuvm_resv_object_alloc(struct drm_device *drm);
  */
 #define drm_gpuvm_resv_obj(gpuvm__) ((gpuvm__)->r_obj)
 
+#define drm_gpuvm_resv_held(gpuvm__) \
+	dma_resv_held(drm_gpuvm_resv(gpuvm__))
+
+#define drm_gpuvm_resv_assert_held(gpuvm__) \
+	dma_resv_assert_held(drm_gpuvm_resv(gpuvm__))
+
 #define drm_gpuvm_resv_held(gpuvm__) \
 	dma_resv_held(drm_gpuvm_resv(gpuvm__))
 
@@ -404,6 +437,125 @@ __drm_gpuva_next(struct drm_gpuva *va)
 #define drm_gpuvm_for_each_va_safe(va__, next__, gpuvm__) \
 	list_for_each_entry_safe(va__, next__, &(gpuvm__)->rb.list, rb.entry)
 
+/**
+ * struct drm_gpuvm_bo - structure representing a &drm_gpuvm and
+ * &drm_gem_object combination
+ *
+ * This structure is an abstraction representing a &drm_gpuvm and
+ * &drm_gem_object combination. It serves as an indirection to accelerate
+ * iterating all &drm_gpuvas within a &drm_gpuvm backed by the same
+ * &drm_gem_object.
+ *
+ * Furthermore it is used cache evicted GEM objects for a certain GPU-VM to
+ * accelerate validation.
+ *
+ * Typically, drivers want to create an instance of a struct drm_gpuvm_bo once
+ * a GEM object is mapped first in a GPU-VM and release the instance once the
+ * last mapping of the GEM object in this GPU-VM is unmapped.
+ */
+struct drm_gpuvm_bo {
+	/**
+	 * @vm: The &drm_gpuvm the @obj is mapped in. This is a reference
+	 * counted pointer.
+	 */
+	struct drm_gpuvm *vm;
+
+	/**
+	 * @obj: The &drm_gem_object being mapped in @vm. This is a reference
+	 * counted pointer.
+	 */
+	struct drm_gem_object *obj;
+
+	/**
+	 * @kref: The reference count for this &drm_gpuvm_bo.
+	 */
+	struct kref kref;
+
+	/**
+	 * @list: Structure containing all &list_heads.
+	 */
+	struct {
+		/**
+		 * @gpuva: The list of linked &drm_gpuvas.
+		 *
+		 * It is safe to access entries from this list as long as the
+		 * GEM's gpuva lock is held. See also struct drm_gem_object.
+		 */
+		struct list_head gpuva;
+
+		/**
+		 * @entry: Structure containing all &list_heads serving as
+		 * entry.
+		 */
+		struct {
+			/**
+			 * @gem: List entry to attach to the &drm_gem_objects
+			 * gpuva list.
+			 */
+			struct list_head gem;
+		} entry;
+	} list;
+};
+
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
+		    struct drm_gem_object *obj);
+
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
+		    struct drm_gem_object *obj);
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm_bo *vm_bo);
+
+/**
+ * drm_gpuvm_bo_get() - acquire a struct drm_gpuvm_bo reference
+ * @vm_bo: the &drm_gpuvm_bo to acquire the reference of
+ *
+ * This function acquires an additional reference to @vm_bo. It is illegal to
+ * call this without already holding a reference. No locks required.
+ */
+static inline struct drm_gpuvm_bo *
+drm_gpuvm_bo_get(struct drm_gpuvm_bo *vm_bo)
+{
+	kref_get(&vm_bo->kref);
+	return vm_bo;
+}
+
+void drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo);
+
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
+		  struct drm_gem_object *obj);
+
+/**
+ * drm_gpuvm_bo_for_each_va() - iterator to walk over a list of &drm_gpuva
+ * @va__: &drm_gpuva structure to assign to in each iteration step
+ * @vm_bo__: the &drm_gpuvm_bo the &drm_gpuva to walk are associated with
+ *
+ * This iterator walks over all &drm_gpuva structures associated with the
+ * &drm_gpuvm_bo.
+ *
+ * The caller must hold the GEM's gpuva lock.
+ */
+#define drm_gpuvm_bo_for_each_va(va__, vm_bo__) \
+	list_for_each_entry(va__, &(vm_bo)->list.gpuva, gem.entry)
+
+/**
+ * drm_gpuvm_bo_for_each_va_safe() - iterator to safely walk over a list of
+ * &drm_gpuva
+ * @va__: &drm_gpuva structure to assign to in each iteration step
+ * @next__: &next &drm_gpuva to store the next step
+ * @vm_bo__: the &drm_gpuvm_bo the &drm_gpuva to walk are associated with
+ *
+ * This iterator walks over all &drm_gpuva structures associated with the
+ * &drm_gpuvm_bo. It is implemented with list_for_each_entry_safe(), hence
+ * it is save against removal of elements.
+ *
+ * The caller must hold the GEM's gpuva lock.
+ */
+#define drm_gpuvm_bo_for_each_va_safe(va__, next__, vm_bo__) \
+	list_for_each_entry_safe(va__, next__, &(vm_bo)->list.gpuva, gem.entry)
+
 /**
  * enum drm_gpuva_op_type - GPU VA operation type
  *
@@ -683,8 +835,7 @@ drm_gpuvm_prefetch_ops_create(struct drm_gpuvm *gpuvm,
 				 u64 addr, u64 range);
 
 struct drm_gpuva_ops *
-drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm *gpuvm,
-			       struct drm_gem_object *obj);
+drm_gpuvm_bo_unmap_ops_create(struct drm_gpuvm_bo *vm_bo);
 
 void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
 			struct drm_gpuva_ops *ops);
@@ -736,6 +887,30 @@ struct drm_gpuvm_ops {
 	 */
 	void (*op_free)(struct drm_gpuva_op *op);
 
+	/**
+	 * @vm_bo_alloc: called when the &drm_gpuvm allocates
+	 * a struct drm_gpuvm_bo
+	 *
+	 * Some drivers may want to embed struct drm_gpuvm_bo into driver
+	 * specific structures. By implementing this callback drivers can
+	 * allocate memory accordingly.
+	 *
+	 * This callback is optional.
+	 */
+	struct drm_gpuvm_bo *(*vm_bo_alloc)(void);
+
+	/**
+	 * @vm_bo_free: called when the &drm_gpuvm frees a
+	 * struct drm_gpuvm_bo
+	 *
+	 * Some drivers may want to embed struct drm_gpuvm_bo into driver
+	 * specific structures. By implementing this callback drivers can
+	 * free the previously allocated memory accordingly.
+	 *
+	 * This callback is optional.
+	 */
+	void (*vm_bo_free)(struct drm_gpuvm_bo *vm_bo);
+
 	/**
 	 * @sm_step_map: called from &drm_gpuvm_sm_map to finally insert the
 	 * mapping once all previous steps were completed
-- 
2.43.0

