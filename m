Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71B4C47DAF
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 13:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C6E10E0B1;
	Fri, 19 Jan 2024 13:26:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05AEA10E0B1
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 13:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705670759; x=1737206759;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=aeTS4ZklxU7vtD5SvxN0hH/ddTz5Ib9gWYEK/ekDiEg=;
 b=GZDUdMCjSBgmCeko+sZ+gYpOAskuRQsNEMgRlwLTPgdvJia0B0Z+awb8
 d00hi8ScTfF8UGUURc7814Syxm+s8oZgqRgdEmPzH9o9f0QLvd/kJrPXw
 Mvhg4RYVT+7ZNLruPLpKomRSNKjOD1GKhwLmYfMlrBGFVLdVDPrLvi3dG
 zlWKcKGHHKSBB49cFd6yLSdXswl6mVsVBWkLuvceGBoviBrbYUW/b2NOA
 R2vPMIS7zY4/nFSfUPcl/PnbA+Z3aYLuX6WVwhX1UID9CtHLbvVxSLJkz
 APpaWo8O5fY6KVVaPc8QDSM5ZNz1cy5POYWovubBI7PmMDQE78iL9KPQC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="627990"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="627990"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 05:25:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="590959"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 05:26:00 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 05:25:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 05:25:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 05:25:57 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 05:25:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jA5iOCSzhVxUIZUFdwAhXe/nwDWH/scHlSJe7Dr5PcUu9NentrNZkYpymS6kHi05OP8JGcgJjCUfnyTqBHjZXxnnHtMnamC/JpZ6eV60M0xCBoaAu8nuyR7KnFR6iGpIvz7ZDmuoXKqATPEW7hVc011r/J27BiJAqZb13dWrXOqdcK3koDVJQr2rDmzKhZdR6LlYH5Ud0UjRrOMB7OxVnky0QFzFPLX9PUro+bFjlnnjhK7w4z89GKVrM0RNViNo9wjD+wdRqsBi9zhj1NCps1kxkMNRNV4n8NND6Q2Rc5wBWOBI9lD3smKyEThR1E8kBqQnQ47WLlT6i0PysZVUGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MucyACmZw65bN7VDQ/poeRask3TD7UbQPY7Hy2UeUxc=;
 b=WlOeIcp06kwk6jMbTiEkQQnV0lbmf29IM5+QL94CllVY6qOSMlXSnq8NARG0puGz4w7lnhDbiYxsaX0ecClsbAn370Qg6Ew3Kn/5lRwDeO6xF+dXy63nl15/LlK6DyTe5aHCxMkDD4U0PHwNHCABv1unIUsazFFB+WKeUitoB8liLtd2ovd2cDA6gKQlGdeVwYoTZF6JvfPDXoP+gLMJ8dN78d86fn+EnpWyTEiuGh5eBPBqY0qJk5Az5bvZ/BSO4bee2kWH8uDReDq9v7p/rEIRfsrEKK1kSgKUc2E4izWIGwGX0FLzKyegnTc6KbCXPT3cZgVLuC1VyOsrTe2JNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ1PR11MB6179.namprd11.prod.outlook.com (2603:10b6:a03:45a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 13:25:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7181.031; Fri, 19 Jan 2024
 13:25:53 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] Revert "drm/xe/uc: Store firmware binary in system-memory
 backed BO"
Date: Fri, 19 Jan 2024 08:25:48 -0500
Message-ID: <20240119132548.404243-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0050.namprd11.prod.outlook.com
 (2603:10b6:a03:80::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ1PR11MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: 61cc1d4f-dced-43ee-d4b8-08dc18f2297c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 32QCk8eCmvjGZPhBQfJjHpKAnqi3tM6h3N8tpCy5MWtGAt2uh8FrVUbW51SVuHBsc1FcxGztTryf6EqFN5A4O9YMx+hnedWqAx8gtz90F9Wpx6bpCGE9W1ru2ZQubfQ8adl+ANu3KFovHBY1r+Ug5vif2icVgiLOsQFPDG18ObbjXXLGJEBYA7gdlvhOAbKzLPDQf51+/RZ8bjjhS39sKmx/TC+KuBg0XZM/T4jpVSWZ86W6DInvY+mDBuYPl8z40xZis3mxAfZJW+BtJeGtvfAZdqmBYKLUDksG3dEaJRsQPHFQ3/EGSoCUJFtYQCd2L8wsf3VU+8Om763QCdFLTBHki/gYKg1adTMgfxC1DV8y5SkOoqCDFd3Nvtu3fs4mttpqR4h1g2kRSdgOP+lrB3M+8IZcCAG5RRCANr+ziUtl3MZPxWld1pWkRbSnc+bxaTFqqeS3JmW31jngLdeSDGSowEMhxcYB6yps9rXLVHI6jyn/rpzpDCW//Pvaf55Rk/x3tBQLrpBAbjxsrWgXESKzMnCETQ7VlVhEB4sVggyApIPv2Jf6k9Mol/gtIT8H
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(1076003)(26005)(83380400001)(6512007)(6506007)(6666004)(36756003)(86362001)(82960400001)(38100700002)(41300700001)(4326008)(5660300002)(44832011)(2616005)(107886003)(66946007)(66556008)(66476007)(6916009)(8676002)(8936002)(54906003)(2906002)(316002)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG1HZlJhdjJBcmd6V3NiU2tUbVkzS2RINnhKNEljeVZVZnVCZHNzakZocGN3?=
 =?utf-8?B?ZzRkdTdHRTV6V3BORmtxZSttUXdOSEhnTUVRQ3hndnA0aEEzbDNEaVRwaCtu?=
 =?utf-8?B?aUc0MmxiTmVITVFHcVRQZE90ZEhWR0Z2cWZKMHplZnpERVc1TWVhZmFwZGlW?=
 =?utf-8?B?TWpZdDc2SjFJVzBKbW9DQ21OR3hTWTIvQnF0MWRLOE4zRnFPM3IybSsvWWVW?=
 =?utf-8?B?L2luYnJpMXZ3VHZRdWRwemNVQUo3eU93dGcrUjNHN2ZpeC9IcStUMkRFMlRh?=
 =?utf-8?B?bk5lUzhqdHVJeXZTeDUvajlHQ05qUkFwME1OQW5rQlFTaXlDN2M5bkt4dGJB?=
 =?utf-8?B?dEZ1RDhxOElUR25zeklhditoSmpsUFZvSHdYb3RZRVJzc2hxWlRyMSswLzJm?=
 =?utf-8?B?eFErMVpPemlBUlVQakVPSmlQM0xsak44T1grblZLZ2RKUGV0RXJKeUoxaUdM?=
 =?utf-8?B?RG5VNjh6Mi9GZEltcHcrQUFCS0ZGUXNUM3MzVHphVm9uMTExdWxnTmdFQ1R1?=
 =?utf-8?B?YVZFRWRQME0vaWkyeXFMVDJ3dVZxd2VWVTNud1orZVlFcEVyR3pOczZhc1l4?=
 =?utf-8?B?eGpETVJ1VXcxYy9CQ1kxREpSVis2Lyt5bm00bU5MOFBZdHVzUFBhZGJFZnBk?=
 =?utf-8?B?T2pQbVdXeDZPMnkyWmFGaVoyWWgxL3VSb0xZSkVMb3NFSG1XSmhTYURuWkdm?=
 =?utf-8?B?UFdBVUkwWGdDbDVYczMxQkkxZXpUczN5V0xUUDg1dW9PaTlvazNGTnNBVG12?=
 =?utf-8?B?c2dMWG9aQnJhYzRKVEhqc3pQcVFhUys1UThJVkt5Uy91YngvRnZsVUIyT1FY?=
 =?utf-8?B?MG5ZNk9MdjZkcVJFWXhubmNtN3JyRWZFcTJLUi9vaUs0ODN6bk11cnNVU2Fv?=
 =?utf-8?B?SDNKbURPWlpTeWJpblpMb1E0VnpXT2haclhzNFBRMStBTFNFempoNHdrL2RQ?=
 =?utf-8?B?N3BVUlNTWFZNZ296TU0xTU1BMVlPczVkbzFGL2IwMVpxYjdKQnZIVUtmM1BO?=
 =?utf-8?B?ZGMzMjlrZno3Vk12MkVvWnJabm9GNTZ3SVFyV21SMTN1QnBmQkE0aWhSZDZO?=
 =?utf-8?B?RDZxSDdpZU9oMW9RTy81Z2lwTWprbldsMStoTUF0aktQYmNVcnRlNlJJQWVP?=
 =?utf-8?B?eUQwSThUalJNNTIrbG5SbERBYTFnczZGbk9BUC9xYmhnSlA4bzdZWTMzVXgv?=
 =?utf-8?B?cVdUWEY5OStxb0ViajFZcmNNd2MwWDFYYXNKWUxwbUNHV25EcDFHdFA3U0Fu?=
 =?utf-8?B?eVNuQTdNNzZKWXprRXdYdnBIb094TldUK01rODh1SnMyNWZyYitwTUZPd21W?=
 =?utf-8?B?MnBoSHZnZGZqdys0ZDhZc0s5eUJ5a202RjZIUEdyUWpKQmRKRlp6WnVaWHVB?=
 =?utf-8?B?dXQ4YkNDNkNoVk9VOGtqSkpkZ3RyYW80V0NpMTZVRDBXbkxNREQ4Z2sxelN5?=
 =?utf-8?B?MWdaVGNSOWE1MTVwdmcvSE53dTBZQTRqVGpueXp1WFFuK3NGczV5dk8wUlF3?=
 =?utf-8?B?OFdDTkYvZXlUQ0hJaC9RRWVIN25tVWM3YmhoTGZmRWlSNlZFcS9EMlNNU2RU?=
 =?utf-8?B?NDdIc251UVBxNHlOM2hDdmg0aElhODVwUzlTTGdhRTN6Qk1TNVJYZ2JaZnlS?=
 =?utf-8?B?aDNySUNqamZyTlZhOSt6cHVVdFRnbS9iTWtTaFZoU1NUSUZPaklZRFJkV2ZE?=
 =?utf-8?B?dlFROVNmSlpTNTQzRU9taVRITW90STdTS0VEZkRCZXZJaTdaTE4wR3Z0SmdN?=
 =?utf-8?B?QnF0b0hrVkhmek5UZ2Z3dFRoM3gvYkdnSW9QRzJSRUt5ZnkzMWI0aUx0QzVH?=
 =?utf-8?B?VHp1bElSZUF3ZGQvcXFGeHY1a2NPYmZiUTQ1bnFhWDkvNUhRZnljNHRvaHU1?=
 =?utf-8?B?QmRjRGRlcEFORFc2Z1J4YkE3NEtLRTgwb0RDaDdxR0Jnc2g2bGlteVNEMDQy?=
 =?utf-8?B?eUVMdGE3YXdsNDBZSFhtV2VDUHBob1MyK0NBeHVmVHRtd0FlcXk3TEtLWjVB?=
 =?utf-8?B?anJuKzdRMWNnM01aMjdtNzczamFEaU5veDhZYTJoNUI4UHgwaTBTSlg5WExj?=
 =?utf-8?B?b1I4dkdNcm9jWFJ1MXMvWmxLeHl0WThaL2Y5dnM4UDVJRlY4aDdVWjJXOS9q?=
 =?utf-8?Q?eiFUYqnBvnfCoU888yKJQUP87?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cc1d4f-dced-43ee-d4b8-08dc18f2297c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 13:25:53.8725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjqtFSAAs1w58ynwkdUqHCkCOGkbwVm4QbaZJnCG5Na+k9vkVUkXyCjtzzi+CD/Lp1P/Kyqap9jdNaY2urDLLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6179
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 48cd5ebcb645ac1bd48480cf11dced902108d306.

This is breaking the GuC load after suspend cycles where the
power was lost such as s3 and d3cold on DGFX.

xe 0000:03:00.0: [drm] GuC load failed: status = 0x400000A0
xe 0000:03:00.0: [drm] GuC load failed: status: Reset = 0,
   BootROM = 0x50, UKernel = 0x00, MIA = 0x00, Auth = 0x01

Currently our suspend/resume flows only evict and restore the BOs
living in the VRAM itself since the system memory power won't be
lost. However, it seems that we might lose the PTEs for those
entries. While we don't have that in place, let's ensure that we
keep uc images in VRAM if possible.

Also another concern is the impact in the resume latency of
this case. So I wonder that if we end up moving this
uc_fw_copy to an earlier stage where LMEM is really not yet
available, maybe we need to later switch the uc_fw->bo to
a VRAM for the final access and better resume times.

Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 9dff96dfe4559..796d604ef36a7 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -750,6 +750,8 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
 int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 {
 	const struct firmware *fw = NULL;
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
+	struct xe_tile *tile = gt_to_tile(gt);
 	int err;
 
 	err = uc_fw_request(uc_fw, &fw);
@@ -761,7 +763,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 		return 0;
 
 	err = uc_fw_copy(uc_fw, fw->data, fw->size,
-			 XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
+			 XE_BO_CREATE_VRAM_IF_DGFX(tile) | XE_BO_CREATE_GGTT_BIT);
 
 	uc_fw_release(fw);
 
-- 
2.43.0

