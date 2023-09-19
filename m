Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3CDCD5BCE
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F7A10E3C5;
	Tue, 19 Sep 2023 14:26:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A82D10E284
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133598; x=1726669598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ahFecBNFRNgoMKeibNLFH3rqgwLjjP7RYUpcByv+Mpc=;
 b=c4gnKazToYDhAYXZAffwygaQ5YFuJDlHgMhF2DyomnJbPTdhLy8K1S8R
 TkTvmTfEc/SOBCmjFS4xGPDXgMKFAAm9FOIGls/WP3ooLAvfm0Q+Twrdu
 0MFU88LELdEfnyTkY0PxZQDFcGS7EjEtkj8vw/cZc78WlZKYhmofo0LpU
 3p/fbzgkvgCKK7nYDKQXRpmf5HCZQcidMgPE/HBLiBeYmuYMHE2t0/77e
 pAuJEv9qCI7+fDrapf8TzXjKPMDkMOOBD9PT/Zfo2YBAkzwqBnKOzmIWT
 m+5pbh9yN7aYv7s0Oj2gM3+JxBAL9n8O0lkhQR4v/7/kfbpLQ24+DicQU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466278958"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="466278958"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="695924455"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="695924455"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=km8J8cobd1UUMnLQxCfiKMSmTv5YTc0iK2hhMPp1rxHD2UkQkiUieq4zZj4W0aO6uKXLW7uFyAjoKwe6JngB8CV3mbvqRLPYBBcuN8Y7M11vXzubPxjYtKaWS5WcJKUYP2sFJy8rTWDUvBxtkXQYd/PyzF/Ct0VvF3ZGP55UgKAq9K2jWPXa2ZCeesrbX7FMiAKOm/P+7cw+ZScl6y60t5kWz8nLHGi9OtTH9QBhd8t9psmymHsimVyAQgU0ILukVh1jFCG4TVBckr/hZ37cG9jIKkXgbe5BgkJibDefbph8wLuQb+lKw70/g6liPaf8dc5IUx9xlJJoARMD9Wk7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCkPZYFnKWjNf4BQ595ASlznuyHgGJzxxDXAWsdJ95k=;
 b=S80uXh7sKF6Xt1mZPF2BD+bWRy0mL+dbiecbVTQUuuUe0W6HLxu4fBjhARFMtYFtKDb+zuaJSgxuSc6KdhaHtztyfxN/oceUjJqavXDfHpdsVCrsfgjPunjmzQDHNRfb7NJ0TWSeCu/H6ZpxT4aJsGjfNTMppsftaa4T0tbUKQ+7O5lO0ByJCSQv6SvBUClK0CxkB+PwUj3J7kEaZTbi8QOfw2DyPnKIu7TAfgRDaFubXTHqVSFvKsJM4hf4kUn1TEBQbofLz9Gh5TuwdRrqsrGnWaD+vfx+MDUs1z7Ha+ddSKRYBiNVfbzQSO+v/YkFpjH6vyWN4KwHiEihpjnFbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 19 Sep
 2023 14:26:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:24:59 -0400
Message-ID: <20230919142504.91652-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0101.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::42) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 15458c9b-a96c-4aae-79d5-08dbb91c67bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ZAbXaReK5RX2KbbouOIS5YqJO/nA/ct/LxKUDRf2CeCy9XG+pXE9HUgM29Z/z1uXPX8q36767CSIBk2fh2h3tA7/6qZB4b4f0u2xGgloP6kbC2Fm0bIlMqqg/ysI4O17VaGd17wtzPOQCK0YXHgzIm3wwzfDbnq0NIOjcVOs33+hOqlUjquIy82rFU1NiswKb1ETCVmrp6AkNTAoPeEsIwN6rSEEUi1Zo00elM4KIIdc8Pfl8hWSWtPdm/M+q7Md6C7Zgp5NybFlbArl9Xz6az+IqoWCXaAchjGxm9lSRqy4TlcccscfnxmMrOThkGkYQBi3csndxrezSM6n2LjUHr0tHtmkKxb+ERMSOFDcw/xlW2khNS6Pq0E0qiqABz2gHTN8qqGGDPUKjikvdsdlGjC7sGr2PH5Ag0Ov7IJ061/pQpieW2v8gtzmOIzWB0qcXGwIjJlzXdC4piyVg7A8RmJ66aLyKhAp3RqRXp8FZJlLihwGglIUOs/9EoDPhISYW7oZyJZ/rA88mAlXE9myGfeYC42hCFGQ3tvqLdStvPXyLgJM3t9HRoTH1UBSHUk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(316002)(54906003)(6916009)(8936002)(8676002)(4326008)(41300700001)(1076003)(2616005)(26005)(83380400001)(6512007)(478600001)(6486002)(6666004)(6506007)(36756003)(86362001)(82960400001)(66574015)(38100700002)(66476007)(66946007)(66556008)(2906002)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjcvSU81KzIrdjNORWhDKzZWK2cvdUlBRm4zYXFIREkwYlJ2QnJLV1NJTlU4?=
 =?utf-8?B?RVpmRTYrdWIrWExLbnpXRE03Y3FHVndLM2Q5cU9sdE56UjBaODRQcGYwaHlH?=
 =?utf-8?B?MVVyUUc1Ynpxa0Z3RWFDL0s4cTNpbzVGMnBnbzlaem9DTHU4UWg3ZVpNZDJO?=
 =?utf-8?B?QW9ZVlpyWWtjdHM1ZzZwVEtacmwvQ2w0VmllYWo1bi9tWEpSajdXelJZVjls?=
 =?utf-8?B?VVFQL3ZYbDdtNi9VOEEwQXFJZEFUOSsrb3NCVUpuNjF1RXA2WEZXYUsveG8r?=
 =?utf-8?B?RTJjcVZEZ09wTlVBUWVJRkwwZmxSdzRNcUV5bTdxUHA1UXowRXZ3enJUQisy?=
 =?utf-8?B?MDlIQjg0WC9GYk5laVAyd0F4eUVtdW5zY3lsNDNFaHg0K1BaR2UyQXk0dk5T?=
 =?utf-8?B?NkJWek53S2xET0lBVDJNTzJ0bGRpTFdmY1krZGNwM284dXVhdzZzQWVtZnkx?=
 =?utf-8?B?aEJZVnRlVXRiVEphUEpRc3BJcUJ6QjdWSWxpbGJYYTlEOCtwNDBpbG9WSW9Q?=
 =?utf-8?B?ZDhnOStOYjRlVUhEN2V5VGV1eTRFaytncC8yWVEvRnJIOWkzSTU5dk14dWVS?=
 =?utf-8?B?NHJNWXJqYTJxc0crT2NPOHU1aDA4ZVREQTVXY1NsdjU2VWtpQ0pFei9MTDQ3?=
 =?utf-8?B?dkFUdVEwcmZvMTg3N1YvOVRXc2ZmNkZrOEZ0WmlCS0dGeUFBSVRDL3YwRlN0?=
 =?utf-8?B?K3RhUVVBdjNUUmdGZG83bGswaUk1djRRMk5lbjVZQ21sRlFQZWhiQjNEd2x3?=
 =?utf-8?B?aE1RZkFsNGlWU2w0OTlmNVQzc2o3b3grU0NpYkltSmF1UDUrSDFNTDMxMU80?=
 =?utf-8?B?ekJMbmZ6RnYzbHFQQVcxSENzNWU3SldiVExNRnpEbU04M1FEcTU3VU4xU3hQ?=
 =?utf-8?B?Z0lIWnFWcFpDdkJpbjZBa2E4RXpVVkFwKzg2aG1tUnRlb0ZOY0xLK3F6dDh0?=
 =?utf-8?B?UG1iS09Uc2tEZSszMGNMaENINGl1V283MmQya0J2NzJmV2ZzeU9Ga2RJUkhN?=
 =?utf-8?B?Yy9MWXFxZ1k0Y2JxMmd0bkFkeWdQQzU4aTA1clVNWHNYRVB2ei9YU01mU0JU?=
 =?utf-8?B?R2IrcVlDUEFxdG9TcXhBM1YzbG5vbG5vQndIL3kxNllqUCtTNWlmbEFSU0V1?=
 =?utf-8?B?MDFZU1hZQ2J0eUdFWlh5cUs5NnFLcVlndVloTWptdlE3N3BkazR1VkttV1Ex?=
 =?utf-8?B?RXZqSExEZHljVGtnT1FZOElEQ01LVnV4K0xERjl0b3FscXdBSXU4K2hnNUZ5?=
 =?utf-8?B?c0pFOFhPMjNBZithWEViYVFqeVFIdlE5UTlIdnZaRVhWdXJabG1SaE5EZnBy?=
 =?utf-8?B?SjQvOGhLY0xkaUFNemFiWDlHK3dSOHJyQXZBMEhyS2ZpckczMThHbGxTUFJT?=
 =?utf-8?B?SFMzeXM4RGpieWhmSFhiQUxlK096Y3h2YnJBZWNSekUvaEd2YUsrUEExMjNn?=
 =?utf-8?B?bWZGcDdva2N6Z1FOdEkyS1NRdklZUVpIN3g3SkVaQ2psaGgxMVQvb3cveGV5?=
 =?utf-8?B?cUlySmpGS0VjVVBWTENRQTcwWURIR2xucTJwYWFDKzJGZ2pTdkdCeHpqN2lq?=
 =?utf-8?B?djUzZmdobnF1WGVDZ1dkS1RMWi94NE5aclRkODJHaGwrMXdzYXVSWDk1M2hY?=
 =?utf-8?B?d3IvTnZ0UjM4K3dHTFVEWXRWQVQxNmJBK0RNczRrdVRQbm52dmNKVUNpSW5I?=
 =?utf-8?B?N250Mk9RYlVBdzlocHg1QWtXNDU0cmd3a2cwSlordDVncmNFdzlLTXdLeDZ2?=
 =?utf-8?B?SWJnb3NyeXpxRmVwdWtab2k5UWZtb3Y5aW9lRVhHVDcvVXRMZkdXUllRazNF?=
 =?utf-8?B?SmVQbHRlLzBtelJBSVdBWmZCd0ZadU5QVkxiU2xWUlJTZG03UnNZUWE2MTE2?=
 =?utf-8?B?d20zazZrQ2tEZE5EU1VFUzlFY2R5UXRwUHZ2THJHNnU3RDhoTHduMDZRU2dw?=
 =?utf-8?B?K3VXWmxqWlkzRTFRdDVIdGJNYkNpUmd6TzVoNlBaVmI2TVRVQVFTV2lUUW1N?=
 =?utf-8?B?eEV3dUhoWVFCQjluNFdQZjFKcERmR1FTNUxPRlRZbHB4ZE9UVzJyWDI3aGNH?=
 =?utf-8?B?ZWFFSG01OStSWkRXRHo1clFTUGxDQ1VXWEtxMVR1U21ualBtY1c5SUlDNTNM?=
 =?utf-8?B?MFFkU2JGSXFQRnFVVU80ZTRSenV0NWM4RDBnVTZjbTJxQUxHMlVUNURJQjJV?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15458c9b-a96c-4aae-79d5-08dbb91c67bb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:25.6871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CCtMJP2MSRBq1esqehyjnvYlldan4wpQn1/Z2dtbc+0+pzdrMN3+gv3LjJnoLBib5p658f7EjwbzAPS/hJ84Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 12/17] drm/xe: Kill
 XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com,
 Francois Dugast <francois.dugast@intel.com>, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, carl.zhang@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This extension is currently not used and it is not aligned with
the error handling on async VM_BIND. Let's remove it and along with
that, since it was the only extension for the vm_create, remove VM
extension entirely.

v2: rebase on top of the removal of drm_xe_ext_exec_queue_set_property

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 129 +------------------------------------
 include/uapi/drm/xe_drm.h  |  23 +------
 2 files changed, 4 insertions(+), 148 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 33a02aca8971..f392ed428254 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1390,37 +1390,6 @@ static void flush_async_ops(struct xe_vm *vm)
 	flush_work(&vm->async_ops.work);
 }
 
-static void vm_error_capture(struct xe_vm *vm, int err,
-			     u32 op, u64 addr, u64 size)
-{
-	struct drm_xe_vm_bind_op_error_capture capture;
-	u64 __user *address =
-		u64_to_user_ptr(vm->async_ops.error_capture.addr);
-	bool in_kthread = !current->mm;
-
-	capture.error = err;
-	capture.op = op;
-	capture.addr = addr;
-	capture.size = size;
-
-	if (in_kthread) {
-		if (!mmget_not_zero(vm->async_ops.error_capture.mm))
-			goto mm_closed;
-		kthread_use_mm(vm->async_ops.error_capture.mm);
-	}
-
-	if (copy_to_user(address, &capture, sizeof(capture)))
-		drm_warn(&vm->xe->drm, "Copy to user failed");
-
-	if (in_kthread) {
-		kthread_unuse_mm(vm->async_ops.error_capture.mm);
-		mmput(vm->async_ops.error_capture.mm);
-	}
-
-mm_closed:
-	wake_up_all(&vm->async_ops.error_capture.wq);
-}
-
 static void xe_vm_close(struct xe_vm *vm)
 {
 	down_write(&vm->lock);
@@ -1904,91 +1873,6 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	return 0;
 }
 
-static int vm_set_error_capture_address(struct xe_device *xe, struct xe_vm *vm,
-					u64 value)
-{
-	if (XE_IOCTL_DBG(xe, !value))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
-		return -EOPNOTSUPP;
-
-	if (XE_IOCTL_DBG(xe, vm->async_ops.error_capture.addr))
-		return -EOPNOTSUPP;
-
-	vm->async_ops.error_capture.mm = current->mm;
-	vm->async_ops.error_capture.addr = value;
-	init_waitqueue_head(&vm->async_ops.error_capture.wq);
-
-	return 0;
-}
-
-typedef int (*xe_vm_set_property_fn)(struct xe_device *xe, struct xe_vm *vm,
-				     u64 value);
-
-static const xe_vm_set_property_fn vm_set_property_funcs[] = {
-	[XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS] =
-		vm_set_error_capture_address,
-};
-
-static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
-				    u64 extension)
-{
-	u64 __user *address = u64_to_user_ptr(extension);
-	struct drm_xe_ext_set_property ext;
-	int err;
-
-	err = __copy_from_user(&ext, address, sizeof(ext));
-	if (XE_IOCTL_DBG(xe, err))
-		return -EFAULT;
-
-	if (XE_IOCTL_DBG(xe, ext.property >=
-			 ARRAY_SIZE(vm_set_property_funcs)) ||
-	    XE_IOCTL_DBG(xe, ext.pad) ||
-	    XE_IOCTL_DBG(xe, ext.reserved[0] || ext.reserved[1]))
-		return -EINVAL;
-
-	return vm_set_property_funcs[ext.property](xe, vm, ext.value);
-}
-
-typedef int (*xe_vm_user_extension_fn)(struct xe_device *xe, struct xe_vm *vm,
-				       u64 extension);
-
-static const xe_vm_set_property_fn vm_user_extension_funcs[] = {
-	[XE_VM_EXTENSION_SET_PROPERTY] = vm_user_ext_set_property,
-};
-
-#define MAX_USER_EXTENSIONS	16
-static int vm_user_extensions(struct xe_device *xe, struct xe_vm *vm,
-			      u64 extensions, int ext_number)
-{
-	u64 __user *address = u64_to_user_ptr(extensions);
-	struct xe_user_extension ext;
-	int err;
-
-	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
-		return -E2BIG;
-
-	err = __copy_from_user(&ext, address, sizeof(ext));
-	if (XE_IOCTL_DBG(xe, err))
-		return -EFAULT;
-
-	if (XE_IOCTL_DBG(xe, ext.pad) ||
-	    XE_IOCTL_DBG(xe, ext.name >=
-			 ARRAY_SIZE(vm_user_extension_funcs)))
-		return -EINVAL;
-
-	err = vm_user_extension_funcs[ext.name](xe, vm, extensions);
-	if (XE_IOCTL_DBG(xe, err))
-		return err;
-
-	if (ext.next_extension)
-		return vm_user_extensions(xe, vm, ext.next_extension,
-					  ++ext_number);
-
-	return 0;
-}
-
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_SCRATCH_PAGE | \
 				    DRM_XE_VM_CREATE_COMPUTE_MODE | \
 				    DRM_XE_VM_CREATE_ASYNC_BIND_OPS | \
@@ -2005,6 +1889,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	int err;
 	u32 flags = 0;
 
+	if (XE_IOCTL_DBG(xe, args->extensions))
+		return -EINVAL;
+
 	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
 		args->flags |= DRM_XE_VM_CREATE_SCRATCH_PAGE;
 
@@ -2047,14 +1934,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-	if (args->extensions) {
-		err = vm_user_extensions(xe, vm, args->extensions, 0);
-		if (XE_IOCTL_DBG(xe, err)) {
-			xe_vm_close_and_put(vm);
-			return err;
-		}
-	}
-
 	mutex_lock(&xef->vm.lock);
 	err = xa_alloc(&xef->vm.xa, &id, vm, xa_limit_32b, GFP_KERNEL);
 	mutex_unlock(&xef->vm.lock);
@@ -2950,8 +2829,6 @@ static void xe_vma_op_work_func(struct work_struct *w)
 				vm_set_async_error(vm, err);
 				up_write(&vm->lock);
 
-				if (vm->async_ops.error_capture.addr)
-					vm_error_capture(vm, err, 0, 0, 0);
 				break;
 			}
 			up_write(&vm->lock);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 8be3b25928bd..817fdb762758 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -555,23 +555,6 @@ struct drm_xe_gem_mmap_offset {
 	__u64 reserved[2];
 };
 
-/**
- * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
- */
-struct drm_xe_vm_bind_op_error_capture {
-	/** @error: errno that occurred */
-	__s32 error;
-
-	/** @op: operation that encounter an error */
-	__u32 op;
-
-	/** @addr: address of bind op */
-	__u64 addr;
-
-	/** @size: size of bind */
-	__u64 size;
-};
-
 /** struct drm_xe_ext_set_property - XE set property extension */
 struct drm_xe_ext_set_property {
 	/** @base: base user extension */
@@ -592,7 +575,6 @@ struct drm_xe_ext_set_property {
 
 struct drm_xe_vm_create {
 #define XE_VM_EXTENSION_SET_PROPERTY	0
-#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -677,10 +659,7 @@ struct drm_xe_vm_bind_op {
 	 * practice the bind op is good and will complete.
 	 *
 	 * If this flag is set and doesn't return an error, the bind op can
-	 * still fail and recovery is needed. If configured, the bind op that
-	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
-	 * Once the user sees the error (via a ufence +
-	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
+	 * still fail and recovery is needed. It should free memory
 	 * via non-async unbinds, and then restart all queued async binds op via
 	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
 	 * VM.
-- 
2.41.0

